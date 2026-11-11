local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.Navigation)
local CreateLazyStackRouterModule = require(script.Parent.createLazyStackRouter)
local LuaAppNavigationActionsModule = require(script.Parent.LuaAppNavigationActions)

return function(p1, p2)
	-- upvalues: CryoModule (copy), LuaAppNavigationActionsModule (copy), CreateLazyStackRouterModule (copy)
	local LazyStackRouterModule = CreateLazyStackRouterModule(p1, (CryoModule.Dictionary.join(p2 or {}, {
		getCustomActionCreators = function(_, _)
			-- upvalues: LuaAppNavigationActionsModule (upval)
			return {
				clearAppScreens = LuaAppNavigationActionsModule.clearAppScreens
			}
		end
	})))
	local GetStateForActionFunction = LazyStackRouterModule.getStateForAction
	
	function LazyStackRouterModule.getStateForAction(p3, p4)
		-- upvalues: LuaAppNavigationActionsModule (upval), CryoModule (upval), GetStateForActionFunction (copy)
		if p3.type == LuaAppNavigationActionsModule.ClearAppScreensAction then
			local Set = CryoModule.List.toSet(p3.routeNames)
			local FilterResult = CryoModule.List.filter(p4.routes, function(p5): boolean
				-- upvalues: Set (copy)
				return not Set[p5.routeName]
			end)
			
			return (CryoModule.Dictionary.join(p4, { routes = FilterResult, index = #FilterResult }))
		else
			return GetStateForActionFunction(p3, p4)
		end
	end
	
	return LazyStackRouterModule
end