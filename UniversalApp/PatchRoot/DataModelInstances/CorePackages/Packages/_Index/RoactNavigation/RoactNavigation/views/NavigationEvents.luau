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

function navigationEvents.didMount(p0)
	p0:subscribeAll()
end

function navigationEvents.didUpdate(p1, p2)
	if p1.props.navigation ~= p2.navigation then
		p1:removeAll()
		p1:subscribeAll()
	end
end

function navigationEvents.willUnmount(p3)
	p3:removeAll()
end

function navigationEvents.getPropListener(p4, p5)
	-- upvalues: t (ref)
	return p4.props[t[p5]]
end

function navigationEvents.subscribeAll(p6)
	-- upvalues: t (ref)
	local navigation = p6.props.navigation
	p6.subscriptions = {}
	
	for i in t do
		p6.subscriptions[i] = navigation.addListener(i, function(...)
			-- upvalues: p6 (ref), i (ref)
			local var5 = p6:getPropListener(i)
			
			if var5 then
				var5(...)
			end
		end)
	end
end

function navigationEvents.removeAll(p7)
	-- upvalues: t (ref)
	for i in t do
		local var6 = p7.subscriptions[i]
		
		if var6 then
			var6.remove()
			p7.subscriptions[i] = nil
		end
	end
end

function navigationEvents.render(_)
	return nil
end

return withNavigationModule(navigationEvents)