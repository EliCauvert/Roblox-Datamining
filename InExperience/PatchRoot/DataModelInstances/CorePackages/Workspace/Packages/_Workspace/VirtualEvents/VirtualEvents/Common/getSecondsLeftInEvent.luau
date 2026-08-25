local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.GraphQLServer)
local getVirtualEventDatesModule = require(virtualEvents.Common.getVirtualEventDates)

return function(p0, p1)
	-- upvalues: getVirtualEventDatesModule (ref)
	local var2 = getVirtualEventDatesModule(p0)
	
	return if p1.UnixTimestamp < var2.startDate.UnixTimestamp then 1e999 elseif var2.endDate.UnixTimestamp < p1.UnixTimestamp then 0 else var2.endDate.UnixTimestamp - var2.startDate.UnixTimestamp - (p1.UnixTimestamp - var2.startDate.UnixTimestamp)
end