local parent = script.Parent.Parent
local parent_1 = parent.Parent
local array = require(parent_1.LuauPolyfill).Array
local eventsModule = require(parent.Events)
local navigationEventManager = require(parent_1.React).Component:extend("NavigationEventManager")

function navigationEventManager.didMount(p1)
	-- upvalues: eventsModule (ref)
	local navigation = p1.props.navigation
	p1._actionSubscription = navigation.addListener(eventsModule.Action, function(...)
		-- upvalues: p1 (ref)
		return p1:_handleAction(...)
	end)
	p1._willFocusSubscription = navigation.addListener(eventsModule.WillFocus, function(...)
		-- upvalues: p1 (ref)
		return p1:_handleWillFocus(...)
	end)
	p1._willBlurSubscription = navigation.addListener(eventsModule.WillBlur, function(...)
		-- upvalues: p1 (ref)
		return p1:_handleWillBlur(...)
	end)
	p1._didFocusSubscription = navigation.addListener(eventsModule.DidFocus, function(...)
		-- upvalues: p1 (ref)
		return p1:_handleDidFocus(...)
	end)
	p1._didBlurSubscription = navigation.addListener(eventsModule.DidBlur, function(...)
		-- upvalues: p1 (ref)
		return p1:_handleDidBlur(...)
	end)
	p1._refocusSubscription = navigation.addListener(eventsModule.Refocus, function(...)
		-- upvalues: p1 (ref)
		return p1:_handleRefocus(...)
	end)
end

function navigationEventManager.willUnmount(p1)
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

function navigationEventManager._handleAction(p1, p2)
	-- upvalues: eventsModule (ref)
	local state = p2.state
	local lastState = p2.lastState
	local action = p2.action
	local type = p2.type
	local context = p2.context
	local onEvent = p1.props.onEvent
	
	if not p1.props.navigation.isFocused() then return end
	local var1 = if lastState and lastState.routes then lastState.routes[lastState.index] else nil
	local index = state.routes[state.index]
	local t = {
		context = ("%s:%s_%s"):format(index.key, tostring(action.type), context or "Root"),
		state = index,
		lastState = var1,
		action = action,
		type = type
	}
	
	if (var1 and var1.key) ~= index.key then
		p1:_emitWillFocus(index.key, t)
		
		if var1 and var1.key then
			p1:_emitWillBlur(var1.key, t)
		end
	end
	if lastState and lastState.isTransitioning ~= state.isTransitioning and state.isTransitioning == false then
		if p1._lastWillBlurKey then
			p1:_emitDidBlur(p1._lastWillBlurKey, t)
		end
		if p1._lastWillFocusKey then
			p1:_emitDidFocus(p1._lastWillFocusKey, t)
		end
	end
	onEvent(index.key, eventsModule.Action, t)
end

function navigationEventManager._handleWillFocus(p1, p2)
	-- upvalues: array (ref)
	local lastState = p2.lastState
	local action = p2.action
	local context = p2.context
	local type = p2.type
	local navigation = p1.props.navigation
	local index = navigation.state.routes[navigation.state.index]
	local var1 = nil
	
	if lastState and lastState.routes then
		local var2 = if lastState then array.findIndex(lastState.routes, function(p3)
			-- upvalues: index (ref)
			return p3.key == index.key
		end) else -1
		
		if var2 > 0 then
			var1 = lastState.routes[var2]
		end
	end
	p1:_emitWillFocus(index.key, {
		context = ("%s:%s_%s"):format(index.key, tostring(action.type), context or "Root"),
		state = index,
		lastState = var1,
		action = action,
		type = type
	})
end

function navigationEventManager._handleWillBlur(p1, p2)
	-- upvalues: array (ref)
	local lastState = p2.lastState
	local action = p2.action
	local context = p2.context
	local type = p2.type
	local navigation = p1.props.navigation
	local index = navigation.state.routes[navigation.state.index]
	local var1 = nil
	
	if lastState and lastState.routes then
		local var2 = if lastState then array.findIndex(lastState.routes, function(p3)
			-- upvalues: index (ref)
			return p3.key == index.key
		end) else -1
		
		if var2 > 0 then
			var1 = lastState.routes[var2]
		end
	end
	p1:_emitWillBlur(index.key, {
		context = ("%s:%s_%s"):format(index.key, tostring(action.type), context or "Root"),
		state = index,
		lastState = var1,
		action = action,
		type = type
	})
end

function navigationEventManager._handleDidFocus(p1, p2)
	-- upvalues: array (ref)
	local lastState = p2.lastState
	local action = p2.action
	local context = p2.context
	local type = p2.type
	local navigation = p1.props.navigation
	
	if p1._lastWillFocusKey then
		local var1 = array.findIndex(navigation.state.routes, function(p3)
			-- upvalues: p1 (ref)
			return p3.key == p1._lastWillFocusKey
		end)
		
		if var1 > 0 then
			local var2 = navigation.state.routes[var1]
			local var3 = nil
			
			if lastState and lastState.routes then
				local var4 = if lastState then array.findIndex(lastState.routes, function(p3)
					-- upvalues: var2 (ref)
					return p3.key == var2.key
				end) else -1
				
				if var4 > 0 then
					var3 = lastState.routes[var4]
				end
			end
			p1:_emitDidFocus(var2.key, {
				context = ("%s:%s_%s"):format(var2.key, tostring(action.type), context or "Root"),
				state = var2,
				lastState = var3,
				action = action,
				type = type
			})
		end
	end
end

function navigationEventManager._handleDidBlur(p1, p2)
	-- upvalues: array (ref)
	local lastState = p2.lastState
	local action = p2.action
	local context = p2.context
	local type = p2.type
	local navigation = p1.props.navigation
	
	if p1._lastWillBlurKey then
		local var1 = array.findIndex(navigation.state.routes, function(p3)
			-- upvalues: p1 (ref)
			return p3.key == p1._lastWillBlurKey
		end)
		
		if var1 > 0 then
			local var2 = navigation.state.routes[var1]
			local var3 = nil
			
			if lastState and lastState.routes then
				local var4 = if lastState then array.findIndex(lastState.routes, function(p3)
					-- upvalues: var2 (ref)
					return p3.key == var2.key
				end) else -1
				
				if var4 > 0 then
					var3 = lastState.routes[var4]
				end
			end
			p1:_emitDidBlur(var2.key, {
				context = ("%s:%s_%s"):format(var2.key, tostring(action.type), context or "Root"),
				state = var2,
				lastState = var3,
				action = action,
				type = type
			})
		end
	end
end

function navigationEventManager._handleRefocus(p1)
	-- upvalues: eventsModule (ref)
	local navigation = p1.props.navigation
	p1.props.onEvent(navigation.state.routes[navigation.state.index].key, eventsModule.Refocus)
end

function navigationEventManager._emitWillFocus(p1, p2, p3)
	-- upvalues: eventsModule (ref)
	if p1._lastWillBlurKey == p2 then
		p1._lastWillBlurKey = nil
	end
	if p1._lastWillFocusKey == p2 then return end
	p1._lastDidFocusKey = nil
	p1._lastWillFocusKey = p2
	local navigation = p1.props.navigation
	p1.props.onEvent(p2, eventsModule.WillFocus, p3)
	
	if type(navigation.state.isTransitioning) ~= "boolean" or navigation.state.isTransitioning ~= true and not navigation._dangerouslyGetParent() then
		p1:_emitDidFocus(p2, p3)
	end
end

function navigationEventManager._emitWillBlur(p1, p2, p3)
	-- upvalues: eventsModule (ref)
	if p1._lastWillFocusKey == p2 then
		p1._lastWillFocusKey = nil
	end
	if p1._lastWillBlurKey == p2 then return end
	p1._lastDidBlurKey = nil
	p1._lastWillBlurKey = p2
	local navigation = p1.props.navigation
	p1.props.onEvent(p2, eventsModule.WillBlur, p3)
	
	if type(navigation.state.isTransitioning) ~= "boolean" or navigation.state.isTransitioning ~= true and not navigation._dangerouslyGetParent() then
		p1:_emitDidBlur(p2, p3)
	end
end

function navigationEventManager._emitDidFocus(p1, p2, p3)
	-- upvalues: eventsModule (ref)
	if p1._lastWillFocusKey == p2 and p1._lastDidFocusKey ~= p2 then
		p1._lastDidFocusKey = p2
		p1.props.onEvent(p2, eventsModule.DidFocus, p3)
		
		return
	end
end

function navigationEventManager._emitDidBlur(p1, p2, p3)
	-- upvalues: eventsModule (ref)
	if p1._lastWillBlurKey == p2 and p1._lastDidBlurKey ~= p2 then
		p1._lastDidBlurKey = p2
		p1.props.onEvent(p2, eventsModule.DidBlur, p3)
		
		return
	end
end

function navigationEventManager.render(_)
	return nil
end

return navigationEventManager