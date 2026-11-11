local ExpChatShared = script:FindFirstAncestor("ExpChatShared")

return require(ExpChatShared.Parent.Rodux).combineReducers({
	byUserId = require(script.Parent.byUserId),
	byDisplayName = require(script.Parent.byDisplayName),
	byUsername = require(script.Parent.byUsername),
	charactersByUserId = if require(ExpChatShared.Flags.getFFlagUseCharacterStore)() then nil else require(script.Parent.charactersByUserId)
})