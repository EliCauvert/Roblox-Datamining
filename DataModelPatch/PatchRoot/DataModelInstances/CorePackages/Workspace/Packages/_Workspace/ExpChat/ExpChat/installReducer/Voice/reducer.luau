local Parent = script:FindFirstAncestor("ExpChat").Parent
local RoduxModule = require(Parent.Rodux)
local EasierUnmutingVoiceParticipantsMutedReducer = game:DefineFastFlag("EasierUnmutingVoiceParticipantsMutedReducer", false)

return RoduxModule.combineReducers({
	participants = if require(Parent.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore() then nil else require(script.Parent.participants),
	participantsMuted = if EasierUnmutingVoiceParticipantsMutedReducer then require(script.Parent.participantsMuted) else RoduxModule.createReducer({}, {}),
	isEnabled = require(script.Parent.isEnabled),
	isVoiceUIVisible = require(script.Parent.isVoiceUIVisible)
})