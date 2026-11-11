local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local GetVirtualEventDatesModule = require(VirtualEvents.Common.getVirtualEventDates)

return function(p1, p2)
	-- upvalues: GetVirtualEventDatesModule (copy)
	local VirtualEventDatesModule = GetVirtualEventDatesModule(p1)
	
	return if p2.UnixTimestamp < VirtualEventDatesModule.startDate.UnixTimestamp then 1e999 elseif VirtualEventDatesModule.endDate.UnixTimestamp < p2.UnixTimestamp then 0 else VirtualEventDatesModule.endDate.UnixTimestamp - VirtualEventDatesModule.startDate.UnixTimestamp - (p2.UnixTimestamp - VirtualEventDatesModule.startDate.UnixTimestamp)
end