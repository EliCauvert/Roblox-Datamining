local LuauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local GetEventManagerModule = require(script.Parent.getEventManager)
local GetChildRouterModule = require(script.Parent.getChildRouter)
local GetNavigationActionCreatorsModule = require(script.Parent.routers.getNavigationActionCreators)
local GetChildrenNavigationCacheModule = require(script.Parent.getChildrenNavigationCache)

local function _(State)
	return function(p1, p2)
		-- upvalues: State (copy)
		local Params = State.params
		
		return if Params and Params[p1] ~= nil then Params[p1] else p2
	end
end

local function getChildNavigation(AssignResult, Key, Callback)
	-- upvalues: GetChildrenNavigationCacheModule (copy), Array (copy), GetChildRouterModule (copy), Object (copy), GetNavigationActionCreatorsModule (copy), getChildNavigation (copy), GetEventManagerModule (copy)
	local ChildrenNavigationCacheModule = GetChildrenNavigationCacheModule(AssignResult)
	local Index: number = Array.findIndex(AssignResult.state.routes, function(p1): boolean
		-- upvalues: Key (copy)
		return p1.key == Key
	end)
	
	if Index < 1 then
		return nil
	end
	local Route = AssignResult.state.routes[Index]
	local Tbl = ChildrenNavigationCacheModule[Key]
	
	if Tbl and Tbl.state == Route then
		return Tbl
	end
	local ChildRouterModule = GetChildRouterModule(AssignResult.router, Route.routeName)
	local Route1 = if Route.routes and type(Route.index) == "number" then Route.routes[Route.index] else nil
	local AssignResult1 = Object.assign(if AssignResult.actions then table.clone(AssignResult.actions) else {}, AssignResult.router.getActionCreators(Route, AssignResult.state.key) or {}, ChildRouterModule and ChildRouterModule.getActionCreators(Route1, Route.key) or {} or {}, GetNavigationActionCreatorsModule(Route) or {})
	local Tbl1 = {}
	
	for i, value in AssignResult1 do
		Tbl1[i] = function(...)
			-- upvalues: value (copy), AssignResult (copy)
			return AssignResult.dispatch((value(...)))
		end
	end
	local IsIndexOfResultMatch = true
	local CallbackResult = Callback()
	
	if CallbackResult then
		IsIndexOfResultMatch = Array.indexOf(CallbackResult.state.routes, Route) == 1
	end
	if Tbl and Tbl.isFirstRouteInParent() == IsIndexOfResultMatch then
		local AssignResult3 = nil
		AssignResult3 = Object.assign(table.clone(Tbl), Tbl1, {
			state = Route,
			router = ChildRouterModule,
			actions = AssignResult1,
			getParam = function(p1, p2)
				-- upvalues: Route (copy)
				local Params = Route.params
				
				return if Params and Params[p1] ~= nil then Params[p1] else p2
			end,
			getChildNavigation = function(Key1)
				-- upvalues: getChildNavigation (upval), AssignResult3 (ref), Callback (copy), Key (copy)
				return getChildNavigation(AssignResult3, Key1, function()
					-- upvalues: Callback (upval), Key (upval)
					local CallbackResult = Callback()
					
					return if CallbackResult then CallbackResult.getChildNavigation(Key) else nil
				end)
			end
		})
		ChildrenNavigationCacheModule[Key] = AssignResult3
		
		return AssignResult3
	else
		local AssignResult3 = GetEventManagerModule
		AssignResult3 = AssignResult3(Key)
		local AssignResult2 = nil
		AssignResult2 = Object.assign(table.clone(Tbl1), {
			state = Route,
			router = ChildRouterModule,
			actions = AssignResult1,
			getParam = function(p1, p2)
				-- upvalues: Route (copy)
				local Params = Route.params
				
				return if Params and Params[p1] ~= nil then Params[p1] else p2
			end,
			getChildNavigation = function(Key1)
				-- upvalues: getChildNavigation (upval), AssignResult2 (ref), Callback (copy), Key (copy)
				return getChildNavigation(AssignResult2, Key1, function()
					-- upvalues: Callback (upval), Key (upval)
					local CallbackResult = Callback()
					
					return if CallbackResult then CallbackResult.getChildNavigation(Key) else nil
				end)
			end,
			isFocused = function(): boolean
				-- upvalues: Callback (copy), Key (copy)
				local CallbackResult = Callback()
				
				if not CallbackResult then
					return false
				elseif CallbackResult.isFocused() then
					local State = CallbackResult.state
					
					return State.routes[State.index].key == Key
				else
					return false
				end
			end,
			isFirstRouteInParent = function()
				-- upvalues: IsIndexOfResultMatch (ref)
				return IsIndexOfResultMatch
			end,
			dispatch = AssignResult.dispatch,
			getScreenProps = AssignResult.getScreenProps,
			_dangerouslyGetParent = Callback,
			addListener = AssignResult3.addListener,
			emit = AssignResult3.emit
		})
		ChildrenNavigationCacheModule[Key] = AssignResult2
		
		return AssignResult2
	end
end

return getChildNavigation