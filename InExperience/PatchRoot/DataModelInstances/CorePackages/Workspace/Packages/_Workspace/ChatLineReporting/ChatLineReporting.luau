return {
	["jest.config"] = script["jest.config"],
	ChatBoxContextMenu = require(script.Components.ChatBoxContextMenu),
	ChatLineReportRoot = require(script.Components.ChatLineReportRoot),
	ChatLineReportSelectionModal = require(script.Components.ChatLineReportSelectionModal),
	Constants = require(script.Common.Constants),
	Enums = {
		ChatLineSelectionMode = require(script.Enums.ChatLineSelectionMode)
	},
	Helpers = {
		getMessageText = require(script.Common.getMessageText),
		isSystemMessage = require(script.Common.isSystemMessage)
	}
}