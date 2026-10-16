local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local IsPageAvailableModule = require(AppChat.Utils.isPageAvailable)
local UseChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local FFlagAppChatOnConsoles = require(Parent.SharedFlags).FFlagAppChatOnConsoles
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy

return function(List) --[[ Line: 21 ]]
	-- upvalues: UseChatPlacementContextFunction (copy), FFlagAppChatOnConsoles (copy), UseAppPolicyFunction (copy), IsPageAvailableModule (copy)
	local ChatPlacement = UseChatPlacementContextFunction().chatPlacement
	local UseAppPolicyResult = if FFlagAppChatOnConsoles then UseAppPolicyFunction(function(p1) --[[ Line: 24 ]]
		return p1.getWebViewSupport()
	end) else nil
	local t = {}
	
	for _, value in List do
		t[value] = IsPageAvailableModule(value, ChatPlacement, if FFlagAppChatOnConsoles then UseAppPolicyResult else nil)
	end
	return t
end