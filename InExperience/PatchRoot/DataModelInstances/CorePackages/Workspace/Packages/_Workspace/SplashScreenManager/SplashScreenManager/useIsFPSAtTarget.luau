local ReactModule = require(script:FindFirstAncestor("SplashScreenManager").Parent.React)
local SplashScreenManagerModule = require(script.Parent.SplashScreenManager)

return function() --[[ Line: 9 | Named "useIsFPSAtTarget" ]]
	-- upvalues: ReactModule (copy), SplashScreenManagerModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(SplashScreenManagerModule.isFPSAtTarget())
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 11 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p1)
	end, { UseStateResult2 })
	ReactModule.useEffect(function() --[[ Line: 15 ]]
		-- upvalues: SplashScreenManagerModule (upval), UseResult (copy)
		SplashScreenManagerModule.addStatusChangeListener(UseResult)
		
		return function() --[[ Line: 17 ]]
			-- upvalues: SplashScreenManagerModule (upval), UseResult (upval)
			SplashScreenManagerModule.removeStatusChangeListener(UseResult)
		end
	end, {})
	
	return UseStateResult
end