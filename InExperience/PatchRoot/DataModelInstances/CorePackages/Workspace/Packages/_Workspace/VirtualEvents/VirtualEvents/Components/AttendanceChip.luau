local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local Players = game:GetService("Players")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local FoundationModule = require(VirtualEvents.Parent.Foundation)
local ReactModule = require(VirtualEvents.Parent.React)
local EventSocialProofModule = require(VirtualEvents.Components.EventSocialProof)
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local FormatNumberWithShortUnitsModule = require(VirtualEvents.Common.formatNumberWithShortUnits)
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 21 | Named "AttendanceChip" ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), EventSocialProofModule (copy), Players (copy), Text (copy), FormatNumberWithShortUnitsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		interested = "Feature.VirtualEvents.AttendanceBeforeEvent",
		attendingNow = "Feature.VirtualEvents.AttendanceDuringEvent"
	})
	local ExperienceDetails = p1.virtualEvent.experienceDetails
	local RsvpCounters = p1.virtualEvent.rsvpCounters
	local IsOngoing = p1.eventStatus == "Ongoing"
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 32 ]]
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
	
	if IsOngoing and ExperienceDetails and ExperienceDetails.playing == 0 or not IsOngoing and RsvpCounters and RsvpCounters.going == 0 then
		return nil
	else
		local Going = if RsvpCounters and RsvpCounters.going then RsvpCounters.going else 0
		local Playing = if ExperienceDetails and ExperienceDetails.playing then ExperienceDetails.playing else 0
		
		return ReactModule.createElement(View, {
			backgroundStyle = UseTokensResult.Inverse.Surface.Surface_300,
			tag = {
				["row gap-xsmall size-0-700 auto-x align-y-center align-x-center clip radius-circle"] = true
			}
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 4),
				PaddingRight = UDim.new(0, 12)
			}),
			EventSocialProof = ReactModule.createElement(EventSocialProofModule, {
				userIds = UseMemoResult,
				desiredFirstUserId = if Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else nil
			}),
			AttendanceCount = ReactModule.createElement(Text, {
				tag = "auto-x size-0-full shrink text-caption-large text-truncate-end",
				Text = ("%s %s"):format(FormatNumberWithShortUnitsModule(if IsOngoing then Playing else Going), if IsOngoing then UseLocalizationResult.attendingNow else UseLocalizationResult.interested),
				textStyle = UseTokensResult.Inverse.Content.Emphasis,
				fontStyle = UseTokensResult.Typography.TitleSmall
			})
		})
	end
end