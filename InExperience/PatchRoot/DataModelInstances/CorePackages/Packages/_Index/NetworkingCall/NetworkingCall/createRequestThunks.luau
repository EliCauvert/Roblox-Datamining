local _ = require(script.Parent.networkingCallTypes)
local networkRequests = script.Parent.networkRequests
local createGetCallHistoryModule = require(networkRequests.createGetCallHistory)
local createGetSuggestedCalleesModule = require(networkRequests.createGetSuggestedCallees)

return function(p0)
	-- upvalues: createGetCallHistoryModule (ref), createGetSuggestedCalleesModule (ref)
	return {
		GetCallHistory = createGetCallHistoryModule(p0),
		GetSuggestedCallees = createGetSuggestedCalleesModule(p0)
	}
end