local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local ReactModule = require(VirtualEvents.Parent.React)
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local _ = require(VirtualEvents.Parent.VirtualEventsState)

return function(p1, p2, p3, p4)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		join = "Feature.VirtualEvents.Join",
		goHome = "Feature.VirtualEvents.GoHome"
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), p2 (copy), UseLocalizationResult (copy), p4 (copy), p3 (copy)
		return if p1.eventStatus == "cancelled" or p1.eventStatus == "moderated" then {
			icon = nil,
			variant = "Standard",
			text = UseLocalizationResult.goHome,
			onActivated = p4.onClose
		} elseif p2 == "Upcoming" or p2 == "UpcomingImminent" then if p1.userRsvpStatus == "going" then {
			icon = nil,
			variant = "Standard",
			text = UseLocalizationResult.unfollowEvent,
			onActivated = p4.onRsvpChanged
		} else {
			icon = nil,
			text = UseLocalizationResult.notifyMe,
			variant = if p3 then "Emphasis" else "Standard",
			onActivated = p4.onRsvpChanged
		} elseif p2 == "Ongoing" or p2 == "ElapsedImminent" then {
			icon = nil,
			variant = "Emphasis",
			text = UseLocalizationResult.join,
			onActivated = p4.onJoinEvent
		} else nil
	end, { p1, p2, p4 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), p2 (copy), p4 (copy)
		return if p1.eventStatus == "cancelled" or p1.eventStatus == "moderated" or p2 == "Elapsed" then nil else {
			text = nil,
			icon = "icons/actions/shareArrowOff",
			variant = "Standard",
			onActivated = p4.onShare
		}
	end, { p1, p2, p4 })
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseMemoResult1 (copy)
		return { button = UseMemoResult, icon = UseMemoResult1 }
	end, { UseMemoResult, UseMemoResult1 }))
end