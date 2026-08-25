local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local playersService = game:GetService("Players")
local _ = require(virtualEvents.Parent.GraphQLServer)
local reactModule = require(virtualEvents.Parent.React)
local attendanceCountModule = require(virtualEvents.Components.AttendanceCount)
local facePileModule = require(virtualEvents.Components.FacePile)
local _ = require(virtualEvents.Parent.VirtualEventsState)

return function(p0)
	-- upvalues: reactModule (ref), attendanceCountModule (ref), facePileModule (ref), playersService (ref)
	local experienceDetails = p0.virtualEvent.experienceDetails
	local rsvpCounters = p0.virtualEvent.rsvpCounters
	
	return if p0.eventStatus == "Ongoing" and experienceDetails and experienceDetails.playing == 0 or p0.eventStatus ~= "Ongoing" and rsvpCounters and rsvpCounters.going == 0 then nil else reactModule.createElement("Folder", nil, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8)
		}),
		AttendanceCount = reactModule.createElement(attendanceCountModule, {
			layoutOrder = 1,
			eventStatus = p0.eventStatus,
			interested = if rsvpCounters and rsvpCounters.going then rsvpCounters.going else 0,
			attending = if experienceDetails and experienceDetails.playing then experienceDetails.playing else 0
		}),
		FacePile = reactModule.createElement(facePileModule, {
			layoutOrder = 2,
			userIds = reactModule.useMemo(function()
				-- upvalues: p0 (ref)
				local t = {}
				
				if p0.virtualEvent.rsvps then
					for i, v in p0.virtualEvent.rsvps do
						if v.rsvpStatus == "going" then
							table.insert(t, tostring(v.userId))
						end
					end
				end
				return t
			end, { p0.virtualEvent }),
			desiredFirstUserId = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
		})
	})
end