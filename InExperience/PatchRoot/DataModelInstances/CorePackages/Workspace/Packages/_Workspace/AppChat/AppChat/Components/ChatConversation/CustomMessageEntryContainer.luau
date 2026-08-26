local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local enumCustomEntryTypesModule = require(appChat.Components.ChatConversation.EnumCustomEntryTypes)
local osaContextCardOneToOneContainerModule = require(appChat.Components.ChatConversation.ConversationCards.OsaContextCardOneToOneContainer)

return reactModule.memo(function(p1)
	-- upvalues: enumCustomEntryTypesModule (ref), reactModule (ref), osaContextCardOneToOneContainerModule (ref)
	return if p1.customEntryType == enumCustomEntryTypesModule.OsaContextCardOneToOne then reactModule.createElement(osaContextCardOneToOneContainerModule, {
		conversationId = p1.conversationId,
		openViewProfile = p1.openViewProfile
	}) else nil
end)