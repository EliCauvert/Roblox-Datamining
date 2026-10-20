local ExpChat = script:FindFirstAncestor("ExpChat")
local CreateMessagesStoreModule = require(script.createMessagesStore)
local FFlagExpChatUseChatMuteStoreModule = require(ExpChat.Flags.FFlagExpChatUseChatMuteStore)

return require(ExpChat.Parent.Signals).createComputed(function()
	-- upvalues: FFlagExpChatUseChatMuteStoreModule (copy), ExpChat (copy), CreateMessagesStoreModule (copy)
	return CreateMessagesStoreModule(if FFlagExpChatUseChatMuteStoreModule then require(ExpChat.Stores.GetGlobalMutedUsersStore)(false).getMutedGlobalUserIds else nil)
end)