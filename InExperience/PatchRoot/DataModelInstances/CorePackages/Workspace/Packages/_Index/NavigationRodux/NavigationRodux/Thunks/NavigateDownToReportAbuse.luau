local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local NavigateDownModule = require(NavigationRodux.Thunks.NavigateDown)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder

return function(UserId, ConversationId, OnClose)
	-- upvalues: ArgCheckModule (copy), NavigateDownModule (copy), AppPage (copy), UrlBuilder (copy)
	ArgCheckModule.isInTypes(UserId, { "string", "number" }, "userId")
	ArgCheckModule.isInTypes(ConversationId, { "string", "number" }, "conversationId")
	ArgCheckModule.isTypeOrNil(OnClose, "function", "onClose")
	
	return NavigateDownModule({
		name = AppPage.ReportAbuse,
		detail = UrlBuilder.user.report({ userId = UserId, conversationId = ConversationId }),
		extraProps = { onClose = OnClose }
	})
end