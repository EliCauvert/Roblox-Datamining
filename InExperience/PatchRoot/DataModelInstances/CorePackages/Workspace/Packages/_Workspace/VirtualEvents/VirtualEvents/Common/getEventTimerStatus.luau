local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local GetVirtualEventDatesModule = require(VirtualEvents.Common.getVirtualEventDates)

return function(p1, p2): string
	-- upvalues: GetVirtualEventDatesModule (copy)
	local VirtualEventDatesModule = GetVirtualEventDatesModule(p1)
	local UnixTimestampDelta = VirtualEventDatesModule.startDate.UnixTimestamp - p2.UnixTimestamp
	local UnixTimestampDelta1 = VirtualEventDatesModule.endDate.UnixTimestamp - p2.UnixTimestamp
	
	return if VirtualEventDatesModule.startDate.UnixTimestamp <= p2.UnixTimestamp then if p2.UnixTimestamp < VirtualEventDatesModule.endDate.UnixTimestamp then if UnixTimestampDelta1 <= 14400 then "ElapsedImminent" else "Ongoing" else "Elapsed" elseif UnixTimestampDelta > 0 and UnixTimestampDelta <= 14400 then "UpcomingImminent" else "Upcoming"
end