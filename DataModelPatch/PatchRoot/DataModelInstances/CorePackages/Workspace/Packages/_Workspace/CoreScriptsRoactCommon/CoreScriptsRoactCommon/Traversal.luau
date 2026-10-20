return {
	Constants = require(script.Constants),
	Flags = require(script.Flags),
	TraversalExperienceCard = require(script.TraversalExperienceCard),
	HistoryMenu = require(script.HistoryMenu),
	HistoryPage = require(script.HistoryPage),
	LocalTraversalHistory = require(script.LocalTraversalHistory),
	TraversalTelemetry = require(script.TraversalTelemetry),
	TeleportBackButton = require(script.TeleportBackButton),
	TeleportLeaveConfirmation = require(script.TeleportLeaveConfirmation),
	useHistoryItems = require(script.Parent.Hooks.useHistoryItems)
}