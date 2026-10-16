local _ = require(script.Parent.networkingCallTypes)
local NetworkRequests = script.Parent.networkRequests
local CreateGetCallHistoryModule = require(NetworkRequests.createGetCallHistory)
local CreateGetSuggestedCalleesModule = require(NetworkRequests.createGetSuggestedCallees)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: CreateGetCallHistoryModule (copy), CreateGetSuggestedCalleesModule (copy)
	return {
		GetCallHistory = CreateGetCallHistoryModule(p1),
		GetSuggestedCallees = CreateGetSuggestedCalleesModule(p1)
	}
end