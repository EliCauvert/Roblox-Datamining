local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseInExperienceLocalizationModule = require(script.Parent.useInExperienceLocalization)
local UseCanSendToChannelFunction = require(script.Parent.useCanSendToChannel).useCanSendToChannel
local LoggerModule = require(script.Parent.Logger)
local MessageModule = require(script.Parent.Message)
local MessageWriterContextModule = require(script.Parent.MessageWriterContext)
local RunVirtualChatCommandsModule = require(script.Parent.runVirtualChatCommands)
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local GetFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)
local ChatInputBarView = require(Parent.ChatUIPrimitives).ChatInputBarView

return function(p1)
	-- upvalues: FoundationModule (copy), UseCanSendToChannelFunction (copy), UseInExperienceLocalizationModule (copy), ReactModule (copy), MessageWriterContextModule (copy), GetFFlagExpChatUseChatMuteStoreModule (copy), RunVirtualChatCommandsModule (copy), MessageModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), LoggerModule (copy), ChatInputBarView (copy)
	local TargetChannel = p1.targetChannel
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseCanSendToChannelResult = UseCanSendToChannelFunction(TargetChannel, p1.localUserId)
	local UseInExperienceLocalizationModuleResult = UseInExperienceLocalizationModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseInExperienceLocalizationModuleResult (copy)
		return {
			placeholder = UseInExperienceLocalizationModuleResult("CoreScripts.TextChat.InputBar.Hint.Touch"),
			disabled = UseInExperienceLocalizationModuleResult("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"),
			chatUnavailable = UseInExperienceLocalizationModuleResult("CoreScripts.TextChat.InputBar.Hint.ChatUnavailable"),
			readOnly = UseInExperienceLocalizationModuleResult("CoreScripts.TextChat.Error.ReadOnlyChannel")
		}
	end, { UseInExperienceLocalizationModuleResult })
	local UseMessageWriterResult = MessageWriterContextModule.useMessageWriter()
	
	return ReactModule.createElement(ChatInputBarView, {
		maximumCharacterLimit = 200,
		onSend = ReactModule.useCallback(function(Message)
			-- upvalues: UseCanSendToChannelResult (copy), TargetChannel (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), p1 (copy), RunVirtualChatCommandsModule (upval), UseMessageWriterResult (copy), MessageModule (upval), UseInExperienceLocalizationModuleResult (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), LoggerModule (upval)
			if not UseCanSendToChannelResult then return end
			if TargetChannel and Message ~= "" then
				if GetFFlagExpChatUseChatMuteStoreModule() and p1.localUserId then
					local RunVirtualChatCommandsModuleResult = RunVirtualChatCommandsModule(Message, p1.localUserId)
					
					if RunVirtualChatCommandsModuleResult then
						if UseMessageWriterResult then
							UseMessageWriterResult.write(MessageModule.createSystemMessage(UseInExperienceLocalizationModuleResult(RunVirtualChatCommandsModuleResult.key, if next(RunVirtualChatCommandsModuleResult.args) then RunVirtualChatCommandsModuleResult.args else nil)))
						end
						return
					end
				end
				task.spawn(function()
					-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TargetChannel (upval), Message (copy), LoggerModule (upval)
					local Success, Result = pcall(function()
						-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TargetChannel (upval), Message (upval)
						if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
							TargetChannel:SendInternalAsync(Message)
							
							return
						else
							TargetChannel:SendAsync(Message)
						end
					end)
					
					if not Success then
						LoggerModule:warning("SendAsync failed: {}", Result)
					end
				end)
			end
		end, {
			TargetChannel,
			UseCanSendToChannelResult,
			UseInExperienceLocalizationModuleResult,
			p1.localUserId,
			UseMessageWriterResult
		}),
		canLocalUserChat = (p1.canLocalUserChat == nil or p1.canLocalUserChat) and (TargetChannel ~= nil and UseCanSendToChannelResult),
		textSize = UseTokensResult.Typography.CaptionMedium.FontSize,
		placeholderText = UseMemoResult.placeholder,
		disabledChatPlaceholderText = if TargetChannel == nil then UseMemoResult.chatUnavailable elseif UseCanSendToChannelResult then UseMemoResult.disabled else UseMemoResult.readOnly,
		autocomplete = ReactModule.useMemo(function()
			return { commands = nil, emojis = true }
		end, {})
	})
end