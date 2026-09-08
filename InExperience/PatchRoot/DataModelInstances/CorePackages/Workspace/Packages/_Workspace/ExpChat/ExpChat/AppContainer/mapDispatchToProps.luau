local playersService = game:GetService("Players")
local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local runGlobalChatCommandModule = require(expChat.runGlobalChatCommand)
local runVirtualChatCommandModule = require(expChat.runVirtualChatCommand)
local parent = expChat.Parent
local promiseModule = require(parent.Promise)
local list = require(parent.llama).List
local expChatSharedModule = require(parent.ExpChatShared)
local analytics = expChatSharedModule.Analytics
local loggerModule = require(script.Parent.Logger)
local configModule = require(expChat.Config)
local dictationAnalyticsModule = require(expChat.ChatInput.UI.ChatInputBar.Dictation.DictationAnalytics)
local computeEditDistanceModule = require(expChat.ChatInput.UI.ChatInputBar.Dictation.computeEditDistance)
local expChatFlipDictationPriorityV2 = game:DefineFastFlag("ExpChatFlipDictationPriorityV2", false)

local function _(p1)
	-- upvalues: configModule (ref)
	if configModule.MessageCharacterLimit < #p1 then
		return string.sub(p1, 1, configModule.MessageCharacterLimit), true
	end
	return p1, false
end

local commands = expChatSharedModule.Commands
local globalCommands = expChatSharedModule.GlobalCommands
local autoCastCommand = expChatSharedModule.Commands.autoCastCommand
local RBXWhisperCommand = expChatSharedModule.Commands.Whisper.RBXWhisperCommand
local chatInputBarResetTargetChannel = expChatSharedModule.Actions.ChatInputBarResetTargetChannel
local chatTranslationGlobalToggledModule = require(expChat.Actions.ChatTranslationGlobalToggled)
local chatTranslationMessageToggledModule = require(expChat.Actions.ChatTranslationMessageToggled)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatFixBackspaceNilTargetChannel = expChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatDictatedSpeechEnabledModule = require(expChat.Flags.FFlagExpChatDictatedSpeechEnabled)
local expChatUseVirtualCommandRunner = game:DefineFastFlag("ExpChatUseVirtualCommandRunner", false)
local getFFlagExpChatProtectedChatInternalAPIs = sharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local fFlagExpChatDictation = sharedFlagsModule.FFlagExpChatDictation

return function(p1)
	-- upvalues: playersService (ref), autoCastCommand (ref), RBXWhisperCommand (ref), promiseModule (ref), loggerModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), chatTranslationGlobalToggledModule (ref), analytics (ref), chatTranslationMessageToggledModule (ref), chatInputBarResetTargetChannel (ref), fFlagExpChatFixBackspaceNilTargetChannel (ref), getTransparencyStoreModule (ref), runVirtualChatCommandModule (ref), commands (ref), textChatService (ref), expChatFlipDictationPriorityV2 (ref), fFlagExpChatDictatedSpeechEnabledModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), list (ref), configModule (ref), fFlagExpChatDictation (ref), dictationAnalyticsModule (ref), computeEditDistanceModule (ref), expChatUseVirtualCommandRunner (ref), globalCommands (ref), runGlobalChatCommandModule (ref)
	return {
		activateWhisperMode = function(p2)
			-- upvalues: playersService (copy), autoCastCommand (copy), RBXWhisperCommand (copy), promiseModule (copy), loggerModule (copy)
			local var1 = playersService:GetPlayerByUserId(p2)
			local localPlayer = playersService.LocalPlayer
			
			if not var1 then return end
			if var1 == localPlayer then
				return
			end
			assert(localPlayer, "Players.LocalPlayer should be non-nil")
			promiseModule.any({
				autoCastCommand(RBXWhisperCommand, localPlayer.UserId, "/w @" .. var19.Name)
			}):catch(function(p3)
				-- upvalues: loggerModule (copy)
				loggerModule:debug("Could not send autoCastCommand. Error: {}", p3)
			end)
		end,
		onToggleTranslation = function(p2)
			-- upvalues: fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), p1 (ref), chatTranslationGlobalToggledModule (copy)
			if fFlagExpChatUseMessagesStore then
				getMessagesStoreModule(false).toggleGlobalTranslation(p2)
				
				return
			end
			p1(chatTranslationGlobalToggledModule(p2))
		end,
		onToggleIndividualTranslation = function(p2, p3)
			-- upvalues: playersService (copy), analytics (copy), fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), p1 (ref), chatTranslationMessageToggledModule (copy)
			analytics.FireClientAnalyticsWithEventName("MessageTranslationToggled", {
				useTranslation = p2,
				senderUserId = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil,
				localeId = if playersService.LocalPlayer then playersService.LocalPlayer.LocaleId else nil
			})
			
			if fFlagExpChatUseMessagesStore then
				getMessagesStoreModule(false).toggleMessageTranslation(p2, p3)
				
				return
			end
			p1(chatTranslationMessageToggledModule(p2, p3))
		end,
		resetTargetChannel = function(value)
			-- upvalues: p1 (ref), chatInputBarResetTargetChannel (copy), fFlagExpChatFixBackspaceNilTargetChannel (copy)
			p1(chatInputBarResetTargetChannel(if fFlagExpChatFixBackspaceNilTargetChannel then value else nil))
		end,
		onHovered = function()
			-- upvalues: getTransparencyStoreModule (copy)
			getTransparencyStoreModule(false).resetAllTransparency()
		end,
		onUnhovered = function()
			-- upvalues: getTransparencyStoreModule (copy)
			getTransparencyStoreModule(false).resetAllTransparency()
		end,
		onSendChat = function(p2, p3, p4)
			-- upvalues: runVirtualChatCommandModule (copy), playersService (copy), commands (copy), textChatService (copy), loggerModule (copy), promiseModule (copy), expChatFlipDictationPriorityV2 (copy), fFlagExpChatDictatedSpeechEnabledModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), list (copy), configModule (copy), fFlagExpChatDictation (copy), dictationAnalyticsModule (copy), analytics (copy), computeEditDistanceModule (copy)
			if string.sub(p2, 1, 1) == "/" and runVirtualChatCommandModule(p2, if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0, commands.getVirtualLocalEnabledCommands(), "RBXGeneral") then return end
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local var1 = if chatInputBarConfiguration then chatInputBarConfiguration.TargetTextChannel else nil
			loggerModule:debug("onSendChat: {} to {}", p2, if var1 then var1.Name else "nil")
			
			if var1 then
				promiseModule.try(function()
					-- upvalues: expChatFlipDictationPriorityV2 (copy), fFlagExpChatDictatedSpeechEnabledModule (copy), p4 (ref), var1 (write), p2 (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), list (copy), playersService (copy), configModule (copy), fFlagExpChatDictation (copy), p3 (ref), dictationAnalyticsModule (copy), analytics (copy), computeEditDistanceModule (copy)
					if expChatFlipDictationPriorityV2 then
						if fFlagExpChatDictatedSpeechEnabledModule and p4 then
							var1:SendDictatedSpeechAsync(p2)
						elseif getFFlagExpChatProtectedChatInternalAPIs() then
							var1:SendInternalAsync(p2)
						else
							var1:SendAsync(p2)
						end
					elseif getFFlagExpChatProtectedChatInternalAPIs() then
						var1:SendInternalAsync(p2)
					elseif fFlagExpChatDictatedSpeechEnabledModule and p4 then
						var1:SendDictatedSpeechAsync(p2)
					else
						var1:SendAsync(p2)
					end
					local t = {
						channelName = var1.Name,
						senderUserId = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil,
						numParticipants = list.count(var1:GetChildren(), function(p5)
							return p5:IsA("TextSource")
						end),
						isDefaultChannel = if configModule[var1.Name] then "true" else "false"
					}
					
					if fFlagExpChatDictation and p3 then
						t[dictationAnalyticsModule.Properties.SttMode] = p3.mode
						t[dictationAnalyticsModule.Properties.SttOutcome] = p3.outcome
					end
					analytics.FireClientAnalyticsWithEventName("LuaMessageSent", t)
					
					if fFlagExpChatDictation and p3 then
						local substring, var2
						local textStt = p3.textStt or ""
						local textSent = p3.textSent or p2
						
						if configModule.MessageCharacterLimit < #textStt then
							substring = string.sub(textStt, 1, configModule.MessageCharacterLimit)
							var2 = true
						else
							substring = textStt
							var2 = false
						end
						local substring_1, var3
						if configModule.MessageCharacterLimit < #textSent then
							substring_1 = string.sub(textSent, 1, configModule.MessageCharacterLimit)
							var3 = true
						else
							substring_1 = textSent
							var3 = false
						end
						dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.MessageSent, {
							[dictationAnalyticsModule.Properties.SttMode] = p3.mode,
							[dictationAnalyticsModule.Properties.SttOutcome] = p3.outcome,
							[dictationAnalyticsModule.Properties.FinalCharCount] = #textSent,
							[dictationAnalyticsModule.Properties.WasEdited] = textStt ~= textSent,
							[dictationAnalyticsModule.Properties.EditDistance] = computeEditDistanceModule(textStt, textSent),
							[dictationAnalyticsModule.Properties.TextStt] = substring,
							[dictationAnalyticsModule.Properties.TextSent] = substring_1,
							[dictationAnalyticsModule.Properties.TextSttTruncated] = var2,
							[dictationAnalyticsModule.Properties.TextSentTruncated] = var3
						})
					end
				end):catch(function(p5)
					warn(p5.error)
				end)
			else
				loggerModule:warning("TargetTextChannel was nil!")
			end
		end,
		onSendGlobalChat = function(p2, _, p3)
			-- upvalues: playersService (copy), expChatUseVirtualCommandRunner (copy), runVirtualChatCommandModule (copy), globalCommands (copy), runGlobalChatCommandModule (copy), promiseModule (copy), fFlagExpChatDictatedSpeechEnabledModule (copy), textChatService (copy)
			if string.sub(p2, 1, 1) == "/" then
				local var1 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0
				
				if if expChatUseVirtualCommandRunner then runVirtualChatCommandModule(p2, var1, globalCommands.getGlobalEnabledCommands(), "RBXGlobal") else runGlobalChatCommandModule(p2, var1) then
					return
				end
			end
			promiseModule.try(function()
				-- upvalues: fFlagExpChatDictatedSpeechEnabledModule (copy), p3 (ref), textChatService (copy), p2 (ref)
				if fFlagExpChatDictatedSpeechEnabledModule and p3 then
					textChatService:SendDictatedSpeechUniverseChatAsync(p2)
					
					return
				end
				textChatService:SendUniverseChatMessageAsync(p2, "")
			end):catch(function(p4)
				warn(p4.error)
			end)
		end
	}
end