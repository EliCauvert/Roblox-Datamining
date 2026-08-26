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

return function(p1, p2, p3, p4)
	-- upvalues: useLocalization (ref), fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable (ref), useRoactService (ref), roactNetworking (ref), usePlayButtonState (ref), getEventCtaButtonStateModule (ref), reactModule (ref), buttonType (ref), images (ref)
	local var1 = useLocalization({
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		joinEvent = "Feature.VirtualEvents.JoinEvent",
		goHome = "Feature.VirtualEvents.GoHome"
	})
	local isRsvpDisabled = nil
	local isJoinEventDisabled = nil
	
	if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then
		local var2 = getEventCtaButtonStateModule(usePlayButtonState(useRoactService(roactNetworking), tostring(p1.universeId)))
		isJoinEventDisabled = var2.isJoinEventDisabled
		isRsvpDisabled = var2.isRsvpDisabled
	end
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref), buttonType (copy), var1 (ref), images (copy), p3 (ref), p4 (ref), fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable (copy), isRsvpDisabled (write), isJoinEventDisabled (write)
		return if p1.eventStatus == "cancelled" or p1.eventStatus == "moderated" then {
			props = {
				buttonType = buttonType.Secondary,
				text = var1.goHome,
				onActivated = p3.onClose,
				buttonRef = p4
			}
		} elseif p2 == "Upcoming" or p2 == "UpcomingImminent" then if p1.userRsvpStatus == "going" then {
			props = {
				buttonType = buttonType.Secondary,
				text = var1.unfollowEvent,
				icon = images["icons/actions/favoriteOn"],
				onActivated = p3.onRsvpChanged,
				buttonRef = p4,
				isDisabled = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isRsvpDisabled else nil
			}
		} else {
			props = {
				buttonType = buttonType.PrimarySystem,
				text = var1.notifyMe,
				icon = images["icons/actions/favoriteOff"],
				onActivated = p3.onRsvpChanged,
				buttonRef = p4,
				isDisabled = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isRsvpDisabled else nil
			}
		} elseif p2 == "Ongoing" or p2 == "ElapsedImminent" then {
			props = {
				buttonType = buttonType.PrimaryContextual,
				text = var1.joinEvent,
				onActivated = p3.onJoinEvent,
				buttonRef = p4,
				isDisabled = if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isJoinEventDisabled else nil
			}
		} else nil
	end, {
		p1, p2, p3, p4,
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isRsvpDisabled else nil,
		if fFlagLuaAppEventDetailsPageDisableCtaOnUnplayable then isJoinEventDisabled else nil
	})
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref), images (copy), p3 (ref)
		return if p1.eventStatus == "cancelled" or p1.eventStatus == "moderated" or p2 == "Elapsed" then nil else {
			props = {
				userInteractionEnabled = true,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = images["icons/actions/share"],
				onActivated = p3.onShare
			}
		}
	end, { p1, p2, p3 })
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref)
		return { button = var3, icons = { var4 } }
	end, { var3, var4 })
end