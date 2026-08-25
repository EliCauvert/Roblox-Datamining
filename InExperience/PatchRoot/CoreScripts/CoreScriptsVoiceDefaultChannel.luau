local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local robloxGui = coreGuiService.RobloxGui
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local default_1 = require(corePackagesService.Workspace.Packages.CallProtocol).CallProtocol.default
local enums = require(corePackagesService.Workspace.Packages.CallProtocol).Enums
local debugDefaultChannelStartMuted = game:DefineFastFlag("DebugDefaultChannelStartMuted", true)
local useNotificationServiceIsConnected = game:DefineFastFlag("UseNotificationServiceIsConnected", false)
local defaultChannelEnableDefaultVoice = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true)
local getFFlagSeamlessVoiceFTUX = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceFTUX
local _ = game:GetEngineFeature("VoiceServiceGenerateDefaultChannelAvailable")
local voiceServiceEnableDefaultVoiceAvailableEngineFeature = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable")
local notificationServiceIsConnectedAvailableEngineFeature = game:GetEngineFeature("NotificationServiceIsConnectedAvailable")
local var9 = require(robloxGui.Modules.VoiceChat.Logger)(script.Name)
local var10 = require(robloxGui.Modules.VoiceChat.Analytics).new()
local voiceChatService = game:GetService("VoiceChatService")

local function initializeDefaultChannel(p0)
	-- upvalues: default (ref), var9 (ref), var10 (ref)
	local service = default:getService()
	
	if not service then
		return nil
	end
	var9:info("Joining default channel")
	local default_1 = service:JoinByGroupIdToken("default", p0)
	
	if default_1 then
		var10:reportVoiceChatJoinResult(true, "defaultJoinSuccess")
		
		return default_1
	end
	var10:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error")
	
	return default_1
end

if notificationServiceIsConnectedAvailableEngineFeature and useNotificationServiceIsConnected then
	if not notificationService.IsConnected then
		var9:debug("NotificationService is not yet connected")
		notificationService:GetPropertyChangedSignal("IsConnected"):Wait()
	end
	var9:debug("NotificationService connected")
end
if not voiceChatService.UseNewAudioApi then
	if playersService.LocalPlayer.Character then
		var9:debug("Player character already loaded")
	else
		playersService.LocalPlayer.CharacterAdded:Wait()
		var9:debug("Player character loaded")
	end
end
if voiceServiceEnableDefaultVoiceAvailableEngineFeature and defaultChannelEnableDefaultVoice then
	local voiceChatService_1 = game:FindService("VoiceChatService")
	
	if voiceChatService_1 then
		if not voiceChatService_1.EnableDefaultVoice and not voiceChatService_1.UseNewAudioApi then
			var9:debug("Default channel is disabled.")
			var10:reportVoiceChatJoinResult(false, "defaultDisabled")
			
			return
		end
	else
		var9:info("VoiceChatService not found. Assuming default values.")
	end
end
default_1:getCallState():andThen(function(p1)
	-- upvalues: enums (ref), debugDefaultChannelStartMuted (ref), default (ref), initializeDefaultChannel (ref), var9 (ref)
	local var16 = if p1.status == enums.CallStatus.Idle.rawValue() or p1.status == enums.CallStatus.Ringing.rawValue() then debugDefaultChannelStartMuted else p1.muted
	default:asyncInit():andThen(function()
		-- upvalues: initializeDefaultChannel (copy), var16 (ref), default (copy)
		if initializeDefaultChannel(var16) == false then
			default:InitialJoinFailedPrompt()
		end
	end):catch(function()
		-- upvalues: var9 (copy)
		var9:info("VoiceChatServiceManager did not initialize")
	end)
end)

if getFFlagSeamlessVoiceFTUX() then
	task.spawn(function()
		-- upvalues: default (ref)
		default:VoiceChatFirstTimeUX(game:GetService("AppStorageService"))
	end)
end