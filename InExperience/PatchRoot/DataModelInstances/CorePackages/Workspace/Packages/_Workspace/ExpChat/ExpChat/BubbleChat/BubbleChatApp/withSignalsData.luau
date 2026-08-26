local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local useSignalState = require(parent.SignalsReact).useSignalState
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local expChatSharedModule = require(parent.ExpChatShared)
local getFFlagUseCharacterStore = expChatSharedModule.Flags.getFFlagUseCharacterStore
local getFFlagExpChatUseVoiceParticipantsStore = sharedFlagsModule.GetFFlagExpChatUseVoiceParticipantsStore
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local getCharacterStoreModule = require(expChat.Stores.GetCharacterStore)
local _ = require(expChat.Stores.GetCharacterStore.createCharacterStore)
local getVoiceStoreModule = require(expChat.Stores.GetVoiceStore)
local _ = require(expChat.Stores.GetVoiceStore.createVoiceStore)
local var1 = if getFFlagUseCharacterStore() then getCharacterStoreModule(false) else nil
local var2 = if getFFlagExpChatUseVoiceParticipantsStore() then getVoiceStoreModule(false) else nil

return function(value)
	-- upvalues: getFFlagUseCharacterStore (ref), var1 (ref), useSignalState (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), var2 (ref), fFlagExpChatUseMessagesStore (ref), expChatSharedModule (ref), reactModule (ref)
	return function(p1)
		-- upvalues: getFFlagUseCharacterStore (copy), var1 (copy), useSignalState (copy), getFFlagExpChatUseVoiceParticipantsStore (copy), var2 (copy), fFlagExpChatUseMessagesStore (copy), expChatSharedModule (copy), reactModule (copy), value (ref)
		local _ = nil
		local var3 = if getFFlagUseCharacterStore() and var1 then useSignalState(var1.getCharacters) else nil
		local _ = nil
		local var4 = if getFFlagExpChatUseVoiceParticipantsStore() and var2 then useSignalState(var2.getVoiceParticipants) else nil
		local _ = nil
		local var5 = nil
		
		if fFlagExpChatUseMessagesStore then
			local context = expChatSharedModule.context
			local messagesStore = context and context.messagesStore
			
			if messagesStore then
				var5 = useSignalState(messagesStore.getMockUserIdToPartOrModel)
			end
		end
		local cloned = table.clone(p1)
		
		if getFFlagUseCharacterStore() then
			cloned.characters = var3
		end
		if getFFlagExpChatUseVoiceParticipantsStore() then
			cloned.voiceParticipants = var4
		end
		if fFlagExpChatUseMessagesStore and var5 then
			cloned.mockUserIdToPartOrModel = var5
		end
		return reactModule.createElement(value, cloned)
	end
end