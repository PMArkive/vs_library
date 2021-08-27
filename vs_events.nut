//-----------------------------------------------------------------------
//------------------- Copyright (c) samisalreadytaken -------------------
//                       github.com/samisalreadytaken
//-----------------------------------------------------------------------
local _VERSION = "vs_library v2.42.0",
ROOT=::getroottable(),CONST=::getconsttable();if("VS"in ROOT&&typeof::VS=="table"){if(::VS.version==_VERSION){if(!(0 in::VS))::VS[0]<-0;if(::VS[0]&0x10)return}}else::VS<-{};;local VS={[0]=0x10,version=_VERSION}if(::print.getinfos().native)::Msg<-::print;;if(::EntFireByHandle.getinfos().native)::DoEntFireByInstanceHandle<-::EntFireByHandle;;local AddEvent=::DoEntFireByInstanceHandle,Fmt=::format;VS.GetCaller<-function():(getstackinfos)return getstackinfos(3).locals["this"];VS.MakePersistent<-function(e){return e.__KeyValueFromString("classname","soundent")}VS.GetAllPlayers<-function():(Entities){local e,a=[];while(e=Entities.FindByClassname(e,"player"))a.append(e.weakref());e=null;while(e=Entities.FindByClassname(e,"cs_bot"))a.append(e.weakref());return a}VS.GetPlayerByIndex<-function(i):(Entities){local e;while(e=Entities.FindByClassname(e,"player"))if(e.entindex()==i)return e;e=null;while(e=Entities.FindByClassname(e,"cs_bot"))if(e.entindex()==i)return e}local Events=delegate::VS:{m_hProxy=null,m_bFixedUp=false,m_SV=null,m_Players=null,m_pSpawner=null,m_pListeners=null,s_szEventName=null,s_hListener=null,s_fnSynchronous=null,__rem=null,__tmp=null,Msg=Msg}VS.Events<-Events;if(!("{847D4B}"in ROOT))ROOT["{847D4B}"]<-array(64);;local gED=ROOT["{847D4B}"];VS.GetPlayerByUserid<-function(i):(Entities){if(m_Players&&i in m_Players)return m_Players[i];if(!m_Players)m_Players={};local p;while(p=Entities.FindByClassname(p,"player")){local s=p.GetScriptScope();if("userid"in s&&s.userid==i){m_Players[i]<-p.weakref();return p}}p=null;while(p=Entities.FindByClassname(p,"cs_bot")){local s=p.GetScriptScope();if("userid"in s&&s.userid==i){m_Players[i]<-p.weakref();return p}}}.bindenv(VS.Events);VS.Events.player_connect<-function(ev):(gED,ROOT){if(ev.networkid!=""){local x;foreach(i,v in gED)if(!gED[i]){x=i;break};if(x==null){for(local i=32;i<64;++i){gED[i-32]=gED[i];gED[i]=null}x=32;Msg("player_connect: ERROR!!! Player data is not being processed\n")};gED[x]=ev;if(!m_pListeners){local cr=GetCaller();if(!cr.parent||!cr.parent.rawin("{7D6E9A}")){Msg("player_connect: Warning: event listener is not fixed up!\n");m_bFixedUp=false}else m_bFixedUp=true;if("OnGameEvent_player_connect"in ROOT)::OnGameEvent_player_connect(ev)};return true};if(m_SV){local sc=m_SV.remove(0);if(!sc||!("self"in sc))return Msg("VS::ForceValidateUserid: invalid scope in validation\n");if(!sc.__vrefs||!sc.self||!sc.self.IsValid())return Msg("VS::ForceValidateUserid: invalid entity in validation\n");if("userid"in sc&&sc.userid!=ev.userid)Msg("VS::ForceValidateUserid: ERROR!!! conflict! ["+sc.userid+", "+ev.userid+"]\n");sc.userid<-ev.userid;if(!("name"in sc))sc.name<-"";if(!("networkid"in sc))sc.networkid<-"";if(!(0 in m_SV))m_SV=null}}.bindenv(VS.Events);VS.Events.player_spawn<-function(ev):(gED,Fmt,ROOT){foreach(i,dt in gED){if(!dt)break;if(dt.userid==ev.userid){local pl=GetPlayerByIndex(dt.index+1);if(!pl||!pl.ValidateScriptScope()){gED[i]=null;Msg("player_connect: invalid player entity ["+dt.userid+"] ["+(dt.index+1)+"]\n");break};local sc=pl.GetScriptScope();if("networkid"in sc&&sc.networkid!=""){Msg("player_connect: ERROR!!! Something has gone wrong! ");if(sc.networkid==dt.networkid){gED[i]=null;Msg(Fmt("Duplicated data. [%d]\n",dt.userid))}else Msg(Fmt("Conflicting data. [%d] ('%s', '%s')\n",dt.userid,sc.networkid,dt.networkid));break};sc.userid<-dt.userid;sc.name<-dt.name;sc.networkid<-dt.networkid;gED[i]=null;gED.sort();gED.reverse();break}}if(!m_pListeners){local cr=GetCaller();if(!cr.parent||!cr.parent.rawin("{7D6E9A}"))Msg("player_spawn: Warning: event listener is not fixed up!\n");if("OnGameEvent_player_spawn"in ROOT)return::OnGameEvent_player_spawn(ev)}}.bindenv(VS.Events);VS.ForceValidateUserid<-function(p):(AddEvent,Fmt,Entities){if(!p||!p.IsValid()||(p.GetClassname()!="player")||!p.ValidateScriptScope())return Msg(Fmt("VS::ForceValidateUserid: invalid input: %s\n",""+p));if(!m_SV)m_SV=[];local sc=p.GetScriptScope(),b=1;foreach(v in m_SV)if(v==sc){b=0;break};if(b)m_SV.append(sc.weakref());if(!m_hProxy){local h=Entities.CreateByClassname("info_game_event_proxy");h.__KeyValueFromString("event_name","player_connect");MakePersistent(h);m_hProxy=h.weakref()};return AddEvent(m_hProxy,"GenerateGameEvent","",0,p,null)}.bindenv(VS.Events);VS.ValidateUseridAll<-function(){if(Events.m_bFixedUp){foreach(i,v in GetAllPlayers())if(!("userid"in v.GetScriptScope()))ForceValidateUserid(v)}else{Msg("VS::ValidateUseridAll: Warning: player_connect event listener is not fixed up!");local d=::delay,t=::FrameTime();foreach(i,v in GetAllPlayers())d("::VS.ForceValidateUserid(self)",i*t,v)}}VS.Events.ForceValidateUserid<-VS.ForceValidateUserid.weakref();VS.Events.ValidateUseridAll<-VS.ValidateUseridAll.weakref();VS.FixupEventListener<-function(p){if(!p||!p.IsValid()||(p.GetClassname()!="logic_eventlistener")||!p.ValidateScriptScope())return Msg("VS::FixupEventListener: invalid event listener input\n");local sc=p.GetScriptScope();if(sc.parent.rawin("{7D6E9A}"))return Msg("VS::FixupEventListener: already fixed up "+p+"\n");local c=[];sc.rawdelete("event_data");delegate(delegate(delegate sc.parent:{_delslot=function(k){delete parent.parent[k]}}):{_newslot=function(k,v):(c){if(k=="event_data")c.insert(0,v);else rawset(k,v)},_get=function(k):(c){if(k=="event_data")return c.pop();return rawget(k)},["{7D6E9A}"]=null}):sc}local __RemovePooledString=function(sz){__rem=sz;m_pSpawner.SpawnEntity();__rem=null}.bindenv(VS.Events);VS.Events.SpawnEntity<-function(ev):(Entities){if(!m_pSpawner){local h=Entities.CreateByClassname("env_entity_maker");h.__KeyValueFromString("EntityTemplate","vs.eventlistener");MakePersistent(h);m_pSpawner=h.weakref()};s_szEventName=ev;m_pSpawner.SpawnEntity();local r=s_hListener;s_szEventName=s_hListener=null;return r}VS.Events.__ExecutePreSpawn<-function(p){local vs=VS.Events;if(vs.__rem){p.__KeyValueFromString("targetname",vs.__rem);p.__KeyValueFromString("EventName","player_connect");p.Destroy();return};local ev=vs.s_szEventName;if(!ev){p.Destroy();return Msg("VS::Events::PreSpawn: invalid call origin\n")};p.__KeyValueFromString("EventName",ev);p.__KeyValueFromInt("FetchEventData",1);p.__KeyValueFromInt("IsEnabled",1);p.__KeyValueFromInt("TeamNum",-1);__EntityMakerResult={}}VS.Events.__FinishSpawn<-function(){__EntityMakerResult=null}VS.Events.PostSpawn<-function(pE):(AddEvent){foreach(p in pE){s_hListener=p;FixupEventListener(p);MakePersistent(p);local sc=p.GetScriptScope();if(!s_fnSynchronous){local nm=sc.__vname;local i=nm.find("_");nm=s_szEventName+"_"+nm.slice(0,i);p.__KeyValueFromString("targetname",nm);AddEvent(p,"AddOutput","OnEventFired "+nm+",CallScriptFunction,OnEventFired",0.0,null,p);sc.OnEventFired<-null}else{p.__KeyValueFromString("targetname","");delete sc.parent._get;sc.parent._newslot=function(k,v):(s_fnSynchronous){if(k=="event_data")s_fnSynchronous(v);else rawset(k,v)}}}}.bindenv(VS.Events);VS.Events.OnPostSpawn<-function():(__RemovePooledString){local VS=VS;if(!VS.Events.m_bFixedUp){VS.Events.m_bFixedUp=true;Msg("VS::Events init\n");VS.StopListeningToAllGameEvents("VS::Events");VS.ListenToGameEvent("player_connect",VS.Events.player_connect,"VS::Events");VS.ListenToGameEvent("player_spawn",VS.Events.player_spawn,"VS::Events");VS.ListenToGameEvent("player_activate",function(ev){return ValidateUseridAll()}.bindenv(VS),"VS::Events");VS.ListenToGameEvent("player_disconnect",function(ev){if(m_Players&&ev.userid in m_Players){delete m_Players[ev.userid]}}.bindenv(VS.Events),"VS::Events")};if(VS.Events.__tmp)__RemovePooledString(VS.Events.__tmp);VS.Events.__tmp=__vname}VS.ListenToGameEvent<-function(ev,fn,cx){if((typeof fn!="function")&&(typeof fn!="native function"))throw"invalid callback param";if(typeof cx!="string")throw"invalid context param";if(!m_pListeners)m_pListeners={};if(!(ev in m_pListeners))m_pListeners[ev]<-{};local pL=m_pListeners[ev];if(!(cx in pL))pL[cx]<-null;local p=pL[cx];if(!p){if((cx=="VS::Events")&&(ev=="player_connect"||ev=="player_spawn"))s_fnSynchronous=fn;else s_fnSynchronous=null;if(!(p=SpawnEntity(ev)))return Msg("VS::ListenToGameEvent: ERROR!!! NULL ent!\n");pL[cx]=p.weakref();if(s_fnSynchronous){s_fnSynchronous=null;return}};local sc=p.GetScriptScope();sc.OnEventFired<-function():(fn){return fn(event_data)}}.bindenv(VS.Events);VS.StopListeningToAllGameEvents<-function(cx):(__RemovePooledString){if(m_pListeners)foreach(l in m_pListeners)if(cx in l){local p=l[cx];if(p&&typeof p=="instance"){__RemovePooledString("OnEventFired "+p.GetName()+",CallScriptFunction,OnEventFired");p.Destroy()};delete l[cx]}}.bindenv(VS.Events);local __ExecutePreSpawn=delete VS.Events.__ExecutePreSpawn,__FinishSpawn=delete VS.Events.__FinishSpawn,PostSpawn=delete VS.Events.PostSpawn,OnPostSpawn=delete VS.Events.OnPostSpawn;VS.Events.InitTemplate<-function(sc):(__ExecutePreSpawn,__FinishSpawn,PostSpawn,OnPostSpawn){local self;if(!("self"in sc)||!(self=sc.self)||!self.IsValid()||self.GetClassname()!="point_template")throw"VS::Events::InitTemplate: invalid entity";self.__KeyValueFromInt("spawnflags",0);self.__KeyValueFromString("targetname","vs.eventlistener");sc.__EntityMakerResult<-null;sc.__ExecutePreSpawn<-__ExecutePreSpawn;sc.__FinishSpawn<-__FinishSpawn;sc.PreSpawnInstance<-1;sc.PostSpawn<-PostSpawn;sc.OnPostSpawn<-OnPostSpawn.bindenv(sc)}{local gVS=::VS;if(!gVS.len()){foreach(k,v in VS)gVS[k]<-v;return::collectgarbage()};if(VS==gVS)return::collectgarbage();if(gVS.version==VS.version){local n=gVS[0]|VS[0];foreach(k,v in VS)gVS[k]<-v;gVS[0]=n;return::collectgarbage()};local vnt="",vst=gVS.version;local c=vst.len();for(local i=0;i<c;++i){local ch=vst[i];if(ch>='0'&&ch<='9')vnt+=ch.tochar()}if(vnt==""){vnt=0;Msg("VS: invalid version number ("+vst+")!\n")};vnt=vnt.tointeger();local vni="",vsi=VS.version;c=vsi.len();for(local i=0;i<c;++i){local ch=vsi[i];if(ch>='0'&&ch<='9')vni+=ch.tochar()}if(vni==""){vni=0;Msg("VS: invalid version number ("+vsi+")\n")};vni=vni.tointeger();if(vnt==vni){Msg("VS: non-matching version strings!\n");return::collectgarbage()};if(vnt<vni){foreach(k,v in VS){if(k=="Events")continue;gVS[k]<-v}}else{foreach(k,v in VS){if(k=="Events")continue;if(!(k in gVS))gVS[k]<-v}};VS=null;return::collectgarbage()}
