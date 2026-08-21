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
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView

return function(p0) --[[ line: 29 | named "TextChatWindowInputBarHost" ]]
	-- upvalues: foundationModule (ref), useCanSendToChannel (ref), useInExperienceLocalization (ref), reactModule (ref), messageWriterContextModule (ref), getFFlagExpChatUseChatMuteStoreModule (ref), runVirtualChatCommandsModule (ref), messageModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), textChannelWindowAnalyticsModule (ref), loggerModule (ref), chatInputBarView (ref)
	local targetChannel = p0.targetChannel
	local var9 = foundationModule.Hooks.useTokens()
	local var10 = useCanSendToChannel(targetChannel, p0.localUserId)
	local var11 = useInExperienceLocalization()
	local var12 = reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: var11 (ref)
		return {
			placeholder = var11("CoreScripts.TextChat.InputBar.Hint.Touch"),
			disabled = var11("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"),
			chatUnavailable = var11("CoreScripts.TextChat.InputBar.Hint.ChatUnavailable"),
			readOnly = var11("CoreScripts.TextChat.Error.ReadOnlyChannel")
		}
	end, { var11 })
	local var13 = messageWriterContextModule.useMessageWriter()
	local var14 = if targetChannel then targetChannel.Name else nil
	
	return reactModule.createElement(chatInputBarView, {
		maximumCharacterLimit = 200,
		onSend = reactModule.useCallback(function(p1) --[[ line: 49 ]]
			-- upvalues: var10 (ref), targetChannel (ref), getFFlagExpChatUseChatMuteStoreModule (copy), p0 (ref), runVirtualChatCommandsModule (copy), var13 (ref), messageModule (copy), var11 (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), textChannelWindowAnalyticsModule (copy), var14 (ref), loggerModule (copy)
			if not var10 then return end
			if targetChannel and p1 ~= "" then
				if getFFlagExpChatUseChatMuteStoreModule() and p0.localUserId then
					local var15 = runVirtualChatCommandsModule(p1, p0.localUserId)
					
					if var15 then
						if var13 then
							var13.write(messageModule.createSystemMessage(var11(var15.key, if next(var15.args) then var15.args else nil)))
						end
						return
					else
						task.spawn(function() --[[ line: 70 ]]
							-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), targetChannel (copy), p1 (ref), textChannelWindowAnalyticsModule (copy), var14 (copy), loggerModule (copy)
							local ok, status = pcall(function() --[[ line: 71 ]]
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
									has_target = var14 ~= nil,
									target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var14)
								})
								
								return
							end
							loggerModule:warning("SendAsync failed: {}", status)
							textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.Send, {
								result = "failure",
								has_target = var14 ~= nil,
								target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(var14)
							})
						end)
					end
				end
			end
		end, {
			targetChannel, var10, var11, p0.localUserId, var13, var14
		}),
		canLocalUserChat = (p0.canLocalUserChat ~= nil or p0.canLocalUserChat) and (targetChannel ~= nil and var10),
		textSize = var9.Typography.CaptionMedium.FontSize,
		placeholderText = var12.placeholder,
		disabledChatPlaceholderText = if targetChannel == nil then var12.chatUnavailable elseif not var10 then var12.readOnly else var12.disabled,
		autocomplete = reactModule.useMemo(function() --[[ line: 117 ]]
			return { commands = nil, emojis = true }
		end, {})
	})
end