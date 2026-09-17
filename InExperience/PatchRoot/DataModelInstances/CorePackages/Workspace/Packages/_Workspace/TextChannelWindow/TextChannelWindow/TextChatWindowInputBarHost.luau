local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local textChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local useInExperienceLocalization = require(parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local loggerModule = require(script.Parent.Logger)
local messageModule = require(script.Parent.Message)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local runVirtualChatCommandsModule = require(script.Parent.runVirtualChatCommands)
local useCanSendToChannel = require(script.Parent.useCanSendToChannel).useCanSendToChannel
local getFFlagExpChatProtectedChatInternalAPIs = require(parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local getFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)
local fFlagExpChatTextChannelWindowThemeByBackgroundModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowThemeByBackground)
local fFlagExpChatComposerFigmaParity = require(parent.SharedFlags).FFlagExpChatComposerFigmaParity
local fFlagExpChatTextChannelWindowExpressionTrayModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowExpressionTray)
local fFlagExpChatTextChannelWindowFocusNavModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFocusNav)
local sendExpressionModule = require(script.Parent.TextChannelWindowExpressionTray.sendExpression)
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView
local useFocusInputBar = chatUIPrimitivesModule.Hooks.useFocusInputBar

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), guiService (ref), useCanSendToChannel (ref), useInExperienceLocalization (ref), reactModule (ref), messageWriterContextModule (ref), getFFlagExpChatUseChatMuteStoreModule (ref), runVirtualChatCommandsModule (ref), messageModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), textChannelWindowAnalyticsModule (ref), loggerModule (ref), useFocusInputBar (ref), sendExpressionModule (ref), fFlagExpChatTextChannelWindowExpressionTrayModule (ref), fFlagExpChatComposerFigmaParity (ref), fFlagExpChatTextChannelWindowFocusNavModule (ref), chatInputBarView (ref), fFlagExpChatTextChannelWindowThemeByBackgroundModule (ref)
	local targetChannel = p1.targetChannel
	local var1 = foundationModule.Hooks.useTokens()
	local guiService_1 = p1.guiService or guiService
	local focusNavEnabled = p1.focusNavEnabled
	local textBoxRef = p1.textBoxRef
	local var2 = useCanSendToChannel(p1.targetChannel, p1.localUserId)
	local var3 = useInExperienceLocalization()
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return {
			placeholder = var3("CoreScripts.TextChat.InputBar.Hint.Touch"),
			disabled = var3("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"),
			chatUnavailable = var3("CoreScripts.TextChat.InputBar.Hint.ChatUnavailable"),
			readOnly = var3("CoreScripts.TextChat.Error.ReadOnlyChannel"),
			presetDisclaimer = var3("Feature.Chat.PresetChat.Disclaimer")
		}
	end, { var3 })
	local var5 = messageWriterContextModule.useMessageWriter()
	local var6 = if targetChannel then targetChannel.Name else nil
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), targetChannel (ref), focusNavEnabled (ref), textBoxRef (ref), guiService_1 (ref), getFFlagExpChatUseChatMuteStoreModule (copy), p1 (ref), runVirtualChatCommandsModule (copy), var5 (ref), messageModule (copy), var3 (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), textChannelWindowAnalyticsModule (copy), var6 (ref), loggerModule (copy)
		if not var2 then return end
		if targetChannel and p2 ~= "" then
			if focusNavEnabled then
				local var8 = if textBoxRef then textBoxRef.current else nil
				
				if var8 then
					guiService_1.SelectedCoreObject = var8
				end
			end
			if getFFlagExpChatUseChatMuteStoreModule() and p1.localUserId then
				local var9 = runVirtualChatCommandsModule(p2, p1.localUserId)
				
				if var9 then
					if var5 then
						var5.write(messageModule.createSystemMessage(var3(var9.key, if next(var9.args) then var9.args else nil)))
					end
					return
				else
					task.spawn(function()
						-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), targetChannel (copy), p2 (ref), textChannelWindowAnalyticsModule (copy), var6 (copy), loggerModule (copy)
						local ok, status = pcall(function()
							-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), targetChannel (copy), p2 (copy)
							if getFFlagExpChatProtectedChatInternalAPIs() then
								targetChannel:SendInternalAsync(p2)
								
								return
							end
							targetChannel:SendAsync(p2)
						end)
						
						if ok then
							textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.Send, {
								result = "success",
								has_target = var6 ~= nil,
								target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var6)
							})
							
							return
						end
						loggerModule:warning("SendAsync failed: {}", status)
						textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.Send, {
							result = "failure",
							has_target = var6 ~= nil,
							target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var6)
						})
					end)
				end
			end
		end
	end, {
		targetChannel, var2, var3, p1.localUserId, var5, var6, focusNavEnabled,
		textBoxRef, guiService_1
	})
	local var8 = p1.canLocalUserChat ~= nil or p1.canLocalUserChat
	local var9 = useFocusInputBar(p1.textBoxRef)
	
	return reactModule.createElement(chatInputBarView, {
		maximumCharacterLimit = 200,
		onSend = var7,
		canLocalUserChat = var8 and (targetChannel ~= nil and var2),
		textSize = var1.Typography.CaptionMedium.FontSize,
		fontFace = p1.fontFace,
		placeholderText = var4.placeholder,
		disabledChatPlaceholderText = if targetChannel == nil then var4.chatUnavailable elseif not var2 then var4.readOnly else var4.disabled,
		autocomplete = reactModule.useMemo(function()
			return { commands = nil, emojis = true }
		end, {}),
		themedColors = fFlagExpChatTextChannelWindowThemeByBackgroundModule,
		textBoxRef = var9.ref,
		expressionTray = if fFlagExpChatTextChannelWindowExpressionTrayModule and fFlagExpChatComposerFigmaParity then {
			sendExpression = reactModule.useCallback(function(p2)
				-- upvalues: sendExpressionModule (copy), targetChannel (ref)
				return sendExpressionModule(p2, targetChannel)
			end, { targetChannel }),
			canLocalUserChat = var8,
			canSend = var2 and targetChannel ~= nil,
			onKeyboardActivated = var9.focus,
			footerText = var4.presetDisclaimer,
			focusNavEnabled = focusNavEnabled == true and fFlagExpChatTextChannelWindowFocusNavModule,
			onOpenChanged = if fFlagExpChatTextChannelWindowFocusNavModule then p1.onExpressionTrayOpenChanged else nil
		} else nil,
		composerLayout = fFlagExpChatComposerFigmaParity,
		selectionImageObject = if focusNavEnabled then p1.selectionCursor else nil
	})
end)