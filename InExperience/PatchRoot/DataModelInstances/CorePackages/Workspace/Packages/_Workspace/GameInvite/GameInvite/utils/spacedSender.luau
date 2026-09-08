local gameInvite = script:FindFirstAncestor("GameInvite")

return require(gameInvite.utils.createSpacedSender)({
	minIntervalSeconds = require(gameInvite.Flags.FIntGameInviteSendSpacing) / 1000,
	now = os.clock,
	delay = task.delay
})