local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ChatUIPrimitivesModule = require(Parent.ChatUIPrimitives)
local ExpressionCatalogResourceModule = require(Parent.ChatUIPrimitives.ExpressionCatalogResource)
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local TextChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local UseInExperienceLocalizationFunction = require(Parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local LoggerModule = require(script.Parent.Logger)
local MessageModule = require(script.Parent.Message)
local MessageWriterContextModule = require(script.Parent.MessageWriterContext)
local RunVirtualChatCommandsModule = require(script.Parent.runVirtualChatCommands)
local UseCanSendToChannelFunction = require(script.Parent.useCanSendToChannel).useCanSendToChannel
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local SendTextToChannelModule = require(script.Parent.sendTextToChannel)
local GetFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)
local FFlagExpChatTextChannelWindowThemeByBackgroundModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowThemeByBackground)
local FFlagExpChatComposerFigmaParity = require(Parent.SharedFlags).FFlagExpChatComposerFigmaParity
local FFlagExpChatTextChannelWindowExpressionTrayModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowExpressionTray)
local FFlagExpChatTextChannelWindowExpressionTrayEmojiModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowExpressionTrayEmoji)
local FFlagExpChatTextChannelWindowFocusNavModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFocusNav)
local FFlagExpChatTextChannelWindowMessageComposerModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowMessageComposer)
local FFlagExpChatTCWRestoreSendSelectionGatedByInputModeModule = require(script.Parent.Flags.FFlagExpChatTCWRestoreSendSelectionGatedByInputMode)
local FFlagExpChatTextChannelWindowQuickWordsNonDirectModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowQuickWordsNonDirect)
local IsDirectChatChannelModule = require(script.Parent.isDirectChatChannel)
local GetDebugExpressionCatalogModule = require(script.Parent.TextChannelWindowExpressionTray.getDebugExpressionCatalog)
local SendExpressionModule = require(script.Parent.TextChannelWindowExpressionTray.sendExpression)
local UseTextChannelWindowComposerViewModelModule = require(script.Parent.useTextChannelWindowComposerViewModel)
local Static = if require(script.Parent.Flags.FFlagDebugExpChatTextChannelWindowStaticExpressions) then ExpressionCatalogResourceModule.createStatic(GetDebugExpressionCatalogModule()) else nil
local ChatInputBarView = ChatUIPrimitivesModule.ChatInputBarView
local MessageComposerModule = require(Parent.ChatUIPrimitives.MessageComposer)
local UseFocusInputBarFunction = ChatUIPrimitivesModule.Hooks.useFocusInputBar

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), GuiService (copy), UseLastInputModeFunction (copy), UseCanSendToChannelFunction (copy), UseInExperienceLocalizationFunction (copy), ReactModule (copy), MessageWriterContextModule (copy), FFlagExpChatTCWRestoreSendSelectionGatedByInputModeModule (copy), GetFFlagExpChatUseChatMuteStoreModule (copy), RunVirtualChatCommandsModule (copy), MessageModule (copy), FFlagExpChatTextChannelWindowExpressionTrayEmojiModule (copy), SendTextToChannelModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), TextChannelWindowAnalyticsModule (copy), LoggerModule (copy), UseFocusInputBarFunction (copy), SendExpressionModule (copy), FFlagExpChatTextChannelWindowQuickWordsNonDirectModule (copy), IsDirectChatChannelModule (copy), FFlagExpChatTextChannelWindowExpressionTrayModule (copy), FFlagExpChatComposerFigmaParity (copy), FFlagExpChatTextChannelWindowFocusNavModule (copy), Static (copy), FFlagExpChatTextChannelWindowMessageComposerModule (copy), UseTextChannelWindowComposerViewModelModule (copy), MessageComposerModule (copy), ChatInputBarView (copy), FFlagExpChatTextChannelWindowThemeByBackgroundModule (copy)
	local TargetChannel = p1.targetChannel
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local GuiService1 = p1.guiService or GuiService
	local FocusNavEnabled = p1.focusNavEnabled
	local TextBoxRef = p1.textBoxRef
	local UseLastInputModeResult = UseLastInputModeFunction()
	local UseCanSendToChannelResult = UseCanSendToChannelFunction(p1.targetChannel, p1.localUserId)
	local UseInExperienceLocalizationResult = UseInExperienceLocalizationFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseInExperienceLocalizationResult (copy)
		return {
			placeholder = UseInExperienceLocalizationResult("CoreScripts.TextChat.InputBar.Hint.Touch"),
			disabled = UseInExperienceLocalizationResult("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"),
			chatUnavailable = UseInExperienceLocalizationResult("CoreScripts.TextChat.InputBar.Hint.ChatUnavailable"),
			readOnly = UseInExperienceLocalizationResult("CoreScripts.TextChat.Error.ReadOnlyChannel"),
			presetDisclaimer = UseInExperienceLocalizationResult("Feature.Chat.PresetChat.Disclaimer")
		}
	end, { UseInExperienceLocalizationResult })
	local UseMessageWriterResult = MessageWriterContextModule.useMessageWriter()
	local Name = if TargetChannel then TargetChannel.Name else nil
	local UseResult = ReactModule.useCallback(function(Message)
		-- upvalues: UseCanSendToChannelResult (copy), TargetChannel (copy), FocusNavEnabled (copy), FFlagExpChatTCWRestoreSendSelectionGatedByInputModeModule (upval), UseLastInputModeResult (copy), TextBoxRef (copy), GuiService1 (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), p1 (copy), RunVirtualChatCommandsModule (upval), UseMessageWriterResult (copy), MessageModule (upval), UseInExperienceLocalizationResult (copy), FFlagExpChatTextChannelWindowExpressionTrayEmojiModule (upval), SendTextToChannelModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TextChannelWindowAnalyticsModule (upval), Name (copy), LoggerModule (upval)
		if not UseCanSendToChannelResult then return end
		if TargetChannel and Message ~= "" then
			if FocusNavEnabled and (not FFlagExpChatTCWRestoreSendSelectionGatedByInputModeModule or UseLastInputModeResult == "Focus") then
				local Current = if TextBoxRef then TextBoxRef.current else nil
				
				if Current then
					GuiService1.SelectedCoreObject = Current
				end
			end
			if GetFFlagExpChatUseChatMuteStoreModule() and p1.localUserId then
				local RunVirtualChatCommandsModuleResult = RunVirtualChatCommandsModule(Message, p1.localUserId)
				
				if RunVirtualChatCommandsModuleResult then
					if UseMessageWriterResult then
						UseMessageWriterResult.write(MessageModule.createSystemMessage(UseInExperienceLocalizationResult(RunVirtualChatCommandsModuleResult.key, if next(RunVirtualChatCommandsModuleResult.args) then RunVirtualChatCommandsModuleResult.args else nil)))
					end
					return
				end
			end
			if FFlagExpChatTextChannelWindowExpressionTrayEmojiModule then
				task.spawn(SendTextToChannelModule, TargetChannel, Message)
				
				return
			end
			task.spawn(function()
				-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TargetChannel (upval), Message (copy), TextChannelWindowAnalyticsModule (upval), Name (upval), LoggerModule (upval)
				local Success, Result = pcall(function()
					-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TargetChannel (upval), Message (upval)
					if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
						TargetChannel:SendInternalAsync(Message)
						
						return
					else
						TargetChannel:SendAsync(Message)
					end
				end)
				
				if Success then
					TextChannelWindowAnalyticsModule.emit(TextChannelWindowAnalyticsModule.Counters.Send, {
						result = "success",
						has_target = Name ~= nil,
						target_text_channel_category = TextChannelWindowAnalyticsModule.getChannelCategory(Name)
					})
					
					return
				else
					LoggerModule:warning("SendAsync failed: {}", Result)
					TextChannelWindowAnalyticsModule.emit(TextChannelWindowAnalyticsModule.Counters.Send, {
						result = "failure",
						has_target = Name ~= nil,
						target_text_channel_category = TextChannelWindowAnalyticsModule.getChannelCategory(Name)
					})
				end
			end)
		end
	end, {
		TargetChannel, UseCanSendToChannelResult, UseInExperienceLocalizationResult,
		p1.localUserId, UseMessageWriterResult, Name, FocusNavEnabled,
		UseLastInputModeResult, TextBoxRef, GuiService1
	})
	local NoCanLocalUserChat = p1.canLocalUserChat == nil or p1.canLocalUserChat
	local UseCanSendToChannelResult1 = NoCanLocalUserChat and (TargetChannel ~= nil and UseCanSendToChannelResult)
	local ChatUnavailable = if TargetChannel == nil then UseMemoResult.chatUnavailable elseif UseCanSendToChannelResult then UseMemoResult.disabled else UseMemoResult.readOnly
	local UseMemoResult1 = ReactModule.useMemo(function()
		return { commands = nil, emojis = true }
	end, {})
	local UseFocusInputBarResult = UseFocusInputBarFunction(p1.textBoxRef)
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: SendExpressionModule (upval), TargetChannel (copy), NoCanLocalUserChat (copy)
		return SendExpressionModule(p2, TargetChannel, NoCanLocalUserChat)
	end, { TargetChannel, NoCanLocalUserChat })
	local IsDirectChatChannelModule1 = FFlagExpChatTextChannelWindowQuickWordsNonDirectModule and (not FFlagExpChatTextChannelWindowExpressionTrayEmojiModule and (TargetChannel ~= nil and IsDirectChatChannelModule(TargetChannel)))
	local Config = if FFlagExpChatTextChannelWindowExpressionTrayModule and FFlagExpChatComposerFigmaParity then {
		sendExpression = UseResult1,
		canLocalUserChat = NoCanLocalUserChat,
		canSend = UseCanSendToChannelResult and (TargetChannel ~= nil and not IsDirectChatChannelModule1),
		onKeyboardActivated = UseFocusInputBarResult.focus,
		footerText = UseMemoResult.presetDisclaimer,
		focusNavEnabled = FocusNavEnabled == true and FFlagExpChatTextChannelWindowFocusNavModule,
		onOpenChanged = if FFlagExpChatTextChannelWindowFocusNavModule then p1.onExpressionTrayOpenChanged else nil,
		catalogResource = Static
	} else nil
	local Config1 = if Config then {
		catalogResource = Config.catalogResource,
		onKeyboardActivated = Config.onKeyboardActivated,
		canSend = Config.canSend,
		onOpenChanged = Config.onOpenChanged
	} else nil
	local Element = if ChatUnavailable and ChatUnavailable ~= "" then ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y",
		padding = {
			left = UDim.new(0, 16),
			right = UDim.new(0, 4),
			top = UDim.new(0, 10),
			bottom = UDim.new(0, 10)
		}
	}, {
		Text = ReactModule.createElement(FoundationModule.Text, {
			testId = "--social-exp-chat-text-input-disabled",
			tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end content-muted",
			Text = ChatUnavailable
		})
	}) else nil
	
	return if FFlagExpChatTextChannelWindowMessageComposerModule then ReactModule.createElement(MessageComposerModule, (UseTextChannelWindowComposerViewModelModule({
		canChat = UseCanSendToChannelResult1,
		canChatFreely = NoCanLocalUserChat,
		targetChannel = TargetChannel,
		disabledOverlay = Element,
		onSend = UseResult,
		expressionTray = Config1,
		windowName = p1.windowName,
		placeholderText = UseMemoResult.placeholder,
		textBoxRef = UseFocusInputBarResult.ref,
		fontFace = p1.fontFace
	}))) else ReactModule.createElement(ChatInputBarView, {
		maximumCharacterLimit = 200,
		onSend = UseResult,
		canLocalUserChat = UseCanSendToChannelResult1,
		textSize = UseTokensResult.Typography.CaptionMedium.FontSize,
		fontFace = p1.fontFace,
		placeholderText = UseMemoResult.placeholder,
		disabledChatPlaceholderText = ChatUnavailable,
		autocomplete = UseMemoResult1,
		themedColors = FFlagExpChatTextChannelWindowThemeByBackgroundModule,
		textBoxRef = UseFocusInputBarResult.ref,
		expressionTray = Config,
		composerLayout = FFlagExpChatComposerFigmaParity,
		selectionImageObject = if FocusNavEnabled then p1.selectionCursor else nil
	})
end)