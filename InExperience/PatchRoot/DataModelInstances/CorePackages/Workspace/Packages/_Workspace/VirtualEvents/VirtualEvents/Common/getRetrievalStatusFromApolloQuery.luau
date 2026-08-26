local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.ApolloClient)
local retrievalStatus = require(virtualEvents.Parent.Http).Enum.RetrievalStatus

return function(p1)
	-- upvalues: retrievalStatus (ref)
	return if p1.loading then retrievalStatus.Fetching elseif p1.data then retrievalStatus.Done elseif p1.error then retrievalStatus.Failed else retrievalStatus.NotStarted
end