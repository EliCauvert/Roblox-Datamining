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

function navigationEvents.didMount(p1)
	p1:subscribeAll()
end

function navigationEvents.didUpdate(p1, p2)
	if p1.props.navigation ~= p2.navigation then
		p1:removeAll()
		p1:subscribeAll()
	end
end

function navigationEvents.willUnmount(p1)
	p1:removeAll()
end

function navigationEvents.getPropListener(p1, p2)
	-- upvalues: t (ref)
	return p1.props[t[p2]]
end

function navigationEvents.subscribeAll(p1)
	-- upvalues: t (ref)
	local navigation = p1.props.navigation
	p1.subscriptions = {}
	
	for i in t do
		p1.subscriptions[i] = navigation.addListener(i, function(...)
			-- upvalues: p1 (ref), i (ref)
			local var1 = p1:getPropListener(i)
			
			if var1 then
				var1(...)
			end
		end)
	end
end

function navigationEvents.removeAll(p2)
	-- upvalues: t (ref)
	for i in t do
		local var1 = p2.subscriptions[i]
		
		if var1 then
			var1.remove()
			p2.subscriptions[i] = nil
		end
	end
end

function navigationEvents.render(_)
	return nil
end

return withNavigationModule(navigationEvents)