//-----------------------------------------------------------------------
//------------------- Copyright (c) samisalreadytaken -------------------
//- v2.36.10 ------------------------------------------------------------
if("VS"in::getroottable()&&typeof::VS=="table"&&"_xa9b2dfB7ffe"in::getroottable()&&!::VS._reload&&::ENT_SCRIPT.IsValid())return;;local _v2=function(){}local _f=_v2.getinfos().src;_f=_f.slice(0,_f.find(".nut"));if(this!=::getroottable())return::DoIncludeScript(_f,::getroottable());;if(_f!="vs_library")::print("Loading vs_library...\n");;::VS<-{slots_entity=["DispatchOnPostSpawn","self","__vname","PrecacheCallChain","OnPostSpawnCallChain","__vrefs","DispatchPrecache","activator","caller","OnPostSpawn","PostSpawn","Precache","PreSpawnInstance","__EntityMakerResult","__FinishSpawn","__ExecutePreSpawn"],slots_root=["CHostage","split","Vector","print","_floatsize_","ScriptIsLocalPlayerUsingController","GetDeveloperLevel","ScriptGetBestTrainingCourseTime","exp","CSceneEntity","ScriptCoopMissionRespawnDeadPlayers","DispatchParticleEffect","CTriggerCamera","DoEntFire","seterrorhandler","RandomFloat","CBasePlayer","VSquirrel_OnReleaseScope","ScriptCoopMissionSetNextRespawnIn","assert","atan2","ScriptCoopMissionSpawnNextWave","DoUniqueString","_charsize_","asin","atan","CBaseAnimating","cos","ScriptPrintMessageCenterTeam","EntFireByHandle","PI","Entities","SendToConsole","TraceLine","strip","ScriptCoopMissionGetMissionNumber","newthread","lstrip","ScriptCoopSetBotQuotaAndRefreshSpawns","ScriptPrintMessageChatTeam","IncludeScript","format","rstrip","acos","ScriptGetPlayerCompletedTraining","Documentation","__DumpScope","CEntities","abs","PrintHelp","ScriptPrintMessageCenterAllWithParams","CBaseEntity","FrameTime","Time","Assert","ScriptCoopGiveC4sToCTs","DebugDrawBox","DebugDrawLine","ScriptHighlightAmmoCounter","Document","_intsize_","collectgarbage","setroottable","ScriptSetMiniScoreHidden","ScriptCoopCollectBonusCoin","CBaseFlex","ScriptPrintMessageCenterAll","ScriptSetRadarHidden","enabledebuginfo","setdebughook","ceil","log10","CGameSurvivalLogic","RecordAchievementEvent","RAND_MAX","rand","srand","GetFunctionSignature","suspend","ScriptIsWarmupPeriod","VSquirrel_OnCreateScope","ScriptShowFinishMsgBox","developer","CEnvEntityMaker","__ReplaceClosures","compilestring","RetrieveNativeSignature","ScriptShowExitDoorMsg","SendToConsoleServer","GetMapName","EntFire","Msg","UniqueString","sqrt","ScriptGetRoundsPlayed","floor","CreateSceneEntity","getstackinfos","ScriptGetGameType","log","fabs","dummy","DoIncludeScript","LateBinder","getroottable","tan","ShowMessage","array","LoopSinglePlayerMaps","_version_","ScriptGetValveTrainingCourseTime","setconsttable","CreateProp","printl","CFuncTrackTrain","sin","getconsttable","pow","CGameCoopMissionManager","ScriptSetPlayerCompletedTraining","CBaseMultiplayerPlayer","RegisterFunctionDocumentation","CPlayerVoiceListener","ScriptSetBestTrainingCourseTime","ScriptTrainingGivePlayerAmmo","ScriptCoopResetRoundStartTime","CScriptKeyValues","type","CCallChainer","CSimpleCallChainer","ScriptPrintMessageChatAll","ScriptGetGameMode","regexp","RandomInt","ScriptCoopMissionSpawnFirstEnemies","ScriptCoopExtendRoundDurationTime","ScriptCoopToggleEntityOutlineHighlights","ScriptMissionResetDangerZones","ScriptMissionCreateAndDetonateDangerZone","ScriptCoopMissionSetDeadPlayerRespawnEnabled"],slots_VS=["_xa9b2dfB7ffe","VS","DoEntFireByInstanceHandle","ClearChat","Chat","ChatTeam","txt","Alert","AlertTeam","PrecacheModel","PrecacheScriptSound","delay","OnGameEvent_player_spawn","OnGameEvent_player_connect","VecToString","ENT_SCRIPT","HPlayer","SPlayer","Ent","Entc","max","min","clamp","MAX_COORD_FLOAT","MAX_TRACE_LENGTH","DEG2RAD","RAD2DEG","CONST","vs_library"],slots_valve=[],slots_default=[],Events={hProxy=null,flValidateTime=0.0,_SV=null},Log={condition=false,export=false,filePrefix="vs.log",L=[],filter="VFLTR"},_reload=false}VS.slots_valve.extend(VS.slots_entity);VS.slots_valve.extend(VS.slots_root);VS.slots_default.extend(VS.slots_valve);VS.slots_default.extend(VS.slots_VS);::CONST<-::getconsttable();::vs_library<-"vs_library 2.36.10";::MAX_COORD_FLOAT<-16384.0;::MAX_TRACE_LENGTH<-56755.84086241;::DEG2RAD<-0.01745329;::RAD2DEG<-57.29577951;::RAND_MAX<-32767;::txt<-{invis="\x00",white="\x01",red="\x02",purple="\x03",green="\x04",lightgreen="\x05",limegreen="\x06",lightred="\x07",grey="\x08",yellow="\x09",lightblue="\x0a",blue="\x0b",darkblue="\x0c",darkgrey="\x0d",pink="\x0e",orangered="\x0f",orange="\x10"}if(!("_xa9b2dfB7ffe"in::getroottable()))::_xa9b2dfB7ffe<-[];;if(!("OnGameEvent_player_spawn"in::getroottable()))::OnGameEvent_player_spawn<-::dummy;;if(!("OnGameEvent_player_connect"in::getroottable()))::OnGameEvent_player_connect<-::dummy;;if(::print.getinfos().native)::Msg<-::print;;if(::EntFireByHandle.getinfos().native)::DoEntFireByInstanceHandle<-::EntFireByHandle;;local _VEC=Vector();local Entities=::Entities,AddEvent=::DoEntFireByInstanceHandle,Vector=::Vector,RandomFloat=::RandomFloat,DebugDrawBox=::DebugDrawBox,DoUniqueString=::DoUniqueString,Time=::Time,format=::format,sin=::sin,cos=::cos,floor=::floor,fabs=::fabs,atan2=::atan2,exp=::exp,pow=::pow,log=::log,compile=::compilestring;::Ent<-function(s,i=null):(Entities)return Entities.FindByName(i,s);::Entc<-function(s,i=null):(Entities)return Entities.FindByClassname(i,s);local _v0=function(){if(::ENT_SCRIPT<-::Entc("worldspawn")){::ENT_SCRIPT.ValidateScriptScope();::VS.slots_default.append(::VS.GetVarName(::ENT_SCRIPT.GetScriptScope()))}else{(::ENT_SCRIPT<-::VS.CreateEntity("soundent")).ValidateScriptScope();::VS._ENT_SCRIPT<-::ENT_SCRIPT;::print("ERROR: Could not find worldspawn\n")};::collectgarbage()}function VS::ForceReload():(_f){_reload=true;::print("Reloading vs_library...\n");return::DoIncludeScript(_f,::getroottable())}::max<-function(a,b)return a>b?a:b;::min<-function(a,b)return a<b?a:b;::clamp<-function(v,lo,hi){if(hi<lo){local t=hi;hi=lo;lo=t};return(v<lo)?lo:(hi<v)?hi:v}function VS::IsInteger(f):(floor)return floor(f)==f;function VS::IsLookingAt(S,T,D,cos){local to=T-S;to.Norm();return to.Dot(D)>=cos}function VS::PointOnLineNearestPoint(S,E,P){local v1=E-S,dist=v1.Dot(P-S)/v1.LengthSqr();if(dist<0.0)return S;else if(dist>1.0)return E;else return S+v1*dist}function VS::GetAngle(vFrom,vTo):(Vector,atan2){local d=vFrom-vTo,pitch=57.29577951*atan2(d.z,d.Length2D()),yaw=57.29577951*(atan2(d.y,d.x)+3.14159265);return Vector(pitch,yaw,0.0)}function VS::GetAngle2D(vFrom,vTo):(atan2){local d=vTo-vFrom,yaw=57.29577951*atan2(d.y,d.x);return yaw}function VS::VectorVectors(forward,right,up):(Vector){if(forward.x==0.0&&forward.y==0.0){right.x=0.0;right.y=-1.0;right.z=0.0;up.x=-forward.z;up.y=0.0;up.z=0.0}else{local R=forward.Cross(Vector(0.0,0.0,1.0));right.x=R.x;right.y=R.y;right.z=R.z;right.Norm();local U=right.Cross(forward);up.x=U.x;up.y=U.y;up.z=U.z;up.Norm()}}function VS::AngleVectors(vAng,vFwd=_VEC,vRg=null,vUp=null):(sin,cos){local sr,cr,rr,yr=0.01745329*vAng.y,sy=sin(yr),cy=cos(yr),pr=0.01745329*vAng.x,sp=sin(pr),cp=cos(pr);if(vAng.z){rr=0.01745329*vAng.z;sr=sin(rr);cr=cos(rr)}else{sr=0.0;cr=1.0};if(vFwd){vFwd.x=cp*cy;vFwd.y=cp*sy;vFwd.z=-sp};if(vRg){vRg.x=(-1.0*sr*sp*cy+-1.0*cr*-sy);vRg.y=(-1.0*sr*sp*sy+-1.0*cr*cy);vRg.z=-1.0*sr*cp};if(vUp){vUp.x=(cr*sp*cy+-sr*-sy);vUp.y=(cr*sp*sy+-sr*cy);vUp.z=cr*cp};return vFwd}function VS::VectorAngles(vFwd):(Vector,atan2,sqrt){local tmp,yaw,pitch;if(vFwd.y==0.0&&vFwd.x==0.0){yaw=0.0;if(vFwd.z>0.0)pitch=270.0;else pitch=90.0}else{yaw=57.29577951*atan2(vFwd.y,vFwd.x);if(yaw<0.0)yaw+=360.0;tmp=sqrt(vFwd.x*vFwd.x+vFwd.y*vFwd.y);pitch=57.29577951*atan2(-vFwd.z,tmp);if(pitch<0.0)pitch+=360.0};return Vector(pitch,yaw,0.0)}function VS::VectorYawRotate(vIn,fYaw,vOut=_VEC):(sin,cos){local rad=0.01745329*fYaw,sy=sin(rad),cy=cos(rad);vOut.x=vIn.x*cy-vIn.y*sy;vOut.y=vIn.x*sy+vIn.y*cy;vOut.z=vIn.z;return vOut}function VS::YawToVector(yaw):(Vector,sin,cos){local ang=0.01745329*yaw;return Vector(cos(ang),sin(ang),0.0)}function VS::VecToYaw(vec):(atan2){if(vec.y==0.0&&vec.x==0.0)return 0.0;local yaw=57.29577951*atan2(vec.y,vec.x);if(yaw<0.0)yaw+=360.0;return yaw}function VS::VecToPitch(vec):(atan2){if(vec.y==0.0&&vec.x==0.0){if(vec.z<0.0)return 180.0;else return -180.0};return 57.29577951*atan2(-vec.z,vec.Length2D())}function VS::VectorIsZero(v)return v.x==v.y&&v.y==v.z&&v.z==0.0;function VS::VectorsAreEqual(a,b,cos=0.0):(fabs)return(fabs(a.x-b.x)<=cos&&fabs(a.y-b.y)<=cos&&fabs(a.z-b.z)<=cos);function VS::AnglesAreEqual(a,b,cos=0.0):(fabs){local df=a-b;df%=360.0;if(df>180.0)df-=360.0;else if(df<(-180.0))df+=360.0;;return fabs(df)<=cos}function VS::CloseEnough(a,b,e):(fabs)return fabs(a-b)<=e;function VS::Approach(tg,val,spd){local dt=tg-val;if(dt>spd)val+=spd;else if(dt<(-spd))val-=spd;else val=tg;;return val}function VS::ApproachAngle(tg,val,spd):(fabs){tg%=360.0;if(tg>180.0)tg-=360.0;else if(tg<(-180.0))tg+=360.0;;val%=360.0;if(val>180.0)val-=360.0;else if(val<(-180.0))val+=360.0;;local dt=tg-val;dt%=360.0;if(dt>180.0)dt-=360.0;else if(dt<(-180.0))dt+=360.0;;spd=fabs(spd);if(dt>spd)val+=spd;else if(dt<(-spd))val-=spd;else val=tg;;return val}function VS::AngleDiff(dst,src){local df=dst-src;df%=360.0;if(df>180.0)df-=360.0;else if(df<(-180.0))df+=360.0;;return df}function VS::AngleNormalize(angle){angle%=360.0;if(angle>180.0)angle-=360.0;else if(angle<(-180.0))angle+=360.0;;return angle}function VS::QAngleNormalize(vAng){vAng.x%=360.0;if(vAng.x>180.0)vAng.x-=360.0;else if(vAng.x<(-180.0))vAng.x+=360.0;;vAng.y%=360.0;if(vAng.y>180.0)vAng.y-=360.0;else if(vAng.y<(-180.0))vAng.y+=360.0;;vAng.z%=360.0;if(vAng.z>180.0)vAng.z-=360.0;else if(vAng.z<(-180.0))vAng.z+=360.0;;return vAng}function VS::SnapDirectionToAxis(v,e=0.1):(fabs){local p=1.0-e;if(fabs(v.x)>p){if(v.x<0.0)v.x=-1.0;else v.x=1.0;v.y=0.0;v.z=0.0;return v};if(fabs(v.y)>p){if(v.y<0.0)v.y=-1.0;else v.y=1.0;v.z=0.0;v.x=0.0;return v};if(fabs(v.z)>p){if(v.z<0.0)v.z=-1.0;else v.z=1.0;v.x=0.0;v.y=0.0;return v}}function VS::Dist(v1,v2)return(v1-v2).Length();function VS::DistSqr(v1,v2)return(v1-v2).LengthSqr();function VS::VectorCopy(src,dst){dst.x=src.x;dst.y=src.y;dst.z=src.z;return dst}function VS::VectorMin(a,b,o=_VEC){o.x=a.x<b.x?a.x:b.x;o.y=a.y<b.y?a.y:b.y;o.z=a.z<b.z?a.z:b.z;return o}function VS::VectorMax(a,b,o=_VEC){o.x=a.x>b.x?a.x:b.x;o.y=a.y>b.y?a.y:b.y;o.z=a.z>b.z?a.z:b.z;return o}function VS::VectorAbs(v):(fabs){v.x=fabs(v.x);v.y=fabs(v.y);v.z=fabs(v.z);return v}function VS::VectorAdd(a,b,o=_VEC){o.x=a.x+b.x;o.y=a.y+b.y;o.z=a.z+b.z;return o}function VS::VectorSubtract(a,b,o=_VEC){o.x=a.x-b.x;o.y=a.y-b.y;o.z=a.z-b.z;return o}function VS::VectorMultiply(a,b,o=_VEC){o.x=a.x*b;o.y=a.y*b;o.z=a.z*b;return o}function VS::VectorMultiply2(a,b,o=_VEC){o.x=a.x*b.x;o.y=a.y*b.y;o.z=a.z*b.z;return o}function VS::VectorDivide(a,b,o=_VEC){local d=1.0/b;o.x=a.x*d;o.y=a.y*d;o.z=a.z*d;return o}function VS::VectorDivide2(a,b,o=_VEC){o.x=a.x/b.x;o.y=a.y/b.y;o.z=a.z/b.z;return o}function VS::ComputeVolume(is,xs){local dt=xs-is;return dt.Dot(dt)}function VS::RandomVector(iv=-RAND_MAX,xv=RAND_MAX):(Vector,RandomFloat)return Vector(RandomFloat(iv,xv),RandomFloat(iv,xv),RandomFloat(iv,xv));function VS::CalcSqrDistanceToAABB(mins,maxs,pt){local dt,ds=0.0;if(pt.x<mins.x){dt=(mins.x-pt.x);ds+=dt*dt}else if(pt.x>maxs.x){dt=(pt.x-maxs.x);ds+=dt*dt};;if(pt.y<mins.y){dt=(mins.y-pt.y);ds+=dt*dt}else if(pt.y>maxs.y){dt=(pt.y-maxs.y);ds+=dt*dt};;if(pt.z<mins.z){dt=(mins.z-pt.z);ds+=dt*dt}else if(pt.z>maxs.z){dt=(pt.z-maxs.z);ds+=dt*dt};;return ds}function VS::CalcClosestPointOnAABB(i,x,p,o=_VEC){o.x=(p.x<i.x)?i.x:(x.x<p.x)?x.x:p.x;o.y=(p.y<i.y)?i.y:(x.y<p.y)?x.y:p.y;o.z=(p.z<i.z)?i.z:(x.z<p.z)?x.z:p.z;return o}function VS::ExponentialDecay(dO,dT,dt):(log,exp)return exp(log(dO)/dT*dt);function VS::ExponentialDecay2(hl,dt):(exp)return exp(-0.69314718/hl*dt);function VS::ExponentialDecayIntegral(dO,dT,dt):(log,pow)return(pow(dO,dt/dT)*dT-dT)/log(dO);function VS::SimpleSpline(val){local vSqr=val*val;return(3.0*vSqr-2.0*vSqr*val)}function VS::SimpleSplineRemapVal(val,A,B,C,D){if(A==B)return val>=B?D:C;local cVal=(val-A)/(B-A);local valSqr=cVal*cVal;return C+(D-C)*(3.0*valSqr-2.0*valSqr*cVal)}function VS::SimpleSplineRemapValClamped(val,A,B,C,D){if(A==B)return val>=B?D:C;local cVal=(val-A)/(B-A);cVal=(cVal<0.0)?0.0:(1.0<cVal)?1.0:cVal;local valSqr=cVal*cVal;return C+(D-C)*(3.0*valSqr-2.0*valSqr*cVal)}function VS::RemapVal(val,A,B,C,D){if(A==B)return val>=B?D:C;return C+(D-C)*(val-A)/(B-A)}function VS::RemapValClamped(val,A,B,C,D){if(A==B)return val>=B?D:C;local cVal=(val-A)/(B-A);cVal=(cVal<0.0)?0.0:(1.0<cVal)?1.0:cVal;return C+(D-C)*cVal}function VS::Bias(x,ba):(log,pow){local la=-1.0,lastExponent=0.0;if(la!=ba)lastExponent=log(ba)*-1.4427;return pow(x,lastExponent)}function VS::Gain(x,ba){if(x<0.5)return 0.5*Bias(2.0*x,1.0-ba);else return 1.0-0.5*Bias(2.0-2.0*x,1.0-ba)}function VS::SmoothCurve(x):(cos)return(1.0-cos(x*3.14159265))*0.5;function VS::MovePeak(x,pkp){if(x<pkp)return x*0.5/pkp;else return 0.5+0.5*(x-pkp)/(1.0-pkp)}local MovePeak=::VS.MovePeak,Gain=::VS.Gain;function VS::SmoothCurve_Tweak(x,pkp,pks):(MovePeak,Gain,cos){local mp=MovePeak(x,pkp);local sh=Gain(mp,pks);return(1.0-cos(sh*3.14159265))*0.5}function VS::Lerp(A,B,f)return A+(B-A)*f;function VS::FLerp(f1,f2,i1,i2,x)return f1+(f2-f1)*(x-i1)/(i2-i1);function VS::VectorLerp(v1,v2,f,o=_VEC){o.x=v1.x+(v2.x-v1.x)*f;o.y=v1.y+(v2.y-v1.y)*f;o.z=v1.z+(v2.z-v1.z)*f;return o}function VS::IsPointInBox(v,i,x)return(v.x>=i.x&&v.x<=x.x&&v.y>=i.y&&v.y<=x.y&&v.z>=i.z&&v.z<=x.z);function VS::IsBoxIntersectingBox(i1,x1,i2,x2){if((i1.x>x2.x)||(x1.x<i2.x))return false;if((i1.y>x2.y)||(x1.y<i2.y))return false;if((i1.z>x2.z)||(x1.z<i2.z))return false;return true}::EntFireByHandle<-function(h,a,v="",t=0.0,o=null,e=null):(AddEvent)return AddEvent(h,a.tostring(),v.tostring(),t,o,e);::PrecacheModel<-function(s)::ENT_SCRIPT.PrecacheModel(s);::PrecacheScriptSound<-function(s)::ENT_SCRIPT.PrecacheScriptSound(s);function VS::MakePermanent(h)return h.__KeyValueFromString("classname","soundent");function VS::SetParent(c,p):(AddEvent){if(p)return AddEvent(c,"setparent","!activator",0.0,p,null);return AddEvent(c,"setparent","",0.0,null,null)}function VS::ShowGameText(H,tg,msg=null,t=0.0):(AddEvent){if(msg)H.__KeyValueFromString("message",""+msg);return AddEvent(H,"display","",t,tg,null)}function VS::ShowHudHint(H,tg,msg=null,t=0.0):(AddEvent){if(msg)H.__KeyValueFromString("message",""+msg);return AddEvent(H,"ShowHudHint","",t,tg,null)}function VS::HideHudHint(H,tg,t=0.0):(AddEvent)return AddEvent(H,"HideHudHint","",t,tg,null);function VS::CreateMeasure(g,n=null,p=false,e=true,s=1.0):(AddEvent){local r=e?n?n.tostring():"vs.ref_"+UniqueString():n?n.tostring():null;if(!r||!r.len())throw"Invalid targetname";local e=CreateEntity("logic_measure_movement",{measuretype=e?1:0,measurereference="",targetreference=r,target=r,measureretarget="",targetscale=s.tofloat(),targetname=e?r:null},p);AddEvent(e,"setmeasurereference",r,0.0,null,null);AddEvent(e,"setmeasuretarget",g,0.0,null,null);AddEvent(e,"enable","",0.0,null,null);return e}function VS::SetMeasure(h,s):(AddEvent)return AddEvent(h,"setmeasuretarget",s,0.0,null,null);function VS::CreateTimer(D,I,L=null,U=null,O=false,P=false):(AddEvent){local e=CreateEntity("logic_timer",null,P);if(I){e.__KeyValueFromInt("UseRandomTime",0);e.__KeyValueFromFloat("RefireTime",I.tofloat())}else{e.__KeyValueFromFloat("LowerRandomBound",L.tofloat());e.__KeyValueFromFloat("UpperRandomBound",U.tofloat());e.__KeyValueFromInt("UseRandomTime",1);e.__KeyValueFromInt("spawnflags",O.tointeger())};AddEvent(e,D?"disable":"enable","",0.0,null,null);return e}function VS::Timer(D,I,C=null,T=null,B=false,P=false){if(!I){::print("\nERROR:\nRefire time cannot be null in VS.Timer\nUse VS.CreateTimer for randomised fire times.\n");throw"NULL REFIRE TIME"};local h=CreateTimer(D,I,null,null,null,P);OnTimer(h,C,T?T:GetCaller(),B);return h}function VS::OnTimer(H,C,T=null,B=false)return AddOutput(H,"OnTimer",C,T?T:GetCaller(),B);function VS::AddOutput(H,S,C,T=null,B=false):(compile){if(!T)T=GetCaller();if(C){if(typeof C=="string"){if(C.find("(")!=null)C=compile(C);else C=T[C]}else if(typeof C!="function")throw"Invalid function type "+typeof C}else{C=null;B=true};H.ValidateScriptScope();local r=H.GetScriptScope();r[S]<-B?C:C.bindenv(T);H.ConnectOutput(S,S);return r}function VS::AddOutput2(H,S,C,T=null,B=false):(AddEvent){if(H.GetScriptScope()||typeof C=="function")return AddOutput(H,S,C,T,B);if(typeof C!="string")throw"Invalid function type "+typeof C;if(!T)T=GetCaller();if(!B){if(!("self"in T)){throw"Invalid function path. Not an entity"};AddEvent(H,"addoutput",S+" "+T.self.GetName()+",runscriptcode,"+C,0.0,T.self,H)}else{local s=H.GetName();if(!s.len()){s=UniqueString();SetName(H,s)};AddEvent(H,"addoutput",S+" "+s+",runscriptcode,"+C,0.0,null,H)}}function VS::CreateEntity(s,kv=null,b=false):(Entities){local h=Entities.CreateByClassname(s);if(typeof kv=="table")foreach(k,v in kv)SetKey(h,k,v);if(b)MakePermanent(h);return h}function VS::SetKey(h,k,v){switch(typeof v){case"bool":case"integer":return h.__KeyValueFromInt(k,v.tointeger());case"float":return h.__KeyValueFromFloat(k,v);case"string":return h.__KeyValueFromString(k,v);case"Vector":return h.__KeyValueFromVector(k,v);case"null":return true;default:throw"Invalid input type: "+typeof v}}function VS::SetName(h,s)return h.__KeyValueFromString("targetname",s.tostring());function VS::DumpEnt(I=null):(Entities){if(!I){local e;while(e=Entities.Next(e)){local s=e.GetScriptScope();if(s)::print(e+" :: "+s.__vname+"\n")}return};if(typeof I=="string")I=FindEntityByString(I);if(typeof I=="instance"){if(I.IsValid()){local s=I.GetScriptScope();if(s){::print("--- Script dump for entity "+I+"\n");DumpScope(s,0,1,0,1);::print("--- End script dump\n")}else return::print("Entity has no script scope! "+I+"\n")}else return::print("Invalid entity!\n")}else if(I){local e;while(e=Entities.Next(e)){local s=e.GetScriptScope();if(s){::print("\n--- Script dump for entity "+e+"\n");DumpScope(s,0,1,0,1);::print("--- End script dump\n")}}}}function VS::GetPlayersAndBots():(Entities){local e,p=[],b=[];while(e=Entities.FindByClassname(e,"cs_bot"))b.append(e.weakref());e=null;while(e=Entities.FindByClassname(e,"player")){local s=e.GetScriptScope();if("networkid"in s&&s.networkid=="BOT")b.append(e.weakref());else p.append(e.weakref())}return[p,b]}function VS::GetAllPlayers():(Entities){local e,a=[];while(e=Entities.Next(e))if(e.GetClassname()=="player")a.append(e.weakref());return a}function VS::DumpPlayers(d=false){local a=GetPlayersAndBots(),p=a[0],b=a[1];::print("\n=======================================\n"+p.len()+" players found\n"+b.len()+" bots found\n");local c=function(_s,_a):(d){foreach(e in _a){local s=e.GetScriptScope();if(s)s=GetVarName(s);if(!s)s="null";::print(_s+"- "+e+" :: "+s+"\n");if(d&&s!="null")DumpEnt(e)}}c("[BOT]    ",b);c("[PLAYER] ",p);::print("=======================================\n")}function VS::GetLocalPlayer(){if(GetPlayersAndBots()[0].len()>1)::print("GetLocalPlayer: More than 1 player detected!\n");local e=Entc("player");if(e!=GetPlayerByIndex(1))::print("GetLocalPlayer: Discrepancy detected!\n");if(!e||!e.IsValid())return::print("GetLocalPlayer: No player found!\n");if(!e.ValidateScriptScope())return::print("GetLocalPlayer: Failed to validate player scope!\n");SetName(e,"localplayer");::SPlayer<-e.GetScriptScope();::HPlayer<-e.weakref();return e}function VS::GetPlayerByIndex(i):(Entities){local e;while(e=Entities.Next(e))if(e.GetClassname()=="player")if(e.entindex()==i)return e}function VS::FindEntityByIndex(i,s="*"):(Entities){local e;while(e=Entities.FindByClassname(e,s))if(e.entindex()==i)return e}function VS::FindEntityByString(s):(Entities){local e;while(e=Entities.Next(e))if(e.tostring()==s)return e}function VS::IsPointSized(h){local v=h.GetBoundingMaxs();return v.x==v.y&&v.y==v.z&&v.z==0.0}function VS::FindEntityNearestFacing(O,F,T):(Entities){local b_d=T,b_e,e;while(e=Entities.Next(e)){local v=e.GetBoundingMaxs();if(v.x==v.y&&v.y==v.z&&v.z==0.0)continue;local t_e=e.GetOrigin()-O;t_e.Norm();local d=F.Dot(t_e);if(d>b_d){b_d=d;b_e=e}}return b_e}function VS::FindEntityClassNearestFacing(O,F,T,C):(Entities){local b_d=T,b_e,e;while(e=Entities.FindByClassname(e,C)){local t_e=e.GetOrigin()-O;t_e.Norm();local d=F.Dot(t_e);if(d>b_d){b_d=d;b_e=e}}return b_e}function VS::FindEntityClassNearestFacingNearest(O,F,T,C,R):(Entities){local x,b_e,e;if(R)x=R*R;else x=3.22122e+09;while(e=Entities.FindByClassname(e,C)){local t_e=e.GetOrigin()-O;t_e.Norm();local d=F.Dot(t_e);if(d>T){local q=(e.GetOrigin()-O).LengthSqr();if(x>q){b_e=e;x=q}}}return b_e}function VS::FormatPrecision(f,n):(format)return format("%."+n+"f",f);function VS::FormatExp(i,n):(format)return format("%."+n+"e",i);function VS::FormatHex(i,n):(format)return format("%#0"+n+"x",i);function VS::FormatWidth(i,n,s=" "):(format)return format("%"+s+""+n+"s",i.tostring());::VecToString<-function(v,p="Vector(",s=",",x=")")return p+v.x+s+v.y+s+v.z+x;function VS::DrawEntityBBox(t,e,r=255,g=138,b=0,a=0):(DebugDrawBox)return DebugDrawBox(e.GetOrigin(),e.GetBoundingMins(),e.GetBoundingMaxs(),r,g,b,a,t);local Trace=::TraceLine;class::VS.TraceLine{constructor(start=null,end=null,ent=null):(Vector,Trace){if(!start){local v=Vector();startpos=v;endpos=v;hIgnore=ent;fraction=1.0;return};startpos=start;endpos=end;hIgnore=ent;fraction=Trace(startpos,endpos,hIgnore)}function _cmp(d){if(fraction<d.fraction)return -1;if(fraction>d.fraction)return 1;return 0}function _add(d)return fraction+d.fraction;function _sub(d)return fraction-d.fraction;function _mul(d)return fraction*d.fraction;function _div(d)return fraction/d.fraction;function _modulo(d)return fraction%d.fraction;function _unm()return -fraction;function _typeof()return"trace_t";startpos=null;endpos=null;hIgnore=null;fraction=0.0;hitpos=null;normal=null;m_Delta=null;m_IsSwept=null;m_Extents=null;m_IsRay=null;m_StartOffset=null;m_Start=null}local CTrace=::VS.TraceLine;function VS::TraceDir(v1,D,f=::MAX_TRACE_LENGTH,hEnt=null):(CTrace)return CTrace(v1,v1+(D*f),hEnt);function VS::TraceLine::DidHit()return fraction<1.0;function VS::TraceLine::GetEnt(r=1.0){if(!hitpos)GetPos();return Entities.FindByClassnameNearest("*",hitpos,r)}function VS::TraceLine::GetEntByName(t,r=1.0):(Entities){if(!hitpos)GetPos();return Entities.FindByNameNearest(t,hitpos,r)}function VS::TraceLine::GetEntByClassname(c,r=1.0):(Entities){if(!hitpos)GetPos();return Entities.FindByClassnameNearest(c,hitpos,r)}function VS::TraceLine::GetPos(){if(!hitpos){if(fraction<1.0)hitpos=startpos+(endpos-startpos)*fraction;else hitpos=endpos};return hitpos}function VS::TraceLine::GetDist()return(startpos-GetPos()).Length();function VS::TraceLine::GetDistSqr()return(startpos-GetPos()).LengthSqr();local TraceDir=::VS.TraceDir;function VS::TraceLine::GetNormal():(Vector,TraceDir){if(!normal){local u=Vector(0.0,0.0,0.5),d=endpos-startpos;d.Norm();GetPos();normal=(hitpos-TraceDir(startpos+d.Cross(u),d).GetPos()).Cross(hitpos-TraceDir(startpos+u,d).GetPos());normal.Norm()};return normal}function VS::TraceLine::Ray(mins=::Vector(),maxs=::Vector()){m_Delta=endpos-startpos;m_IsSwept=m_Delta.LengthSqr()!=0.0;m_Extents=(maxs-mins)*0.5;m_IsRay=m_Extents.LengthSqr()<1.e-6;m_StartOffset=(mins+maxs)*0.5;m_Start=startpos+m_StartOffset;m_StartOffset*=-1.0;return this}function VS::UniqueString():(DoUniqueString){local s=DoUniqueString("");return s.slice(0,s.len()-1)}function VS::arrayFind(arr,val){foreach(i,v in arr)if(v==val)return i}function VS::arrayApply(arr,func){foreach(i,v in arr)arr[i]=func(v)}function VS::arrayMap(arr,func){local new=::array(arr.len());foreach(i,v in arr)new[i]=func(v);return new}function VS::DumpScope(table,pa=false,dp=true,guides=true,dh=0){local indent=function(count)for(local i=0;i<count;++i)::print("   ");if(guides)::print(" ------------------------------\n");if(table){foreach(key,val in table){local dft=false;if(!pa){foreach(k in slots_default)if(key==k)dft=true}else if(key=="VS"||key=="Documentation")dft=true;;if(!dft){indent(dh);::print(key);switch(typeof val){case"table": ::print("(TABLE) : "+val.len());if(!dp)break;::print("\n");indent(dh);::print("{\n");DumpScope(val,pa,dp,false,dh+1);indent(dh);::print("}");break;case"array": ::print("(ARRAY) : "+val.len());if(!dp)break;::print("\n");indent(dh);::print("[\n");DumpScope(val,pa,dp,false,dh+1);indent(dh);::print("]");break;case"string": ::print(" = \""+val+"\"");break;case"Vector": ::print(" = "+::VecToString(val));break;default: ::print(" = "+val)}::print("\n")}}}else ::print("null\n");if(guides)::print(" ------------------------------\n")}function VS::ArrayToTable(a){local t={}foreach(i,v in a)t[v]<-i;return t}function VS::GetStackInfo(dp=false,pa=false){::print(" --- STACKINFO ----------------\n");local s,j=2;while(s=::getstackinfos(j++)){if(s.func=="pcall"&&s.src=="NATIVE")break;::print(" ("+(j-1)+")\n");local w,m=s.locals;if("this"in m&&typeof m["this"]=="table"){if(m["this"]==::getroottable()){w="roottable"}else{w=GetVarName(m["this"]);m[w]<-delete m["this"]}};if(w=="roottable")DumpScope(s,pa,0,0);else DumpScope(s,pa,dp,0);if(w)::print("scope = \""+w+"\"\n")}::print(" --- STACKINFO ----------------\n")}VS.GetCaller<-::compilestring("return(getstackinfos(3)[\"locals\"][\"this\"])");VS.GetCallerFunc<-::compilestring("return(getstackinfos(3)[\"func\"])");function VS::GetTableDir(table){if(typeof table!="table")throw"Invalid input type '"+typeof table+"' ; expected: 'table'";local r=_f627f40d21a6([],table);if(r)r.append("roottable");else r=["roottable"];r.reverse();return r}function VS::_f627f40d21a6(bF,t,l=::getroottable()){foreach(v,u in l)if(typeof u=="table")if(v!="VS"&&v!="Documentation")if(u==t){bF.append(v);return bF}else{local r=_f627f40d21a6(bF,t,u);if(r){bF.append(v);return r}}}function VS::FindVarByName(S){if(typeof S!="string")throw"Invalid input type '"+typeof S+"' ; expected: 'string'";return _fb3k55Ir91t7(S)}function VS::_fb3k55Ir91t7(t,l=::getroottable()){if(t in l)return l[t];else foreach(v,u in l)if(typeof u=="table")if(v!="VS"&&v!="Documentation"){local r=_fb3k55Ir91t7(t,u);if(r)return r}}function VS::GetVarName(v){local t=typeof v;if(t=="function"||t=="native function")return v.getinfos().name;return _fb3k5S1r91t7(t,v)}function VS::_fb3k5S1r91t7(t,i,s=::getroottable()){foreach(k,v in s){if(v==i)return k;if(typeof v=="table")if(k!="VS"&&k!="Documentation"){local r=_fb3k5S1r91t7(t,i,v);if(r)return r}}}local flTickRate=1.0/::FrameTime();function VS::GetTickrate():(flTickRate)return flTickRate;_v0();local Chat=::ScriptPrintMessageChatAll,ChatTeam=::ScriptPrintMessageChatTeam;::delay<-function(X,T=0.0,E=::ENT_SCRIPT,A=null,C=null):(AddEvent)return AddEvent(E,"runscriptcode",""+X,T,A,C);::Chat<-function(s):(Chat)return Chat(" "+s);::ChatTeam<-function(i,s):(ChatTeam)return ChatTeam(i," "+s);::Alert<-::ScriptPrintMessageCenterAll;::AlertTeam<-::ScriptPrintMessageCenterTeam;::ClearChat<-function():(Chat)for(local i=9;i--;)Chat(" ");::txt<-{invis="\x00",white="\x01",red="\x02",purple="\x03",green="\x04",lightgreen="\x05",limegreen="\x06",lightred="\x07",grey="\x08",yellow="\x09",lightblue="\x0a",blue="\x0b",darkblue="\x0c",darkgrey="\x0d",pink="\x0e",orangered="\x0f",orange="\x10"}function VS::GetPlayerByUserid(i):(Entities){local e;while(e=Entities.Next(e))if(e.GetClassname()=="player"){local s=e.GetScriptScope();if("userid"in s&&s.userid==i)return e}}local gEventData=::_xa9b2dfB7ffe;local flTimeoutThold=::FrameTime()*2;function VS::Events::player_connect(data):(gEventData,Time,flTimeoutThold){if(data.networkid.len()){if(gEventData.len()>128){for(local i=64;i--;)gEventData.remove(0);::print("player_connect: ERROR!!! Player data is not being processed\n")};gEventData.append(data);return::OnGameEvent_player_connect(data)}else if(_SV){local dt=Time()-flValidateTime;if(!(dt>flTimeoutThold)){_SV.userid<-data.userid;if(!("name"in _SV))_SV.name<-"";if(!("networkid"in _SV))_SV.networkid<-""}else::print("player_connect: Unexpected error! "+dt+"\n");_SV=null;flValidateTime=0.0;return}}function VS::Events::player_spawn(data):(gEventData){if(gEventData.len())foreach(i,d in gEventData)if(d.userid==data.userid){local player=::VS.GetPlayerByIndex(d.index+1);if(!player.ValidateScriptScope()){::print("player_connect: Invalid player entity\n");break};local scope=player.GetScriptScope();if("networkid"in scope){::print("player_connect: BUG!!! Something has gone wrong. ");if(scope.networkid==d.networkid){::print("Duplicated data!\n");gEventData.remove(i)}else::print("Conflicting data!\n");break};if(!d.networkid.len())::print("player_connect: could not get event data\n");scope.userid<-d.userid;scope.name<-d.name;scope.networkid<-d.networkid;gEventData.remove(i);break};;return::OnGameEvent_player_spawn(data)}function VS::Events::ForceValidateUserid(e):(AddEvent,Time){if(!e||!e.IsValid()||e.GetClassname()!="player")return::print("ForceValidateUserid: Invalid input: "+E+"\n");if(!::Entc("logic_eventlistener"))return::print("ForceValidateUserid: No eventlistener found\n");if(!hProxy)hProxy=::VS.CreateEntity("info_game_event_proxy",{event_name="player_connect"},true).weakref();flValidateTime=Time();e.ValidateScriptScope();_SV=e.GetScriptScope();AddEvent(hProxy,"generategameevent","",0,e,null)}function VS::Events::ValidateUseridAll(b=0){local flFrameTime=::FrameTime();local delay=::delay;local ENT_SCRIPT=::ENT_SCRIPT;local i=0;foreach(v in::VS.GetAllPlayers())if(!("userid"in v.GetScriptScope())||b)delay("::VS.Events.ForceValidateUserid(activator)",i++*flFrameTime,ENT_SCRIPT,v)}local L=::VS.Log.L;function VS::Log::Run(){if(!condition)return;return _Start()}local Msg=::print;local flFrameTime=::FrameTime();function VS::Log::_Print(f):(Msg,L,delay,flFrameTime){local t=filter,p=Msg,L=L;if(!f)for(local i=nC;i<nN;++i)p(L[i]);else for(local i=nC;i<nN;++i)p(t+L[i]);nC+=nD;local v=nN+nD;nN=(v<0)?0:(nL<v)?nL:v;if(nC>=nN){if(f)_Stop();nL=null;nD=null;nC=null;nN=null;return};return delay("::VS.Log._Print("+f+")",flFrameTime)}function VS::Log::_Start():(flFrameTime){nL<-L.len();nD<-2000;nC<-0;nN<-::clamp(nD,0,nL);if(export){local file=filePrefix[0]==58?filePrefix.slice(1):filePrefix+"_"+::VS.UniqueString();_d<-::developer();::SendToConsole("developer 0;con_filter_enable 1;con_filter_text_out\""+filter+"\";con_filter_text\"\";con_logfile\""+file+".log\";script delay(\"::VS.Log._Print(1)\","+flFrameTime*4.0+")");return file}else{_Print(0)}}function VS::Log::_Stop()::SendToConsole("con_logfile\"\";con_filter_text_out\"\";con_filter_text\"\";con_filter_enable 0;developer "+_d);function VS::Log::Add(s):(L)L.append(s);function VS::Log::Clear():(L)L.clear();
