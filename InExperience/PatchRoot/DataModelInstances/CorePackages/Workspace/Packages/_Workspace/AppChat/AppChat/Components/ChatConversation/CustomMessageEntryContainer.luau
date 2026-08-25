local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local enumCustomEntryTypesModule = require(appChat.Components.ChatConversation.EnumCustomEntryTypes)
local osaContextCardOneToOneContainerModule = require(appChat.Components.ChatConversation.ConversationCards.OsaContextCardOneToOneContainer)

return reactModule.memo(function(p0)
	-- upvalues: enumCustomEntryTypesModule (ref), reactModule (ref), osaContextCardOneToOneContainerModule (ref)
	return if p0.customEntryType == enumCustomEntryTypesModule.OsaContextCardOneToOne then reactModule.createElement(osaContextCardOneToOneContainerModule, {
		conversationId = p0.conversationId,
		openViewProfile = p0.openViewProfile
	}) else nil
end)