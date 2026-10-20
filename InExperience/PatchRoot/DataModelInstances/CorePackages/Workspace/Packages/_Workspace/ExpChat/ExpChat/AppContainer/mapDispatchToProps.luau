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
local ExpChatFlipDictationPriorityV2 = game:DefineFastFlag("ExpChatFlipDictationPriorityV2", false)

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
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatFixBackspaceNilTargetChannel = ExpChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local FFlagExpChatDictatedSpeechEnabledModule = require(ExpChat.Flags.FFlagExpChatDictatedSpeechEnabled)
local ExpChatUseVirtualCommandRunner = game:DefineFastFlag("ExpChatUseVirtualCommandRunner", false)
local GetFFlagExpChatProtectedChatInternalAPIsFunction = SharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local FFlagExpChatDictation = SharedFlagsModule.FFlagExpChatDictation
local FFlagExpChatDictationGrafanaMetricsModule = require(ExpChat.Flags.FFlagExpChatDictationGrafanaMetrics)

return function(Callback)
	-- upvalues: Players (copy), AutoCastCommandFunction (copy), RBXWhisperCommand (copy), PromiseModule (copy), LoggerModule (copy), GetMessagesStoreModule (copy), Analytics (copy), ChatInputBarResetTargetChannelFunction (copy), FFlagExpChatFixBackspaceNilTargetChannel (copy), GetTransparencyStoreModule (copy), RunVirtualChatCommandModule (copy), Commands (copy), TextChatService (copy), ExpChatFlipDictationPriorityV2 (copy), FFlagExpChatDictatedSpeechEnabledModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), List (copy), ConfigModule (copy), FFlagExpChatDictation (copy), DictationAnalyticsModule (copy), ComputeEditDistanceModule (copy), FFlagExpChatDictationGrafanaMetricsModule (copy), ExpChatUseVirtualCommandRunner (copy), GlobalCommands (copy), RunGlobalChatCommandModule (copy)
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
			-- upvalues: GetMessagesStoreModule (upval)
			GetMessagesStoreModule(false).toggleGlobalTranslation(p1)
		end,
		onToggleIndividualTranslation = function(UseTranslation, p1)
			-- upvalues: Players (upval), Analytics (upval), GetMessagesStoreModule (upval)
			Analytics.FireClientAnalyticsWithEventName("MessageTranslationToggled", {
				useTranslation = UseTranslation,
				senderUserId = if Players.LocalPlayer then Players.LocalPlayer.UserId else nil,
				localeId = if Players.LocalPlayer then Players.LocalPlayer.LocaleId else nil
			})
			GetMessagesStoreModule(false).toggleMessageTranslation(UseTranslation, p1)
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
		onSendChat = function(Text: string, p1, p2, TargetTextChannel)
			-- upvalues: RunVirtualChatCommandModule (upval), Players (upval), Commands (upval), TextChatService (upval), LoggerModule (upval), PromiseModule (upval), ExpChatFlipDictationPriorityV2 (upval), FFlagExpChatDictatedSpeechEnabledModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), List (upval), ConfigModule (upval), FFlagExpChatDictation (upval), DictationAnalyticsModule (upval), Analytics (upval), ComputeEditDistanceModule (upval), FFlagExpChatDictationGrafanaMetricsModule (upval)
			if string.sub(Text, 1, 1) == "/" and RunVirtualChatCommandModule(Text, Players.LocalPlayer and Players.LocalPlayer.UserId or 0, Commands.getVirtualLocalEnabledCommands(), "RBXGeneral") then return end
			local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local TargetTextChannel1 = TargetTextChannel
			
			if TargetTextChannel1 == nil and ChatInputBarConfiguration then
				TargetTextChannel1 = ChatInputBarConfiguration.TargetTextChannel
			end
			LoggerModule:debug("onSendChat: {} to {}", Text, if TargetTextChannel1 then TargetTextChannel1.Name else "nil")
			
			if TargetTextChannel1 then
				PromiseModule.try(function()
					-- upvalues: ExpChatFlipDictationPriorityV2 (upval), FFlagExpChatDictatedSpeechEnabledModule (upval), p2 (copy), TargetTextChannel1 (ref), Text (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), List (upval), Players (upval), ConfigModule (upval), FFlagExpChatDictation (upval), p1 (copy), DictationAnalyticsModule (upval), Analytics (upval), ComputeEditDistanceModule (upval), FFlagExpChatDictationGrafanaMetricsModule (upval)
					if ExpChatFlipDictationPriorityV2 then
						if FFlagExpChatDictatedSpeechEnabledModule and p2 then
							TargetTextChannel1:SendDictatedSpeechAsync(Text)
						elseif GetFFlagExpChatProtectedChatInternalAPIsFunction() then
							TargetTextChannel1:SendInternalAsync(Text)
						else
							TargetTextChannel1:SendAsync(Text)
						end
					elseif GetFFlagExpChatProtectedChatInternalAPIsFunction() then
						TargetTextChannel1:SendInternalAsync(Text)
					elseif FFlagExpChatDictatedSpeechEnabledModule and p2 then
						TargetTextChannel1:SendDictatedSpeechAsync(Text)
					else
						TargetTextChannel1:SendAsync(Text)
					end
					local config = {
						channelName = TargetTextChannel1.Name,
						senderUserId = if Players.LocalPlayer then Players.LocalPlayer.UserId else nil,
						numParticipants = List.count(TargetTextChannel1:GetChildren(), function(TextSource)
							return TextSource:IsA("TextSource")
						end),
						isDefaultChannel = if ConfigModule[TargetTextChannel1.Name] then "true" else "false"
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
						
						if FFlagExpChatDictationGrafanaMetricsModule then
							DictationAnalyticsModule.reportMessageSentCounter(p1.mode)
						end
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