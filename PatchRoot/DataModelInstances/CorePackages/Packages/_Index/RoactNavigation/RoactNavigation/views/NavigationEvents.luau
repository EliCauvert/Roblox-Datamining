-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local withNavigationModule = require(script.Parent.withNavigation)
local eventsModule = require(parent.Events)
local t = {
	[eventsModule.WillFocus] = "onWillFocus",
	[eventsModule.DidFocus] = "onDidFocus",
	[eventsModule.WillBlur] = "onWillBlur",
	[eventsModule.DidBlur] = "onDidBlur"
}
local navigationEvents = reactModule.Component:extend("NavigationEvents")

function navigationEvents.didMount(p0) --[[ line: 51 ]]
	p0:subscribeAll()
end

function navigationEvents.didUpdate(p1, p2) --[[ line: 58 ]]
	if p1.props.navigation ~= p2.navigation then
		p1:removeAll()
		p1:subscribeAll()
	end
end

function navigationEvents.willUnmount(p3) --[[ line: 66 ]]
	p3:removeAll()
end

function navigationEvents.getPropListener(p4, p5) --[[ line: 70 ]]
	-- upvalues: t (ref)
	return p4.props[t[p5]]
end

function navigationEvents.subscribeAll(p6) --[[ line: 74 ]]
	-- upvalues: t (ref)
	local navigation = p6.props.navigation
	p6.subscriptions = {}
	
	for i in t do
		p6.subscriptions[i] = navigation.addListener(i, function(...) --[[ line: 80 ]]
			-- upvalues: p6 (ref), i (ref)
			local var5 = p6:getPropListener(i)
			
			if var5 then
				var5(...)
			end
		end)
	end
end

function navigationEvents.removeAll(p7) --[[ line: 90 ]]
	-- upvalues: t (ref)
	for i in t do
		local var6 = p7.subscriptions[i]
		
		if var6 then
			var6.remove()
			p7.subscriptions[i] = nil
		end
	end
end

function navigationEvents.render(_) --[[ line: 100 ]]
	return nil
end

return withNavigationModule(navigationEvents)