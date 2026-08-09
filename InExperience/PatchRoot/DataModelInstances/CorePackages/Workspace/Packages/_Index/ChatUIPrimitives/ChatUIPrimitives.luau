local _ = require(script.Types)

return {
	ChatInputBarView = require(script.ChatInputBarView),
	["jest.config"] = script["jest.config"],
	MessageLayoutContainer = require(script.MessageLayoutContainer),
	Utils = {
		computeNameColor = require(script.Utils.computeNameColor),
		getMessageTextSize = require(script.Utils.getMessageTextSize)
	},
	Hooks = {
		useStableSignal = require(script.Hooks.useStableSignal),
		useFinishChatWindowMessageRenderIntervals = require(script.Hooks.useFinishChatWindowMessageRenderIntervals)
	},
	Telemetry = {
		ExpChatPerfTracker = require(script.Telemetry.ExpChatPerfTracker)
	},
	Flags = {
		FFlagExpChatScrollPerfTracking = require(script.Flags.FFlagExpChatScrollPerfTracking)
	}
}