local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local EnumCustomEntryTypesModule = require(AppChat.Components.ChatConversation.EnumCustomEntryTypes)
local OsaContextCardOneToOneContainerModule = require(AppChat.Components.ChatConversation.ConversationCards.OsaContextCardOneToOneContainer)

return ReactModule.memo(function(p1) --[[ Line: 15 | Named "CustomMessageEntryContainer" ]]
	-- upvalues: EnumCustomEntryTypesModule (copy), ReactModule (copy), OsaContextCardOneToOneContainerModule (copy)
	return if p1.customEntryType == EnumCustomEntryTypesModule.OsaContextCardOneToOne then ReactModule.createElement(OsaContextCardOneToOneContainerModule, {
		conversationId = p1.conversationId,
		openViewProfile = p1.openViewProfile
	}) else nil
end)