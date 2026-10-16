local ReactModule = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.React)
local UseIsRouteOnScreenModule = require(script.Parent.useIsRouteOnScreen)

return function(Callback, Callback1) --[[ Line: 8 | Named "useOnScreenNavigationListener" ]]
	-- upvalues: UseIsRouteOnScreenModule (copy), ReactModule (copy)
	local UseIsRouteOnScreenModuleResult = UseIsRouteOnScreenModule()
	local UseRefResult = ReactModule.useRef(UseIsRouteOnScreenModuleResult)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: UseIsRouteOnScreenModuleResult (copy), UseRefResult (copy), Callback (copy), Callback1 (copy)
		if UseIsRouteOnScreenModuleResult == UseRefResult.current then return end
		UseRefResult.current = UseIsRouteOnScreenModuleResult
		
		if UseIsRouteOnScreenModuleResult then
			if Callback ~= nil then
				Callback()
				
				return
			end
		elseif Callback1 ~= nil then
			Callback1()
		end
	end, { Callback, Callback1, UseIsRouteOnScreenModuleResult })
end