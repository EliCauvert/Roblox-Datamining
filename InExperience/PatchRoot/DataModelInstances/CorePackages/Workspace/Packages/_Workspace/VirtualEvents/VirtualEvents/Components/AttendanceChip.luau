local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local playersService = game:GetService("Players")
local _ = require(virtualEvents.Parent.GraphQLServer)
local foundationModule = require(virtualEvents.Parent.Foundation)
local reactModule = require(virtualEvents.Parent.React)
local eventSocialProofModule = require(virtualEvents.Components.EventSocialProof)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local formatNumberWithShortUnitsModule = require(virtualEvents.Common.formatNumberWithShortUnits)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), view (ref), eventSocialProofModule (ref), playersService (ref), text (ref), formatNumberWithShortUnitsModule (ref)
	local var6 = useTokens()
	local var7 = useLocalization({
		interested = "Feature.VirtualEvents.AttendanceBeforeEvent",
		attendingNow = "Feature.VirtualEvents.AttendanceDuringEvent"
	})
	local experienceDetails = p0.virtualEvent.experienceDetails
	local rsvpCounters = p0.virtualEvent.rsvpCounters
	local isOngoing = p0.eventStatus == "Ongoing"
	
	return if isOngoing and experienceDetails and experienceDetails.playing == 0 or not isOngoing and rsvpCounters and rsvpCounters.going == 0 then nil else reactModule.createElement(view, {
		backgroundStyle = var6.Inverse.Surface.Surface_300,
		tag = {
			["row gap-xsmall size-0-700 auto-x align-y-center align-x-center clip radius-circle"] = true
		}
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 12)
		}),
		EventSocialProof = reactModule.createElement(eventSocialProofModule, {
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
		}),
		AttendanceCount = reactModule.createElement(text, {
			tag = "auto-x size-0-full shrink text-caption-large text-truncate-end",
			Text = ("%s %s"):format(formatNumberWithShortUnitsModule(if isOngoing then if experienceDetails and experienceDetails.playing then experienceDetails.playing else 0 elseif rsvpCounters and rsvpCounters.going then rsvpCounters.going else 0), if isOngoing then var7.attendingNow else var7.interested),
			textStyle = var6.Inverse.Content.Emphasis,
			fontStyle = var6.Typography.TitleSmall
		})
	})
end