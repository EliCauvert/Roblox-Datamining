local parent = script.Parent.Parent
local parent_1 = parent.Parent
local array = require(parent_1.LuauPolyfill).Array
local eventsModule = require(parent.Events)
local navigationEventManager = require(parent_1.React).Component:extend("NavigationEventManager")

function navigationEventManager.didMount(p0)
	-- upvalues: eventsModule (ref)
	local navigation = p0.props.navigation
	p0._actionSubscription = navigation.addListener(eventsModule.Action, function(...)
		-- upvalues: p0 (ref)
		return p0:_handleAction(...)
	end)
	p0._willFocusSubscription = navigation.addListener(eventsModule.WillFocus, function(...)
		-- upvalues: p0 (ref)
		return p0:_handleWillFocus(...)
	end)
	p0._willBlurSubscription = navigation.addListener(eventsModule.WillBlur, function(...)
		-- upvalues: p0 (ref)
		return p0:_handleWillBlur(...)
	end)
	p0._didFocusSubscription = navigation.addListener(eventsModule.DidFocus, function(...)
		-- upvalues: p0 (ref)
		return p0:_handleDidFocus(...)
	end)
	p0._didBlurSubscription = navigation.addListener(eventsModule.DidBlur, function(...)
		-- upvalues: p0 (ref)
		return p0:_handleDidBlur(...)
	end)
	p0._refocusSubscription = navigation.addListener(eventsModule.Refocus, function(...)
		-- upvalues: p0 (ref)
		return p0:_handleRefocus(...)
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

function navigationEventManager._handleAction(p2, p3)
	-- upvalues: eventsModule (ref)
	local state = p3.state
	local lastState = p3.lastState
	local action = p3.action
	local type = p3.type
	local context = p3.context
	local onEvent = p2.props.onEvent
	
	if not p2.props.navigation.isFocused() then return end
	local var2 = if lastState and lastState.routes then lastState.routes[lastState.index] else nil
	local index = state.routes[state.index]
	local t = {
		context = ("%s:%s_%s"):format(index.key, tostring(action.type), context or "Root"),
		state = index,
		lastState = var2,
		action = action,
		type = type
	}
	
	if (var2 and var2.key) ~= index.key then
		p2:_emitWillFocus(index.key, t)
		
		if var2 and var2.key then
			p2:_emitWillBlur(var2.key, t)
		end
	end
	if lastState and lastState.isTransitioning ~= state.isTransitioning and state.isTransitioning == false then
		if p2._lastWillBlurKey then
			p2:_emitDidBlur(p2._lastWillBlurKey, t)
		end
		if p2._lastWillFocusKey then
			p2:_emitDidFocus(p2._lastWillFocusKey, t)
		end
	end
	onEvent(index.key, eventsModule.Action, t)
end

function navigationEventManager._handleWillFocus(p4, p5)
	-- upvalues: array (ref)
	local lastState = p5.lastState
	local action = p5.action
	local context = p5.context
	local type = p5.type
	local navigation = p4.props.navigation
	local index = navigation.state.routes[navigation.state.index]
	local var4 = nil
	
	if lastState and lastState.routes then
		local var5 = if lastState then array.findIndex(lastState.routes, function(p6)
			-- upvalues: index (ref)
			return p6.key == index.key
		end) else -1
		
		if var5 > 0 then
			var4 = lastState.routes[var5]
		end
	end
	p4:_emitWillFocus(index.key, {
		context = ("%s:%s_%s"):format(index.key, tostring(action.type), context or "Root"),
		state = index,
		lastState = var4,
		action = action,
		type = type
	})
end

function navigationEventManager._handleWillBlur(p7, p8)
	-- upvalues: array (ref)
	local lastState = p8.lastState
	local action = p8.action
	local context = p8.context
	local type = p8.type
	local navigation = p7.props.navigation
	local index = navigation.state.routes[navigation.state.index]
	local var6 = nil
	
	if lastState and lastState.routes then
		local var7 = if lastState then array.findIndex(lastState.routes, function(p9)
			-- upvalues: index (ref)
			return p9.key == index.key
		end) else -1
		
		if var7 > 0 then
			var6 = lastState.routes[var7]
		end
	end
	p7:_emitWillBlur(index.key, {
		context = ("%s:%s_%s"):format(index.key, tostring(action.type), context or "Root"),
		state = index,
		lastState = var6,
		action = action,
		type = type
	})
end

function navigationEventManager._handleDidFocus(p10, p11)
	-- upvalues: array (ref)
	local lastState = p11.lastState
	local action = p11.action
	local context = p11.context
	local type = p11.type
	local navigation = p10.props.navigation
	
	if p10._lastWillFocusKey then
		local var8 = array.findIndex(navigation.state.routes, function(p12)
			-- upvalues: p10 (ref)
			return p12.key == p10._lastWillFocusKey
		end)
		
		if var8 > 0 then
			local var9 = navigation.state.routes[var8]
			local var10 = nil
			
			if lastState and lastState.routes then
				local var11 = if lastState then array.findIndex(lastState.routes, function(p13)
					-- upvalues: var9 (ref)
					return p13.key == var9.key
				end) else -1
				
				if var11 > 0 then
					var10 = lastState.routes[var11]
				end
			end
			p10:_emitDidFocus(var9.key, {
				context = ("%s:%s_%s"):format(var9.key, tostring(action.type), context or "Root"),
				state = var9,
				lastState = var10,
				action = action,
				type = type
			})
		end
	end
end

function navigationEventManager._handleDidBlur(p14, p15)
	-- upvalues: array (ref)
	local lastState = p15.lastState
	local action = p15.action
	local context = p15.context
	local type = p15.type
	local navigation = p14.props.navigation
	
	if p14._lastWillBlurKey then
		local var12 = array.findIndex(navigation.state.routes, function(p16)
			-- upvalues: p14 (ref)
			return p16.key == p14._lastWillBlurKey
		end)
		
		if var12 > 0 then
			local var13 = navigation.state.routes[var12]
			local var14 = nil
			
			if lastState and lastState.routes then
				local var15 = if lastState then array.findIndex(lastState.routes, function(p17)
					-- upvalues: var13 (ref)
					return p17.key == var13.key
				end) else -1
				
				if var15 > 0 then
					var14 = lastState.routes[var15]
				end
			end
			p14:_emitDidBlur(var13.key, {
				context = ("%s:%s_%s"):format(var13.key, tostring(action.type), context or "Root"),
				state = var13,
				lastState = var14,
				action = action,
				type = type
			})
		end
	end
end

function navigationEventManager._handleRefocus(p18)
	-- upvalues: eventsModule (ref)
	local navigation = p18.props.navigation
	p18.props.onEvent(navigation.state.routes[navigation.state.index].key, eventsModule.Refocus)
end

function navigationEventManager._emitWillFocus(p19, p20, p21)
	-- upvalues: eventsModule (ref)
	if p19._lastWillBlurKey == p20 then
		p19._lastWillBlurKey = nil
	end
	if p19._lastWillFocusKey == p20 then return end
	p19._lastDidFocusKey = nil
	p19._lastWillFocusKey = p20
	local navigation = p19.props.navigation
	p19.props.onEvent(p20, eventsModule.WillFocus, p21)
	
	if type(navigation.state.isTransitioning) ~= "boolean" or navigation.state.isTransitioning ~= true and not navigation._dangerouslyGetParent() then
		p19:_emitDidFocus(p20, p21)
	end
end

function navigationEventManager._emitWillBlur(p22, p23, p24)
	-- upvalues: eventsModule (ref)
	if p22._lastWillFocusKey == p23 then
		p22._lastWillFocusKey = nil
	end
	if p22._lastWillBlurKey == p23 then return end
	p22._lastDidBlurKey = nil
	p22._lastWillBlurKey = p23
	local navigation = p22.props.navigation
	p22.props.onEvent(p23, eventsModule.WillBlur, p24)
	
	if type(navigation.state.isTransitioning) ~= "boolean" or navigation.state.isTransitioning ~= true and not navigation._dangerouslyGetParent() then
		p22:_emitDidBlur(p23, p24)
	end
end

function navigationEventManager._emitDidFocus(p25, p26, p27)
	-- upvalues: eventsModule (ref)
	if p25._lastWillFocusKey == p26 and p25._lastDidFocusKey ~= p26 then
		p25._lastDidFocusKey = p26
		p25.props.onEvent(p26, eventsModule.DidFocus, p27)
		
		return
	end
end

function navigationEventManager._emitDidBlur(p28, p29, p30)
	-- upvalues: eventsModule (ref)
	if p28._lastWillBlurKey == p29 and p28._lastDidBlurKey ~= p29 then
		p28._lastDidBlurKey = p29
		p28.props.onEvent(p29, eventsModule.DidBlur, p30)
		
		return
	end
end

function navigationEventManager.render(_)
	return nil
end

return navigationEventManager