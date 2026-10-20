local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local Players = game:GetService("Players")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local ReactModule = require(VirtualEvents.Parent.React)
local AttendanceCountModule = require(VirtualEvents.Components.AttendanceCount)
local FacePileModule = require(VirtualEvents.Components.FacePile)
local _ = require(VirtualEvents.Parent.VirtualEventsState)

return function(p1)
	-- upvalues: ReactModule (copy), AttendanceCountModule (copy), FacePileModule (copy), Players (copy)
	local ExperienceDetails = p1.virtualEvent.experienceDetails
	local RsvpCounters = p1.virtualEvent.rsvpCounters
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local List = {}
		
		if p1.virtualEvent.rsvps then
			for _, rsvp in p1.virtualEvent.rsvps do
				if rsvp.rsvpStatus == "going" then
					table.insert(List, (tostring(rsvp.userId)))
				end
			end
		end
		return List
	end, { p1.virtualEvent })
	
	if p1.eventStatus == "Ongoing" and ExperienceDetails and ExperienceDetails.playing == 0 or p1.eventStatus ~= "Ongoing" and RsvpCounters and RsvpCounters.going == 0 then
		return nil
	else
		return ReactModule.createElement("Folder", nil, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 8)
			}),
			AttendanceCount = ReactModule.createElement(AttendanceCountModule, {
				layoutOrder = 1,
				eventStatus = p1.eventStatus,
				interested = if RsvpCounters and RsvpCounters.going then RsvpCounters.going else 0,
				attending = if ExperienceDetails and ExperienceDetails.playing then ExperienceDetails.playing else 0
			}),
			FacePile = ReactModule.createElement(FacePileModule, {
				layoutOrder = 2,
				userIds = UseMemoResult,
				desiredFirstUserId = if Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else nil
			})
		})
	end
end