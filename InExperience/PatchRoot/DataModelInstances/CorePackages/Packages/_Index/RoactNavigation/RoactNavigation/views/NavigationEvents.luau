local Parent = script.Parent.Parent
local WithNavigationModule = require(script.Parent.withNavigation)
local EventsModule = require(Parent.Events)
local config = {
	[EventsModule.WillFocus] = "onWillFocus",
	[EventsModule.DidFocus] = "onDidFocus",
	[EventsModule.WillBlur] = "onWillBlur",
	[EventsModule.DidBlur] = "onDidBlur"
}
local NavigationEvents = require(Parent.Parent.React).Component:extend("NavigationEvents")

function NavigationEvents.didMount(p1) --[[ Line: 51 ]]
	p1:subscribeAll()
end

function NavigationEvents.didUpdate(p1, p2) --[[ Line: 58 ]]
	if p1.props.navigation ~= p2.navigation then
		p1:removeAll()
		p1:subscribeAll()
	end
end

function NavigationEvents.willUnmount(p1) --[[ Line: 66 ]]
	p1:removeAll()
end

function NavigationEvents.getPropListener(p1, p2) --[[ Line: 70 ]]
	-- upvalues: config (copy)
	return p1.props[config[p2]]
end

function NavigationEvents.subscribeAll(p1) --[[ Line: 74 ]]
	-- upvalues: config (copy)
	local Navigation = p1.props.navigation
	p1.subscriptions = {}
	
	for i in config do
		p1.subscriptions[i] = Navigation.addListener(i, function(...) --[[ Line: 80 ]]
			-- upvalues: p1 (copy), i (copy)
			local PropListener: (any) -> () = p1:getPropListener(i)
			
			if PropListener then
				PropListener(...)
			end
		end)
	end
end

function NavigationEvents.removeAll(p2) --[[ Line: 90 ]]
	-- upvalues: config (copy)
	for i in config do
		local Subscription = p2.subscriptions[i]
		
		if Subscription then
			Subscription.remove()
			p2.subscriptions[i] = nil
		end
	end
end

function NavigationEvents:render() --[[ Line: 100 ]]
	return nil
end

return WithNavigationModule(NavigationEvents)