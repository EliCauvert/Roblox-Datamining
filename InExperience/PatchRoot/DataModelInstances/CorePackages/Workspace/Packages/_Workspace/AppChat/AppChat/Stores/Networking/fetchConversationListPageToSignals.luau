local AppChat = script:FindFirstAncestor("AppChat")
local PromiseModule = require(AppChat.Parent.Promise)
local GetConversationPageDataHydrationModule = require(AppChat.Stores.GetConversationPageDataHydration)

return function(p1) --[[ Line: 12 | Named "fetchConversationListPageToSignals" ]]
	-- upvalues: GetConversationPageDataHydrationModule (copy), PromiseModule (copy)
	GetConversationPageDataHydrationModule.fetchPage(if p1 == nil then nil else p1.cursor)
	
	return PromiseModule.resolve(nil)
end