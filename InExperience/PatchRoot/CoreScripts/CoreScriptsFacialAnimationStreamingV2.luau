local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AppStorageService = game:GetService("AppStorageService")
local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local Default = require(CorePackages.Workspace.Packages.CallProtocol).CallProtocol.default
local FaceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature = game:GetEngineFeature("FaceAnimatorNotifyLODRecommendCameraInputDisable")
local FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule = require(RobloxGui.Modules.Flags.FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2C)
local GetFFlagAvatarChatServiceEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local AvatarChatService = if GetFFlagAvatarChatServiceEnabledFunction() then game:GetService("AvatarChatService") else nil
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local FFlagUXForCameraPerformanceEnabledModule = require(RobloxGui.Modules.Flags.FFlagUXForCameraPerformanceEnabled)
local FFlagDisableCameraOnLowspecAndroidCallsModule = require(RobloxGui.Modules.Flags.FFlagDisableCameraOnLowspecAndroidCalls)
local FIntUXForCameraPerformanceSessionDelayModule = require(RobloxGui.Modules.Flags.FIntUXForCameraPerformanceSessionDelay)
local FIntUXForCameraPerformanceDeviceDelayModule = require(RobloxGui.Modules.Flags.FIntUXForCameraPerformanceDeviceDelay)
local GetFFlagUXForCameraPerformanceIXPEnabledModule = require(RobloxGui.Modules.Flags.GetFFlagUXForCameraPerformanceIXPEnabled)
local GetFStringUXForCameraPerformanceIXPLayerNameModule = require(RobloxGui.Modules.Flags.GetFStringUXForCameraPerformanceIXPLayerName)
local IsCamEnabledForUserAndPlaceModule = if FFlagDisableCameraOnLowspecAndroidCallsModule then require(RobloxGui.Modules.Settings.isCamEnabledForUserAndPlace) else function(): boolean
	return true
end
local FacialAnimationStreamingHeartbeatStatsModule = require(RobloxGui.Modules.FacialAnimationStreaming.FacialAnimationStreamingHeartbeatStats)

if not FaceAnimatorService or not AvatarChatService then return end
FaceAnimatorService.FlipHeadOrientation = true
local TrackerMenuModule = require(RobloxGui.Modules.Tracker.TrackerMenu)
local TrackerPromptTypeModule = require(RobloxGui.Modules.Tracker.TrackerPromptType)
local Default1 = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local FacialAnimationStreamingDecisionsModule = require(RobloxGui.Modules.FacialAnimationStreaming.FacialAnimationStreamingDecisions)
local Flag = false
local TrackerErrorConnection = nil
local TrackerPromptConnection = nil
local EventConnection = nil
local Connection = nil
local Connection1 = nil
local NewResult1 = require(RobloxGui.Modules.FacialAnimationStreaming.FacialAnimationStreamingPlayerTracker).new({
	Players = Players,
	FaceAnimatorService = FaceAnimatorService,
	EmoteHelper = require(RobloxGui.Modules.Emote.EmoteHelper),
	VoiceChatServiceManager = Default1,
	log = NewResult
})

local function _(p1, Player: Player)
	-- upvalues: NewResult (copy)
	local v1 = ""
	local Name = ""
	
	if Player then
		if Player.UserId then
			v1 = tostring(Player.UserId)
		end
		if Player.Name then
			Name = Player.Name
		end
	end
	NewResult:trace(string.format("%s {id: %s, name: %s}.", p1, v1, Name))
end

local GetPlayerFaceControlsFunction = NewResult1.getPlayerFaceControls
local PlayerUpdateFunction = NewResult1.playerUpdate
local ToggleMuteFunction = NewResult1.toggleMute
local UpdateStreamTrackStatusFunction = NewResult1.updateStreamTrackStatus

local _ = function()
	-- upvalues: NewResult1 (copy)
	NewResult1.joinAllExistingPlayers()
end

local function ConnectStateChangeCallback()
	-- upvalues: Default1 (copy), Players (copy), ToggleMuteFunction (copy), NewResult (copy), PlayerUpdateFunction (copy)
	local Service = Default1:getService()
	local UserId = Players.LocalPlayer.UserId
	Default1.participantsUpdate.Event:Connect(function(List)
		-- upvalues: UserId (copy), ToggleMuteFunction (upval)
		for i, value in pairs(List) do
			local Number: number? = tonumber(i)
			
			if Number ~= UserId then
				ToggleMuteFunction(Number, value.isMutedLocally)
			end
		end
	end)
	
	if Service then
		Service.ParticipantsStateChanged:Connect(function(ParticipantsLeft, ParticipantsJoined, _)
			-- upvalues: Players (upval), NewResult (upval), PlayerUpdateFunction (upval)
			for _, UserId in ipairs(ParticipantsLeft) do
				local Player = Players:GetPlayerByUserId(UserId)
				
				if Player then
					local v1 = ""
					local Name = ""
					
					if Player then
						if Player.UserId then
							v1 = tostring(Player.UserId)
						end
						if Player.Name then
							Name = Player.Name
						end
					end
					NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player leaving chat", v1, Name))
					PlayerUpdateFunction(Player)
				end
			end
			for _, UserId1 in ipairs(ParticipantsJoined) do
				local Player = Players:GetPlayerByUserId(UserId1)
				
				if Player then
					local v2 = ""
					local Name = ""
					
					if Player then
						if Player.UserId then
							v2 = tostring(Player.UserId)
						end
						if Player.Name then
							Name = Player.Name
						end
					end
					NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player joining chat", v2, Name))
					PlayerUpdateFunction(Player)
				end
			end
		end)
		
		return
	else
		NewResult:trace("Could not find VoiceChatService")
	end
end

local NewResult2 = require(RobloxGui.Modules.FacialAnimationStreaming.CameraPerformanceToast).new({
	AppStorageService = AppStorageService,
	AnalyticsService = RbxAnalyticsService,
	IXPServiceWrapper = IXPServiceWrapper,
	TrackerMenu = TrackerMenuModule,
	TrackerPromptType = TrackerPromptTypeModule,
	getLocalUserId = function()
		-- upvalues: Players (copy)
		return Players.LocalPlayer.UserId
	end,
	getPlaceId = function()
		return game.PlaceId
	end,
	ixpEnabled = GetFFlagUXForCameraPerformanceIXPEnabledModule,
	ixpLayerName = GetFStringUXForCameraPerformanceIXPLayerNameModule,
	sessionDelaySec = FIntUXForCameraPerformanceSessionDelayModule,
	deviceDelaySec = FIntUXForCameraPerformanceDeviceDelayModule,
	sessionStartUnixTime = os.time()
})

local _ = function()
	-- upvalues: NewResult2 (copy)
	NewResult2.attemptToShow()
end

function InitializeVoiceChat()
	-- upvalues: ConnectStateChangeCallback (copy), Default1 (copy), NewResult (copy), EventConnection (ref), FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule (copy), GetPlayerFaceControlsFunction (copy), Players (copy), FaceAnimatorService (copy), FacialAnimationStreamingDecisionsModule (copy)
	local function v49()
		-- upvalues: ConnectStateChangeCallback (upval)
		ConnectStateChangeCallback()
	end
	
	if not Default1 then
		ConnectStateChangeCallback()
		
		return
	end
	Default1:asyncInit():catch(function(_)
		-- upvalues: NewResult (upval)
		NewResult:trace("VoiceChat:asyncInit failed (possibly denied mic permission)")
	end):finally(v49)
	EventConnection = Default1.muteChanged.Event:connect(function(p1)
		-- upvalues: FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule (upval), GetPlayerFaceControlsFunction (upval), Players (upval), NewResult (upval), FaceAnimatorService (upval), FacialAnimationStreamingDecisionsModule (upval)
		local HasPlayerFaceControls = GetPlayerFaceControlsFunction(Players.LocalPlayer) ~= nil
		NewResult:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(p1) .. " hasFaceControls=" .. tostring(HasPlayerFaceControls))
		FaceAnimatorService.AudioAnimationEnabled = FacialAnimationStreamingDecisionsModule.shouldEnableAudioAnimation(not p1, HasPlayerFaceControls, FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule)
	end)
	local NoLocalMuted = false
	
	if Default1.localMuted ~= nil then
		NewResult:trace("Syncing audio processing with VoiceChat mute status: muted=" .. tostring(Default1.localMuted))
		NoLocalMuted = not Default1.localMuted
	end
	local HasPlayerFaceControls = GetPlayerFaceControlsFunction(Players.LocalPlayer) ~= nil
	NewResult:trace("Syncing audio processing with Dynamic Head status: hasFaceControls=" .. tostring(HasPlayerFaceControls))
	FaceAnimatorService.AudioAnimationEnabled = FacialAnimationStreamingDecisionsModule.shouldEnableAudioAnimation(NoLocalMuted, HasPlayerFaceControls, FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule)
end

function CleanupVoiceChat()
	-- upvalues: EventConnection (ref)
	if EventConnection then
		EventConnection:Disconnect()
		EventConnection = nil
	end
end

function InitializeFacialAnimationStreaming(p1)
	-- upvalues: Flag (ref), TrackerErrorConnection (ref), FaceAnimatorService (copy), NewResult (copy), TrackerMenuModule (copy), FacialAnimationStreamingDecisionsModule (copy), TrackerPromptTypeModule (copy), FFlagDisableCameraOnLowspecAndroidCallsModule (copy), IsCamEnabledForUserAndPlaceModule (ref), GetFFlagAvatarChatServiceEnabledFunction (copy), AvatarChatService (copy), FaceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature (copy), TrackerPromptConnection (ref), FFlagUXForCameraPerformanceEnabledModule (copy), NewResult2 (copy), Default (copy), NewResult1 (copy), FacialAnimationStreamingHeartbeatStatsModule (copy)
	if Flag then return end
	Flag = true
	TrackerErrorConnection = FaceAnimatorService.TrackerError:Connect(function(p2)
		-- upvalues: NewResult (upval), TrackerMenuModule (upval), FacialAnimationStreamingDecisionsModule (upval), TrackerPromptTypeModule (upval)
		NewResult:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerError: %s", (tostring(p2))), "", ""))
		TrackerMenuModule:showPrompt(FacialAnimationStreamingDecisionsModule.getTrackerErrorPrompt(p2, TrackerPromptTypeModule))
	end)
	
	if FFlagDisableCameraOnLowspecAndroidCallsModule and not IsCamEnabledForUserAndPlaceModule() then
		NewResult:trace("Camera is disabled for user and place")
		
		return
	end
	if GetFFlagAvatarChatServiceEnabledFunction() then
		FaceAnimatorService:Init(AvatarChatService:IsEnabled(p1, Enum.AvatarChatServiceFeature.UserVideo), AvatarChatService:IsEnabled(p1, Enum.AvatarChatServiceFeature.UserAudio))
	end
	if FaceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature then
		TrackerPromptConnection = FaceAnimatorService.TrackerPrompt:Connect(function(Prompt)
			-- upvalues: NewResult (upval), FFlagUXForCameraPerformanceEnabledModule (upval), NewResult2 (upval), TrackerMenuModule (upval), TrackerPromptTypeModule (upval)
			NewResult:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerPrompt: %s", (tostring(Prompt))), "", ""))
			
			if Prompt == Enum.TrackerPromptEvent.LODCameraRecommendDisable then
				if FFlagUXForCameraPerformanceEnabledModule then
					NewResult2.attemptToShow()
					
					return
				end
				TrackerMenuModule:showPrompt(TrackerPromptTypeModule.LODCameraRecommendDisable)
			end
		end)
	end
	Default:getCallState():andThen(function(Result)
		-- upvalues: Flag (upval), FaceAnimatorService (upval), FacialAnimationStreamingDecisionsModule (upval), NewResult1 (upval), FacialAnimationStreamingHeartbeatStatsModule (upval)
		if Flag then
			FaceAnimatorService.VideoAnimationEnabled = FacialAnimationStreamingDecisionsModule.getInitialVideoEnabled(Result)
			InitializeVoiceChat()
			NewResult1.joinAllExistingPlayers()
			FacialAnimationStreamingHeartbeatStatsModule.Initialize()
			
			return
		end
	end)
end

function CleanupFacialAnimationStreaming()
	-- upvalues: Flag (ref), FacialAnimationStreamingHeartbeatStatsModule (copy), NewResult1 (copy), TrackerErrorConnection (ref), Connection (ref), Connection1 (ref), FaceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature (copy), TrackerPromptConnection (ref)
	if not Flag then return end
	Flag = false
	CleanupVoiceChat()
	FacialAnimationStreamingHeartbeatStatsModule.Cleanup()
	NewResult1.leaveAllPlayers()
	
	if TrackerErrorConnection then
		TrackerErrorConnection:Disconnect()
		TrackerErrorConnection = nil
	end
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end
	if Connection1 then
		Connection1:Disconnect()
		Connection1 = nil
	end
	if FaceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature and TrackerPromptConnection then
		TrackerPromptConnection:Disconnect()
		TrackerPromptConnection = nil
	end
end

local function updateWithServiceState(ClientFeatures)
	-- upvalues: NewResult (copy), GetFFlagAvatarChatServiceEnabledFunction (copy), FacialAnimationStreamingDecisionsModule (copy), AvatarChatService (copy)
	NewResult:trace(string.format("[updateWithServiceState] state: %s", (tostring(ClientFeatures))))
	
	if not GetFFlagAvatarChatServiceEnabledFunction() then
		CleanupFacialAnimationStreaming()
		
		return
	end
	if FacialAnimationStreamingDecisionsModule.isStreamingEligible(AvatarChatService, ClientFeatures) then
		InitializeFacialAnimationStreaming(ClientFeatures)
		
		return
	else
		CleanupFacialAnimationStreaming()
	end
end

Connection = FaceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function()
	-- upvalues: UpdateStreamTrackStatusFunction (copy)
	UpdateStreamTrackStatusFunction()
end)
Connection1 = FaceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function()
	-- upvalues: UpdateStreamTrackStatusFunction (copy)
	UpdateStreamTrackStatusFunction()
end)

if GetFFlagAvatarChatServiceEnabledFunction() then
	if AvatarChatService.ClientFeaturesInitialized then
		updateWithServiceState(AvatarChatService.ClientFeatures)
	else
		local Connection2 = nil
		Connection2 = AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
			-- upvalues: updateWithServiceState (copy), AvatarChatService (copy), Connection2 (ref)
			updateWithServiceState(AvatarChatService.ClientFeatures)
			Connection2:Disconnect()
		end)
	end
end