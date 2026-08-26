local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local argCheckModule = require(parent.ArgCheck)
local navigateDownModule = require(navigationRodux.Thunks.NavigateDown)
local appPage = require(parent.RobloxAppEnums).AppPage

return function(p1)
	-- upvalues: argCheckModule (ref), navigateDownModule (ref), appPage (ref)
	argCheckModule.isTypeOrNil(p1, "function", "onClose")
	
	return navigateDownModule({
		name = appPage.Notifications,
		extraProps = { onClose = p1 }
	})
end