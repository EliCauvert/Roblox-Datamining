local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local argCheckModule = require(parent.ArgCheck)
local navigateDownModule = require(navigationRodux.Thunks.NavigateDown)
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p1, p2, p3)
	-- upvalues: argCheckModule (ref), navigateDownModule (ref), appPage (ref), urlBuilder (ref)
	argCheckModule.isInTypes(p1, { "string", "number" }, "userId")
	argCheckModule.isInTypes(p2, { "string", "number" }, "conversationId")
	argCheckModule.isTypeOrNil(p3, "function", "onClose")
	
	return navigateDownModule({
		name = appPage.ReportAbuse,
		detail = urlBuilder.user.report({ userId = p1, conversationId = p2 }),
		extraProps = { onClose = p3 }
	})
end