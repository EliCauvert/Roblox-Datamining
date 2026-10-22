local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ChatUIPrimitivesModule = require(Parent.ChatUIPrimitives)
local ExpressionCatalogResourceModule = require(Parent.ChatUIPrimitives.ExpressionCatalogResource)
local TextChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local UseInExperienceLocalizationFunction = require(Parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local LoggerModule = require(script.Parent.Logger)
local MessageModule = require(script.Parent.Message)
local MessageWriterContextModule = require(script.Parent.MessageWriterContext)
local RunVirtualChatCommandsModule = require(script.Parent.runVirtualChatCommands)
local UseCanSendToChannelFunction = require(script.Parent.useCanSendToChannel).useCanSendToChannel
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local GetFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)
local FFlagExpChatTextChannelWindowThemeByBackgroundModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowThemeByBackground)
local FFlagExpChatComposerFigmaParity = require(Parent.SharedFlags).FFlagExpChatComposerFigmaParity
local FFlagExpChatTextChannelWindowExpressionTrayModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowExpressionTray)
local FFlagExpChatTextChannelWindowFocusNavModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFocusNav)
local GetDebugExpressionCatalogModule = require(script.Parent.TextChannelWindowExpressionTray.getDebugExpressionCatalog)
local SendExpressionModule = require(script.Parent.TextChannelWindowExpressionTray.sendExpression)
local Static = if require(script.Parent.Flags.FFlagDebugExpChatTextChannelWindowStaticExpressions) then ExpressionCatalogResourceModule.createStatic(GetDebugExpressionCatalogModule()) else nil
local ChatInputBarView = ChatUIPrimitivesModule.ChatInputBarView
local UseFocusInputBarFunction = ChatUIPrimitivesModule.Hooks.useFocusInputBar

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), GuiService (copy), UseCanSendToChannelFunction (copy), UseInExperienceLocalizationFunction (copy), ReactModule (copy), MessageWriterContextModule (copy), GetFFlagExpChatUseChatMuteStoreModule (copy), RunVirtualChatCommandsModule (copy), MessageModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), TextChannelWindowAnalyticsModule (copy), LoggerModule (copy), UseFocusInputBarFunction (copy), SendExpressionModule (copy), FFlagExpChatTextChannelWindowExpressionTrayModule (copy), FFlagExpChatComposerFigmaParity (copy), FFlagExpChatTextChannelWindowFocusNavModule (copy), Static (copy), ChatInputBarView (copy), FFlagExpChatTextChannelWindowThemeByBackgroundModule (copy)
	local TargetChannel = p1.targetChannel
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local GuiService1 = p1.guiService or GuiService
	local FocusNavEnabled = p1.focusNavEnabled
	local TextBoxRef = p1.textBoxRef
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
		-- upvalues: UseCanSendToChannelResult (copy), TargetChannel (copy), FocusNavEnabled (copy), TextBoxRef (copy), GuiService1 (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), p1 (copy), RunVirtualChatCommandsModule (upval), UseMessageWriterResult (copy), MessageModule (upval), UseInExperienceLocalizationResult (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TextChannelWindowAnalyticsModule (upval), Name (copy), LoggerModule (upval)
		if not UseCanSendToChannelResult then return end
		if TargetChannel and Message ~= "" then
			if FocusNavEnabled then
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
		p1.localUserId, UseMessageWriterResult, Name, FocusNavEnabled, TextBoxRef,
		GuiService1
	})
	local NoCanLocalUserChat = p1.canLocalUserChat == nil or p1.canLocalUserChat
	local UseCanSendToChannelResult1 = NoCanLocalUserChat and (TargetChannel ~= nil and UseCanSendToChannelResult)
	local UseMemoResult1 = ReactModule.useMemo(function()
		return { commands = nil, emojis = true }
	end, {})
	local UseFocusInputBarResult = UseFocusInputBarFunction(p1.textBoxRef)
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: SendExpressionModule (upval), TargetChannel (copy)
		return SendExpressionModule(p2, TargetChannel)
	end, { TargetChannel })
	
	return ReactModule.createElement(ChatInputBarView, {
		maximumCharacterLimit = 200,
		onSend = UseResult,
		canLocalUserChat = UseCanSendToChannelResult1,
		textSize = UseTokensResult.Typography.CaptionMedium.FontSize,
		fontFace = p1.fontFace,
		placeholderText = UseMemoResult.placeholder,
		disabledChatPlaceholderText = if TargetChannel == nil then UseMemoResult.chatUnavailable elseif UseCanSendToChannelResult then UseMemoResult.disabled else UseMemoResult.readOnly,
		autocomplete = UseMemoResult1,
		themedColors = FFlagExpChatTextChannelWindowThemeByBackgroundModule,
		textBoxRef = UseFocusInputBarResult.ref,
		expressionTray = if FFlagExpChatTextChannelWindowExpressionTrayModule and FFlagExpChatComposerFigmaParity then {
			sendExpression = UseResult1,
			canLocalUserChat = NoCanLocalUserChat,
			canSend = UseCanSendToChannelResult and TargetChannel ~= nil,
			onKeyboardActivated = UseFocusInputBarResult.focus,
			footerText = UseMemoResult.presetDisclaimer,
			focusNavEnabled = FocusNavEnabled == true and FFlagExpChatTextChannelWindowFocusNavModule,
			onOpenChanged = if FFlagExpChatTextChannelWindowFocusNavModule then p1.onExpressionTrayOpenChanged else nil,
			catalogResource = Static
		} else nil,
		composerLayout = FFlagExpChatComposerFigmaParity,
		selectionImageObject = if FocusNavEnabled then p1.selectionCursor else nil
	})
end)