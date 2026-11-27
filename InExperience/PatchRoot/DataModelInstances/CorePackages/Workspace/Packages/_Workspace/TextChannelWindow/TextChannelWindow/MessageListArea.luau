local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local ChatUIPrimitivesModule = require(Parent.ChatUIPrimitives)
local TextChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local UseTranslationToggleAvailableModule = require(script.Parent.useTranslationToggleAvailable)
local UseInExperienceLocalizationFunction = require(Parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local FFlagTCWTranslationSupport = ChatUIPrimitivesModule.Flags.FFlagTCWTranslationSupport
local MessageLayoutContainer = ChatUIPrimitivesModule.MessageLayoutContainer

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), UseInExperienceLocalizationFunction (copy), FFlagTCWTranslationSupport (copy), UseTranslationToggleAvailableModule (copy), ReactModule (copy), TextChannelWindowAnalyticsModule (copy), MessageLayoutContainer (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseInExperienceLocalizationResult = UseInExperienceLocalizationFunction()
	local UseTranslationToggleAvailableModuleResult = if FFlagTCWTranslationSupport then UseTranslationToggleAvailableModule() else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: TextChannelWindowAnalyticsModule (upval), p1 (copy)
		return TextChannelWindowAnalyticsModule.createOnScrollCallback(p1.windowName)
	end, { p1.windowName })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy)
		return {
			top = UDim.new(0, UseTokensResult.Size.Size_100),
			bottom = UDim.new(0, UseTokensResult.Size.Size_100),
			left = UDim.new(0, UseTokensResult.Size.Size_200),
			right = UDim.new(0, UseTokensResult.Size.Size_1400)
		}
	end, {
		UseTokensResult.Size.Size_100,
		UseTokensResult.Size.Size_200,
		UseTokensResult.Size.Size_1400
	})
	
	return if p1.channelState == "no-channel" then ReactModule.createElement(FoundationModule.Empty, {
		icon = { name = "icons/status/oof_xlarge" },
		text = UseInExperienceLocalizationResult("CoreScripts.TextChat.Error.NoChannelSelected")
	}) elseif p1.channelState == "not-member" then ReactModule.createElement(FoundationModule.Empty, {
		icon = { name = "icons/status/oof_xlarge" },
		text = UseInExperienceLocalizationResult("CoreScripts.TextChat.Error.NoChannelAccess")
	}) elseif p1.channelState == "member" then ReactModule.createElement(MessageLayoutContainer, {
		layoutStyle = "textLine",
		messagesSignal = p1.messagesSignal,
		fontFace = p1.fontFace,
		Size = UDim2.fromScale(1, 1),
		contentPadding = UseMemoResult1,
		onScroll = UseMemoResult,
		selectableRows = p1.selectableRows,
		selectionCursor = p1.selectionCursor,
		isTranslationSettingEnabled = UseTranslationToggleAvailableModuleResult,
		onLatestUsernameChanged = p1.onLatestUsernameChanged
	}) else ReactModule.createElement(FoundationModule.Empty, {
		icon = { name = "icons/status/oof_xlarge" },
		text = UseInExperienceLocalizationResult("CoreScripts.TextChat.InputBar.Hint.ChatUnavailable")
	})
end)