local _ = require(script.Types)

return {
	ChatInputBarView = require(script.Components.ChatInputBar.ChatInputBarView),
	["jest.config"] = script["jest.config"],
	MessageLayoutContainer = require(script.Components.MessageLayoutContainer.MessageLayoutContainer),
	useMessagePool = require(script.Components.MessageLayoutContainer.useMessagePool),
	Utils = {
		computeNameColor = require(script.Utils.computeNameColor),
		getMessageTextSize = require(script.Utils.getMessageTextSize),
		formatInlineIcon = require(script.Utils.formatInlineIcon),
		escapeRichText = require(script.Utils.escapeRichText)
	},
	Hooks = {
		useStableSignal = require(script.Hooks.useStableSignal),
		usePropSignal = require(script.Hooks.usePropSignal),
		useFinishChatWindowMessageRenderIntervals = require(script.Hooks.useFinishChatWindowMessageRenderIntervals)
	},
	Telemetry = {
		ExpChatPerfTracker = require(script.Telemetry.ExpChatPerfTracker),
		TextChannelWindowPerfTracker = require(script.Telemetry.TextChannelWindowPerfTracker)
	},
	Flags = {
		FFlagExpChatScrollPerfTracking = require(script.Flags.FFlagExpChatScrollPerfTracking),
		FFlagExpChatAddressFrame0Flash = require(script.Flags.FFlagExpChatAddressFrame0Flash),
		FFlagExpChatPerfTrackerTabName = require(script.Flags.FFlagExpChatPerfTrackerTabName)
	}
}