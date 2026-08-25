local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.GraphQLServer)
local reactModule = require(virtualEvents.Parent.React)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local _ = require(virtualEvents.Parent.VirtualEventsState)

return function(p0, p1, p2, p3)
	-- upvalues: useLocalization (ref), reactModule (ref)
	local var2 = useLocalization({
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		join = "Feature.VirtualEvents.Join",
		goHome = "Feature.VirtualEvents.GoHome"
	})
	local var3 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), p1 (ref), var2 (ref), p3 (ref), p2 (ref)
		return if p0.eventStatus == "cancelled" or p0.eventStatus == "moderated" then {
			icon = nil,
			variant = "Standard",
			text = var2.goHome,
			onActivated = p3.onClose
		} elseif p1 == "Upcoming" or p1 == "UpcomingImminent" then if p0.userRsvpStatus == "going" then {
			icon = nil,
			variant = "Standard",
			text = var2.unfollowEvent,
			onActivated = p3.onRsvpChanged
		} else {
			icon = nil,
			text = var2.notifyMe,
			variant = if p2 then "Emphasis" else "Standard",
			onActivated = p3.onRsvpChanged
		} elseif p1 == "Ongoing" or p1 == "ElapsedImminent" then {
			icon = nil,
			variant = "Emphasis",
			text = var2.join,
			onActivated = p3.onJoinEvent
		} else nil
	end, { p0, p1, p3 })
	local var4 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), p1 (ref), p3 (ref)
		return if p0.eventStatus == "cancelled" or p0.eventStatus == "moderated" or p1 == "Elapsed" then nil else {
			text = nil,
			icon = "icons/actions/shareArrowOff",
			variant = "Standard",
			onActivated = p3.onShare
		}
	end, { p0, p1, p3 })
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref)
		return { button = var3, icon = var4 }
	end, { var3, var4 })
end