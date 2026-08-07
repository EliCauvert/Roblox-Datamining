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

local function RouteViewStatesReducer(p0, p1) --[[ line: 73 ]]
	-- upvalues: array (ref), RouteViewStatesReducer (ref), viewStateModule (ref), object (ref)
	local var4 = array.findIndex(p0, function(p2) --[[ line: 74 ]]
		-- upvalues: p1 (ref)
		return p2.descriptor.key == p1.key
	end)
	
	if p1.type == "SetCurrent" then
		for i, v in p1.navigationState.routes do
			p0 = RouteViewStatesReducer(p0, {
				type = "SetOpening",
				key = v.key,
				descriptor = p1.descriptors[v.key]
			})
		end
		for i, v_1 in p0 do
			if p1.descriptors[v_1.descriptor.key] == nil then
				p0 = RouteViewStatesReducer(p0, { type = "SetClosing", key = v_1.descriptor.key })
			end
		end
		return p0
	elseif p1.type == "SetOpening" then
		if var4 == -1 then
			p0 = table.clone(p0)
			table.insert(p0, {
				viewState = viewStateModule.Opening,
				descriptor = p1.descriptor
			})
			
			return p0
		elseif p0[var4].viewState == viewStateModule.Closing then
			p0 = table.clone(p0)
			p0[var4] = object.assign({}, p0[var4], {
				viewState = viewStateModule.Opening,
				descriptor = p1.descriptor
			})
			
			return p0
		elseif p0[var4].descriptor == p1.descriptor then
			return p0
		else
			p0 = table.clone(p0)
			p0[var4] = object.assign({}, p0[var4], { descriptor = p1.descriptor })
			
			return p0
		end
	elseif p1.type == "SetOpened" then
		if var4 == -1 or p0[var4].viewState ~= viewStateModule.Opening then
		else
			p0 = table.clone(p0)
			p0[var4] = object.assign({}, p0[var4], { viewState = viewStateModule.Opened })
			
			return p0
		end
	elseif p1.type == "SetClosing" then
		if var4 == -1 or p0[var4].viewState == viewStateModule.Closing then
		else
			p0 = table.clone(p0)
			p0[var4] = object.assign({}, p0[var4], { viewState = viewStateModule.Closing })
			
			return p0
		end
	elseif p1.type == "SetClosed" and var4 ~= -1 and p0[var4].viewState == viewStateModule.Closing then
		p0 = table.clone(p0)
		table.remove(p0, var4)
	end
end

return function(p3) --[[ line: 147 | named "useStackScreens" ]]
	-- upvalues: reactModule (ref), RouteViewStatesReducer (ref), fFlagLuaAppDerivedStackAndSwitchState (ref), stackActions (ref), array (ref), object (ref)
	local navigation = p3.navigation
	local state = navigation.state
	local descriptors = p3.descriptors
	local var5, var6 = reactModule.useReducer(RouteViewStatesReducer, {})
	
	if fFlagLuaAppDerivedStackAndSwitchState then
		reactModule.useMemo(function() --[[ line: 158 ]]
			-- upvalues: var6 (ref), state (ref), descriptors (ref)
			var6({
				type = "SetCurrent",
				navigationState = state,
				descriptors = descriptors
			})
		end, { state, descriptors })
	else
		reactModule.useLayoutEffect(function() --[[ line: 166 ]]
			-- upvalues: var6 (ref), state (ref), descriptors (ref)
			var6({
				type = "SetCurrent",
				navigationState = state,
				descriptors = descriptors
			})
		end, { state, descriptors })
	end
	local var7 = reactModule.useCallback(function(p4) --[[ line: 175 ]]
		-- upvalues: navigation (ref), stackActions (copy)
		if navigation.state.isTransitioning then
			navigation.dispatch(stackActions.completeTransition({ key = navigation.state.key, toChildKey = p4 }))
		end
	end, { navigation })
	local var8 = reactModule.useCallback(function(p5) --[[ line: 184 ]]
		-- upvalues: var6 (ref), var7 (ref)
		var6({ type = "SetOpened", key = p5.descriptor.key })
		var7(p5.descriptor.key)
	end, { var7 })
	local var9 = reactModule.useCallback(function(p6) --[[ line: 192 ]]
		-- upvalues: var6 (ref)
		var6({ type = "SetClosed", key = p6.descriptor.key })
	end, {})
	
	return reactModule.useMemo(function() --[[ line: 199 ]]
		-- upvalues: array (copy), var5 (ref), object (copy), var8 (ref), var9 (ref)
		return array.map(var5, function(p7) --[[ line: 200 ]]
			-- upvalues: object (copy), var8 (copy), var9 (copy)
			return object.assign({}, p7, {
				setOpened = function() --[[ line: 202 ]]
					-- upvalues: var8 (copy), p7 (ref)
					var8(p7)
				end,
				setClosed = function() --[[ line: 205 ]]
					-- upvalues: var9 (copy), p7 (ref)
					var9(p7)
				end
			})
		end)
	end, { var5, var8, var9 })
end