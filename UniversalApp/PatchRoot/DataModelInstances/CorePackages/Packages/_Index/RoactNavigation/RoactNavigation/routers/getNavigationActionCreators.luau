local NavigationActionsModule = require(script.Parent.Parent.NavigationActions)
local InvariantModule = require(script.Parent.Parent.utils.invariant)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: InvariantModule (copy), NavigationActionsModule (copy)
	return {
		goBack = function(Key) --[[ Line: 8 ]]
			-- upvalues: p1 (copy), InvariantModule (upval), NavigationActionsModule (upval)
			if Key == nil and p1.key then
				InvariantModule(type(p1.key) == "string", ".goBack(): key should be a string")
				Key = p1.key
			end
			return NavigationActionsModule.back({ key = Key })
		end,
		navigate = function(RouteName, Params, Action) --[[ Line: 19 ]]
			-- upvalues: NavigationActionsModule (upval), InvariantModule (upval)
			if type(RouteName) == "string" then
				return NavigationActionsModule.navigate({ routeName = RouteName, params = Params, action = Action })
			else
				InvariantModule(type(RouteName) == "table", ".navigate(): navigateTo must be a string or table")
				InvariantModule(Params == nil, ".navigate(): params can only be provided with a string navigateTo value")
				InvariantModule(Action == nil, ".navigate(): child action can only be provided with a string navigateTo value")
				
				return NavigationActionsModule.navigate(RouteName)
			end
		end,
		setParams = function(Params) --[[ Line: 36 ]]
			-- upvalues: InvariantModule (upval), p1 (copy), NavigationActionsModule (upval)
			InvariantModule(type(p1.key) == "string", ".setParams(): cannot be called by the root navigator")
			
			return NavigationActionsModule.setParams({ params = Params, key = p1.key })
		end
	}
end