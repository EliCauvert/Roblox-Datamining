local parent = script.Parent.Parent
local reactModule = require(parent.React)
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local stackActions = require(parent.RoactNavigation).StackActions
local fFlagLuaAppDerivedStackAndSwitchState = require(parent.SharedFlags).FFlagLuaAppDerivedStackAndSwitchState
local viewStateModule = require(script.Parent.ViewState)
local _ = require(script.Parent.types)
local _ = {
	SetCurrent = "SetCurrent",
	SetOpening = "SetOpening",
	SetOpened = "SetOpened",
	SetClosing = "SetClosing",
	SetClosed = "SetClosed"
}

local function RouteViewStatesReducer(p1, p2)
	-- upvalues: array (ref), RouteViewStatesReducer (ref), viewStateModule (ref), object (ref)
	local var1 = array.findIndex(p1, function(p3)
		-- upvalues: p2 (ref)
		return p3.descriptor.key == p2.key
	end)
	
	if p2.type == "SetCurrent" then
		for i, v in p2.navigationState.routes do
			p1 = RouteViewStatesReducer(p1, {
				type = "SetOpening",
				key = v.key,
				descriptor = p2.descriptors[v.key]
			})
		end
		for i, v_1 in p1 do
			if p2.descriptors[v_1.descriptor.key] == nil then
				p1 = RouteViewStatesReducer(p1, { type = "SetClosing", key = v_1.descriptor.key })
			end
		end
		return p1
	elseif p2.type == "SetOpening" then
		if var1 == -1 then
			p1 = table.clone(p1)
			table.insert(p1, {
				viewState = viewStateModule.Opening,
				descriptor = p2.descriptor
			})
			
			return p1
		elseif p1[var1].viewState == viewStateModule.Closing then
			p1 = table.clone(p1)
			p1[var1] = object.assign({}, p1[var1], {
				viewState = viewStateModule.Opening,
				descriptor = p2.descriptor
			})
			
			return p1
		elseif p1[var1].descriptor == p2.descriptor then
			return p1
		else
			p1 = table.clone(p1)
			p1[var1] = object.assign({}, p1[var1], { descriptor = p2.descriptor })
			
			return p1
		end
	elseif p2.type == "SetOpened" then
		if var1 == -1 or p1[var1].viewState ~= viewStateModule.Opening then
		else
			p1 = table.clone(p1)
			p1[var1] = object.assign({}, p1[var1], { viewState = viewStateModule.Opened })
			
			return p1
		end
	elseif p2.type == "SetClosing" then
		if var1 == -1 or p1[var1].viewState == viewStateModule.Closing then
		else
			p1 = table.clone(p1)
			p1[var1] = object.assign({}, p1[var1], { viewState = viewStateModule.Closing })
			
			return p1
		end
	elseif p2.type == "SetClosed" and var1 ~= -1 and p1[var1].viewState == viewStateModule.Closing then
		p1 = table.clone(p1)
		table.remove(p1, var1)
	end
end

return function(p3)
	-- upvalues: reactModule (ref), RouteViewStatesReducer (ref), fFlagLuaAppDerivedStackAndSwitchState (ref), stackActions (ref), array (ref), object (ref)
	local navigation = p3.navigation
	local state = navigation.state
	local descriptors = p3.descriptors
	local var2, var3 = reactModule.useReducer(RouteViewStatesReducer, {})
	
	if fFlagLuaAppDerivedStackAndSwitchState then
		reactModule.useMemo(function()
			-- upvalues: var3 (ref), state (ref), descriptors (ref)
			var3({
				type = "SetCurrent",
				navigationState = state,
				descriptors = descriptors
			})
		end, { state, descriptors })
	else
		reactModule.useLayoutEffect(function()
			-- upvalues: var3 (ref), state (ref), descriptors (ref)
			var3({
				type = "SetCurrent",
				navigationState = state,
				descriptors = descriptors
			})
		end, { state, descriptors })
	end
	local var4 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref), stackActions (copy)
		if navigation.state.isTransitioning then
			navigation.dispatch(stackActions.completeTransition({ key = navigation.state.key, toChildKey = p4 }))
		end
	end, { navigation })
	local var5 = reactModule.useCallback(function(p4)
		-- upvalues: var3 (ref), var4 (ref)
		var3({ type = "SetOpened", key = p4.descriptor.key })
		var4(p4.descriptor.key)
	end, { var4 })
	local var6 = reactModule.useCallback(function(p4)
		-- upvalues: var3 (ref)
		var3({ type = "SetClosed", key = p4.descriptor.key })
	end, {})
	
	return reactModule.useMemo(function()
		-- upvalues: array (copy), var2 (ref), object (copy), var5 (ref), var6 (ref)
		return array.map(var2, function(p4)
			-- upvalues: object (copy), var5 (copy), var6 (copy)
			return object.assign({}, p4, {
				setOpened = function()
					-- upvalues: var5 (copy), p4 (ref)
					var5(p4)
				end,
				setClosed = function()
					-- upvalues: var6 (copy), p4 (ref)
					var6(p4)
				end
			})
		end)
	end, { var2, var5, var6 })
end