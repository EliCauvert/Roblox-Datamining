local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local RunGlobalChatCommandModule = require(ExpChat.runGlobalChatCommand)
local RunVirtualChatCommandModule = require(ExpChat.runVirtualChatCommand)
local Parent = ExpChat.Parent
local PromiseModule = require(Parent.Promise)
local List = require(Parent.llama).List
local ExpChatSharedModule = require(Parent.ExpChatShared)
local Analytics = ExpChatSharedModule.Analytics
local LoggerModule = require(script.Parent.Logger)
local ConfigModule = require(ExpChat.Config)
local DictationAnalyticsModule = require(ExpChat.ChatInput.UI.ChatInputBar.Dictation.DictationAnalytics)
local ComputeEditDistanceModule = require(ExpChat.ChatInput.UI.ChatInputBar.Dictation.computeEditDistance)

local function _(Text: string)
	-- upvalues: ConfigModule (copy)
	if ConfigModule.MessageCharacterLimit < #Text then
		return string.sub(Text, 1, ConfigModule.MessageCharacterLimit), true
	else
		return Text, false
	end
end

local Commands = ExpChatSharedModule.Commands
local GlobalCommands = ExpChatSharedModule.GlobalCommands
local AutoCastCommandFunction = ExpChatSharedModule.Commands.autoCastCommand
local RBXWhisperCommand = ExpChatSharedModule.Commands.Whisper.RBXWhisperCommand
local ChatInputBarResetTargetChannelFunction = ExpChatSharedModule.Actions.ChatInputBarResetTargetChannel
local ChatTranslationGlobalToggledModule = require(ExpChat.Actions.ChatTranslationGlobalToggled)
local ChatTranslationMessageToggledModule = require(ExpChat.Actions.ChatTranslationMessageToggled)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatFixBackspaceNilTargetChannel = ExpChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagExpChatDictatedSpeechEnabledModule = require(ExpChat.Flags.FFlagExpChatDictatedSpeechEnabled)
local ExpChatUseVirtualCommandRunner = game:DefineFastFlag("ExpChatUseVirtualCommandRunner", false)
local GetFFlagExpChatProtectedChatInternalAPIsFunction = SharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local FFlagExpChatDictation = SharedFlagsModule.FFlagExpChatDictation

return function(Callback)
	-- upvalues: Players (copy), AutoCastCommandFunction (copy), RBXWhisperCommand (copy), PromiseModule (copy), LoggerModule (copy), FFlagExpChatUseMessagesStore (copy), GetMessagesStoreModule (copy), ChatTranslationGlobalToggledModule (copy), Analytics (copy), ChatTranslationMessageToggledModule (copy), ChatInputBarResetTargetChannelFunction (copy), FFlagExpChatFixBackspaceNilTargetChannel (copy), GetTransparencyStoreModule (copy), RunVirtualChatCommandModule (copy), Commands (copy), TextChatService (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), FFlagExpChatDictatedSpeechEnabledModule (copy), List (copy), ConfigModule (copy), FFlagExpChatDictation (copy), DictationAnalyticsModule (copy), ComputeEditDistanceModule (copy), ExpChatUseVirtualCommandRunner (copy), GlobalCommands (copy), RunGlobalChatCommandModule (copy)
	return {
		activateWhisperMode = function(UserId)
			-- upvalues: Players (upval), AutoCastCommandFunction (upval), RBXWhisperCommand (upval), PromiseModule (upval), LoggerModule (upval)
			local Player = Players:GetPlayerByUserId(UserId)
			local LocalPlayer = Players.LocalPlayer
			
			if not Player then return end
			if Player ~= LocalPlayer then
				assert(LocalPlayer, "Players.LocalPlayer should be non-nil")
				PromiseModule.any({
					AutoCastCommandFunction(RBXWhisperCommand, LocalPlayer.UserId, "/w @" .. Player.Name)
				}):catch(function(Err)
					-- upvalues: LoggerModule (upval)
					LoggerModule:debug("Could not send autoCastCommand. Error: {}", Err)
				end)
				
				return
			end
		end,
		onToggleTranslation = function(p1)
			-- upvalues: FFlagExpChatUseMessagesStore (upval), GetMessagesStoreModule (upval), Callback (copy), ChatTranslationGlobalToggledModule (upval)
			if FFlagExpChatUseMessagesStore then
				GetMessagesStoreModule(false).toggleGlobalTranslation(p1)
				
				return
			else
				Callback(ChatTranslationGlobalToggledModule(p1))
			end
		end,
		onToggleIndividualTranslation = function(UseTranslation, p1)
			-- upvalues: Players (upval), Analytics (upval), FFlagExpChatUseMessagesStore (upval), GetMessagesStoreModule (upval), Callback (copy), ChatTranslationMessageToggledModule (upval)
			Analytics.FireClientAnalyticsWithEventName("MessageTranslationToggled", {
				useTranslation = UseTranslation,
				senderUserId = if Players.LocalPlayer then Players.LocalPlayer.UserId else nil,
				localeId = if Players.LocalPlayer then Players.LocalPlayer.LocaleId else nil
			})
			
			if FFlagExpChatUseMessagesStore then
				GetMessagesStoreModule(false).toggleMessageTranslation(UseTranslation, p1)
				
				return
			else
				Callback(ChatTranslationMessageToggledModule(UseTranslation, p1))
			end
		end,
		resetTargetChannel = function(p1)
			-- upvalues: Callback (copy), ChatInputBarResetTargetChannelFunction (upval), FFlagExpChatFixBackspaceNilTargetChannel (upval)
			Callback(ChatInputBarResetTargetChannelFunction(if FFlagExpChatFixBackspaceNilTargetChannel then p1 else nil))
		end,
		onHovered = function()
			-- upvalues: GetTransparencyStoreModule (upval)
			GetTransparencyStoreModule(false).resetAllTransparency()
		end,
		onUnhovered = function()
			-- upvalues: GetTransparencyStoreModule (upval)
			GetTransparencyStoreModule(false).resetAllTransparency()
		end,
		onSendChat = function(Text: string, p1, p2)
			-- upvalues: RunVirtualChatCommandModule (upval), Players (upval), Commands (upval), TextChatService (upval), LoggerModule (upval), PromiseModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), FFlagExpChatDictatedSpeechEnabledModule (upval), List (upval), ConfigModule (upval), FFlagExpChatDictation (upval), DictationAnalyticsModule (upval), Analytics (upval), ComputeEditDistanceModule (upval)
			if string.sub(Text, 1, 1) == "/" and RunVirtualChatCommandModule(Text, Players.LocalPlayer and Players.LocalPlayer.UserId or 0, Commands.getVirtualLocalEnabledCommands(), "RBXGeneral") then return end
			local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local TargetTextChannel = if ChatInputBarConfiguration then ChatInputBarConfiguration.TargetTextChannel else nil
			LoggerModule:debug("onSendChat: {} to {}", Text, if TargetTextChannel then TargetTextChannel.Name else "nil")
			
			if TargetTextChannel then
				PromiseModule.try(function()
					-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TargetTextChannel (ref), Text (copy), FFlagExpChatDictatedSpeechEnabledModule (upval), p2 (copy), List (upval), Players (upval), ConfigModule (upval), FFlagExpChatDictation (upval), p1 (copy), DictationAnalyticsModule (upval), Analytics (upval), ComputeEditDistanceModule (upval)
					if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
						TargetTextChannel:SendInternalAsync(Text)
					elseif FFlagExpChatDictatedSpeechEnabledModule and p2 then
						TargetTextChannel:SendDictatedSpeechAsync(Text)
					else
						TargetTextChannel:SendAsync(Text)
					end
					local config = {
						channelName = TargetTextChannel.Name,
						senderUserId = if Players.LocalPlayer then Players.LocalPlayer.UserId else nil,
						numParticipants = List.count(TargetTextChannel:GetChildren(), function(TextSource)
							return TextSource:IsA("TextSource")
						end),
						isDefaultChannel = if ConfigModule[TargetTextChannel.Name] then "true" else "false"
					}
					
					if FFlagExpChatDictation and p1 then
						config[DictationAnalyticsModule.Properties.SttMode] = p1.mode
						config[DictationAnalyticsModule.Properties.SttOutcome] = p1.outcome
					end
					Analytics.FireClientAnalyticsWithEventName("LuaMessageSent", config)
					
					if FFlagExpChatDictation and p1 then
						local TextStt = p1.textStt or ""
						local TextSent = p1.textSent or Text
						local Segment = nil
						local Flag = nil
						
						if ConfigModule.MessageCharacterLimit < #TextStt then
							Segment = string.sub(TextStt, 1, ConfigModule.MessageCharacterLimit)
							Flag = true
						else
							Segment = TextStt
							Flag = false
						end
						local Segment1 = nil
						local Flag1 = nil
						if ConfigModule.MessageCharacterLimit < #TextSent then
							Segment1 = string.sub(TextSent, 1, ConfigModule.MessageCharacterLimit)
							Flag1 = true
						else
							Segment1 = TextSent
							Flag1 = false
						end
						DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.MessageSent, {
							[DictationAnalyticsModule.Properties.SttMode] = p1.mode,
							[DictationAnalyticsModule.Properties.SttOutcome] = p1.outcome,
							[DictationAnalyticsModule.Properties.FinalCharCount] = #TextSent,
							[DictationAnalyticsModule.Properties.WasEdited] = TextStt ~= TextSent,
							[DictationAnalyticsModule.Properties.EditDistance] = ComputeEditDistanceModule(TextStt, TextSent),
							[DictationAnalyticsModule.Properties.TextStt] = Segment,
							[DictationAnalyticsModule.Properties.TextSent] = Segment1,
							[DictationAnalyticsModule.Properties.TextSttTruncated] = Flag,
							[DictationAnalyticsModule.Properties.TextSentTruncated] = Flag1
						})
					end
				end):catch(function(Err)
					warn(Err.error)
				end)
			else
				LoggerModule:warning("TargetTextChannel was nil!")
			end
		end,
		onSendGlobalChat = function(Text: string, _, p1)
			-- upvalues: Players (upval), ExpChatUseVirtualCommandRunner (upval), RunVirtualChatCommandModule (upval), GlobalCommands (upval), RunGlobalChatCommandModule (upval), PromiseModule (upval), FFlagExpChatDictatedSpeechEnabledModule (upval), TextChatService (upval)
			if string.sub(Text, 1, 1) == "/" then
				local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or 0
				
				if if ExpChatUseVirtualCommandRunner then RunVirtualChatCommandModule(Text, UserId, GlobalCommands.getGlobalEnabledCommands(), "RBXGlobal") else RunGlobalChatCommandModule(Text, UserId) then return end
			end
			PromiseModule.try(function()
				-- upvalues: FFlagExpChatDictatedSpeechEnabledModule (upval), p1 (copy), TextChatService (upval), Text (copy)
				if FFlagExpChatDictatedSpeechEnabledModule and p1 then
					TextChatService:SendDictatedSpeechUniverseChatAsync(Text)
					
					return
				else
					TextChatService:SendUniverseChatMessageAsync(Text, "")
				end
			end):catch(function(Err)
				warn(Err.error)
			end)
		end
	}
end