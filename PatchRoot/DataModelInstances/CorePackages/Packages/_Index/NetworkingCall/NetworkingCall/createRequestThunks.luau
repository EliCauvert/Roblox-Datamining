-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:53 2026 Pacific Standard Time.

local _ = require(script.Parent.networkingCallTypes)
local networkRequests = script.Parent.networkRequests
local createGetCallHistoryModule = require(networkRequests.createGetCallHistory)
local createGetSuggestedCalleesModule = require(networkRequests.createGetSuggestedCallees)

return function(p0) --[[ line: 9 ]]
	-- upvalues: createGetCallHistoryModule (ref), createGetSuggestedCalleesModule (ref)
	return {
		GetCallHistory = createGetCallHistoryModule(p0),
		GetSuggestedCallees = createGetSuggestedCalleesModule(p0)
	}
end