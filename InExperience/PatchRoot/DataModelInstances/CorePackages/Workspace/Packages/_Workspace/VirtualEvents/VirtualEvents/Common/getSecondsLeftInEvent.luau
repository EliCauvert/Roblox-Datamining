local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.GraphQLServer)
local getVirtualEventDatesModule = require(virtualEvents.Common.getVirtualEventDates)

return function(p1, p2)
	-- upvalues: getVirtualEventDatesModule (ref)
	local var1 = getVirtualEventDatesModule(p1)
	
	return if p2.UnixTimestamp < var1.startDate.UnixTimestamp then 1e999 elseif var1.endDate.UnixTimestamp < p2.UnixTimestamp then 0 else var1.endDate.UnixTimestamp - var1.startDate.UnixTimestamp - (p2.UnixTimestamp - var1.startDate.UnixTimestamp)
end