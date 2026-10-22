local _ = require(script:FindFirstAncestor("BuildExperience").Parent.Navigation)

return function(Tbl)
	if typeof(Tbl.clearAppScreens) == "function" then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		
		function Copy.clearAppScreens(RouteNames)
			-- upvalues: Tbl (copy)
			Tbl.dispatch({ type = "ClearAppScreensAction", routeNames = RouteNames })
		end
		
		return Copy
	end
end