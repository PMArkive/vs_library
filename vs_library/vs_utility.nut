//-----------------------------------------------------------------------
//------------------- Copyright (c) samisalreadytaken -------------------
//                       github.com/samisalreadytaken
//-----------------------------------------------------------------------

local Entities = ::Entities;
local DebugDrawBox = ::DebugDrawBox;
local DoUniqueString = ::DoUniqueString;

::Ent  <- function( s, i = null ):(Entities){ return Entities.FindByName(i,s); }
::Entc <- function( s, i = null ):(Entities){ return Entities.FindByClassname(i,s); }

//-----------------------------------------------------------------------
// Input  : Vector
// Output : string
//-----------------------------------------------------------------------
::VecToString <- function( vec, prefix = "Vector(", separator = ",", suffix = ")" )
{
	return prefix + vec.x + separator + vec.y + separator + vec.z + suffix;
}

//-----------------------------------------------------------------------
// Draw entity's AABB
// ent_bbox
//-----------------------------------------------------------------------
function VS::DrawEntityBBox( time, ent, r = 255, g = 138, b = 0, a = 0 ):(DebugDrawBox)
{
	return DebugDrawBox(ent.GetOrigin(),ent.GetBoundingMins(),ent.GetBoundingMaxs(),r,g,b,a,time);
}

//-----------------------------------------------------------------------
// Ray tracing
/*

local trace = VS.TraceLine( v1, v2 )

trace.DidHit()
trace.GetEnt( search_radius )
trace.GetPos()
trace.GetDist()
trace.GetNormal()

trace.fraction
trace.startpos
trace.endpos
trace.hitpos
trace.normal

*/
//-----------------------------------------------------------------------
local Trace = ::TraceLine;

class::VS.TraceLine
{
	constructor( start = null, end = null, ent = null ):(Vector,Trace)
	{
		if ( !start )
		{
			local v = Vector();
			startpos = v;
			endpos = v;
			ignore = ent;
			fraction = 1.0;
			return;
		};

		startpos = start;
		endpos = end;
		ignore = ent;
		fraction = Trace( startpos, endpos, ignore );
	}

	function _cmp(d) { if ( fraction < d.fraction ) return -1; if ( fraction > d.fraction ) return 1; return 0; }
	function _add(d) { return fraction + d.fraction; }
	function _sub(d) { return fraction - d.fraction; }
	function _mul(d) { return fraction * d.fraction; }
	function _div(d) { return fraction / d.fraction; }
	function _modulo(d) { return fraction % d.fraction; }
	function _unm() { return -fraction; }
	function _typeof() { return "trace_t"; }

	startpos = null;
	endpos = null;
	ignore = null;
	fraction = 0.0;
	hitpos = null;
	normal = null;

	m_Delta = null;
	m_IsSwept = null;
	m_Extents = null;
	m_IsRay = null;
	m_StartOffset = null;
	m_Start = null;
}

//-----------------------------------------------------------------------
// Set 'f' to limit the max distance
// Input  : Vector [ start pos ]
//          Vector [ normalised direction ]
//          handle [ to ignore ]
// Output : trace_t [ VS.TraceLine ]
//-----------------------------------------------------------------------
local CTrace = ::VS.TraceLine;

function VS::TraceDir( v1, vDir, f = MAX_TRACE_LENGTH, hEnt = null ):(CTrace)
{
	return CTrace( v1, v1 + (vDir * f), hEnt );
}

// if direct LOS return false
function VS::TraceLine::DidHit()
{
	return fraction < 1.0;
}

// return hit entity handle, null if none
function VS::TraceLine::GetEnt( radius )
{
	return GetEntByClassname( "*", radius );
}

// GetEnt, find by name
function VS::TraceLine::GetEntByName( targetname, radius ):(Entities)
{
	if ( !hitpos ) GetPos();
	return Entities.FindByNameNearest( targetname, hitpos, radius );
}

// GetEnt, find by classname
function VS::TraceLine::GetEntByClassname( classname, radius ):(Entities)
{
	if ( !hitpos ) GetPos();
	return Entities.FindByClassnameNearest( classname, hitpos, radius );
}

// return hit position (hitpos)
function VS::TraceLine::GetPos()
{
	if ( !hitpos )
	{
		if ( DidHit() ) hitpos = startpos + (endpos - startpos) * fraction;
		else hitpos = endpos;
	};
	return hitpos;
}

// Get distance from startpos to hit position
function VS::TraceLine::GetDist()
{
	return (startpos-GetPos()).Length();
}

// Get distance squared. Useful for comparisons
function VS::TraceLine::GetDistSqr()
{
	return (startpos-GetPos()).LengthSqr();
}

local TraceDir = ::VS.TraceDir;

// Get surface normal
function VS::TraceLine::GetNormal():(Vector,TraceDir)
{
	if ( !normal )
	{
		local u = Vector(0.0,0.0,0.5),
			  d = endpos - startpos;
		d.Norm();
		GetPos();
		normal = (hitpos-TraceDir(startpos+d.Cross(u),d).GetPos()).Cross(hitpos-TraceDir(startpos+u,d).GetPos());
		normal.Norm();
	};

	return normal;
}

// initiate ray tracing
function VS::TraceLine::Ray( mins =::Vector(), maxs =::Vector() )
{
	m_Delta = endpos - startpos;
	m_IsSwept = m_Delta.LengthSqr() != 0.0;
	m_Extents = (maxs - mins) * 0.5;
	m_IsRay = m_Extents.LengthSqr() < 1.e-6;
	m_StartOffset = (mins + maxs) * 0.5;
	m_Start = startpos + m_StartOffset;
	m_StartOffset *= -1.0;
	return this;
}

// VECTOR_CONE_1DEGREES  = Vector( 0.00873, 0.00873, 0.00873 )
// VECTOR_CONE_2DEGREES  = Vector( 0.01745, 0.01745, 0.01745 )
// VECTOR_CONE_3DEGREES  = Vector( 0.02618, 0.02618, 0.02618 )
// VECTOR_CONE_4DEGREES  = Vector( 0.03490, 0.03490, 0.03490 )
// VECTOR_CONE_5DEGREES  = Vector( 0.04362, 0.04362, 0.04362 )
// VECTOR_CONE_6DEGREES  = Vector( 0.05234, 0.05234, 0.05234 )
// VECTOR_CONE_7DEGREES  = Vector( 0.06105, 0.06105, 0.06105 )
// VECTOR_CONE_8DEGREES  = Vector( 0.06976, 0.06976, 0.06976 )
// VECTOR_CONE_9DEGREES  = Vector( 0.07846, 0.07846, 0.07846 )
// VECTOR_CONE_10DEGREES = Vector( 0.08716, 0.08716, 0.08716 )
// VECTOR_CONE_15DEGREES = Vector( 0.13053, 0.13053, 0.13053 )
// VECTOR_CONE_20DEGREES = Vector( 0.17365, 0.17365, 0.17365 )

//function VS::ApplySpread(vecShotDirection, vecSpread, bias = 1.0)
//{
//	// get circular gaussian spread
//	local x, y, z;
//
//	if ( bias > 1.0 )
//		bias = 1.0;
//	else if ( bias < 0.0 )
//		bias = 0.0;;
//
//	local shotBiasMin = -1.0;
//	local shotBiasMax = 1.0;
//
//	// 1.0 gaussian, 0.0 is flat, -1.0 is inverse gaussian
//	local shotBias = ( ( shotBiasMax - shotBiasMin ) * bias ) + shotBiasMin;
//
//	local flatness = ( fabs(shotBias) * 0.5 );
//
//	do
//	{
//		x = RandomFloat(-1.0,1.0) * flatness + RandomFloat(-1.0,1.0) * (1.0 - flatness);
//		y = RandomFloat(-1.0,1.0) * flatness + RandomFloat(-1.0,1.0) * (1.0 - flatness);
//		if ( shotBias < 0.0 )
//		{
//			x = ( x >= 0.0 ) ? 1.0 - x : -1.0 - x;
//			y = ( y >= 0.0 ) ? 1.0 - y : -1.0 - y;
//		};
//		z = x*x+y*y;
//	} while (z > 1)
//
//	local vecRight = Vector(), vecUp = Vector();
//	VectorVectors(vecShotDirection, vecRight, vecUp);
//
//	return vecShotDirection + x * vecSpread.x * vecRight + y * vecSpread.y * vecUp;
//}

//-----------------------------------------------------------------------
// UniqueString without _ in the end
//-----------------------------------------------------------------------
function VS::UniqueString():(DoUniqueString)
{
	local s = DoUniqueString("");
	return s.slice(0,s.len()-1);
}

//-----------------------------------------------------------------------
// FindInArray
// arr.find( val )
//
// linear search
// if value found in array, return index
// else return null
//-----------------------------------------------------------------------
function VS::arrayFind( arr, val )
{
	foreach( i, v in arr )
		if ( v == val )
			return i;
}

//-----------------------------------------------------------------------
// arr.apply( func(v) )
// apply the input function to every element in the input array
//-----------------------------------------------------------------------
function VS::arrayApply( arr, func )
{
	foreach( i, v in arr )
		arr[i] = func( v );
}

//-----------------------------------------------------------------------
// arr.map( func(v) )
// Same as arrayApply, but return a new array. Doesn't modify the input array
//-----------------------------------------------------------------------
local array = ::array;

function VS::arrayMap( arr, func ):(array)
{
	local new = array(arr.len());

	foreach( i, v in arr )
		new[i] = func( v );
	return new;
}

//-----------------------------------------------------------------------
// < VS.DumpScope(input, 1, 1, 0, depth) > is equivalent to <__DumpScope(depth, input)>
//
// Input  : array/table [ array or table to dump ]
//          bool [ print default keys ]
//          bool [ expand nested tables and arrays ]
//          bool [ --- ]
//          integer [ indent ]
//-----------------------------------------------------------------------
function VS::DumpScope( table, printall = false, deepprint = true, guides = true, depth = 0 ):(slots_default)
{
	local indent = function(count) for( local i = count; i--; ) ::print("   ");
	if ( guides ) ::print(" ------------------------------\n");
	if ( table )
	{
		foreach( key, val in table )
		{
			local isdefault = false;
			if ( !printall ){ foreach( k in slots_default ) if ( key == k ) isdefault = true }
			else if ( key == "VS" || key == "Documentation" ) isdefault = true;;
			if ( !isdefault )
			{
				indent(depth);
				::print(key);
				switch( typeof val )
				{
					case "table":
						::print("(TABLE) : "+val.len());
						if (!deepprint) break;
						::print("\n");
						indent(depth);
						::print("{\n");
						DumpScope( val, printall, deepprint, false, depth + 1 );
						indent(depth);
						::print("}");
						break;
					case "array":
						::print("(ARRAY) : "+val.len());
						if (!deepprint) break;
						::print("\n");
						indent(depth);
						::print("[\n");
						DumpScope( val, printall, deepprint, false, depth + 1 );
						indent(depth);
						::print("]");
						break;
					case "string":
						::print(" = \""+val+"\"");
						break;
					case "Vector":
						::print(" = "+::VecToString(val));
						break;
					default:
						::print(" = "+val);
				}
				::print("\n");
			};
		}
	}
	else ::print("null\n");
	if ( guides ) ::print(" ------------------------------\n");
}

//-----------------------------------------------------------------------
// Input  : array [ input ]
// Output : table [ clone of the input ]
//-----------------------------------------------------------------------
function VS::ArrayToTable( a )
{
	local t = {}
	foreach( i, v in a ) t[v] <- i;
	return t;
}

//-----------------------------------------------------------------------
// Put in the function you want to get stack info from
// if deepprint && scope not roottable, deepprint
/*
Engine function calls are done through Call(...), that's why these 2 stacks are excluded.
	 ---
	line = -1
	locals(TABLE) : 0
	src = "NATIVE"
	func = "pcall"
	 ---
	line = 360
	locals(TABLE) : 5
	{
	   i = 0
	   args(ARRAY) : 0
	   this = (instance : pointer)
	   result = (null : 0x00000000)
	   func = (function : pointer)
	}
	src = "unnamed"
	func = "Call"
	 ---
*/
//-----------------------------------------------------------------------
function VS::GetStackInfo( deepprint = false, printall = false )
{
	::print(" --- STACKINFO ----------------\n");
	local s, j = 2;
	while( s =::getstackinfos(j++) )
	{
		if ( s.func == "pcall" && s.src == "NATIVE" ) break;
		::print(" ("+(j-1)+")\n");
		local w, m = s.locals;
		if ( "this" in m && typeof m["this"] == "table" )
		{
			if (m["this"] == ::getroottable())
			{
				w = "roottable";
			}
			else
			{
				if ( w = GetVarName(m["this"]) )
				{
					m[w] <- delete m["this"];
				};
			};
		};
		if ( w == "roottable" ) DumpScope(s, printall, 0, 0);
		else DumpScope(s, printall, deepprint, 0);
		if (w)::print("scope = \""+w+"\"\n");
	}
	::print(" --- STACKINFO ----------------\n");
}

local Stack = ::getstackinfos;

// return caller table
function VS::GetCaller():(Stack) return Stack(3).locals["this"];

// (DEBUG) return caller function as string
function VS::GetCallerFunc():(Stack) return Stack(3).func;

//-----------------------------------------------------------------------
// Input  : table
// Output : array containing the input's directory
//-----------------------------------------------------------------------
function VS::GetTableDir(input)
{
	if ( typeof input != "table" )
		throw "Invalid input type '" + typeof input + "' ; expected: 'table'";

	local r = _f627f40d21a6([],input);

	if (r) r.append("roottable");
	else r = ["roottable"];

	r.reverse();
	return r
}

// exclusive recursion function
function VS::_f627f40d21a6(bF, t, l = ROOT)
{
	foreach(v, u in l)
		if (typeof u == "table")
			if (v != "VS" && v != "Documentation")
				if (u == t)
				{
					bF.append(v);
					return bF;
				}
				else
				{
					local r = _f627f40d21a6(bF, t, u);
					if (r)
					{
						bF.append(v);
						return r;
					};
				};;;
}

//-----------------------------------------------------------------------
// Input  : string [variable]
// Output : variable
//-----------------------------------------------------------------------
function VS::FindVarByName(S)
{
	if (typeof S != "string")
		throw "Invalid input type '" + typeof S + "' ; expected: 'string'";

	return _fb3k55Ir91t7(S);
}

// exclusive recursion function
function VS::_fb3k55Ir91t7(t, l = ROOT)
{
	if (t in l)
		return l[t];
	else
		foreach(v, u in l)
			if (typeof u == "table")
				if (v != "VS" && v != "Documentation")
				{
					local r = _fb3k55Ir91t7(t, u);
					if (r) return r;
				};;;
}

//-----------------------------------------------------------------------
// Doesn't work with primitive variables if
// there are multiple variables with the same value.
// But it can work if the value is unique, like a unique string.
//-----------------------------------------------------------------------
function VS::GetVarName(v)
{
	local t = typeof v;

	if ( t == "function" || t == "native function" )
		return v.getinfos().name;

	return _fb3k5S1r91t7(t, v);
}

// exclusive recursion function
function VS::_fb3k5S1r91t7(t, i, s = ROOT)
{
	foreach(k, v in s)
	{
		if (v == i)
			return k;

		if (typeof v == "table")
			if (k != "VS" && k != "Documentation")
			{
				local r = _fb3k5S1r91t7(t, i, v);
				if (r) return r;
			};;
	}
}

local World;
{
	local e = Entc("worldspawn");
	if ( !e )
	{
		Msg("ERROR: could not find worldspawn\n");
		e = VS.CreateEntity("soundent");
	};
	if ( e.ValidateScriptScope() )
		slots_default.append( e.GetScriptScope().__vname );
	World = e;
}

//-----------------------------------------------------------------------
// Deprecated. Use VS.EventQueue.AddEvent instead.
//
//  	VS.EventQueue.AddEvent( MyFunc, 0.5 )
//  	VS.EventQueue.AddEvent( MyFunc, 0.5, this )
//  	VS.EventQueue.AddEvent( MyFunc, 0.5, null )
//  	VS.EventQueue.AddEvent( MyFunc, 0.5, [ this, "param1", "param2" ] )
//  	VS.EventQueue.AddEvent( MyFunc, 0.5, [ this, "param1", "param2" ], activator, caller )
//
//
// Each string is allocated and added to the game string pool.
//-----------------------------------------------------------------------
local AddEvent = ::DoEntFireByInstanceHandle;
::delay <- function( X, T = 0.0, E = World, A = null, C = null ):(AddEvent)
	return AddEvent( E, "RunScriptCode", ""+X, T, A, C );


//-----------------------------------------------------------------------
//-----------------------------------------------------------------------


{
VS.EventQueue <- delegate VS :
{
	m_Events      = [null],
	m_flNextQueue = -1.0,
	m_flLastQueue = -1.0
}

// enum
local m_flFireTime = 0;
local m_hFunc      = 1;
local m_argv       = 2;
local m_Env        = 3;
local m_activator  = 4;
local m_caller     = 5;
local curtime = ::Time;

VS.EventQueue.Dump <- function() : ( m_flFireTime, m_hFunc, m_argv, m_Env, m_activator, m_caller, curtime )
{
	if ( !("m_Events" in this) )
		return Msg("VS::EventQueue::Dump: FAILED\n");

	local get = function(i)
	{
		if ( i == null )
			return "(NULL)";
		local s = "" + i;
		local t = s.find("0x");
		if ( t == null )
			return s;
		return "(" + s.slice( t, s.len()-1 ) + ")";
	}

	Msg( "VS::EventQueue::Dump: " + curtime() + " : next(" + m_flNextQueue + "), last(" + m_flLastQueue + ")\n" );
	for ( local i = 0, l = m_Events.len() - 1; i < l; ++i )
	{
		local ev = m_Events[i];
		Msg(format( "   (%.2f) func '%s', env '%s', activator '%s', caller '%s'\n",
			ev[m_flFireTime],
			get(ev[m_hFunc]),
			get(ev[m_Env]),
			get(ev[m_activator]),
			get(ev[m_caller]) ));
	}
	Msg( "VS::EventQueue::Dump: end.\n" );

}.bindenv(VS.EventQueue);

VS.EventQueue.Clear <- function()
{
	m_Events.clear();
	m_Events.append(null);
	m_flNextQueue = -1.0;
	m_flLastQueue = -1.0;

}.bindenv(VS.EventQueue);

VS.EventQueue.CancelEventsByInput <- function( f ) : ( m_hFunc )
{
	for ( local i = m_Events.len() - 1; i--; )
	{
		if ( f == m_Events[i][m_hFunc] )
		{
			m_Events.remove(i);
		};
	}
}.bindenv(VS.EventQueue);

VS.EventQueue.RemoveEvent <- function( ev )
{
	if ( typeof ev == "weakref" )
		ev = ev.ref();

	for ( local i = m_Events.len() - 1; i--; )
	{
		if ( ev == m_Events[i] )
		{
			m_Events.remove(i);
			return;
		};
	}
}.bindenv(VS.EventQueue);

VS.EventQueue.AddEvent <- function( hFunc, flDelay, argv = null, activator = null, caller = null ) :
( World, AddEvent, m_flFireTime, m_hFunc, m_Env, m_argv, m_activator, m_caller, curtime, ROOT )
{
	local curtime = curtime();
	local event = [null,null,null,null,null,null];

	event[ m_flFireTime ] = curtime + flDelay;
	event[ m_hFunc ] = hFunc;
	event[ m_activator ] = activator;
	event[ m_caller ] = caller;

	local typeofArgs = typeof argv;
	if ( typeofArgs == "table" )
	{
		event[ m_Env ] = argv;
	}
	else if ( typeofArgs == "array" )
	{
		event[ m_argv ] = argv;
	}
	else
	{
		event[ m_Env ] = ROOT;
	};;

	local i = 0, v = m_Events.len() - 1;
	while ( i < v )
	{
		if ( event[ m_flFireTime ] < m_Events[i][ m_flFireTime ] )
		{
			v = i;
			break;
		};
		++i;
	}
	m_Events.insert( v, event );

	if ( m_flLastQueue == curtime )
		return event.weakref(); m_flLastQueue = curtime;

	if ( (m_flNextQueue == -1.0) || (flDelay < m_flNextQueue) )
	{
		AddEvent( World, "RunScriptCode", "::VS.EventQueue.ServiceEvents()", 0.0, activator, caller );
		m_flNextQueue = flDelay;
	};
	// SetNextThink( 1 );

	return event.weakref();

}.bindenv(VS.EventQueue);

VS.EventQueue.ServiceEvents <- function() : ( World, AddEvent, m_flFireTime, m_hFunc, m_Env, m_argv, m_activator, m_caller, curtime )
{
	local curtime = curtime();
	local ev;
	while ( ev = m_Events[0] )
	{
		local f = ev[m_flFireTime];
		if ( f <= curtime )
		{
			local f = ev[m_hFunc];
			if ( f )
			{
				local p = ev[ m_argv ];
				if ( p ) f.acall( p );
				else f.call( ev[ m_Env ] );
			};
			m_Events.remove(0);
		}
		else
		{
			local next = f - curtime;
			m_flNextQueue = next;
			AddEvent( World, "RunScriptCode", "::VS.EventQueue.ServiceEvents()", next, ev[m_activator], ev[m_caller] );
			return;
		};
	}
	m_flNextQueue = -1.0;
	// SetNextThink( -1 );

}.bindenv(VS.EventQueue);
}


//-----------------------------------------------------------------------
//-----------------------------------------------------------------------


//-----------------------------------------------------------------------
// Frame times:
//
// 64.0  tick : 0.01562500
// 102.4 tick : 0.00976563
// 128.0 tick : 0.00781250
//-----------------------------------------------------------------------
local flTickRate = 1.0 / ::FrameTime();
function VS::GetTickrate():(flTickRate)
{
	return flTickRate;
}

if (!PORTAL2){

// The initialisation of this function is asynchronous.
// It takes 12 seconds to finalise on map spawn auto-load,
// and 1-5 frames on manual execution on post map spawn.
// VS.flCanCheckForDedicatedAfterSec can be used for delayed initialisation needs.
// 		VS.EventQueue.AddEvent( Init, VS.flCanCheckForDedicatedAfterSec, this )
function VS::IsDedicatedServer()
{
	throw "not ready";
}

local TIMESTART = 4.0;
local TIMEOUT = 12.0;
local _TIMEOUT = TIMEOUT+FrameTime()*4;

::VS.flCanCheckForDedicatedAfterSec <- fabs(clamp(Time(),0,_TIMEOUT)-_TIMEOUT);

::_VS_DS_Init <- function():(TIMESTART,TIMEOUT)
{
	if (::_VS_DS_bInitDone)
	{
		::VS.flCanCheckForDedicatedAfterSec = 0.0;

		delete::_VS_DS_Init;
		delete::_VS_DS_IsListen;
		delete::_VS_DS_bInitDone;
		delete::_VS_DS_bExecOnce;
		return;
	};

	local time = ::Time();

	if ( time > TIMESTART )
	{
		::SendToConsole("script _VS_DS_IsListen()");

		if ( time > TIMEOUT )
		{
			::VS.IsDedicatedServer = function() return true;
			::_VS_DS_bInitDone = true;
		};
	};

	::VS.EventQueue.AddEvent( ::_VS_DS_Init, 0.1, this ); // delay value should not be less than 5 frames (SendToConsole delay)
}

::_VS_DS_IsListen <- function()
{
	::VS.IsDedicatedServer = function() return false;
	::_VS_DS_bInitDone = true;
}

// extra protection
if ( !("_VS_DS_bExecOnce" in ROOT) )
{
	::_VS_DS_bExecOnce <- true;
	::_VS_DS_bInitDone <- false;
};

if (::_VS_DS_bExecOnce)
{
	local time = ::Time();

	// on map load
	if ( time < TIMESTART )
	{
		::VS.EventQueue.AddEvent( ::_VS_DS_Init, TIMESTART-time, this );
	}
	// late execution
	else
	{
		::_VS_DS_Init();
	};

	::_VS_DS_bExecOnce = false;
};

}; // !PORTAL2

if (!PORTAL2){

local Chat = ::ScriptPrintMessageChatAll;
local ChatTeam = ::ScriptPrintMessageChatTeam;

::Chat      <- function(s):(Chat) return Chat(" "+s);
::ChatTeam  <- function(i,s):(ChatTeam) return ChatTeam(i," "+s);
::Alert     <- ::ScriptPrintMessageCenterAll;
::AlertTeam <- ::ScriptPrintMessageCenterTeam;

::txt <-
{
	invis      = "\x00",
	white      = "\x01",
	red        = "\x02",
	purple     = "\x03",
	green      = "\x04",
	lightgreen = "\x05",
	limegreen  = "\x06",
	lightred   = "\x07",
	grey       = "\x08",
	yellow     = "\x09",
	lightblue  = "\x0a",
	blue       = "\x0b",
	darkblue   = "\x0c",
	darkgrey   = "\x0d",
	pink       = "\x0e",
	orangered  = "\x0f",
	orange     = "\x10"
}

}; // !PORTAL2
