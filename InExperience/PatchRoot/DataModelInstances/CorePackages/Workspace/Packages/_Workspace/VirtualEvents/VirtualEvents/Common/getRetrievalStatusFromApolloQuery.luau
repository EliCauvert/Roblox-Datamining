local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.ApolloClient)
local retrievalStatus = require(virtualEvents.Parent.Http).Enum.RetrievalStatus

return function(p0)
	-- upvalues: retrievalStatus (ref)
	return if p0.loading then retrievalStatus.Fetching elseif p0.data then retrievalStatus.Done elseif p0.error then retrievalStatus.Failed else retrievalStatus.NotStarted
end