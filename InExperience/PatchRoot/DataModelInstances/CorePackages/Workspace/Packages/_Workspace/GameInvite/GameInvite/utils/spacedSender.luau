local GameInvite = script:FindFirstAncestor("GameInvite")

return require(GameInvite.utils.createSpacedSender)({
	minIntervalSeconds = require(GameInvite.Flags.FIntGameInviteSendSpacing) / 1000,
	now = os.clock,
	delay = task.delay
})