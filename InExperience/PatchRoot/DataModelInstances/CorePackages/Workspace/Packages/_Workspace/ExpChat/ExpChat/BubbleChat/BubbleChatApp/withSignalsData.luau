local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ReactModule = require(Parent.React)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local GetFFlagUseCharacterStoreFunction = ExpChatSharedModule.Flags.getFFlagUseCharacterStore
local GetFFlagExpChatUseVoiceParticipantsStoreFunction = require(Parent.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local GetCharacterStoreModule = require(ExpChat.Stores.GetCharacterStore)
local _ = require(ExpChat.Stores.GetCharacterStore.createCharacterStore)
local GetVoiceStoreModule = require(ExpChat.Stores.GetVoiceStore)
local _ = require(ExpChat.Stores.GetVoiceStore.createVoiceStore)
local CharacterStoreModule = if GetFFlagUseCharacterStoreFunction() then GetCharacterStoreModule(false) else nil
local VoiceStoreModule = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then GetVoiceStoreModule(false) else nil

return function(p1) --[[ Line: 28 | Named "withSignalsData" ]]
	-- upvalues: GetFFlagUseCharacterStoreFunction (copy), CharacterStoreModule (copy), UseSignalStateFunction (copy), GetFFlagExpChatUseVoiceParticipantsStoreFunction (copy), VoiceStoreModule (copy), ExpChatSharedModule (copy), ReactModule (copy)
	return function(Tbl) --[[ Line: 29 ]]
		-- upvalues: GetFFlagUseCharacterStoreFunction (upval), CharacterStoreModule (upval), UseSignalStateFunction (upval), GetFFlagExpChatUseVoiceParticipantsStoreFunction (upval), VoiceStoreModule (upval), ExpChatSharedModule (upval), ReactModule (upval), p1 (copy)
		local UseSignalStateResult = if GetFFlagUseCharacterStoreFunction() and CharacterStoreModule then UseSignalStateFunction(CharacterStoreModule.getCharacters) else nil
		local UseSignalStateResult1 = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() and VoiceStoreModule then UseSignalStateFunction(VoiceStoreModule.getVoiceParticipants) else nil
		local MockUserIdToPartOrModel = nil
		local Context = ExpChatSharedModule.context
		local MessagesStore = Context and Context.messagesStore
		
		if MessagesStore then
			MockUserIdToPartOrModel = UseSignalStateFunction(MessagesStore.getMockUserIdToPartOrModel)
		end
		local Copy = table.clone(Tbl)
		
		if GetFFlagUseCharacterStoreFunction() then
			Copy.characters = UseSignalStateResult
		end
		if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then
			Copy.voiceParticipants = UseSignalStateResult1
		end
		if MockUserIdToPartOrModel then
			Copy.mockUserIdToPartOrModel = MockUserIdToPartOrModel
		end
		return ReactModule.createElement(p1, Copy)
	end
end