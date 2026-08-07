local expChatShared = script:FindFirstAncestor("ExpChatShared")

return require(expChatShared.Parent.Rodux).combineReducers({
	byUserId = require(script.Parent.byUserId),
	byDisplayName = require(script.Parent.byDisplayName),
	byUsername = require(script.Parent.byUsername),
	charactersByUserId = if require(expChatShared.Flags.getFFlagUseCharacterStore)() then nil else require(script.Parent.charactersByUserId)
})