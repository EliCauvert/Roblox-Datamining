local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local getEventCtaButtonStateModule = require(virtualEvents.Common.getEventCtaButtonState)
local _ = require(virtualEvents.Parent.GraphQLServer)
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local _ = require(virtualEvents.Parent.VirtualEventsState)
local usePlayButtonState = require(virtualEvents.Parent.GamePlayButton).usePlayButtonState
local roactNetworking = require(virtualEvents.Parent.RoactServiceTags).RoactNetworking
local useRoactService = require(virtualEvents.Parent.RobloxAppHooks).useRoactService
local fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable = require(virtualEvents.Parent.SharedFlags).FFlagLuaAppEventDetailsPageDisableCtaOnUnplayable
local images = UIBloxModule.App.ImageSet.Images
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p0, p1, p2, p3) --[[ line: 68 | named "useActionBarProps" ]]
	-- upvalues: useLocalization (ref), fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable (ref), useRoactService (ref), roactNetworking (ref), usePlayButtonState (ref), getEventCtaButtonStateModule (ref), reactModule (ref), buttonType (ref), images (ref)
	local var4 = useLocalization({
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		joinEvent = "Feature.VirtualEvents.JoinEvent",
		goHome = "Feature.VirtualEvents.GoHome"
	})
	local isRsvpDisabled = nil
	local isJoinEventDisabled = nil
	
	if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
		local var5 = getEventCtaButtonStateModule(usePlayButtonState(useRoactService(roactNetworking), tostring(p0.universeId)))
		isJoinEventDisabled = var5.isJoinEventDisabled
		isRsvpDisabled = var5.isRsvpDisabled
	end
	local var6 = reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: p0 (ref), p1 (ref), buttonType (copy), var4 (ref), images (copy), p2 (ref), p3 (ref), fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable (copy), isRsvpDisabled (write), isJoinEventDisabled (write)
		return if p0.eventStatus == "cancelled" or p0.eventStatus == "moderated" then {
			props = {
				buttonType = buttonType.Secondary,
				text = var4.goHome,
				onActivated = p2.onClose,
				buttonRef = p3
			}
		} elseif p1 == "Upcoming" or p1 == "UpcomingImminent" then if p0.userRsvpStatus == "going" then {
			props = {
				buttonType = buttonType.Secondary,
				text = var4.unfollowEvent,
				icon = images["icons/actions/favoriteOn"],
				onActivated = p2.onRsvpChanged,
				buttonRef = p3,
				isDisabled = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isRsvpDisabled else nil
			}
		} else {
			props = {
				buttonType = buttonType.PrimarySystem,
				text = var4.notifyMe,
				icon = images["icons/actions/favoriteOff"],
				onActivated = p2.onRsvpChanged,
				buttonRef = p3,
				isDisabled = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isRsvpDisabled else nil
			}
		} elseif p1 == "Ongoing" or p1 == "ElapsedImminent" then {
			props = {
				buttonType = buttonType.PrimaryContextual,
				text = var4.joinEvent,
				onActivated = p2.onJoinEvent,
				buttonRef = p3,
				isDisabled = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isJoinEventDisabled else nil
			}
		} else nil
	end, {
		p0, p1, p2, p3,
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isRsvpDisabled else nil,
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isJoinEventDisabled else nil
	})
	local var7 = reactModule.useMemo(function() --[[ line: 158 ]]
		-- upvalues: p0 (ref), p1 (ref), images (copy), p2 (ref)
		return if p0.eventStatus == "cancelled" or p0.eventStatus == "moderated" or p1 == "Elapsed" then nil else {
			props = {
				userInteractionEnabled = true,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = images["icons/actions/share"],
				onActivated = p2.onShare
			}
		}
	end, { p0, p1, p2 })
	
	return reactModule.useMemo(function() --[[ line: 178 ]]
		-- upvalues: var6 (ref), var7 (ref)
		return { button = var6, icons = { var7 } }
	end, { var6, var7 })
end