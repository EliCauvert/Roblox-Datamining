local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.GraphQLServer)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local getVirtualEventDatesModule = require(virtualEvents.Common.getVirtualEventDates)

return function(p1, p2)
	-- upvalues: getVirtualEventDatesModule (ref)
	local var1 = getVirtualEventDatesModule(p1)
	local var2 = var1.startDate.UnixTimestamp - p2.UnixTimestamp
	
	return if var1.startDate.UnixTimestamp <= p2.UnixTimestamp then if p2.UnixTimestamp < var1.endDate.UnixTimestamp then if var1.endDate.UnixTimestamp - p2.UnixTimestamp <= 14400 then "ElapsedImminent" else "Ongoing" else "Elapsed" elseif var2 > 0 and var2 <= 14400 then "UpcomingImminent" else "Upcoming"
end