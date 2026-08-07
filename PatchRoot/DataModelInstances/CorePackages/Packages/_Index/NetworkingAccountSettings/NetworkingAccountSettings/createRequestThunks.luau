-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:52 2026 Pacific Standard Time.

local parent = script.Parent
local createGetEmailSettingsModule = require(parent.networkRequests.createGetEmailSettings)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0) --[[ line: 6 ]]
	-- upvalues: createGetEmailSettingsModule (ref)
	return { GetEmailSettings = createGetEmailSettingsModule(p0) }
end