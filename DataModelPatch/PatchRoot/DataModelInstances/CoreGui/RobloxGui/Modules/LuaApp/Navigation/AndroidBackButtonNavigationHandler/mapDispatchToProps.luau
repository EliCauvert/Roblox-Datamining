local NavigateBackModule = require(script:FindFirstAncestor("Modules").LuaApp.Thunks.NavigateBack)

return function(Callback)
	-- upvalues: NavigateBackModule (copy)
	return {
		navigateBackInAppRoute = function()
			-- upvalues: Callback (copy), NavigateBackModule (upval)
			Callback(NavigateBackModule())
		end
	}
end