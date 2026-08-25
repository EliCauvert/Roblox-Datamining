local reactModule = require(script:FindFirstAncestor("SplashScreenManager").Parent.React)
local splashScreenManagerModule = require(script.Parent.SplashScreenManager)

return function()
	-- upvalues: reactModule (ref), splashScreenManagerModule (ref)
	local var2, var3 = reactModule.useState(splashScreenManagerModule.isFPSAtTarget())
	local var4 = reactModule.useCallback(function(p0)
		-- upvalues: var3 (ref)
		var3(p0)
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: splashScreenManagerModule (copy), var4 (ref)
		splashScreenManagerModule.addStatusChangeListener(var4)
		
		return function()
			-- upvalues: splashScreenManagerModule (copy), var4 (copy)
			splashScreenManagerModule.removeStatusChangeListener(var4)
		end
	end, {})
	
	return var2
end