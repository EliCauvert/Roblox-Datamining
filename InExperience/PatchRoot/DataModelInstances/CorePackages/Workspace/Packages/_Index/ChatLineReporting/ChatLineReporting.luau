return {
	["jest.config"] = script["jest.config"],
	ChatBoxContextMenu = require(script.Components.ChatBoxContextMenu),
	ChatLineReportRoot = require(script.Components.ChatLineReportRoot),
	Constants = require(script.Common.Constants),
	Helpers = {
		getMessageText = require(script.Common.getMessageText),
		isSystemMessage = require(script.Common.isSystemMessage)
	}
}