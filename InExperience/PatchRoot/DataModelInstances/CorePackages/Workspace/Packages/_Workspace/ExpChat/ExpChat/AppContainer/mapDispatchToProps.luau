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

local function _(p0) --[[ line: 28 | named "truncateToCharLimit" ]]
	-- upvalues: configModule (ref)
	if configModule.MessageCharacterLimit < #p0 then
		return string.sub(p0, 1, configModule.MessageCharacterLimit), true
	end
	return p0, false
end

local commands = expChatSharedModule.Commands
local globalCommands = expChatSharedModule.GlobalCommands
local autoCastCommand = expChatSharedModule.Commands.autoCastCommand
local RBXWhisperCommand = expChatSharedModule.Commands.Whisper.RBXWhisperCommand
local chatInputBarResetTargetChannel = expChatSharedModule.Actions.ChatInputBarResetTargetChannel
local chatTranslationGlobalToggledModule = require(expChat.Actions.ChatTranslationGlobalToggled)
local chatTranslationMessageToggledModule = require(expChat.Actions.ChatTranslationMessageToggled)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatDictatedSpeechEnabledModule = require(expChat.Flags.FFlagExpChatDictatedSpeechEnabled)
local expChatUseVirtualCommandRunner = game:DefineFastFlag("ExpChatUseVirtualCommandRunner", false)
local getFFlagExpChatProtectedChatInternalAPIs = sharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local fFlagExpChatDictation = sharedFlagsModule.FFlagExpChatDictation

return function(p1) --[[ line: 53 ]]
	-- upvalues: playersService (ref), autoCastCommand (ref), RBXWhisperCommand (ref), promiseModule (ref), loggerModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), chatTranslationGlobalToggledModule (ref), analytics (ref), chatTranslationMessageToggledModule (ref), chatInputBarResetTargetChannel (ref), getTransparencyStoreModule (ref), runVirtualChatCommandModule (ref), commands (ref), textChatService (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), fFlagExpChatDictatedSpeechEnabledModule (ref), list (ref), configModule (ref), fFlagExpChatDictation (ref), dictationAnalyticsModule (ref), computeEditDistanceModule (ref), expChatUseVirtualCommandRunner (ref), globalCommands (ref), runGlobalChatCommandModule (ref)
	return {
		activateWhisperMode = function(p2) --[[ line: 55 ]]
			-- upvalues: playersService (copy), autoCastCommand (copy), RBXWhisperCommand (copy), promiseModule (copy), loggerModule (copy)
			local var18 = playersService:GetPlayerByUserId(p2)
			local localPlayer = playersService.LocalPlayer
			
			if not var18 then return end
			if var18 == localPlayer then
				return
			end
			assert(localPlayer, "Players.LocalPlayer should be non-nil")
			promiseModule.any({
				autoCastCommand(RBXWhisperCommand, localPlayer.UserId, "/w @" .. var18.Name)
			}):catch(function(p3) --[[ line: 71 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:debug("Could not send autoCastCommand. Error: {}", p3)
			end)
		end,
		onToggleTranslation = function(p4) --[[ line: 76 ]]
			-- upvalues: fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), p1 (ref), chatTranslationGlobalToggledModule (copy)
			if fFlagExpChatUseMessagesStore then
				getMessagesStoreModule(false).toggleGlobalTranslation(p4)
				
				return
			end
			p1(chatTranslationGlobalToggledModule(p4))
		end,
		onToggleIndividualTranslation = function(p5, p6) --[[ line: 85 ]]
			-- upvalues: playersService (copy), analytics (copy), fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), p1 (ref), chatTranslationMessageToggledModule (copy)
			analytics.FireClientAnalyticsWithEventName("MessageTranslationToggled", {
				useTranslation = p5,
				senderUserId = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil,
				localeId = if playersService.LocalPlayer then playersService.LocalPlayer.LocaleId else nil
			})
			
			if fFlagExpChatUseMessagesStore then
				getMessagesStoreModule(false).toggleMessageTranslation(p5, p6)
				
				return
			end
			p1(chatTranslationMessageToggledModule(p5, p6))
		end,
		resetTargetChannel = function() --[[ line: 102 ]]
			-- upvalues: p1 (ref), chatInputBarResetTargetChannel (copy)
			p1(chatInputBarResetTargetChannel())
		end,
		onHovered = function() --[[ line: 106 ]]
			-- upvalues: getTransparencyStoreModule (copy)
			getTransparencyStoreModule(false).resetAllTransparency()
		end,
		onUnhovered = function() --[[ line: 110 ]]
			-- upvalues: getTransparencyStoreModule (copy)
			getTransparencyStoreModule(false).resetAllTransparency()
		end,
		onSendChat = function(p7, p8, p9) --[[ line: 114 ]]
			-- upvalues: runVirtualChatCommandModule (copy), playersService (copy), commands (copy), textChatService (copy), loggerModule (copy), promiseModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), fFlagExpChatDictatedSpeechEnabledModule (copy), list (copy), configModule (copy), fFlagExpChatDictation (copy), dictationAnalyticsModule (copy), analytics (copy), computeEditDistanceModule (copy)
			if string.sub(p7, 1, 1) == "/" and runVirtualChatCommandModule(p7, if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0, commands.getVirtualLocalEnabledCommands(), "RBXGeneral") then return end
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local var20 = if chatInputBarConfiguration then chatInputBarConfiguration.TargetTextChannel else nil
			loggerModule:debug("onSendChat: {} to {}", p7, if var20 then var20.Name else "nil")
			
			if var20 then
				promiseModule.try(function() --[[ line: 135 ]]
					-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), var20 (write), p7 (ref), fFlagExpChatDictatedSpeechEnabledModule (copy), p9 (ref), list (copy), playersService (copy), configModule (copy), fFlagExpChatDictation (copy), p8 (ref), dictationAnalyticsModule (copy), analytics (copy), computeEditDistanceModule (copy)
					if getFFlagExpChatProtectedChatInternalAPIs() then
						var20:SendInternalAsync(p7)
					elseif fFlagExpChatDictatedSpeechEnabledModule and p9 then
						var20:SendDictatedSpeechAsync(p7)
					else
						var20:SendAsync(p7)
					end
					local t = {
						channelName = var20.Name,
						senderUserId = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil,
						numParticipants = list.count(var20:GetChildren(), function(p11) --[[ line: 144 ]]
							return p11:IsA("TextSource")
						end),
						isDefaultChannel = if configModule[var20.Name] then "true" else "false"
					}
					
					if fFlagExpChatDictation and p8 then
						t[dictationAnalyticsModule.Properties.SttMode] = p8.mode
						t[dictationAnalyticsModule.Properties.SttOutcome] = p8.outcome
					end
					analytics.FireClientAnalyticsWithEventName("LuaMessageSent", t)
					
					if fFlagExpChatDictation and p8 then
						local substring, var25
						local textStt = p8.textStt or ""
						local textSent = p8.textSent or p7
						
						if configModule.MessageCharacterLimit < #textStt then
							substring = string.sub(textStt, 1, configModule.MessageCharacterLimit)
							var25 = true
						else
							substring = textStt
							var25 = false
						end
						local substring_1, var27
						if configModule.MessageCharacterLimit < #textSent then
							substring_1 = string.sub(textSent, 1, configModule.MessageCharacterLimit)
							var27 = true
						else
							substring_1 = textSent
							var27 = false
						end
						dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.MessageSent, {
							[dictationAnalyticsModule.Properties.SttMode] = p8.mode,
							[dictationAnalyticsModule.Properties.SttOutcome] = p8.outcome,
							[dictationAnalyticsModule.Properties.FinalCharCount] = #textSent,
							[dictationAnalyticsModule.Properties.WasEdited] = textStt ~= textSent,
							[dictationAnalyticsModule.Properties.EditDistance] = computeEditDistanceModule(textStt, textSent),
							[dictationAnalyticsModule.Properties.TextStt] = substring,
							[dictationAnalyticsModule.Properties.TextSent] = substring_1,
							[dictationAnalyticsModule.Properties.TextSttTruncated] = var25,
							[dictationAnalyticsModule.Properties.TextSentTruncated] = var27
						})
					end
				end):catch(function(p10) --[[ line: 178 ]]
					warn(p10.error)
				end)
			else
				loggerModule:warning("TargetTextChannel was nil!")
			end
		end,
		onSendGlobalChat = function(p12, _, p13) --[[ line: 186 ]]
			-- upvalues: playersService (copy), expChatUseVirtualCommandRunner (copy), runVirtualChatCommandModule (copy), globalCommands (copy), runGlobalChatCommandModule (copy), promiseModule (copy), fFlagExpChatDictatedSpeechEnabledModule (copy), textChatService (copy)
			if string.sub(p12, 1, 1) == "/" then
				local var28 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0
				
				if if expChatUseVirtualCommandRunner then runVirtualChatCommandModule(p12, var28, globalCommands.getGlobalEnabledCommands(), "RBXGlobal") else runGlobalChatCommandModule(p12, var28) then
					return
				end
			end
			promiseModule.try(function() --[[ line: 204 ]]
				-- upvalues: fFlagExpChatDictatedSpeechEnabledModule (copy), p13 (ref), textChatService (copy), p12 (ref)
				if fFlagExpChatDictatedSpeechEnabledModule and p13 then
					textChatService:SendDictatedSpeechUniverseChatAsync(p12)
					
					return
				end
				textChatService:SendUniverseChatMessageAsync(p12, "")
			end):catch(function(p14) --[[ line: 210 ]]
				warn(p14.error)
			end)
		end
	}
end