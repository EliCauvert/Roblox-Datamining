local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.GraphQLServer)
local reactModule = require(virtualEvents.Parent.React)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local _ = require(virtualEvents.Parent.VirtualEventsState)

return function(p1, p2, p3, p4)
	-- upvalues: useLocalization (ref), reactModule (ref)
	local var1 = useLocalization({
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		join = "Feature.VirtualEvents.Join",
		goHome = "Feature.VirtualEvents.GoHome"
	})
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref), var1 (ref), p4 (ref), p3 (ref)
		return if p1.eventStatus == "cancelled" or p1.eventStatus == "moderated" then {
			icon = nil,
			variant = "Standard",
			text = var1.goHome,
			onActivated = p4.onClose
		} elseif p2 == "Upcoming" or p2 == "UpcomingImminent" then if p1.userRsvpStatus == "going" then {
			icon = nil,
			variant = "Standard",
			text = var1.unfollowEvent,
			onActivated = p4.onRsvpChanged
		} else {
			icon = nil,
			text = var1.notifyMe,
			variant = if p3 then "Emphasis" else "Standard",
			onActivated = p4.onRsvpChanged
		} elseif p2 == "Ongoing" or p2 == "ElapsedImminent" then {
			icon = nil,
			variant = "Emphasis",
			text = var1.join,
			onActivated = p4.onJoinEvent
		} else nil
	end, { p1, p2, p4 })
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref), p4 (ref)
		return if p1.eventStatus == "cancelled" or p1.eventStatus == "moderated" or p2 == "Elapsed" then nil else {
			text = nil,
			icon = "icons/actions/shareArrowOff",
			variant = "Standard",
			onActivated = p4.onShare
		}
	end, { p1, p2, p4 })
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), var3 (ref)
		return { button = var2, icon = var3 }
	end, { var2, var3 })
end