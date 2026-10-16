local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local Players = game:GetService("Players")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local Default1 = require(CorePackages.Workspace.Packages.CallProtocol).CallProtocol.default
local Enums = require(CorePackages.Workspace.Packages.CallProtocol).Enums
local DebugDefaultChannelStartMuted = game:DefineFastFlag("DebugDefaultChannelStartMuted", true)
local UseNotificationServiceIsConnected = game:DefineFastFlag("UseNotificationServiceIsConnected", false)
local DefaultChannelEnableDefaultVoice = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true)
local GetFFlagSeamlessVoiceFTUXFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceFTUX
local _ = game:GetEngineFeature("VoiceServiceGenerateDefaultChannelAvailable")
local VoiceServiceEnableDefaultVoiceAvailableEngineFeature = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable")
local v1 = require(RobloxGui.Modules.VoiceChat.Logger)(script.Name)
local NewResult = require(RobloxGui.Modules.VoiceChat.Analytics).new()
local VoiceChatService = game:GetService("VoiceChatService")

local function initializeDefaultChannel(Muted) --[[ Line: 27 ]]
	-- upvalues: Default (copy), v1 (copy), NewResult (copy)
	local Service = Default:getService()
	
	if not Service then
		return nil
	end
	v1:info("Joining default channel")
	local Default1 = Service:JoinByGroupIdToken("default", Muted)
	
	if Default1 then
		NewResult:reportVoiceChatJoinResult(true, "defaultJoinSuccess")
		
		return Default1
	else
		NewResult:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error")
		
		return Default1
	end
end

if game:GetEngineFeature("NotificationServiceIsConnectedAvailable") and UseNotificationServiceIsConnected then
	if not NotificationService.IsConnected then
		v1:debug("NotificationService is not yet connected")
		NotificationService:GetPropertyChangedSignal("IsConnected"):Wait()
	end
	v1:debug("NotificationService connected")
end
if not VoiceChatService.UseNewAudioApi then
	if Players.LocalPlayer.Character then
		v1:debug("Player character already loaded")
	else
		Players.LocalPlayer.CharacterAdded:Wait()
		v1:debug("Player character loaded")
	end
end
if VoiceServiceEnableDefaultVoiceAvailableEngineFeature and DefaultChannelEnableDefaultVoice then
	local VoiceChatService1 = game:FindService("VoiceChatService")
	
	if not VoiceChatService1 then
		v1:info("VoiceChatService not found. Assuming default values.")
	elseif not VoiceChatService1.EnableDefaultVoice and not VoiceChatService1.UseNewAudioApi then
		v1:debug("Default channel is disabled.")
		NewResult:reportVoiceChatJoinResult(false, "defaultDisabled")
		
		return
	end
end
Default1:getCallState():andThen(function(Result) --[[ Line: 74 ]]
	-- upvalues: Enums (copy), DebugDefaultChannelStartMuted (copy), Default (copy), initializeDefaultChannel (copy), v1 (copy)
	local DebugDefaultChannelStartMuted1 = if Result.status == Enums.CallStatus.Idle.rawValue() or Result.status == Enums.CallStatus.Ringing.rawValue() then DebugDefaultChannelStartMuted else Result.muted
	Default:asyncInit():andThen(function() --[[ Line: 81 ]]
		-- upvalues: initializeDefaultChannel (upval), DebugDefaultChannelStartMuted1 (copy), Default (upval)
		if initializeDefaultChannel(DebugDefaultChannelStartMuted1) == false then
			Default:InitialJoinFailedPrompt()
		end
	end):catch(function() --[[ Line: 87 ]]
		-- upvalues: v1 (upval)
		v1:info("VoiceChatServiceManager did not initialize")
	end)
end)

if GetFFlagSeamlessVoiceFTUXFunction() then
	task.spawn(function() --[[ Line: 96 ]]
		-- upvalues: Default (copy)
		Default:VoiceChatFirstTimeUX(game:GetService("AppStorageService"))
	end)
end