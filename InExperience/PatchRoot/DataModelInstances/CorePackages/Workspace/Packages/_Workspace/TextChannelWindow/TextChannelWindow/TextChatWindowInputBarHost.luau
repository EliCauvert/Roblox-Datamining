local parent = script.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local textChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local useInExperienceLocalization = require(parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local useCanSendToChannel = require(script.Parent.useCanSendToChannel).useCanSendToChannel
local loggerModule = require(script.Parent.Logger)
local messageModule = require(script.Parent.Message)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local runVirtualChatCommandsModule = require(script.Parent.runVirtualChatCommands)
local getFFlagExpChatProtectedChatInternalAPIs = require(parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local getFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)
local fFlagExpChatTextChannelWindowThemeByBackgroundModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowThemeByBackground)
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView

return function(p0) --[[ line: 33 | named "TextChatWindowInputBarHost" ]]
	-- upvalues: foundationModule (ref), useCanSendToChannel (ref), useInExperienceLocalization (ref), reactModule (ref), messageWriterContextModule (ref), getFFlagExpChatUseChatMuteStoreModule (ref), runVirtualChatCommandsModule (ref), messageModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), textChannelWindowAnalyticsModule (ref), loggerModule (ref), chatInputBarView (ref), fFlagExpChatTextChannelWindowThemeByBackgroundModule (ref)
	local targetChannel = p0.targetChannel
	local var10 = foundationModule.Hooks.useTokens()
	local var11 = useCanSendToChannel(targetChannel, p0.localUserId)
	local var12 = useInExperienceLocalization()
	local var13 = reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: var12 (ref)
		return {
			placeholder = var12("CoreScripts.TextChat.InputBar.Hint.Touch"),
			disabled = var12("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"),
			chatUnavailable = var12("CoreScripts.TextChat.InputBar.Hint.ChatUnavailable"),
			readOnly = var12("CoreScripts.TextChat.Error.ReadOnlyChannel")
		}
	end, { var12 })
	local var14 = messageWriterContextModule.useMessageWriter()
	local var15 = if targetChannel then targetChannel.Name else nil
	
	return reactModule.createElement(chatInputBarView, {
		maximumCharacterLimit = 200,
		onSend = reactModule.useCallback(function(p1) --[[ line: 53 ]]
			-- upvalues: var11 (ref), targetChannel (ref), getFFlagExpChatUseChatMuteStoreModule (copy), p0 (ref), runVirtualChatCommandsModule (copy), var14 (ref), messageModule (copy), var12 (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), textChannelWindowAnalyticsModule (copy), var15 (ref), loggerModule (copy)
			if not var11 then return end
			if targetChannel and p1 ~= "" then
				if getFFlagExpChatUseChatMuteStoreModule() and p0.localUserId then
					local var16 = runVirtualChatCommandsModule(p1, p0.localUserId)
					
					if var16 then
						if var14 then
							var14.write(messageModule.createSystemMessage(var12(var16.key, if next(var16.args) then var16.args else nil)))
						end
						return
					else
						task.spawn(function() --[[ line: 74 ]]
							-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), targetChannel (copy), p1 (ref), textChannelWindowAnalyticsModule (copy), var15 (copy), loggerModule (copy)
							local ok, status = pcall(function() --[[ line: 75 ]]
								-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), targetChannel (copy), p1 (copy)
								if getFFlagExpChatProtectedChatInternalAPIs() then
									targetChannel:SendInternalAsync(p1)
									
									return
								end
								targetChannel:SendAsync(p1)
							end)
							
							if ok then
								textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.Send, {
									result = "success",
									has_target = var15 ~= nil,
									target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var15)
								})
								
								return
							end
							loggerModule:warning("SendAsync failed: {}", status)
							textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.Send, {
								result = "failure",
								has_target = var15 ~= nil,
								target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var15)
							})
						end)
					end
				end
			end
		end, {
			targetChannel, var11, var12, p0.localUserId, var14, var15
		}),
		canLocalUserChat = (p0.canLocalUserChat ~= nil or p0.canLocalUserChat) and (targetChannel ~= nil and var11),
		textSize = var10.Typography.CaptionMedium.FontSize,
		fontFace = p0.fontFace,
		placeholderText = var13.placeholder,
		disabledChatPlaceholderText = if targetChannel == nil then var13.chatUnavailable elseif not var11 then var13.readOnly else var13.disabled,
		autocomplete = reactModule.useMemo(function() --[[ line: 121 ]]
			return { commands = nil, emojis = true }
		end, {}),
		themedColors = fFlagExpChatTextChannelWindowThemeByBackgroundModule
	})
end