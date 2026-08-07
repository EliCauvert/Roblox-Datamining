local appChat = script:FindFirstAncestor("AppChat")
local promiseModule = require(appChat.Parent.Promise)
local getConversationPageDataHydrationModule = require(appChat.Stores.GetConversationPageDataHydration)

return function(value) --[[ line: 12 | named "fetchConversationListPageToSignals" ]]
	-- upvalues: getConversationPageDataHydrationModule (ref), promiseModule (ref)
	getConversationPageDataHydrationModule.fetchPage(if value ~= nil then nil else value.cursor)
	
	return promiseModule.resolve(nil)
end