//-----------------------------------------------------------------------
//------------------- Copyright (c) samisalreadytaken -------------------
//                       github.com/samisalreadytaken
//-----------------------------------------------------------------------
local VERSION = "2.43.19",
ROOT=::getroottable(),CONST=::getconsttable();if("VS"in ROOT){local gVS=::VS;if(typeof gVS=="table"){if(gVS.version==VERSION){if(!(0 in gVS))gVS[0]<-0;if((gVS[0]&0x10)==0x10)return}}}else::VS<-{};;local VS={[0]=0x10,version=VERSION}if(::print.getinfos().native&&!::Msg.getinfos().native)::Msg<-::print;;if(::EntFireByHandle.getinfos().native)::DoEntFireByInstanceHandle<-::EntFireByHandle;;local AddEvent=::DoEntFireByInstanceHandle,Fmt=::format;VS.GetCaller<-function():(getstackinfos)return getstackinfos(3).locals["this"];VS.MakePersistent<-function(e){return e.__KeyValueFromString("classname","soundent")}VS.GetAllPlayers<-function():(Entities){local e,a=[];while(e=Entities.FindByClassname(e,"player"))a.append(e.weakref());e=null;while(e=Entities.FindByClassname(e,"cs_bot"))a.append(e.weakref());return a}VS.GetPlayerByIndex<-function(i){local e;while(e=Entities.FindByClassname(e,"player"))if(e.entindex()==i)return e;e=null;while(e=Entities.FindByClassname(e,"cs_bot"))if(e.entindex()==i)return e}local Events=delegate::VS:{m_hProxy=null,m_bFixedUp=false,m_SV=null,m_Players=null,m_ppCache=null,m_pSpawner=null,m_pListeners=null,s_szEventName=null,s_hListener=null,s_fnSynchronous=null,__rem=null,__tmp=null,m_DeferredReg=null,Msg=Msg}VS.Events<-Events;if(!("{847D4B}"in ROOT))ROOT["{847D4B}"]<-array(64);;local gED=ROOT["{847D4B}"];VS.GetPlayerByUserid<-function(i):(Entities){if(i in m_Players)return m_Players[i];if(!m_Players)m_Players={};local p;while(p=Entities.FindByClassname(p,"player")){local s=p.GetScriptScope();if("userid"in s&&s.userid==i){m_Players[i]<-p.weakref();return p}}p=null;while(p=Entities.FindByClassname(p,"cs_bot")){local s=p.GetScriptScope();if("userid"in s&&s.userid==i){m_Players[i]<-p.weakref();return p}}}.bindenv(VS.Events);local OnPlayerConnect=function(ev):(gED,ROOT,SendToConsole){if(ev.networkid!=""){local idx;foreach(i,v in gED)if(!gED[i]){idx=i;break};if(idx==null){for(local i=32;i<64;++i){gED[i-32]=gED[i];gED[i]=null}idx=32;Msg("VS::OnPlayerConnect: ERROR!!! Player data is not being processed\n")};gED[idx]=ev;return};if(m_SV){local sc=m_SV.remove(0);if(!sc||!("self"in sc))return Msg("VS::Events: invalid scope in validation\n");if(!sc.__vrefs||!sc.self||!sc.self.IsValid())return Msg("VS::Events: invalid entity in validation\n");if("userid"in sc&&sc.userid!=ev.userid&&sc.userid!=-1)Msg("VS::Events: ERROR!!! conflict! ["+sc.userid+", "+ev.userid+"]\n");if(ev.userid in m_Players&&m_Players[ev.userid]!=sc.self)Msg("VS::Events: ERROR!!! conflict! ["+sc.self+", "+m_Players[ev.userid]+"]\n");sc.userid<-ev.userid;if(!("name"in sc))sc.name<-"";if(!("networkid"in sc))sc.networkid<-"";SendToConsole("banid 0.05 "+ev.userid);if(!(0 in m_SV))m_SV=null}}.bindenv(VS.Events);local OnPlayerBan=function(ev){if(!ev.userid)return;if(ev.kicked)return;local p=GetPlayerByUserid(ev.userid);if(!p)return Msg("VS::Events: validation failed to find player! ["+ev.userid+"]\n");local sc=p.GetScriptScope();if(sc.name!=""&&sc.name!=ev.name)Msg(format("VS::Events: validation: [%d] overwriting name '%s' -> '%s'\n",ev.userid,sc.name,ev.name));if(sc.networkid!=""&&sc.networkid!=ev.networkid)Msg(format("VS::Events: validation: [%d] overwriting networkid '%s' -> '%s'\n",ev.userid,sc.networkid,ev.networkid));sc.name=ev.name;sc.networkid=ev.networkid}.bindenv(VS.Events);local OnPlayerSpawn=function(ev):(gED,Fmt,ROOT){foreach(i,data in gED){if(!data)return;if(data.userid==ev.userid){local p=GetPlayerByIndex(data.index+1);if(!p||!p.ValidateScriptScope()){gED[i]=null;Msg("VS::OnPlayerConnect: invalid player entity ["+data.userid+"] ["+(data.index+1)+"]\n");return};local sc=p.GetScriptScope();if("networkid"in sc&&sc.networkid!=""){Msg("VS::OnPlayerConnect: ERROR!!! Something has gone wrong! ");if(sc.networkid==data.networkid){gED[i]=null;Msg(Fmt("Duplicated data. [%d]\n",data.userid))}else{Msg(Fmt("Conflicting data. [%d] ('%s', '%s')\n",data.userid,sc.networkid,data.networkid))};return};sc.userid<-data.userid;sc.name<-data.name;sc.networkid<-data.networkid;gED[i]=null;gED.sort();gED.reverse();return}}}.bindenv(VS.Events);local ValidateUserid=function(p):(AddEvent,Fmt,Entities){if(!p||!p.IsValid()||(p.GetClassname()!="player")||!p.ValidateScriptScope())return Msg(Fmt("VS::ValidateUserid: invalid input: %s\n",""+p));if(!m_SV)m_SV=[];local sc=p.GetScriptScope(),b=1;foreach(v in m_SV)if(v==sc){b=0;break};if(b)m_SV.append(sc.weakref());if(!m_hProxy){local h=Entities.CreateByClassname("info_game_event_proxy");h.__KeyValueFromString("event_name","player_connect");MakePersistent(h);m_hProxy=h.weakref()};return AddEvent(m_hProxy,"GenerateGameEvent","",0,p,null)}.bindenv(VS.Events);local __RemovePooledString=function(sz){__rem=sz;m_pSpawner.SpawnEntity();__rem=null}.bindenv(VS.Events);local SpawnEntity=function(ev):(Entities){if(!m_pSpawner){local p=Entities.CreateByClassname("env_entity_maker");p.__KeyValueFromString("EntityTemplate","vs.eventlistener");MakePersistent(p);m_pSpawner=p.weakref()};s_szEventName=ev;m_pSpawner.SpawnEntity();local r=s_hListener;s_szEventName=s_hListener=null;return r}local __ExecutePreSpawn=function(p){local vs=VS.Events;if(vs.__rem){p.__KeyValueFromString("targetname",vs.__rem);p.__KeyValueFromString("EventName","player_connect");return p.Destroy()};if(!vs.s_szEventName){Msg("VS::Events::PreSpawn: invalid call origin\n");return p.Destroy()};p.__KeyValueFromString("targetname","");p.__KeyValueFromString("EventName",vs.s_szEventName);p.__KeyValueFromInt("FetchEventData",1);p.__KeyValueFromInt("IsEnabled",1);p.__KeyValueFromInt("TeamNum",-1);__EntityMakerResult={[""]=null}}local __FinishSpawn=function(){__EntityMakerResult=null}local PostSpawn=function(pp){local p=pp[""];s_hListener=p;MakePersistent(p);p.ValidateScriptScope();local sc=p.GetScriptScope();delegate delegate delegate sc.parent:{_delslot=function(k){delete parent.parent[k]}}:{_newslot=null,["{7D6E9A}"]=null}:sc;sc.rawdelete("event_data");if(!s_fnSynchronous){local ch=[];if(!m_ppCache)m_ppCache=[];m_ppCache.append(ch.weakref());sc.parent._newslot=function(k,v):(ch){if(k=="event_data")return ch.insert(0,v);return rawset(k,v)}sc.parent._get<-function(k):(ch){if(k=="event_data")return ch.pop();return rawget(k)}local n=sc.__vname,i=n.find("_");n=s_szEventName+"_"+n.slice(0,i);p.__KeyValueFromString("targetname",n);p.__KeyValueFromString("OnEventFired",n+",CallScriptFunction,");sc[""]<-null}}.bindenv(VS.Events);local OnPostSpawn=function():(__RemovePooledString,OnPlayerConnect,OnPlayerSpawn,OnPlayerBan,ValidateUserid){local VS=VS;if(!VS.Events.m_bFixedUp){VS.Events.m_bFixedUp=true;Msg("VS::Events init '"+VS.version+"'\n");VS.StopListeningToAllGameEvents("VS::Events");VS.ListenToGameEvent("player_connect",OnPlayerConnect,"VS::Events");VS.ListenToGameEvent("player_spawn",OnPlayerSpawn,"VS::Events");VS.ListenToGameEvent("server_addban",OnPlayerBan,"VS::Events");VS.ListenToGameEvent("player_activate",function(ev):(ValidateUserid){foreach(i,v in GetAllPlayers()){local t=v.GetScriptScope();if(!("userid"in t)||t.userid==-1)ValidateUserid(v)}}.bindenv(VS),"VS::Events");if(VS.Events.m_DeferredReg){foreach(p in VS.Events.m_DeferredReg)VS.ListenToGameEvent.pacall(p);VS.Events.m_DeferredReg=null}};local Pl=VS.Events.m_Players;if(Pl&&Pl.len()){local t=[];foreach(k,v in Pl)if(!v||!v.IsValid())t.append(k);foreach(v in t)delete Pl[v]};if(VS.Events.__tmp)__RemovePooledString(VS.Events.__tmp);VS.Events.__tmp=__vname}VS.ListenToGameEvent<-function(ev,fn,ctx,sync=0):(SpawnEntity){local err,c;if((typeof fn!="function")&&(typeof fn!="native function")){err="invalid callback param"}else{c=fn.getinfos().parameters.len();if(c!=2&&c!=1)err="invalid callback param: wrong number of parameters"};if(typeof ctx!="string")err="invalid context param";if(typeof ev!="string")err="invalid eventname param";if(err){Msg(format("\nAN ERROR HAS OCCURED [%s]\n",err));return PrintStack()};if(!m_pListeners)m_pListeners={};if(!(ev in m_pListeners))m_pListeners[ev]<-{};local pListener=m_pListeners[ev];if(!(ctx in pListener))pListener[ctx]<-null;if(!m_bFixedUp){if(!m_DeferredReg)m_DeferredReg=[];m_DeferredReg.append([this,ev,fn,ctx,sync]);return};local p=pListener[ctx];if(!p||!p.IsValid()){if(sync||ctx=="VS::Events")s_fnSynchronous=fn;else s_fnSynchronous=null;if(!(p=SpawnEntity(ev)))return Msg("VS::ListenToGameEvent: ERROR!!! NULL ent!\n");pListener[ctx]=p.weakref();if(s_fnSynchronous){s_fnSynchronous=null;if(ctx=="VS::Events"){p.GetScriptScope().parent._newslot=function(k,v):(fn){if(k=="event_data")return fn(v)}return}}};local sc=p.GetScriptScope();if(!!sync==sc.parent.rawin("_get")){Msg("VS::ListenToGameEvent: changing synchronicity of "+ev+":"+ctx+"\n");p.Destroy();return ListenToGameEvent(ev,fn,ctx,sync)};if(!sync){if(c==1)sc[""]=fn;else sc[""]=function():(fn)return fn(event_data)}else{if(c==1)sc.parent._newslot=function(k,v):(fn,ev,ctx){if(k=="event_data")try fn()catch(x)return print(format("\nAN ERROR HAS OCCURED [%s] ON EVENT [%s:%s]\n\n",x,ev,ctx))}else sc.parent._newslot=function(k,v):(fn,ev,ctx){if(k=="event_data")try fn(v)catch(x)return print(format("\nAN ERROR HAS OCCURED [%s] ON EVENT [%s:%s]\n\n",x,ev,ctx))}}}.bindenv(VS.Events);VS.StopListeningToAllGameEvents<-function(ctx):(dummy){if(m_pListeners)foreach(v in m_pListeners){if(ctx in v){local p=v[ctx];if((typeof p=="instance")&&p.IsValid()){p.GetScriptScope().parent._newslot=dummy;p.Destroy()};delete v[ctx]}}}.bindenv(VS.Events);VS.Events.DumpListeners<-function(){if(m_pListeners&&m_pListeners.len()){local ll=[];foreach(ev,v in m_pListeners)ll.append(ev);ll.sort();local Fmt=format;foreach(ev in ll){local v=m_pListeners[ev];foreach(ctx,p in v){if(ctx!="VS::Events"){if(p&&(typeof p=="instance")&&p.IsValid()){Msg(Fmt("  %-32.32s  | %-32.64s |  %.64s\n",ev,ctx,p.GetName()))}else{Msg(Fmt("  %-32.32s  | %-32.64s |  <null>\n",ev,ctx))}}}}}}.bindenv(VS.Events);VS.Events.InitTemplate<-function(sc):(__ExecutePreSpawn,__FinishSpawn,PostSpawn,OnPostSpawn){local self;if(!("self"in sc)||!(self=sc.self)||!self.IsValid()||self.GetClassname()!="point_template")throw"VS::Events::InitTemplate: invalid entity";self.__KeyValueFromInt("spawnflags",0);self.__KeyValueFromString("targetname","vs.eventlistener");sc.__EntityMakerResult<-null;sc.__ExecutePreSpawn<-__ExecutePreSpawn;sc.__FinishSpawn<-__FinishSpawn;sc.PreSpawnInstance<-1;sc.PostSpawn<-PostSpawn;sc.OnPostSpawn<-OnPostSpawn.bindenv(sc);if(m_ppCache){for(local i=m_ppCache.len();i--;){local v=m_ppCache[i];if(v)v.clear();else m_ppCache.remove(i)}};if("EventQueue"in VS)VS.EventQueue.Clear()}{local gVS=::VS,T;if("version"in gVS){local pV1=split(gVS.version,"."),pV2=split(VS.version,".");if(!((2 in pV1)&&(2 in pV2)))return;local s=function(p){local x=p[0].len();while(0<=--x){local c=p[0][x];if(c>'9'||c<'0'){p[0]=p[0].slice(x,p[0].len());break}}x=0;for(local i=p.len()-1,l=p[i].len();++x<l;){local c=p[i][x];if(c>'9'||c<'0'){p[i]=p[i].slice(0,x);break}}}s(pV1);s(pV2);local l1=pV1.len(),l2=pV2.len();if(l2>l1){pV1.resize(l2,0);l1=l2}else if(l2<l1)pV2.resize(l1,0);;local x=0;do{local v1=pV1[x].tointeger(),v2=pV2[x].tointeger();if(v2!=v1){T=v2>v1;break}}while(++x<l1);if(T==null)if((gVS[0]&VS[0])==VS[0])return};if(T==null){foreach(k,v in VS)gVS.rawset(k,v);print(format("VS v%s [%Xh]\n",gVS.version,gVS[0]))}else{local n=gVS[0]|VS[0];print(format("VS v%s [%Xh] %d(%Xh|%Xh)\n",gVS.version,n,T.tointeger(),gVS[0],VS[0]));if(T){foreach(k,v in VS){if(k=="Events")continue;gVS.rawset(k,v)}}else{foreach(k,v in VS)if(!(k in gVS)){if(k=="Events")continue;gVS.rawset(k,v)}};gVS[0]=n};VS=null;return collectgarbage()}
