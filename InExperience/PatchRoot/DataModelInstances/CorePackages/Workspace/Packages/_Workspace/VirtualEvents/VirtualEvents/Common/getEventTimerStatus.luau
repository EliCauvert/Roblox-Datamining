local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.GraphQLServer)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local getVirtualEventDatesModule = require(virtualEvents.Common.getVirtualEventDates)

return function(p0, p1)
	-- upvalues: getVirtualEventDatesModule (ref)
	local var2 = getVirtualEventDatesModule(p0)
	local var3 = var2.startDate.UnixTimestamp - p1.UnixTimestamp
	
	return if var2.startDate.UnixTimestamp <= p1.UnixTimestamp then if p1.UnixTimestamp < var2.endDate.UnixTimestamp then if var2.endDate.UnixTimestamp - p1.UnixTimestamp <= 14400 then "ElapsedImminent" else "Ongoing" else "Elapsed" elseif var3 > 0 and var3 <= 14400 then "UpcomingImminent" else "Upcoming"
end