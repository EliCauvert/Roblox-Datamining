local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(VirtualEvents.Parent.ApolloClient)
local RetrievalStatus = require(VirtualEvents.Parent.Http).Enum.RetrievalStatus

return function(p1)
	-- upvalues: RetrievalStatus (copy)
	return if p1.loading then RetrievalStatus.Fetching elseif p1.data then RetrievalStatus.Done elseif p1.error then RetrievalStatus.Failed else RetrievalStatus.NotStarted
end