-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:26 2026 Pacific Standard Time.

local getPresenceTextFromUserModule = require(script.Parent.getPresenceTextFromUser)
local presenceImageByPresenceModule = require(script.Parent.presenceImageByPresence)

return function(p0) --[[ line: 4 ]]
	-- upvalues: getPresenceTextFromUserModule (ref), presenceImageByPresenceModule (ref)
	return {
		text = getPresenceTextFromUserModule(p0),
		image = presenceImageByPresenceModule[p0.presence]
	}
end