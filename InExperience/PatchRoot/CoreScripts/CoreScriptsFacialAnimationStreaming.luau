local _ = game:GetService("VRService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AppStorageService = game:GetService("AppStorageService")
local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("RobloxReplicatedStorage")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local Default = require(CorePackages.Workspace.Packages.CallProtocol).CallProtocol.default
local Enums = require(CorePackages.Workspace.Packages.CallProtocol).Enums
local LoadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature = game:GetEngineFeature("LoadStreamAnimationReplaceErrorsWithTelemetryFeature")
local FaceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature = game:GetEngineFeature("FaceAnimatorNotifyLODRecommendCameraInputDisable")
local FacialAnimationStreamingClearTrackImprovementsV2 = game:DefineFastFlag("FacialAnimationStreamingClearTrackImprovementsV2", false)
game:DefineFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving", false)
game:DefineFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator", false)
game:DefineFastFlag("StopStreamTrackOnDeath", false)
game:DefineFastFlag("FacialAnimationStreamingClearAllConnectionsFix2", false)
game:DefineFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C", false)
local GetFFlagAvatarChatServiceEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local AvatarChatService = if GetFFlagAvatarChatServiceEnabledFunction() then game:GetService("AvatarChatService") else nil
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local UXForCameraPerformanceEnabled = game:DefineFastFlag("UXForCameraPerformanceEnabled", false)
local DisableCameraOnLowspecAndroidCalls = game:DefineFastFlag("DisableCameraOnLowspecAndroidCalls", false)
local UXForCameraPerformanceSessionDelay = game:DefineFastInt("UXForCameraPerformanceSessionDelay", 300)
local UXForCameraPerformanceDeviceDelay = game:DefineFastInt("UXForCameraPerformanceDeviceDelay", 43200)
local GetFFlagUXForCameraPerformanceIXPEnabledModule = require(RobloxGui.Modules.Flags.GetFFlagUXForCameraPerformanceIXPEnabled)
local GetFStringUXForCameraPerformanceIXPLayerNameModule = require(RobloxGui.Modules.Flags.GetFStringUXForCameraPerformanceIXPLayerName)
local IsCamEnabledForUserAndPlaceModule = if DisableCameraOnLowspecAndroidCalls then require(RobloxGui.Modules.Settings.isCamEnabledForUserAndPlace) else function(): boolean --[[ Line: 47 ]]
	return true
end
local FacialAnimationStreamingHeartbeatStatsModule = require(RobloxGui.Modules.FacialAnimationStreaming.FacialAnimationStreamingHeartbeatStats)

if not FaceAnimatorService or not AvatarChatService then return end
FaceAnimatorService.FlipHeadOrientation = true
local EmoteHelperModule = require(RobloxGui.Modules.Emote.EmoteHelper)
local TrackerMenuModule = require(RobloxGui.Modules.Tracker.TrackerMenu)
local TrackerPromptTypeModule = require(RobloxGui.Modules.Tracker.TrackerPromptType)
local Default1 = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local Player = {
	CharacterAdded = "CharacterAdded",
	CharacterRemoving = "CharacterRemoving",
	CharacterDescendantAdded = "CharacterDescendantAdded",
	CharacterDescendantRemoving = "CharacterDescendantRemoving",
	AnimatorDataModelReady = "AnimatorDataModelReady",
	PlayerEmoted = "PlayerEmoted",
	PlayerChatted = "PlayerChatted",
	EmoteFinished = "EmoteFinished",
	PlayerDied = "PlayerDied"
}
local _ = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Message.PlaceUnavailable")
local Flag = false
local Timestamp = os.time()
local t = {}
local t1 = {}
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local TrackerErrorConnection = nil
local TrackerPromptConnection = nil
local EventConnection = nil
local Connection = nil
local Connection1 = nil

local function _(p1, Player: Player) --[[ Line: 106 | Named "playerTrace" ]]
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

local _ = function(Player: Player, p1) --[[ Line: 120 | Named "clearConnection" ]]
	-- upvalues: t3 (copy)
	if t3[Player.UserId] and t3[Player.UserId][p1] then
		t3[Player.UserId][p1]:Disconnect()
		t3[Player.UserId][p1] = nil
	end
end

local function clearAllConnections(Player1: Player) --[[ Line: 127 ]]
	-- upvalues: Player (copy), t3 (copy)
	if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
		for _, value in pairs(Player) do
			if t3[Player1.UserId] and t3[Player1.UserId][value] then
				t3[Player1.UserId][value]:Disconnect()
				t3[Player1.UserId][value] = nil
			end
		end
	else
		for _, value1 in ipairs(Player) do
			if t3[Player1.UserId] and t3[Player1.UserId][value1] then
				t3[Player1.UserId][value1]:Disconnect()
				t3[Player1.UserId][value1] = nil
			end
		end
	end
	t3[Player1.UserId] = {}
end

local function clearCharacterAnimations(Player: Player) --[[ Line: 141 ]]
	-- upvalues: NewResult (copy), t2 (copy), FacialAnimationStreamingClearTrackImprovementsV2 (copy)
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
	NewResult:trace(string.format("%s {id: %s, name: %s}.", "clearCharacterAnimations", v1, Name))
	
	if t2[Player.UserId] then
		if FacialAnimationStreamingClearTrackImprovementsV2 then
			if t2[Player.UserId].animationTrack then
				t2[Player.UserId].animationTrack:Stop(0)
				t2[Player.UserId].animationTrack = nil
			end
			if t2[Player.UserId].animation then
				t2[Player.UserId].animation = nil
			end
		else
			if t2[Player.UserId].animation then
				t2[Player.UserId].animation:Destroy()
				t2[Player.UserId].animation = nil
			end
			if t2[Player.UserId].animationTrack then
				t2[Player.UserId].animationTrack:Stop(0)
				t2[Player.UserId].animationTrack:Destroy()
				t2[Player.UserId].animationTrack = nil
			end
		end
		t2[Player.UserId] = nil
	end
end

local function getPlayerFaceControls(Player: Player) --[[ Line: 168 ]]
	return if Player and Player.Character then Player.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
end

local function getPlayerHumanoid(Player: Player) --[[ Line: 176 ]]
	return if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil
end

local function getPlayerAnimator(Player: Player) --[[ Line: 184 ]]
	local Humanoid = if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil
	
	return if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
end

local _ = function(Player: Player) --[[ Line: 193 | Named "pauseStreamingAnimationForPlayer" ]]
	-- upvalues: t2 (copy), NewResult (copy)
	if t2[Player.UserId] and t2[Player.UserId].animationTrack then
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
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v1, Name))
		t2[Player.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end

local _ = function(Player: Player) --[[ Line: 204 | Named "resumeStreamingAnimationForPlayer" ]]
	-- upvalues: t2 (copy), NewResult (copy)
	if t2[Player.UserId] and t2[Player.UserId].animationTrack then
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
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v1, Name))
		t2[Player.UserId].animationTrack:AdjustWeight(1, 0.5)
	end
end

local _ = function() --[[ Line: 211 | Named "updateStreamTrackStatus" ]]
	-- upvalues: Players (copy), FaceAnimatorService (copy), t2 (copy), NewResult (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then return end
	if FaceAnimatorService.AudioAnimationEnabled or FaceAnimatorService.VideoAnimationEnabled then
		if t2[LocalPlayer.UserId] and t2[LocalPlayer.UserId].animationTrack then
			local v1 = ""
			local Name = ""
			
			if LocalPlayer then
				if LocalPlayer.UserId then
					v1 = tostring(LocalPlayer.UserId)
				end
				if LocalPlayer.Name then
					Name = LocalPlayer.Name
				end
			end
			NewResult:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v1, Name))
			t2[LocalPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
			
			return
		end
	elseif t2[LocalPlayer.UserId] and t2[LocalPlayer.UserId].animationTrack then
		local v2 = ""
		local Name = ""
		
		if LocalPlayer then
			if LocalPlayer.UserId then
				v2 = tostring(LocalPlayer.UserId)
			end
			if LocalPlayer.Name then
				Name = LocalPlayer.Name
			end
		end
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v2, Name))
		t2[LocalPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end

local function handleEmote(Player1: Player, AnyActiveDefaultChatTriggeredEmoteTrack, p1) --[[ Line: 225 ]]
	-- upvalues: NewResult (copy), Player (copy), t3 (copy), t2 (copy), EmoteHelperModule (copy), FaceAnimatorService (copy)
	local Formatted = string.format("handleEmote {isChatTriggered:%s}", (tostring(p1)))
	local v1 = ""
	local Name = ""
	
	if Player1 then
		if Player1.UserId then
			v1 = tostring(Player1.UserId)
		end
		if Player1.Name then
			Name = Player1.Name
		end
	end
	NewResult:trace(string.format("%s {id: %s, name: %s}.", Formatted, v1, Name))
	
	if AnyActiveDefaultChatTriggeredEmoteTrack then
		local EmoteFinished = Player.EmoteFinished
		
		if t3[Player1.UserId] and t3[Player1.UserId][EmoteFinished] then
			t3[Player1.UserId][EmoteFinished]:Disconnect()
			t3[Player1.UserId][EmoteFinished] = nil
		end
		if t2[Player1.UserId] and t2[Player1.UserId].animationTrack then
			local v2 = ""
			local Name1 = ""
			
			if Player1 then
				if Player1.UserId then
					v2 = tostring(Player1.UserId)
				end
				if Player1.Name then
					Name1 = Player1.Name
				end
			end
			NewResult:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v2, Name1))
			t2[Player1.UserId].animationTrack:AdjustWeight(0.1, 0.5)
		end
		t3[Player1.UserId][Player.EmoteFinished] = EmoteHelperModule.createEmoteFinishEvent(Player1, AnyActiveDefaultChatTriggeredEmoteTrack, p1):Connect(function() --[[ Line: 240 ]]
			-- upvalues: Player1 (copy), Player (upval), t3 (upval), FaceAnimatorService (upval), t2 (upval), NewResult (upval)
			local EmoteFinished = Player.EmoteFinished
			
			if t3[Player1.UserId] and t3[Player1.UserId][EmoteFinished] then
				t3[Player1.UserId][EmoteFinished]:Disconnect()
				t3[Player1.UserId][EmoteFinished] = nil
			end
			if FaceAnimatorService.AudioAnimationEnabled or FaceAnimatorService.VideoAnimationEnabled then
				if t2[Player1.UserId] and t2[Player1.UserId].animationTrack then
					local v3 = ""
					local Name = ""
					
					if Player1 then
						if Player1.UserId then
							v3 = tostring(Player1.UserId)
						end
						if Player1.Name then
							Name = Player1.Name
						end
					end
					NewResult:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v3, Name))
					t2[Player1.UserId].animationTrack:AdjustWeight(1, 0.5)
					
					return
				end
			elseif t2[Player1.UserId] and t2[Player1.UserId].animationTrack then
				local v4 = ""
				local Name = ""
				
				if Player1 then
					if Player1.UserId then
						v4 = tostring(Player1.UserId)
					end
					if Player1.Name then
						Name = Player1.Name
					end
				end
				NewResult:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v4, Name))
				t2[Player1.UserId].animationTrack:AdjustWeight(0.1, 0.5)
			end
		end)
	end
end

local function onPlayerChatted(Player: Player, Text: string) --[[ Line: 256 ]]
	-- upvalues: EmoteHelperModule (copy), handleEmote (copy)
	if if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil then
		local Segment: string? = nil
		
		if string.sub(Text, 1, 3) == "/e " then
			Segment = string.sub(Text, 4)
		elseif string.sub(Text, 1, 7) == "/emote " then
			Segment = string.sub(Text, 8)
		end
		if Segment and EmoteHelperModule.LegacyDefaultEmotes[Segment] then
			wait(EmoteHelperModule.EMOTE_LOOP_TRANSITION_WAIT_TIME)
			local AnyActiveDefaultChatTriggeredEmoteTrack = EmoteHelperModule.getAnyActiveDefaultChatTriggeredEmoteTrack(Player)
			
			if AnyActiveDefaultChatTriggeredEmoteTrack then
				handleEmote(Player, AnyActiveDefaultChatTriggeredEmoteTrack, true)
			end
		end
	end
end

local function onAnimatorAdded(Player1: Player, Object) --[[ Line: 279 ]]
	-- upvalues: t2 (copy), NewResult (copy), Player (copy), t3 (copy), LoadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature (copy), FaceAnimatorService (copy), Players (copy), t4 (copy)
	if not Object then return end
	if not Object.Parent or not Object.Parent:IsA("Humanoid") then return end
	if t2[Player1.UserId] then
		local v1 = ""
		local Name = ""
		
		if Player1 then
			if Player1.UserId then
				v1 = tostring(Player1.UserId)
			end
			if Player1.Name then
				Name = Player1.Name
			end
		end
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "onAnimatorAdded already done; skipping", v1, Name))
		
		return
	else
		local AnimatorDataModelReady = Player.AnimatorDataModelReady
		
		if t3[Player1.UserId] and t3[Player1.UserId][AnimatorDataModelReady] then
			t3[Player1.UserId][AnimatorDataModelReady]:Disconnect()
			t3[Player1.UserId][AnimatorDataModelReady] = nil
		end
		local function v100() --[[ Line: 297 ]]
			-- upvalues: Object (copy), Player1 (copy), LoadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature (upval), t2 (upval), FaceAnimatorService (upval), Players (upval), NewResult (upval), t4 (upval)
			local config = { animation = Instance.new("TrackerStreamAnimation") }
			
			if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
				config.animationTrack = Object:LoadStreamAnimationV2(config.animation, Player1)
			else
				config.animationTrack = Object:LoadStreamAnimation(config.animation)
			end
			if LoadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature and not config.animationTrack then return end
			config.animationTrack.Priority = Enum.AnimationPriority.Idle
			config.animationTrack:Play(0.1, 1)
			t2[Player1.UserId] = config
			local AudioAnimationEnabled = FaceAnimatorService.AudioAnimationEnabled or FaceAnimatorService.VideoAnimationEnabled
			
			if Player1 == Players.LocalPlayer and not AudioAnimationEnabled and t2[Player1.UserId] and t2[Player1.UserId].animationTrack then
				local v2 = ""
				local Name = ""
				
				if Player1 then
					if Player1.UserId then
						v2 = tostring(Player1.UserId)
					end
					if Player1.Name then
						Name = Player1.Name
					end
				end
				NewResult:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v2, Name))
				t2[Player1.UserId].animationTrack:AdjustWeight(0.1, 0.5)
			end
			if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
				t4[Player1.UserId] = Object
			end
		end
		
		if Object:IsDescendantOf(game) then
			v100()
			
			return
		else
			t3[Player1.UserId][Player.AnimatorDataModelReady] = Object.AncestryChanged:Connect(function(_, _) --[[ Line: 335 ]]
				-- upvalues: Object (copy), Player1 (copy), Player (upval), t3 (upval), v100 (copy)
				if Object:IsDescendantOf(game) then
					local AnimatorDataModelReady = Player.AnimatorDataModelReady
					
					if t3[Player1.UserId] and t3[Player1.UserId][AnimatorDataModelReady] then
						t3[Player1.UserId][AnimatorDataModelReady]:Disconnect()
						t3[Player1.UserId][AnimatorDataModelReady] = nil
					end
					v100()
				end
			end)
		end
	end
end

local function onHumanoidAdded(Player1: Player, Humanoid) --[[ Line: 347 ]]
	-- upvalues: Player (copy), t3 (copy), handleEmote (copy), clearCharacterAnimations (copy)
	if not Humanoid then return end
	local PlayerEmoted = Player.PlayerEmoted
	
	if t3[Player1.UserId] and t3[Player1.UserId][PlayerEmoted] then
		t3[Player1.UserId][PlayerEmoted]:Disconnect()
		t3[Player1.UserId][PlayerEmoted] = nil
	end
	t3[Player1.UserId][Player.PlayerEmoted] = Humanoid.EmoteTriggered:Connect(function(Success, AnimationTrack) --[[ Line: 355 ]]
		-- upvalues: handleEmote (upval), Player1 (copy)
		if Success then
			handleEmote(Player1, AnimationTrack, false)
		end
	end)
	
	if game:GetFastFlag("StopStreamTrackOnDeath") then
		local PlayerDied = Player.PlayerDied
		
		if t3[Player1.UserId] and t3[Player1.UserId][PlayerDied] then
			t3[Player1.UserId][PlayerDied]:Disconnect()
			t3[Player1.UserId][PlayerDied] = nil
		end
		t3[Player1.UserId][Player.PlayerDied] = Humanoid.Died:Connect(function() --[[ Line: 365 ]]
			-- upvalues: clearCharacterAnimations (upval), Player1 (copy)
			clearCharacterAnimations(Player1)
		end)
	end
end

local function onFaceControlsAdded(Player: Player, p1) --[[ Line: 371 ]]
	-- upvalues: Players (copy), t5 (copy), Default1 (copy), NewResult (copy), FaceAnimatorService (copy)
	assert(game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C"))
	
	if Player ~= Players.LocalPlayer then return end
	if t5[Player.UserId] ~= nil and p1 == t5[Player.UserId] then return end
	t5[Player.UserId] = p1
	
	if t5[Player.UserId] then
		if Default1 and Default1.localMuted == false then
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
			NewResult:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> enabling A2C (Mic is ON)...", v1, Name))
			FaceAnimatorService.AudioAnimationEnabled = true
			
			return
		else
			local v2 = ""
			local Name1 = ""
			
			if Player then
				if Player.UserId then
					v2 = tostring(Player.UserId)
				end
				if Player.Name then
					Name1 = Player.Name
				end
			end
			NewResult:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> won't enable A2C (Mic is MUTED)...", v2, Name1))
			
			return
		end
	elseif FaceAnimatorService.AudioAnimationEnabled then
		local v3 = ""
		local Name = ""
		
		if Player then
			if Player.UserId then
				v3 = tostring(Player.UserId)
			end
			if Player.Name then
				Name = Player.Name
			end
		end
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> disabling A2C...", v3, Name))
		FaceAnimatorService.AudioAnimationEnabled = false
		
		return
	else
		local v4 = ""
		local Name2 = ""
		
		if Player then
			if Player.UserId then
				v4 = tostring(Player.UserId)
			end
			if Player.Name then
				Name2 = Player.Name
			end
		end
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> won't disable A2C (already is disabled)...", v4, Name2))
	end
end

local function onCharacterDescendantAdded(Player: Player, Object) --[[ Line: 407 ]]
	-- upvalues: onAnimatorAdded (copy), onHumanoidAdded (copy), onFaceControlsAdded (copy), getPlayerFaceControls (copy)
	if Object:IsDescendantOf(game) then
		if Object:IsA("Animator") then
			onAnimatorAdded(Player, Object)
			
			return
		end
		if Object:IsA("Humanoid") then
			onHumanoidAdded(Player, Object)
			
			return
		end
		if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and Object:IsA("MeshPart") and Object.Name == "Head" then
			onFaceControlsAdded(Player, getPlayerFaceControls(Player))
			
			return
		end
		if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and Object:IsA("FaceControls") then
			onFaceControlsAdded(Player, Object)
		end
	end
end

local function onCharacterDescendantRemoving(Player1: Player, Object) --[[ Line: 427 ]]
	-- upvalues: t4 (copy), Player (copy), t3 (copy), clearCharacterAnimations (copy), onAnimatorAdded (copy), onFaceControlsAdded (copy), getPlayerFaceControls (copy)
	if Object:IsA("Animator") then
		if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
			if Object == t4[Player1.UserId] then
				local AnimatorDataModelReady1 = Player.AnimatorDataModelReady
				
				if t3[Player1.UserId] and t3[Player1.UserId][AnimatorDataModelReady1] then
					t3[Player1.UserId][AnimatorDataModelReady1]:Disconnect()
					t3[Player1.UserId][AnimatorDataModelReady1] = nil
				end
				clearCharacterAnimations(Player1)
				t4[Player1.UserId] = nil
				
				if game:GetFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator") then
					local Humanoid = if Player1.Character then Player1.Character:FindFirstChildOfClass("Humanoid") else nil
					local Animator = if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
					
					if Animator then
						onAnimatorAdded(Player1, Animator)
						
						return
					end
				end
			end
		else
			local AnimatorDataModelReady = Player.AnimatorDataModelReady
			
			if t3[Player1.UserId] and t3[Player1.UserId][AnimatorDataModelReady] then
				t3[Player1.UserId][AnimatorDataModelReady]:Disconnect()
				t3[Player1.UserId][AnimatorDataModelReady] = nil
			end
			clearCharacterAnimations(Player1)
			
			return
		end
	elseif Object:IsA("Humanoid") then
		local PlayerEmoted = Player.PlayerEmoted
		
		if t3[Player1.UserId] and t3[Player1.UserId][PlayerEmoted] then
			t3[Player1.UserId][PlayerEmoted]:Disconnect()
			t3[Player1.UserId][PlayerEmoted] = nil
		end
		if game:GetFastFlag("StopStreamTrackOnDeath") then
			local PlayerDied = Player.PlayerDied
			
			if t3[Player1.UserId] and t3[Player1.UserId][PlayerDied] then
				t3[Player1.UserId][PlayerDied]:Disconnect()
				t3[Player1.UserId][PlayerDied] = nil
				
				return
			end
		end
	elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and (Object:IsA("MeshPart") and Object.Name == "Head" or Object:IsA("FaceControls")) then
		onFaceControlsAdded(Player1, getPlayerFaceControls(Player1))
	end
end

local function onCharacterAdded(Player1: Player, Character) --[[ Line: 460 ]]
	-- upvalues: NewResult (copy), Player (copy), t3 (copy), onCharacterDescendantAdded (copy), onCharacterDescendantRemoving (copy), onFaceControlsAdded (copy), getPlayerFaceControls (copy), onHumanoidAdded (copy), getPlayerHumanoid (copy), onAnimatorAdded (copy), getPlayerAnimator (copy)
	local v1 = ""
	local Name = ""
	
	if Player1 then
		if Player1.UserId then
			v1 = tostring(Player1.UserId)
		end
		if Player1.Name then
			Name = Player1.Name
		end
	end
	NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player character added", v1, Name))
	local CharacterDescendantAdded = Player.CharacterDescendantAdded
	
	if t3[Player1.UserId] and t3[Player1.UserId][CharacterDescendantAdded] then
		t3[Player1.UserId][CharacterDescendantAdded]:Disconnect()
		t3[Player1.UserId][CharacterDescendantAdded] = nil
	end
	local CharacterDescendantRemoving = Player.CharacterDescendantRemoving
	
	if t3[Player1.UserId] and t3[Player1.UserId][CharacterDescendantRemoving] then
		t3[Player1.UserId][CharacterDescendantRemoving]:Disconnect()
		t3[Player1.UserId][CharacterDescendantRemoving] = nil
	end
	t3[Player1.UserId][Player.CharacterDescendantAdded] = Character.DescendantAdded:Connect(function(Descendant) --[[ Line: 469 ]]
		-- upvalues: onCharacterDescendantAdded (upval), Player1 (copy)
		onCharacterDescendantAdded(Player1, Descendant)
	end)
	t3[Player1.UserId][Player.CharacterDescendantRemoving] = Character.DescendantRemoving:Connect(function(Descendant) --[[ Line: 474 ]]
		-- upvalues: onCharacterDescendantRemoving (upval), Player1 (copy)
		onCharacterDescendantRemoving(Player1, Descendant)
	end)
	
	if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
		onFaceControlsAdded(Player1, getPlayerFaceControls(Player1))
	end
	onHumanoidAdded(Player1, getPlayerHumanoid(Player1))
	onAnimatorAdded(Player1, getPlayerAnimator(Player1))
end

local function onCharacterRemoving(Player1: Player, _) --[[ Line: 488 ]]
	-- upvalues: NewResult (copy), Player (copy), t3 (copy), clearAllConnections (copy), clearCharacterAnimations (copy)
	local v1 = ""
	local Name = ""
	
	if Player1 then
		if Player1.UserId then
			v1 = tostring(Player1.UserId)
		end
		if Player1.Name then
			Name = Player1.Name
		end
	end
	NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player character removing", v1, Name))
	
	if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
		local CharacterDescendantAdded = Player.CharacterDescendantAdded
		
		if t3[Player1.UserId] and t3[Player1.UserId][CharacterDescendantAdded] then
			t3[Player1.UserId][CharacterDescendantAdded]:Disconnect()
			t3[Player1.UserId][CharacterDescendantAdded] = nil
		end
		local CharacterDescendantRemoving = Player.CharacterDescendantRemoving
		
		if t3[Player1.UserId] and t3[Player1.UserId][CharacterDescendantRemoving] then
			t3[Player1.UserId][CharacterDescendantRemoving]:Disconnect()
			t3[Player1.UserId][CharacterDescendantRemoving] = nil
		end
	else
		clearAllConnections(Player1)
	end
	clearCharacterAnimations(Player1)
end

local function playerUpdate(Player1: Player) --[[ Line: 502 ]]
	-- upvalues: NewResult (copy), t1 (copy), t2 (copy), clearAllConnections (copy), onCharacterAdded (copy), t3 (copy), Player (copy), onCharacterRemoving (copy), onPlayerChatted (copy), clearCharacterAnimations (copy)
	local v1 = ""
	local Name = ""
	
	if Player1 then
		if Player1.UserId then
			v1 = tostring(Player1.UserId)
		end
		if Player1.Name then
			Name = Player1.Name
		end
	end
	NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player update", v1, Name))
	local Entry = t1[Player1.UserId]
	
	if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") and Entry and t2[Player1.UserId] then
		local v2 = ""
		local Name1 = ""
		
		if Player1 then
			if Player1.UserId then
				v2 = tostring(Player1.UserId)
			end
			if Player1.Name then
				Name1 = Player1.Name
			end
		end
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", v2, Name1))
		
		return
	else
		clearAllConnections(Player1)
		
		if Entry then
			if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") or not t2[Player1.UserId] then
				local v3 = ""
				local Name1 = ""
				
				if Player1 then
					if Player1.UserId then
						v3 = tostring(Player1.UserId)
					end
					if Player1.Name then
						Name1 = Player1.Name
					end
				end
				NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player update - joined", v3, Name1))
				
				if Player1.Character then
					onCharacterAdded(Player1, Player1.Character)
				end
				t3[Player1.UserId][Player.CharacterAdded] = Player1.CharacterAdded:Connect(function(Character) --[[ Line: 530 ]]
					-- upvalues: onCharacterAdded (upval), Player1 (copy)
					onCharacterAdded(Player1, Character)
				end)
				t3[Player1.UserId][Player.CharacterRemoving] = Player1.CharacterRemoving:Connect(function(Character) --[[ Line: 534 ]]
					-- upvalues: onCharacterRemoving (upval), Player1 (copy)
					onCharacterRemoving(Player1, Character)
				end)
				t3[Player1.UserId][Player.PlayerChatted] = Player1.Chatted:Connect(function(Message) --[[ Line: 538 ]]
					-- upvalues: onPlayerChatted (upval), Player1 (copy)
					onPlayerChatted(Player1, Message)
				end)
				
				return
			else
				local v4 = ""
				local Name2 = ""
				
				if Player1 then
					if Player1.UserId then
						v4 = tostring(Player1.UserId)
					end
					if Player1.Name then
						Name2 = Player1.Name
					end
				end
				NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", v4, Name2))
				
				return
			end
		else
			local v5 = ""
			local Name3 = ""
			
			if Player1 then
				if Player1.UserId then
					v5 = tostring(Player1.UserId)
				end
				if Player1.Name then
					Name3 = Player1.Name
				end
			end
			NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player update - left", v5, Name3))
			clearCharacterAnimations(Player1)
		end
	end
end

local _ = function(p1, Paused) --[[ Line: 547 | Named "toggleMute" ]]
	-- upvalues: t2 (copy)
	if t2[p1] and t2[p1].animationTrack then
		t2[p1].animationTrack:TogglePause(Paused)
	end
end

local function JoinAllExistingPlayers() --[[ Line: 553 ]]
	-- upvalues: Players (copy), t1 (copy), playerUpdate (copy), NewResult (copy)
	for _, player in ipairs(Players:GetPlayers()) do
		t1[player.UserId] = true
		playerUpdate(player)
	end
	Players.PlayerRemoving:Connect(function(Player: Player) --[[ Line: 559 ]]
		-- upvalues: NewResult (upval), t1 (upval), playerUpdate (upval)
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
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player leaving game", v1, Name))
		t1[Player.UserId] = nil
		playerUpdate(Player)
	end)
	Players.PlayerAdded:Connect(function(Player: Player) --[[ Line: 565 ]]
		-- upvalues: NewResult (upval), t1 (upval), playerUpdate (upval)
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
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "Player joining game", v1, Name))
		t1[Player.UserId] = true
		playerUpdate(Player)
	end)
end

local function ConnectStateChangeCallback() --[[ Line: 572 ]]
	-- upvalues: Default1 (copy), Players (copy), t2 (copy), NewResult (copy), t (copy), playerUpdate (copy)
	local Service = Default1:getService()
	local UserId = Players.LocalPlayer.UserId
	Default1.participantsUpdate.Event:Connect(function(List) --[[ Line: 576 ]]
		-- upvalues: UserId (copy), t2 (upval)
		for i, value in pairs(List) do
			local Number: number? = tonumber(i)
			
			if Number ~= UserId then
				local IsMutedLocally = value.isMutedLocally
				
				if t2[Number] and t2[Number].animationTrack then
					t2[Number].animationTrack:TogglePause(IsMutedLocally)
				end
			end
		end
	end)
	
	if Service then
		Service.ParticipantsStateChanged:Connect(function(ParticipantsLeft, ParticipantsJoined, _) --[[ Line: 586 ]]
			-- upvalues: Players (upval), NewResult (upval), t (upval), playerUpdate (upval)
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
					t[Player.UserId] = nil
					playerUpdate(Player)
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
					t[Player.UserId] = true
					playerUpdate(Player)
				end
			end
		end)
		
		return
	else
		NewResult:trace("Could not find VoiceChatService")
	end
end

local function AttemptToShowCameraPerformanceToast(p1) --[[ Line: 612 ]]
	-- upvalues: GetFFlagUXForCameraPerformanceIXPEnabledModule (copy), IXPServiceWrapper (copy), GetFStringUXForCameraPerformanceIXPLayerNameModule (copy), Timestamp (copy), UXForCameraPerformanceSessionDelay (copy), AttemptToShowCameraPerformanceToast (copy), AppStorageService (copy), UXForCameraPerformanceDeviceDelay (copy), TrackerMenuModule (copy), TrackerPromptTypeModule (copy), RbxAnalyticsService (copy), Players (copy)
	if GetFFlagUXForCameraPerformanceIXPEnabledModule() then
		local Success, Result = pcall(function() --[[ Line: 615 ]]
			-- upvalues: IXPServiceWrapper (upval), GetFStringUXForCameraPerformanceIXPLayerNameModule (upval)
			return IXPServiceWrapper:GetLayerData(GetFStringUXForCameraPerformanceIXPLayerNameModule())
		end)
		
		if not Success then return end
		if not Result then return end
		if not Result.UXForCameraPerformanceEnabled then return end
	end
	local Elapsed = os.time() - Timestamp
	
	if not p1 and Elapsed < UXForCameraPerformanceSessionDelay then
		task.delay(UXForCameraPerformanceSessionDelay - Elapsed, function() --[[ Line: 636 ]]
			-- upvalues: AttemptToShowCameraPerformanceToast (upval)
			AttemptToShowCameraPerformanceToast(true)
		end)
		
		return
	end
	local Number: number? = 0
	local Success1, Result1 = pcall(function() --[[ Line: 644 ]]
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("CameraPerformanceUXUnixTimestamp")
	end)
	
	if not Success1 then return end
	Number = tonumber(Result1)
	if os.time() - Number >= UXForCameraPerformanceDeviceDelay then
		pcall(function() --[[ Line: 656 ]]
			-- upvalues: AppStorageService (upval), Number (ref), TrackerMenuModule (upval), TrackerPromptTypeModule (upval), RbxAnalyticsService (upval), Players (upval)
			AppStorageService:SetItem("CameraPerformanceUXUnixTimestamp", (tostring(Number)))
			AppStorageService:Flush()
			TrackerMenuModule:showPrompt(TrackerPromptTypeModule.LODCameraRecommendDisable)
			RbxAnalyticsService:SendEventDeferred("client", "avatarChat", "UXForCameraPerformanceShown", {
				userId = Players.LocalPlayer.UserId,
				pid = tostring(game.PlaceId)
			})
		end)
		
		return
	end
end

function InitializeVoiceChat() --[[ Line: 678 ]]
	-- upvalues: ConnectStateChangeCallback (copy), Default1 (copy), NewResult (copy), EventConnection (ref), Players (copy), FaceAnimatorService (copy)
	local function v161() --[[ Line: 679 ]]
		-- upvalues: ConnectStateChangeCallback (upval)
		ConnectStateChangeCallback()
	end
	
	if not Default1 then
		ConnectStateChangeCallback()
		
		return
	end
	Default1:asyncInit():catch(function(_) --[[ Line: 685 ]]
		-- upvalues: NewResult (upval)
		NewResult:trace("VoiceChat:asyncInit failed (possibly denied mic permission)")
	end):finally(v161)
	EventConnection = Default1.muteChanged.Event:connect(function(p1) --[[ Line: 691 ]]
		-- upvalues: Players (upval), NewResult (upval), FaceAnimatorService (upval)
		if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
			local LocalPlayer = Players.LocalPlayer
			local FaceControls = if LocalPlayer and LocalPlayer.Character then LocalPlayer.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
			NewResult:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(p1) .. " hasFaceControls=" .. tostring(FaceControls ~= nil))
			FaceAnimatorService.AudioAnimationEnabled = not p1 and FaceControls ~= nil
			
			return
		else
			NewResult:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(p1))
			FaceAnimatorService.AudioAnimationEnabled = not p1
		end
	end)
	local NoLocalMuted = false
	
	if Default1.localMuted ~= nil then
		NewResult:trace("Syncing audio processing with VoiceChat mute status: muted=" .. tostring(Default1.localMuted))
		NoLocalMuted = not Default1.localMuted
	end
	if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
		local LocalPlayer = Players.LocalPlayer
		local FaceControls = if LocalPlayer and LocalPlayer.Character then LocalPlayer.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
		NewResult:trace("Syncing audio processing with Dynamic Head status: hasFaceControls=" .. tostring(FaceControls ~= nil))
		NoLocalMuted = NoLocalMuted and FaceControls ~= nil
	end
	FaceAnimatorService.AudioAnimationEnabled = NoLocalMuted
end

function CleanupVoiceChat() --[[ Line: 729 ]]
	-- upvalues: EventConnection (ref)
	if EventConnection then
		EventConnection:Disconnect()
		EventConnection = nil
	end
end

function InitializeFacialAnimationStreaming(p1) --[[ Line: 736 ]]
	-- upvalues: Flag (ref), TrackerErrorConnection (ref), FaceAnimatorService (copy), NewResult (copy), TrackerMenuModule (copy), TrackerPromptTypeModule (copy), DisableCameraOnLowspecAndroidCalls (copy), IsCamEnabledForUserAndPlaceModule (ref), GetFFlagAvatarChatServiceEnabledFunction (copy), AvatarChatService (copy), FaceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature (copy), TrackerPromptConnection (ref), UXForCameraPerformanceEnabled (copy), AttemptToShowCameraPerformanceToast (copy), Default (copy), Enums (copy), JoinAllExistingPlayers (copy), FacialAnimationStreamingHeartbeatStatsModule (copy)
	if Flag then return end
	Flag = true
	TrackerErrorConnection = FaceAnimatorService.TrackerError:Connect(function(TrackerError) --[[ Line: 744 ]]
		-- upvalues: NewResult (upval), TrackerMenuModule (upval), TrackerPromptTypeModule (upval)
		NewResult:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerError: %s", (tostring(TrackerError))), "", ""))
		
		if TrackerError == Enum.TrackerError.VideoNoPermission then
			TrackerMenuModule:showPrompt(TrackerPromptTypeModule.VideoNoPermission)
			
			return
		end
		if TrackerError == Enum.TrackerError.VideoUnsupported then
			TrackerMenuModule:showPrompt(TrackerPromptTypeModule.VideoUnsupported)
			
			return
		end
		if TrackerError == Enum.TrackerError.UnsupportedDevice then
			TrackerMenuModule:showPrompt(TrackerPromptTypeModule.UnsupportedDevice)
			
			return
		else
			TrackerMenuModule:showPrompt(TrackerPromptTypeModule.NotAvailable)
		end
	end)
	
	if DisableCameraOnLowspecAndroidCalls and not IsCamEnabledForUserAndPlaceModule() then
		NewResult:trace("Camera is disabled for user and place")
		
		return
	end
	if GetFFlagAvatarChatServiceEnabledFunction() then
		FaceAnimatorService:Init(AvatarChatService:IsEnabled(p1, Enum.AvatarChatServiceFeature.UserVideo), AvatarChatService:IsEnabled(p1, Enum.AvatarChatServiceFeature.UserAudio))
	end
	if FaceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature then
		TrackerPromptConnection = FaceAnimatorService.TrackerPrompt:Connect(function(Prompt) --[[ Line: 771 ]]
			-- upvalues: NewResult (upval), UXForCameraPerformanceEnabled (upval), AttemptToShowCameraPerformanceToast (upval), TrackerMenuModule (upval), TrackerPromptTypeModule (upval)
			NewResult:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerPrompt: %s", (tostring(Prompt))), "", ""))
			
			if Prompt == Enum.TrackerPromptEvent.LODCameraRecommendDisable then
				if UXForCameraPerformanceEnabled then
					AttemptToShowCameraPerformanceToast()
					
					return
				end
				TrackerMenuModule:showPrompt(TrackerPromptTypeModule.LODCameraRecommendDisable)
			end
		end)
	end
	Default:getCallState():andThen(function(Result) --[[ Line: 784 ]]
		-- upvalues: Flag (upval), Enums (upval), FaceAnimatorService (upval), JoinAllExistingPlayers (upval), FacialAnimationStreamingHeartbeatStatsModule (upval)
		if not Flag then return end
		if Result.status == Enums.CallStatus.Idle.rawValue() or Result.status == Enums.CallStatus.Ringing.rawValue() then
			FaceAnimatorService.VideoAnimationEnabled = false
		else
			FaceAnimatorService.VideoAnimationEnabled = Result.camEnabled
		end
		InitializeVoiceChat()
		JoinAllExistingPlayers()
		FacialAnimationStreamingHeartbeatStatsModule.Initialize()
	end)
end

function CleanupFacialAnimationStreaming() --[[ Line: 809 ]]
	-- upvalues: Flag (ref), FacialAnimationStreamingHeartbeatStatsModule (copy), Players (copy), t1 (copy), playerUpdate (copy), TrackerErrorConnection (ref), Connection (ref), Connection1 (ref), FaceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature (copy), TrackerPromptConnection (ref)
	if not Flag then return end
	Flag = false
	CleanupVoiceChat()
	FacialAnimationStreamingHeartbeatStatsModule.Cleanup()
	
	for _, player in ipairs(Players:GetPlayers()) do
		t1[player.UserId] = nil
		playerUpdate(player)
	end
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

local function updateWithServiceState(ClientFeatures) --[[ Line: 847 ]]
	-- upvalues: NewResult (copy), GetFFlagAvatarChatServiceEnabledFunction (copy), AvatarChatService (copy)
	NewResult:trace(string.format("[updateWithServiceState] state: %s", (tostring(ClientFeatures))))
	
	if not GetFFlagAvatarChatServiceEnabledFunction() then
		CleanupFacialAnimationStreaming()
		
		return
	end
	if (AvatarChatService:IsEnabled(ClientFeatures, Enum.AvatarChatServiceFeature.UserAudioEligible) or AvatarChatService:IsEnabled(ClientFeatures, Enum.AvatarChatServiceFeature.UserVideoEligible)) and AvatarChatService:IsPlaceEnabled() then
		InitializeFacialAnimationStreaming(ClientFeatures)
		
		return
	else
		CleanupFacialAnimationStreaming()
	end
end

Connection = FaceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function() --[[ Line: 868 ]]
	-- upvalues: Players (copy), FaceAnimatorService (copy), t2 (copy), NewResult (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then return end
	if FaceAnimatorService.AudioAnimationEnabled or FaceAnimatorService.VideoAnimationEnabled then
		if t2[LocalPlayer.UserId] and t2[LocalPlayer.UserId].animationTrack then
			local v1 = ""
			local Name = ""
			
			if LocalPlayer then
				if LocalPlayer.UserId then
					v1 = tostring(LocalPlayer.UserId)
				end
				if LocalPlayer.Name then
					Name = LocalPlayer.Name
				end
			end
			NewResult:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v1, Name))
			t2[LocalPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
			
			return
		end
	elseif t2[LocalPlayer.UserId] and t2[LocalPlayer.UserId].animationTrack then
		local v2 = ""
		local Name = ""
		
		if LocalPlayer then
			if LocalPlayer.UserId then
				v2 = tostring(LocalPlayer.UserId)
			end
			if LocalPlayer.Name then
				Name = LocalPlayer.Name
			end
		end
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v2, Name))
		t2[LocalPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end)
Connection1 = FaceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ Line: 872 ]]
	-- upvalues: Players (copy), FaceAnimatorService (copy), t2 (copy), NewResult (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then return end
	if FaceAnimatorService.AudioAnimationEnabled or FaceAnimatorService.VideoAnimationEnabled then
		if t2[LocalPlayer.UserId] and t2[LocalPlayer.UserId].animationTrack then
			local v1 = ""
			local Name = ""
			
			if LocalPlayer then
				if LocalPlayer.UserId then
					v1 = tostring(LocalPlayer.UserId)
				end
				if LocalPlayer.Name then
					Name = LocalPlayer.Name
				end
			end
			NewResult:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v1, Name))
			t2[LocalPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
			
			return
		end
	elseif t2[LocalPlayer.UserId] and t2[LocalPlayer.UserId].animationTrack then
		local v2 = ""
		local Name = ""
		
		if LocalPlayer then
			if LocalPlayer.UserId then
				v2 = tostring(LocalPlayer.UserId)
			end
			if LocalPlayer.Name then
				Name = LocalPlayer.Name
			end
		end
		NewResult:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v2, Name))
		t2[LocalPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end)

if GetFFlagAvatarChatServiceEnabledFunction() then
	if AvatarChatService.ClientFeaturesInitialized then
		updateWithServiceState(AvatarChatService.ClientFeatures)
	else
		local Connection2 = nil
		Connection2 = AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ Line: 882 ]]
			-- upvalues: updateWithServiceState (copy), AvatarChatService (copy), Connection2 (ref)
			updateWithServiceState(AvatarChatService.ClientFeatures)
			Connection2:Disconnect()
		end)
	end
end