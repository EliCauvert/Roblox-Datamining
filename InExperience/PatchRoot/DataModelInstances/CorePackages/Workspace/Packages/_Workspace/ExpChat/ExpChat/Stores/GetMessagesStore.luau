local expChat = script:FindFirstAncestor("ExpChat")
local signalsModule = require(expChat.Parent.Signals)
local createMessagesStoreModule = require(script.createMessagesStore)
local fFlagExpChatUseChatMuteStoreModule = require(expChat.Flags.FFlagExpChatUseChatMuteStore)

return signalsModule.createComputed(function()
	-- upvalues: fFlagExpChatUseChatMuteStoreModule (ref), expChat (ref), createMessagesStoreModule (ref)
	return createMessagesStoreModule(if fFlagExpChatUseChatMuteStoreModule then require(expChat.Stores.GetGlobalMutedUsersStore)(false).getMutedGlobalUserIds else nil)
end)