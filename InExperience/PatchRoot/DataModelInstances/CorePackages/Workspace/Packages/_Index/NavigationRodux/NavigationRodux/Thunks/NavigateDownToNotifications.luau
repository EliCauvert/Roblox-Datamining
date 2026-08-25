local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local argCheckModule = require(parent.ArgCheck)
local navigateDownModule = require(navigationRodux.Thunks.NavigateDown)
local appPage = require(parent.RobloxAppEnums).AppPage

return function(p0)
	-- upvalues: argCheckModule (ref), navigateDownModule (ref), appPage (ref)
	argCheckModule.isTypeOrNil(p0, "function", "onClose")
	
	return navigateDownModule({
		name = appPage.Notifications,
		extraProps = { onClose = p0 }
	})
end