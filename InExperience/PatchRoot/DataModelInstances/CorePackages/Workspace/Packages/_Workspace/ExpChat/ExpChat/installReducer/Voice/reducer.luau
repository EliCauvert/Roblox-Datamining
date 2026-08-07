local parent = script:FindFirstAncestor("ExpChat").Parent
local roduxModule = require(parent.Rodux)

return roduxModule.combineReducers({
	participants = if require(parent.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore() then nil else require(script.Parent.participants),
	participantsMuted = if game:DefineFastFlag("EasierUnmutingVoiceParticipantsMutedReducer", false) then require(script.Parent.participantsMuted) else roduxModule.createReducer({}, {}),
	isEnabled = require(script.Parent.isEnabled),
	isVoiceUIVisible = require(script.Parent.isVoiceUIVisible)
})