local LuaAppNavigationActionsModule = { ClearAppScreensAction = "ClearAppScreensAction" }

function LuaAppNavigationActionsModule.clearAppScreens(RouteNames)
	-- upvalues: LuaAppNavigationActionsModule (copy)
	return {
		type = LuaAppNavigationActionsModule.ClearAppScreensAction,
		routeNames = RouteNames
	}
end

return LuaAppNavigationActionsModule