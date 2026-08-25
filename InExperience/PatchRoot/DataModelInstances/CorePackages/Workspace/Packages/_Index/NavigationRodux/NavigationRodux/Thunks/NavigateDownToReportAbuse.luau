local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local argCheckModule = require(parent.ArgCheck)
local navigateDownModule = require(navigationRodux.Thunks.NavigateDown)
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p0, p1, p2)
	-- upvalues: argCheckModule (ref), navigateDownModule (ref), appPage (ref), urlBuilder (ref)
	argCheckModule.isInTypes(p0, { "string", "number" }, "userId")
	argCheckModule.isInTypes(p1, { "string", "number" }, "conversationId")
	argCheckModule.isTypeOrNil(p2, "function", "onClose")
	
	return navigateDownModule({
		name = appPage.ReportAbuse,
		detail = urlBuilder.user.report({ userId = p0, conversationId = p1 }),
		extraProps = { onClose = p2 }
	})
end