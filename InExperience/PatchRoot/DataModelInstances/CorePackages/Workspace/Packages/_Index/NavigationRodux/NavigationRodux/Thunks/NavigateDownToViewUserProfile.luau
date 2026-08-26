local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local argCheckModule = require(parent.ArgCheck)
local navigateDownModule = require(navigationRodux.Thunks.NavigateDown)
local appPage = require(parent.RobloxAppEnums).AppPage

return function(p1, p2)
	-- upvalues: argCheckModule (ref), navigateDownModule (ref), appPage (ref)
	argCheckModule.isInTypes(p1, { "string", "number" }, "userId")
	argCheckModule.isTypeOrNil(p2, "function", "onClose")
	
	return navigateDownModule({
		name = appPage.ViewUserProfile,
		detail = p1,
		extraProps = { onClose = p2 }
	})
end