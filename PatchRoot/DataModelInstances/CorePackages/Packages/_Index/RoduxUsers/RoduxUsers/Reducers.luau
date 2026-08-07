-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

local roduxModule = require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux)
local byUserIdModule = require(script.Users.byUserId)
local byUsernameModule = require(script.Users.byUsername)

return function(p0) --[[ line: 8 ]]
	-- upvalues: roduxModule (ref), byUserIdModule (ref), byUsernameModule (ref)
	return roduxModule.combineReducers({
		byUserId = byUserIdModule(p0),
		byUsername = byUsernameModule(p0)
	})
end