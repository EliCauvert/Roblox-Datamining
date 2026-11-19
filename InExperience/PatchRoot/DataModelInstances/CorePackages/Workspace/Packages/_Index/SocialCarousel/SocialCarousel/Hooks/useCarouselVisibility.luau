local Parent = script:FindFirstAncestor("SocialCarousel").Parent
local ReactModule = require(Parent.React)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local FFlagEnableOnScreenAPIIntegration = require(Parent.SharedFlags).FFlagEnableOnScreenAPIIntegration
local UseIsRouteOnScreen = if FFlagEnableOnScreenAPIIntegration then require(Parent.RobloxAppNavigation).useIsRouteOnScreen else nil
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize

return function(p1, p2)
	-- upvalues: FFlagEnableOnScreenAPIIntegration (copy), UseIsRouteOnScreen (copy), UseNavigationFocusFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy)
	local UseIsRouteOnScreenResult = if FFlagEnableOnScreenAPIIntegration then UseIsRouteOnScreen() else UseNavigationFocusFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	
	return ReactModule.useCallback(function(): boolean
		-- upvalues: p1 (copy), UseIsRouteOnScreenResult (copy), p2 (copy), UseScreenSizeResult (copy)
		if not p1 or not UseIsRouteOnScreenResult then
			return false
		end
		local Current = if p2 then p2.current else nil
		
		if Current then
			local Y = Current.AbsolutePosition.Y
			
			return Y + Current.AbsoluteSize.Y > 0 and Y < UseScreenSizeResult.Y
		else
			return false
		end
	end, { p2, p1, UseIsRouteOnScreenResult, UseScreenSizeResult })
end