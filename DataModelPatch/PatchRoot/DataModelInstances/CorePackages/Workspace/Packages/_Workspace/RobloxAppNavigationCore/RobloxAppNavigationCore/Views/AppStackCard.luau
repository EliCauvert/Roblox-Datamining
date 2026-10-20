local ReactModule = require(script:FindFirstAncestor("RobloxAppNavigationCore").Parent.React)
local AppCardModule = require(script.Parent.AppCard)

return function(p1)
	-- upvalues: ReactModule (copy), AppCardModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		p1.onAnimationComplete()
	end, { p1.onAnimationComplete })
	
	return ReactModule.createElement(AppCardModule, {
		isActive = p1.isActive,
		descriptor = p1.descriptor,
		screenProps = p1.screenProps,
		isVisible = p1.isVisible,
		ZIndex = p1.ZIndex
	})
end