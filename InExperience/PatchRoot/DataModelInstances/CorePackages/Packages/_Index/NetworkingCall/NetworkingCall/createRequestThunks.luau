local _ = require(script.Parent.networkingCallTypes)
local networkRequests = script.Parent.networkRequests
local createGetCallHistoryModule = require(networkRequests.createGetCallHistory)
local createGetSuggestedCalleesModule = require(networkRequests.createGetSuggestedCallees)

return function(p1)
	-- upvalues: createGetCallHistoryModule (ref), createGetSuggestedCalleesModule (ref)
	return {
		GetCallHistory = createGetCallHistoryModule(p1),
		GetSuggestedCallees = createGetSuggestedCalleesModule(p1)
	}
end