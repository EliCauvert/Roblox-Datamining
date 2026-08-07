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
local var6 = if getFFlagUseCharacterStore() then getCharacterStoreModule(false) else nil
local var7 = if getFFlagExpChatUseVoiceParticipantsStore() then getVoiceStoreModule(false) else nil

return function(value) --[[ line: 29 | named "withSignalsData" ]]
	-- upvalues: getFFlagUseCharacterStore (ref), var6 (ref), useSignalState (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), var7 (ref), fFlagExpChatUseMessagesStore (ref), expChatSharedModule (ref), reactModule (ref)
	return function(p0) --[[ line: 30 ]]
		-- upvalues: getFFlagUseCharacterStore (copy), var6 (copy), useSignalState (copy), getFFlagExpChatUseVoiceParticipantsStore (copy), var7 (copy), fFlagExpChatUseMessagesStore (copy), expChatSharedModule (copy), reactModule (copy), value (ref)
		local _ = nil
		local var8 = if getFFlagUseCharacterStore() and var6 then useSignalState(var6.getCharacters) else nil
		local _ = nil
		local var9 = if getFFlagExpChatUseVoiceParticipantsStore() and var7 then useSignalState(var7.getVoiceParticipants) else nil
		local _ = nil
		local var10 = nil
		
		if fFlagExpChatUseMessagesStore then
			local context = expChatSharedModule.context
			local messagesStore = context and context.messagesStore
			
			if messagesStore then
				var10 = useSignalState(messagesStore.getMockUserIdToPartOrModel)
			end
		end
		local cloned = table.clone(p0)
		
		if getFFlagUseCharacterStore() then
			cloned.characters = var8
		end
		if getFFlagExpChatUseVoiceParticipantsStore() then
			cloned.voiceParticipants = var9
		end
		if fFlagExpChatUseMessagesStore and var10 then
			cloned.mockUserIdToPartOrModel = var10
		end
		return reactModule.createElement(value, cloned)
	end
end