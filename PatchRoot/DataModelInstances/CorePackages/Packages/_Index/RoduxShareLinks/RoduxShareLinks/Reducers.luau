-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:09 2026 Pacific Standard Time.

local roduxModule = require(script:FindFirstAncestor("RoduxShareLinks").Parent.Rodux)
local invitesModule = require(script.Invites)

return function(p0) --[[ line: 7 ]]
	-- upvalues: roduxModule (ref), invitesModule (ref)
	return roduxModule.combineReducers({ Invites = invitesModule(p0) })
end