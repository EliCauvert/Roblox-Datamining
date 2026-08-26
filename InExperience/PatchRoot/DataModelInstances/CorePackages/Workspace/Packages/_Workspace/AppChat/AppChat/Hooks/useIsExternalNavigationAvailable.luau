local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local isPageAvailableModule = require(appChat.Utils.isPageAvailable)
local useChatPlacementContext = require(appChat.Contexts.ChatPlacementContext).useChatPlacementContext
local fFlagAppChatOnConsoles = require(parent.SharedFlags).FFlagAppChatOnConsoles
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy

return function(p1)
	-- upvalues: useChatPlacementContext (ref), fFlagAppChatOnConsoles (ref), useAppPolicy (ref), isPageAvailableModule (ref)
	local chatPlacement = useChatPlacementContext().chatPlacement
	local var1 = if fFlagAppChatOnConsoles then useAppPolicy(function(p2)
		return p2.getWebViewSupport()
	end) else nil
	local t = {}
	
	for i, v in p1 do
		t[v] = isPageAvailableModule(v, chatPlacement, if fFlagAppChatOnConsoles then var1 else nil)
	end
	return t
end