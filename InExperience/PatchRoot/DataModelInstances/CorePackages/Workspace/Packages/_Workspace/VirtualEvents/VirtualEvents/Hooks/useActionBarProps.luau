local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local GetEventCtaButtonStateModule = require(VirtualEvents.Common.getEventCtaButtonState)
local _ = require(VirtualEvents.Parent.GraphQLServer)
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local UsePlayButtonStateFunction = require(VirtualEvents.Parent.GamePlayButton).usePlayButtonState
local RoactNetworking = require(VirtualEvents.Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(VirtualEvents.Parent.RobloxAppHooks).useRoactService
local Images = UIBloxModule.App.ImageSet.Images
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1, p2, p3, ButtonRef) --[[ Line: 65 | Named "useActionBarProps" ]]
	-- upvalues: UseLocalizationFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UsePlayButtonStateFunction (copy), GetEventCtaButtonStateModule (copy), ReactModule (copy), ButtonType (copy), Images (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		joinEvent = "Feature.VirtualEvents.JoinEvent",
		goHome = "Feature.VirtualEvents.GoHome"
	})
	local EventCtaButtonStateModule = GetEventCtaButtonStateModule((UsePlayButtonStateFunction(UseRoactServiceFunction(RoactNetworking), (tostring(p1.universeId)))))
	local IsJoinEventDisabled = EventCtaButtonStateModule.isJoinEventDisabled
	local IsRsvpDisabled = EventCtaButtonStateModule.isRsvpDisabled
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 85 ]]
		-- upvalues: p1 (copy), p2 (copy), ButtonType (upval), UseLocalizationResult (copy), Images (upval), p3 (copy), ButtonRef (copy), IsRsvpDisabled (copy), IsJoinEventDisabled (copy)
		return if p1.eventStatus == "cancelled" or p1.eventStatus == "moderated" then {
			props = {
				buttonType = ButtonType.Secondary,
				text = UseLocalizationResult.goHome,
				onActivated = p3.onClose,
				buttonRef = ButtonRef
			}
		} elseif p2 == "Upcoming" or p2 == "UpcomingImminent" then if p1.userRsvpStatus == "going" then {
			props = {
				buttonType = ButtonType.Secondary,
				text = UseLocalizationResult.unfollowEvent,
				icon = Images["icons/actions/favoriteOn"],
				onActivated = p3.onRsvpChanged,
				buttonRef = ButtonRef,
				isDisabled = IsRsvpDisabled
			}
		} else {
			props = {
				buttonType = ButtonType.PrimarySystem,
				text = UseLocalizationResult.notifyMe,
				icon = Images["icons/actions/favoriteOff"],
				onActivated = p3.onRsvpChanged,
				buttonRef = ButtonRef,
				isDisabled = IsRsvpDisabled
			}
		} elseif p2 == "Ongoing" or p2 == "ElapsedImminent" then {
			props = {
				buttonType = ButtonType.PrimaryContextual,
				text = UseLocalizationResult.joinEvent,
				onActivated = p3.onJoinEvent,
				buttonRef = ButtonRef,
				isDisabled = IsJoinEventDisabled
			}
		} else nil
	end, {
		p1, p2, p3, ButtonRef, IsRsvpDisabled, IsJoinEventDisabled
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 145 ]]
		-- upvalues: p1 (copy), p2 (copy), Images (upval), p3 (copy)
		return if p1.eventStatus == "cancelled" or p1.eventStatus == "moderated" or p2 == "Elapsed" then nil else {
			props = {
				userInteractionEnabled = true,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = Images["icons/actions/share"],
				onActivated = p3.onShare
			}
		}
	end, { p1, p2, p3 })
	
	return (ReactModule.useMemo(function() --[[ Line: 165 ]]
		-- upvalues: UseMemoResult (copy), UseMemoResult1 (copy)
		return { button = UseMemoResult, icons = { UseMemoResult1 } }
	end, { UseMemoResult, UseMemoResult1 }))
end