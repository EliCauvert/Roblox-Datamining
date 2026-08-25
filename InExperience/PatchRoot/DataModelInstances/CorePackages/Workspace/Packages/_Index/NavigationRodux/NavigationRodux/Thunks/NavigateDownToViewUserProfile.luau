local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local argCheckModule = require(parent.ArgCheck)
local navigateDownModule = require(navigationRodux.Thunks.NavigateDown)
local appPage = require(parent.RobloxAppEnums).AppPage

return function(p0, p1)
	-- upvalues: argCheckModule (ref), navigateDownModule (ref), appPage (ref)
	argCheckModule.isInTypes(p0, { "string", "number" }, "userId")
	argCheckModule.isTypeOrNil(p1, "function", "onClose")
	
	return navigateDownModule({
		name = appPage.ViewUserProfile,
		detail = p0,
		extraProps = { onClose = p1 }
	})
end