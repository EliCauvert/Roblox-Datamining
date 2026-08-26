local reactModule = require(script:FindFirstAncestor("SplashScreenManager").Parent.React)
local splashScreenManagerModule = require(script.Parent.SplashScreenManager)

return function()
	-- upvalues: reactModule (ref), splashScreenManagerModule (ref)
	local var1, var2 = reactModule.useState(splashScreenManagerModule.isFPSAtTarget())
	local var3 = reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref)
		var2(p1)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: splashScreenManagerModule (copy), var3 (ref)
		splashScreenManagerModule.addStatusChangeListener(var3)
		
		return function()
			-- upvalues: splashScreenManagerModule (copy), var3 (copy)
			splashScreenManagerModule.removeStatusChangeListener(var3)
		end
	end, {})
	
	return var1
end