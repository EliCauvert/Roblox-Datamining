local _ = require(script.Types)

return {
	ChatInputBarView = require(script.Components.ChatInputBar.ChatInputBarView),
	chatTabNavigationSignal = require(script.chatTabNavigationSignal),
	["jest.config"] = script["jest.config"],
	["jest.bench.config"] = script["jest.bench.config"],
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
		useFinishChatWindowMessageRenderIntervals = require(script.Hooks.useFinishChatWindowMessageRenderIntervals),
		useFocusInputBar = require(script.Hooks.useFocusInputBar),
		useInExperienceLocalization = require(script.Hooks.useInExperienceLocalization),
		useLastInputGroup = require(script.Hooks.useLastInputGroup),
		usePortalSelectionLinks = require(script.Hooks.usePortalSelectionLinks)
	},
	Telemetry = {
		ExpChatPerfTracker = require(script.Telemetry.ExpChatPerfTracker),
		TextChannelWindowPerfTracker = require(script.Telemetry.TextChannelWindowPerfTracker)
	},
	Flags = {
		FFlagExpChatAddressFrame0Flash = require(script.Flags.FFlagExpChatAddressFrame0Flash),
		FFlagExpChatExpressionTrayReducedMotion = require(script.Flags.FFlagExpChatExpressionTrayReducedMotion),
		FFlagExpChatPerfTrackerTabName = require(script.Flags.FFlagExpChatPerfTrackerTabName),
		FFlagTCWTranslationSupport = require(script.Flags.FFlagTCWTranslationSupport)
	}
}