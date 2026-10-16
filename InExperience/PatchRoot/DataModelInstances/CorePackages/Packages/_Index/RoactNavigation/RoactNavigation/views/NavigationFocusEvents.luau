local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Array = require(Parent1.LuauPolyfill).Array
local EventsModule = require(Parent.Events)
local NavigationEventManager = require(Parent1.React).Component:extend("NavigationEventManager")

function NavigationEventManager.didMount(p1) --[[ Line: 13 ]]
	-- upvalues: EventsModule (copy)
	local Navigation = p1.props.navigation
	p1._actionSubscription = Navigation.addListener(EventsModule.Action, function(...) --[[ Line: 16 ]]
		-- upvalues: p1 (copy)
		return p1:_handleAction(...)
	end)
	p1._willFocusSubscription = Navigation.addListener(EventsModule.WillFocus, function(...) --[[ Line: 20 ]]
		-- upvalues: p1 (copy)
		return p1:_handleWillFocus(...)
	end)
	p1._willBlurSubscription = Navigation.addListener(EventsModule.WillBlur, function(...) --[[ Line: 24 ]]
		-- upvalues: p1 (copy)
		return p1:_handleWillBlur(...)
	end)
	p1._didFocusSubscription = Navigation.addListener(EventsModule.DidFocus, function(...) --[[ Line: 28 ]]
		-- upvalues: p1 (copy)
		return p1:_handleDidFocus(...)
	end)
	p1._didBlurSubscription = Navigation.addListener(EventsModule.DidBlur, function(...) --[[ Line: 32 ]]
		-- upvalues: p1 (copy)
		return p1:_handleDidBlur(...)
	end)
	p1._refocusSubscription = Navigation.addListener(EventsModule.Refocus, function(...) --[[ Line: 36 ]]
		-- upvalues: p1 (copy)
		return p1:_handleRefocus(...)
	end)
end

function NavigationEventManager.willUnmount(p1) --[[ Line: 41 ]]
	if p1._actionSubscription then
		p1._actionSubscription.remove()
	end
	if p1._willFocusSubscription then
		p1._willFocusSubscription.remove()
	end
	if p1._willBlurSubscription then
		p1._willBlurSubscription.remove()
	end
	if p1._didFocusSubscription then
		p1._didFocusSubscription.remove()
	end
	if p1._didBlurSubscription then
		p1._didBlurSubscription.remove()
	end
	if p1._refocusSubscription then
		p1._refocusSubscription.remove()
	end
end

function NavigationEventManager._handleAction(p1, p2) --[[ Line: 62 ]]
	-- upvalues: EventsModule (copy)
	local State = p2.state
	local LastState = p2.lastState
	local Action = p2.action
	local Type = p2.type
	local Context = p2.context
	local OnEventFunction: (any, any, any) -> () = p1.props.onEvent
	
	if not p1.props.navigation.isFocused() then return end
	local Route = if LastState and LastState.routes then LastState.routes[LastState.index] else nil
	local Route1 = State.routes[State.index]
	local config = {
		context = ("%s:%s_%s"):format(Route1.key, tostring(Action.type), Context or "Root"),
		state = Route1,
		lastState = Route,
		action = Action,
		type = Type
	}
	
	if (Route and Route.key) ~= Route1.key then
		p1:_emitWillFocus(Route1.key, config)
		
		if Route and Route.key then
			p1:_emitWillBlur(Route.key, config)
		end
	end
	if LastState and LastState.isTransitioning ~= State.isTransitioning and State.isTransitioning == false then
		if p1._lastWillBlurKey then
			p1:_emitDidBlur(p1._lastWillBlurKey, config)
		end
		if p1._lastWillFocusKey then
			p1:_emitDidFocus(p1._lastWillFocusKey, config)
		end
	end
	OnEventFunction(Route1.key, EventsModule.Action, config)
end

function NavigationEventManager._handleWillFocus(p1, p2) --[[ Line: 113 ]]
	-- upvalues: Array (copy)
	local LastState = p2.lastState
	local Action = p2.action
	local Context = p2.context
	local Type = p2.type
	local Navigation = p1.props.navigation
	local Route = Navigation.state.routes[Navigation.state.index]
	local Route1 = nil
	
	if LastState and LastState.routes then
		local Index = if LastState then Array.findIndex(LastState.routes, function(p3): boolean --[[ Line: 125 ]]
			-- upvalues: Route (copy)
			return p3.key == Route.key
		end) else -1
		
		if Index > 0 then
			Route1 = LastState.routes[Index]
		end
	end
	p1:_emitWillFocus(Route.key, {
		context = ("%s:%s_%s"):format(Route.key, tostring(Action.type), Context or "Root"),
		state = Route,
		lastState = Route1,
		action = Action,
		type = Type
	})
end

function NavigationEventManager._handleWillBlur(p1, p2) --[[ Line: 143 ]]
	-- upvalues: Array (copy)
	local LastState = p2.lastState
	local Action = p2.action
	local Context = p2.context
	local Type = p2.type
	local Navigation = p1.props.navigation
	local Route = Navigation.state.routes[Navigation.state.index]
	local Route1 = nil
	
	if LastState and LastState.routes then
		local Index = if LastState then Array.findIndex(LastState.routes, function(p3): boolean --[[ Line: 155 ]]
			-- upvalues: Route (copy)
			return p3.key == Route.key
		end) else -1
		
		if Index > 0 then
			Route1 = LastState.routes[Index]
		end
	end
	p1:_emitWillBlur(Route.key, {
		context = ("%s:%s_%s"):format(Route.key, tostring(Action.type), Context or "Root"),
		state = Route,
		lastState = Route1,
		action = Action,
		type = Type
	})
end

function NavigationEventManager._handleDidFocus(p1, p2) --[[ Line: 173 ]]
	-- upvalues: Array (copy)
	local LastState = p2.lastState
	local Action = p2.action
	local Context = p2.context
	local Type = p2.type
	local Navigation = p1.props.navigation
	
	if p1._lastWillFocusKey then
		local Index: number = Array.findIndex(Navigation.state.routes, function(p3): boolean --[[ Line: 182 ]]
			-- upvalues: p1 (copy)
			return p3.key == p1._lastWillFocusKey
		end)
		
		if Index > 0 then
			local Route = Navigation.state.routes[Index]
			local Route1 = nil
			
			if LastState and LastState.routes then
				local Index1 = if LastState then Array.findIndex(LastState.routes, function(p3): boolean --[[ Line: 192 ]]
					-- upvalues: Route (copy)
					return p3.key == Route.key
				end) else -1
				
				if Index1 > 0 then
					Route1 = LastState.routes[Index1]
				end
			end
			p1:_emitDidFocus(Route.key, {
				context = ("%s:%s_%s"):format(Route.key, tostring(Action.type), Context or "Root"),
				state = Route,
				lastState = Route1,
				action = Action,
				type = Type
			})
		end
	end
end

function NavigationEventManager._handleDidBlur(p1, p2) --[[ Line: 212 ]]
	-- upvalues: Array (copy)
	local LastState = p2.lastState
	local Action = p2.action
	local Context = p2.context
	local Type = p2.type
	local Navigation = p1.props.navigation
	
	if p1._lastWillBlurKey then
		local Index: number = Array.findIndex(Navigation.state.routes, function(p3): boolean --[[ Line: 221 ]]
			-- upvalues: p1 (copy)
			return p3.key == p1._lastWillBlurKey
		end)
		
		if Index > 0 then
			local Route = Navigation.state.routes[Index]
			local Route1 = nil
			
			if LastState and LastState.routes then
				local Index1 = if LastState then Array.findIndex(LastState.routes, function(p3): boolean --[[ Line: 231 ]]
					-- upvalues: Route (copy)
					return p3.key == Route.key
				end) else -1
				
				if Index1 > 0 then
					Route1 = LastState.routes[Index1]
				end
			end
			p1:_emitDidBlur(Route.key, {
				context = ("%s:%s_%s"):format(Route.key, tostring(Action.type), Context or "Root"),
				state = Route,
				lastState = Route1,
				action = Action,
				type = Type
			})
		end
	end
end

function NavigationEventManager._handleRefocus(p1) --[[ Line: 251 ]]
	-- upvalues: EventsModule (copy)
	local Navigation = p1.props.navigation
	p1.props.onEvent(Navigation.state.routes[Navigation.state.index].key, EventsModule.Refocus)
end

function NavigationEventManager._emitWillFocus(p1, Key, p2) --[[ Line: 259 ]]
	-- upvalues: EventsModule (copy)
	if p1._lastWillBlurKey == Key then
		p1._lastWillBlurKey = nil
	end
	if p1._lastWillFocusKey == Key then return end
	p1._lastDidFocusKey = nil
	p1._lastWillFocusKey = Key
	local Navigation = p1.props.navigation
	p1.props.onEvent(Key, EventsModule.WillFocus, p2)
	
	if type(Navigation.state.isTransitioning) ~= "boolean" or Navigation.state.isTransitioning ~= true and not Navigation._dangerouslyGetParent() then
		p1:_emitDidFocus(Key, p2)
	end
end

function NavigationEventManager._emitWillBlur(p1, Key, p2) --[[ Line: 284 ]]
	-- upvalues: EventsModule (copy)
	if p1._lastWillFocusKey == Key then
		p1._lastWillFocusKey = nil
	end
	if p1._lastWillBlurKey == Key then return end
	p1._lastDidBlurKey = nil
	p1._lastWillBlurKey = Key
	local Navigation = p1.props.navigation
	p1.props.onEvent(Key, EventsModule.WillBlur, p2)
	
	if type(Navigation.state.isTransitioning) ~= "boolean" or Navigation.state.isTransitioning ~= true and not Navigation._dangerouslyGetParent() then
		p1:_emitDidBlur(Key, p2)
	end
end

function NavigationEventManager._emitDidFocus(p1, LastWillFocusKey, p2) --[[ Line: 309 ]]
	-- upvalues: EventsModule (copy)
	if p1._lastWillFocusKey == LastWillFocusKey and p1._lastDidFocusKey ~= LastWillFocusKey then
		p1._lastDidFocusKey = LastWillFocusKey
		p1.props.onEvent(LastWillFocusKey, EventsModule.DidFocus, p2)
		
		return
	end
end

function NavigationEventManager._emitDidBlur(p1, LastWillBlurKey, p2) --[[ Line: 321 ]]
	-- upvalues: EventsModule (copy)
	if p1._lastWillBlurKey == LastWillBlurKey and p1._lastDidBlurKey ~= LastWillBlurKey then
		p1._lastDidBlurKey = LastWillBlurKey
		p1.props.onEvent(LastWillBlurKey, EventsModule.DidBlur, p2)
		
		return
	end
end

function NavigationEventManager:render() --[[ Line: 333 ]]
	return nil
end

return NavigationEventManager