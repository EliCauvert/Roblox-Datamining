local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local StackActions = require(Parent.RoactNavigation).StackActions
local FFlagLuaAppDerivedStackAndSwitchState = require(Parent.SharedFlags).FFlagLuaAppDerivedStackAndSwitchState
local ViewStateModule = require(script.Parent.ViewState)
local _ = require(script.Parent.types)

local function RouteViewStatesReducer(Tbl, p1)
	-- upvalues: Array (copy), RouteViewStatesReducer (copy), ViewStateModule (copy), Object (copy)
	local Index = Array.findIndex(Tbl, function(p2): boolean
		-- upvalues: p1 (copy)
		return p2.descriptor.key == p1.key
	end)
	
	if p1.type == "SetCurrent" then
		for _, route in p1.navigationState.routes do
			Tbl = RouteViewStatesReducer(Tbl, {
				type = "SetOpening",
				key = route.key,
				descriptor = p1.descriptors[route.key]
			})
		end
		for _, value in Tbl do
			if p1.descriptors[value.descriptor.key] == nil then
				Tbl = RouteViewStatesReducer(Tbl, { type = "SetClosing", key = value.descriptor.key })
			end
		end
		return Tbl
	else
		if p1.type ~= "SetOpening" then
			if p1.type ~= "SetOpened" then
				if p1.type ~= "SetClosing" then
					if p1.type == "SetClosed" and Index ~= -1 and Tbl[Index].viewState == ViewStateModule.Closing then
						Tbl = table.clone(Tbl)
						table.remove(Tbl, Index)
					end
				elseif Index ~= -1 and Tbl[Index].viewState ~= ViewStateModule.Closing then
					Tbl = table.clone(Tbl)
					Tbl[Index] = Object.assign({}, Tbl[Index], { viewState = ViewStateModule.Closing })
					
					return Tbl
				end
			elseif Index ~= -1 and Tbl[Index].viewState == ViewStateModule.Opening then
				Tbl = table.clone(Tbl)
				Tbl[Index] = Object.assign({}, Tbl[Index], { viewState = ViewStateModule.Opened })
				
				return Tbl
			end
		elseif Index == -1 then
			Tbl = table.clone(Tbl)
			table.insert(Tbl, {
				viewState = ViewStateModule.Opening,
				descriptor = p1.descriptor
			})
			
			return Tbl
		elseif Tbl[Index].viewState == ViewStateModule.Closing then
			Tbl = table.clone(Tbl)
			Tbl[Index] = Object.assign({}, Tbl[Index], {
				viewState = ViewStateModule.Opening,
				descriptor = p1.descriptor
			})
			
			return Tbl
		elseif Tbl[Index].descriptor ~= p1.descriptor then
			Tbl = table.clone(Tbl)
			Tbl[Index] = Object.assign({}, Tbl[Index], { descriptor = p1.descriptor })
			
			return Tbl
		end
		return Tbl
	end
end

return function(p2)
	-- upvalues: ReactModule (copy), RouteViewStatesReducer (copy), FFlagLuaAppDerivedStackAndSwitchState (copy), StackActions (copy), Array (copy), Object (copy)
	local Navigation = p2.navigation
	local State = Navigation.state
	local Descriptors = p2.descriptors
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(RouteViewStatesReducer, {})
	
	if FFlagLuaAppDerivedStackAndSwitchState then
		ReactModule.useMemo(function()
			-- upvalues: UseReducerResult2 (copy), State (copy), Descriptors (copy)
			UseReducerResult2({
				type = "SetCurrent",
				navigationState = State,
				descriptors = Descriptors
			})
		end, { State, Descriptors })
	else
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseReducerResult2 (copy), State (copy), Descriptors (copy)
			UseReducerResult2({
				type = "SetCurrent",
				navigationState = State,
				descriptors = Descriptors
			})
		end, { State, Descriptors })
	end
	local UseResult = ReactModule.useCallback(function(ToChildKey)
		-- upvalues: Navigation (copy), StackActions (upval)
		if Navigation.state.isTransitioning then
			Navigation.dispatch(StackActions.completeTransition({ key = Navigation.state.key, toChildKey = ToChildKey }))
		end
	end, { Navigation })
	local UseResult1 = ReactModule.useCallback(function(p3)
		-- upvalues: UseReducerResult2 (copy), UseResult (copy)
		UseReducerResult2({ type = "SetOpened", key = p3.descriptor.key })
		UseResult(p3.descriptor.key)
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function(p3)
		-- upvalues: UseReducerResult2 (copy)
		UseReducerResult2({ type = "SetClosed", key = p3.descriptor.key })
	end, {})
	
	return (ReactModule.useMemo(function()
		-- upvalues: Array (upval), UseReducerResult (copy), Object (upval), UseResult1 (copy), UseResult2 (copy)
		return Array.map(UseReducerResult, function(p3)
			-- upvalues: Object (upval), UseResult1 (upval), UseResult2 (upval)
			return Object.assign({}, p3, {
				setOpened = function()
					-- upvalues: UseResult1 (upval), p3 (copy)
					UseResult1(p3)
				end,
				setClosed = function()
					-- upvalues: UseResult2 (upval), p3 (copy)
					UseResult2(p3)
				end
			})
		end)
	end, { UseReducerResult, UseResult1, UseResult2 }))
end