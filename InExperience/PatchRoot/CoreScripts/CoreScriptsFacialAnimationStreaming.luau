local _ = game:GetService("VRService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local appStorageService = game:GetService("AppStorageService")
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("RobloxReplicatedStorage")
local robloxGui = coreGuiService.RobloxGui
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local default = require(corePackagesService.Workspace.Packages.CallProtocol).CallProtocol.default
local enums = require(corePackagesService.Workspace.Packages.CallProtocol).Enums
local loadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature = game:GetEngineFeature("LoadStreamAnimationReplaceErrorsWithTelemetryFeature")
local faceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature = game:GetEngineFeature("FaceAnimatorNotifyLODRecommendCameraInputDisable")
local facialAnimationStreamingClearTrackImprovementsV2 = game:DefineFastFlag("FacialAnimationStreamingClearTrackImprovementsV2", false)
game:DefineFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving", false)
game:DefineFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator", false)
game:DefineFastFlag("StopStreamTrackOnDeath", false)
game:DefineFastFlag("FacialAnimationStreamingClearAllConnectionsFix2", false)
game:DefineFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C", false)
game:DefineFastFlag("FacialAnimationStreamingFixNilMutedCheck", false)
local getFFlagAvatarChatServiceEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local var1 = if getFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil
local faceAnimatorService = game:GetService("FaceAnimatorService")
local UXForCameraPerformanceEnabled = game:DefineFastFlag("UXForCameraPerformanceEnabled", false)
local disableCameraOnLowspecAndroidCalls = game:DefineFastFlag("DisableCameraOnLowspecAndroidCalls", false)
local UXForCameraPerformanceSessionDelay = game:DefineFastInt("UXForCameraPerformanceSessionDelay", 300)
local UXForCameraPerformanceDeviceDelay = game:DefineFastInt("UXForCameraPerformanceDeviceDelay", 43200)
local getFFlagUXForCameraPerformanceIXPEnabledModule = require(robloxGui.Modules.Flags.GetFFlagUXForCameraPerformanceIXPEnabled)
local getFStringUXForCameraPerformanceIXPLayerNameModule = require(robloxGui.Modules.Flags.GetFStringUXForCameraPerformanceIXPLayerName)
local var2 = if disableCameraOnLowspecAndroidCalls then require(robloxGui.Modules.Settings.isCamEnabledForUserAndPlace) else function()
	return true
end
local facialAnimationStreamingHeartbeatStatsModule = require(robloxGui.Modules.FacialAnimationStreaming.FacialAnimationStreamingHeartbeatStats)

if not faceAnimatorService or not var1 then return end
faceAnimatorService.FlipHeadOrientation = true
local emoteHelperModule = require(robloxGui.Modules.Emote.EmoteHelper)
local trackerMenuModule = require(robloxGui.Modules.Tracker.TrackerMenu)
local trackerPromptTypeModule = require(robloxGui.Modules.Tracker.TrackerPromptType)
local default_1 = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local t = {
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
local _ = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Message.PlaceUnavailable")
local var3 = false
local timestamp = os.time()
local t_1 = {}
local t_2 = {}
local t_3 = {}
local t_4 = {}
local t_5 = {}
local t_6 = {}
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil

local function _(p1, p2)
	-- upvalues: name (ref)
	local var9 = ""
	local var10 = ""
	
	if p2 then
		if p2.UserId then
			var9 = tostring(p2.UserId)
		end
		if p2.Name then
			var10 = p2.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", p1, var9, var10))
end

local _ = function(p1, p2)
	-- upvalues: t_4 (ref)
	if t_4[p1.UserId] and t_4[p1.UserId][p2] then
		t_4[p1.UserId][p2]:Disconnect()
		t_4[p1.UserId][p2] = nil
	end
end

local function clearAllConnections(p1)
	-- upvalues: t (ref), t_4 (ref)
	if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
		for i, v in pairs(t) do
			if t_4[p1.UserId] and t_4[p1.UserId][v] then
				t_4[p1.UserId][v]:Disconnect()
				t_4[p1.UserId][v] = nil
			end
		end
	else
		for i, v in ipairs(t) do
			if t_4[p1.UserId] and t_4[p1.UserId][v] then
				t_4[p1.UserId][v]:Disconnect()
				t_4[p1.UserId][v] = nil
			end
		end
	end
	t_4[p1.UserId] = {}
end

local function clearCharacterAnimations(p2)
	-- upvalues: name (ref), t_3 (ref), facialAnimationStreamingClearTrackImprovementsV2 (ref)
	local var9 = ""
	local var10 = ""
	
	if p2 then
		if p2.UserId then
			var9 = tostring(p2.UserId)
		end
		if p2.Name then
			var10 = p2.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", "clearCharacterAnimations", var9, var10))
	
	if t_3[p2.UserId] then
		if facialAnimationStreamingClearTrackImprovementsV2 then
			if t_3[p2.UserId].animationTrack then
				t_3[p2.UserId].animationTrack:Stop(0)
				t_3[p2.UserId].animationTrack = nil
			end
			if t_3[p2.UserId].animation then
				t_3[p2.UserId].animation = nil
			end
		elseif t_3[p2.UserId].animation then
			t_3[p2.UserId].animation:Destroy()
			t_3[p2.UserId].animation = nil
		end
		if t_3[p2.UserId].animationTrack then
			t_3[p2.UserId].animationTrack:Stop(0)
			t_3[p2.UserId].animationTrack:Destroy()
			t_3[p2.UserId].animationTrack = nil
		end
		t_3[p2.UserId] = nil
	end
end

local function getPlayerFaceControls(p2)
	return if p2 and p2.Character then p2.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
end

local function getPlayerHumanoid(p2)
	return if p2.Character then p2.Character:FindFirstChildOfClass("Humanoid") else nil
end

local function getPlayerAnimator(p2)
	local var9 = if p2.Character then p2.Character:FindFirstChildOfClass("Humanoid") else nil
	
	return if var9 then var9:FindFirstChildOfClass("Animator") else nil
end

local _ = function(a)
	-- upvalues: t_3 (ref), name (ref)
	if t_3[a.UserId] and t_3[a.UserId].animationTrack then
		local var9 = ""
		local var10 = ""
		
		if a then
			if a.UserId then
				var9 = tostring(a.UserId)
			end
			if a.Name then
				var10 = a.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var9, var10))
		t_3[a.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end

local _ = function(a)
	-- upvalues: t_3 (ref), name (ref)
	if t_3[a.UserId] and t_3[a.UserId].animationTrack then
		local var9 = ""
		local var10 = ""
		
		if a then
			if a.UserId then
				var9 = tostring(a.UserId)
			end
			if a.Name then
				var10 = a.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var9, var10))
		t_3[a.UserId].animationTrack:AdjustWeight(1, 0.5)
	end
end

local _ = function()
	-- upvalues: playersService (ref), faceAnimatorService (ref), t_3 (ref), name (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	if faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled then
		if not t_3[localPlayer.UserId] or not t_3[localPlayer.UserId].animationTrack then return end
		local var9 = ""
		local var10 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var9 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var10 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var9, var10))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
		
		return
	elseif t_3[localPlayer.UserId] and t_3[localPlayer.UserId].animationTrack then
		local var11 = ""
		local var12 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var11 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var12 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var11, var12))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end

local function handleEmote(p2, p3, p4)
	-- upvalues: name (ref), t (ref), t_4 (ref), t_3 (ref), emoteHelperModule (ref), faceAnimatorService (ref)
	local formattedText = string.format("handleEmote {isChatTriggered:%s}", tostring(p4))
	local var9 = ""
	local var10 = ""
	
	if p2 then
		if p2.UserId then
			var9 = tostring(p2.UserId)
		end
		if p2.Name then
			var10 = p2.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", formattedText, var9, var10))
	
	if p3 then
		local emoteFinished = t.EmoteFinished
		
		if t_4[p2.UserId] and t_4[p2.UserId][emoteFinished] then
			t_4[p2.UserId][emoteFinished]:Disconnect()
			t_4[p2.UserId][emoteFinished] = nil
		end
		if t_3[p2.UserId] and t_3[p2.UserId].animationTrack then
			local var11 = ""
			local var12 = ""
			
			if p2 then
				if p2.UserId then
					var11 = tostring(p2.UserId)
				end
				if p2.Name then
					var12 = p2.Name
				end
			end
			name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var11, var12))
			t_3[p2.UserId].animationTrack:AdjustWeight(0.1, 0.5)
		end
		t_4[p2.UserId][t.EmoteFinished] = emoteHelperModule.createEmoteFinishEvent(p2, p3, p4):Connect(function()
			-- upvalues: p2 (ref), t (copy), t_4 (copy), faceAnimatorService (copy), t_3 (copy), name (copy)
			local var13
			local emoteFinished = t.EmoteFinished
			
			if t_4[p2.UserId] and t_4[p2.UserId][emoteFinished] then
				t_4[p2.UserId][emoteFinished]:Disconnect()
				t_4[p2.UserId][emoteFinished] = nil
			end
			if faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled then
				var13 = p2
				
				if not t_3[var13.UserId] or not t_3[var13.UserId].animationTrack then return end
				local var14 = ""
				local var15 = ""
				
				if var13 then
					if var13.UserId then
						var14 = tostring(var13.UserId)
					end
					if var13.Name then
						var15 = var13.Name
					end
				end
				name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var14, var15))
				t_3[var13.UserId].animationTrack:AdjustWeight(1, 0.5)
				
				return
			else
				var13 = p2
				
				if t_3[var13.UserId] and t_3[var13.UserId].animationTrack then
					local var16 = ""
					local var17 = ""
					
					if var13 then
						if var13.UserId then
							var16 = tostring(var13.UserId)
						end
						if var13.Name then
							var17 = var13.Name
						end
					end
					name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var16, var17))
					t_3[var13.UserId].animationTrack:AdjustWeight(0.1, 0.5)
				end
			end
		end)
	end
end

local function onPlayerChatted(p2, p3)
	-- upvalues: emoteHelperModule (ref), handleEmote (ref)
	if if p2.Character then p2.Character:FindFirstChildOfClass("Humanoid") else nil then
		local substring = nil
		
		if string.sub(p3, 1, 3) == "/e " then
			substring = string.sub(p3, 4)
		elseif string.sub(p3, 1, 7) == "/emote " then
			substring = string.sub(p3, 8)
		end
		if substring and emoteHelperModule.LegacyDefaultEmotes[substring] then
			wait(emoteHelperModule.EMOTE_LOOP_TRANSITION_WAIT_TIME)
			local anyActiveDefaultChatTriggeredEmoteTrack = emoteHelperModule.getAnyActiveDefaultChatTriggeredEmoteTrack(p2)
			
			if anyActiveDefaultChatTriggeredEmoteTrack then
				handleEmote(p2, anyActiveDefaultChatTriggeredEmoteTrack, true)
			end
		end
	end
end

local function onAnimatorAdded(p2, p3)
	-- upvalues: t_3 (ref), name (ref), t (ref), t_4 (ref), loadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature (ref), faceAnimatorService (ref), playersService (ref), t_5 (ref)
	if not p3 then return end
	if not p3.Parent or not p3.Parent:IsA("Humanoid") then return end
	if t_3[p2.UserId] then
		local var9 = ""
		local var10 = ""
		
		if p2 then
			if p2.UserId then
				var9 = tostring(p2.UserId)
			end
			if p2.Name then
				var10 = p2.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "onAnimatorAdded already done; skipping", var9, var10))
		
		return
	else
		local animatorDataModelReady = t.AnimatorDataModelReady
		
		if t_4[p2.UserId] and t_4[p2.UserId][animatorDataModelReady] then
			t_4[p2.UserId][animatorDataModelReady]:Disconnect()
			t_4[p2.UserId][animatorDataModelReady] = nil
		end
		local var11 = function()
			-- upvalues: p3 (ref), p2 (ref), loadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature (copy), t_3 (copy), faceAnimatorService (copy), playersService (copy), name (copy), t_5 (copy)
			local t = { animation = Instance.new("TrackerStreamAnimation") }
			
			if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
				t.animationTrack = p3:LoadStreamAnimationV2(t.animation, p2)
			else
				t.animationTrack = p3:LoadStreamAnimation(t.animation)
			end
			if loadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature and not t.animationTrack then return end
			t.animationTrack.Priority = Enum.AnimationPriority.Idle
			t.animationTrack:Play(0.1, 1)
			t_3[p2.UserId] = t
			
			if p2 == playersService.LocalPlayer and not (faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled) then
				local var12 = p2
				
				if t_3[var12.UserId] and t_3[var12.UserId].animationTrack then
					local var13 = ""
					local var14 = ""
					
					if var12 then
						if var12.UserId then
							var13 = tostring(var12.UserId)
						end
						if var12.Name then
							var14 = var12.Name
						end
					end
					name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var13, var14))
					t_3[var12.UserId].animationTrack:AdjustWeight(0.1, 0.5)
				end
			end
			if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
				t_5[p2.UserId] = p3
			end
		end
		
		if p3:IsDescendantOf(game) then
			var11()
			
			return
		end
		t_4[p2.UserId][t.AnimatorDataModelReady] = p3.AncestryChanged:Connect(function(_, _)
			-- upvalues: p3 (ref), p2 (ref), t (copy), t_4 (copy), var11 (ref)
			if p3:IsDescendantOf(game) then
				local animatorDataModelReady = t.AnimatorDataModelReady
				
				if t_4[p2.UserId] and t_4[p2.UserId][animatorDataModelReady] then
					t_4[p2.UserId][animatorDataModelReady]:Disconnect()
					t_4[p2.UserId][animatorDataModelReady] = nil
				end
				var11()
			end
		end)
	end
end

local function onHumanoidAdded(p2, p3)
	-- upvalues: t (ref), t_4 (ref), handleEmote (ref), clearCharacterAnimations (ref)
	if not p3 then return end
	local playerEmoted = t.PlayerEmoted
	
	if t_4[p2.UserId] and t_4[p2.UserId][playerEmoted] then
		t_4[p2.UserId][playerEmoted]:Disconnect()
		t_4[p2.UserId][playerEmoted] = nil
	end
	t_4[p2.UserId][t.PlayerEmoted] = p3.EmoteTriggered:Connect(function(p4, p5)
		-- upvalues: handleEmote (copy), p2 (ref)
		if p4 then
			handleEmote(p2, p5, false)
		end
	end)
	
	if game:GetFastFlag("StopStreamTrackOnDeath") then
		local playerDied = t.PlayerDied
		
		if t_4[p2.UserId] and t_4[p2.UserId][playerDied] then
			t_4[p2.UserId][playerDied]:Disconnect()
			t_4[p2.UserId][playerDied] = nil
		end
		t_4[p2.UserId][t.PlayerDied] = p3.Died:Connect(function()
			-- upvalues: clearCharacterAnimations (copy), p2 (ref)
			clearCharacterAnimations(p2)
		end)
	end
end

local function onFaceControlsAdded(p2, p3)
	-- upvalues: playersService (ref), t_6 (ref), default_1 (ref), name (ref), faceAnimatorService (ref)
	assert(game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C"))
	
	if p2 ~= playersService.LocalPlayer then return end
	if t_6[p2.UserId] ~= nil and p3 == t_6[p2.UserId] then return end
	t_6[p2.UserId] = p3
	
	if t_6[p2.UserId] then
		local var9
		if game:GetFastFlag("FacialAnimationStreamingFixNilMutedCheck") then
			var9 = default_1
			
			if var9 then
				var9 = default_1.localMuted == false
				var9 = nil
			end
		else
			var9 = default_1 and not default_1.localMuted
		end
		if var9 then
			local var10 = ""
			local var11 = ""
			
			if p2 then
				if p2.UserId then
					var10 = tostring(p2.UserId)
				end
				if p2.Name then
					var11 = p2.Name
				end
			end
			name:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> enabling A2C (Mic is ON)...", var10, var11))
			faceAnimatorService.AudioAnimationEnabled = true
			
			return
		else
			local var12 = ""
			local var13 = ""
			
			if p2 then
				if p2.UserId then
					var12 = tostring(p2.UserId)
				end
				if p2.Name then
					var13 = p2.Name
				end
			end
			name:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> won't enable A2C (Mic is MUTED)...", var12, var13))
			
			return
		end
	elseif faceAnimatorService.AudioAnimationEnabled then
		local var14 = ""
		local var15 = ""
		
		if p2 then
			if p2.UserId then
				var14 = tostring(p2.UserId)
			end
			if p2.Name then
				var15 = p2.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> disabling A2C...", var14, var15))
		faceAnimatorService.AudioAnimationEnabled = false
		
		return
	else
		local var16 = ""
		local var17 = ""
		
		if p2 then
			if p2.UserId then
				var16 = tostring(p2.UserId)
			end
			if p2.Name then
				var17 = p2.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> won't disable A2C (already is disabled)...", var16, var17))
	end
end

local function onCharacterDescendantAdded(p2, p3)
	-- upvalues: onAnimatorAdded (ref), onHumanoidAdded (ref), onFaceControlsAdded (ref), getPlayerFaceControls (ref)
	if p3:IsDescendantOf(game) then
		if p3:IsA("Animator") then
			onAnimatorAdded(p2, p3)
			
			return
		elseif p3:IsA("Humanoid") then
			onHumanoidAdded(p2, p3)
			
			return
		elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and p3:IsA("MeshPart") and p3.Name == "Head" then
			onFaceControlsAdded(p2, getPlayerFaceControls(p2))
			
			return
		elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and p3:IsA("FaceControls") then
			onFaceControlsAdded(p2, p3)
		end
	end
end

local function onCharacterDescendantRemoving(p2, p3)
	-- upvalues: t_5 (ref), t (ref), t_4 (ref), clearCharacterAnimations (ref), onAnimatorAdded (ref), onFaceControlsAdded (ref), getPlayerFaceControls (ref)
	if p3:IsA("Animator") then
		if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
			if p3 == t_5[p2.UserId] then
				local animatorDataModelReady = t.AnimatorDataModelReady
				
				if t_4[p2.UserId] and t_4[p2.UserId][animatorDataModelReady] then
					t_4[p2.UserId][animatorDataModelReady]:Disconnect()
					t_4[p2.UserId][animatorDataModelReady] = nil
				end
				clearCharacterAnimations(p2)
				t_5[p2.UserId] = nil
				
				if game:GetFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator") then
					local var9 = if p2.Character then p2.Character:FindFirstChildOfClass("Humanoid") else nil
					local var10 = if var9 then var9:FindFirstChildOfClass("Animator") else nil
					
					if var10 then
						onAnimatorAdded(p2, var10)
						
						return
					end
				end
			end
		else
			local animatorDataModelReady = t.AnimatorDataModelReady
			
			if t_4[p2.UserId] and t_4[p2.UserId][animatorDataModelReady] then
				t_4[p2.UserId][animatorDataModelReady]:Disconnect()
				t_4[p2.UserId][animatorDataModelReady] = nil
			end
			clearCharacterAnimations(p2)
			
			return
		end
	elseif p3:IsA("Humanoid") then
		local playerEmoted = t.PlayerEmoted
		
		if t_4[p2.UserId] and t_4[p2.UserId][playerEmoted] then
			t_4[p2.UserId][playerEmoted]:Disconnect()
			t_4[p2.UserId][playerEmoted] = nil
		end
		if game:GetFastFlag("StopStreamTrackOnDeath") then
			local playerDied = t.PlayerDied
			
			if t_4[p2.UserId] and t_4[p2.UserId][playerDied] then
				t_4[p2.UserId][playerDied]:Disconnect()
				t_4[p2.UserId][playerDied] = nil
				
				return
			end
		end
	elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and (p3:IsA("MeshPart") and p3.Name == "Head" or p3:IsA("FaceControls")) then
		onFaceControlsAdded(p2, getPlayerFaceControls(p2))
	end
end

local function onCharacterAdded(p2, p3)
	-- upvalues: name (ref), t (ref), t_4 (ref), onCharacterDescendantAdded (ref), onCharacterDescendantRemoving (ref), onFaceControlsAdded (ref), getPlayerFaceControls (ref), onHumanoidAdded (ref), getPlayerHumanoid (ref), onAnimatorAdded (ref), getPlayerAnimator (ref)
	local var9 = ""
	local var10 = ""
	
	if p2 then
		if p2.UserId then
			var9 = tostring(p2.UserId)
		end
		if p2.Name then
			var10 = p2.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", "Player character added", var9, var10))
	local characterDescendantAdded = t.CharacterDescendantAdded
	
	if t_4[p2.UserId] and t_4[p2.UserId][characterDescendantAdded] then
		t_4[p2.UserId][characterDescendantAdded]:Disconnect()
		t_4[p2.UserId][characterDescendantAdded] = nil
	end
	local characterDescendantRemoving = t.CharacterDescendantRemoving
	
	if t_4[p2.UserId] and t_4[p2.UserId][characterDescendantRemoving] then
		t_4[p2.UserId][characterDescendantRemoving]:Disconnect()
		t_4[p2.UserId][characterDescendantRemoving] = nil
	end
	t_4[p2.UserId][t.CharacterDescendantAdded] = p3.DescendantAdded:Connect(function(p4)
		-- upvalues: onCharacterDescendantAdded (copy), p2 (ref)
		onCharacterDescendantAdded(p2, p4)
	end)
	t_4[p2.UserId][t.CharacterDescendantRemoving] = p3.DescendantRemoving:Connect(function(p4)
		-- upvalues: onCharacterDescendantRemoving (copy), p2 (ref)
		onCharacterDescendantRemoving(p2, p4)
	end)
	
	if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
		onFaceControlsAdded(p2, getPlayerFaceControls(p2))
	end
	onHumanoidAdded(p2, getPlayerHumanoid(p2))
	onAnimatorAdded(p2, getPlayerAnimator(p2))
end

local function onCharacterRemoving(p2, _)
	-- upvalues: name (ref), t (ref), t_4 (ref), clearAllConnections (ref), clearCharacterAnimations (ref)
	local var9 = ""
	local var10 = ""
	
	if p2 then
		if p2.UserId then
			var9 = tostring(p2.UserId)
		end
		if p2.Name then
			var10 = p2.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", "Player character removing", var9, var10))
	
	if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
		local characterDescendantAdded = t.CharacterDescendantAdded
		
		if t_4[p2.UserId] and t_4[p2.UserId][characterDescendantAdded] then
			t_4[p2.UserId][characterDescendantAdded]:Disconnect()
			t_4[p2.UserId][characterDescendantAdded] = nil
		end
		local characterDescendantRemoving = t.CharacterDescendantRemoving
		
		if t_4[p2.UserId] and t_4[p2.UserId][characterDescendantRemoving] then
			t_4[p2.UserId][characterDescendantRemoving]:Disconnect()
			t_4[p2.UserId][characterDescendantRemoving] = nil
		end
	else
		clearAllConnections(p2)
	end
	clearCharacterAnimations(p2)
end

local function playerUpdate(p2)
	-- upvalues: name (ref), t_2 (ref), t_3 (ref), clearAllConnections (ref), onCharacterAdded (ref), t_4 (ref), t (ref), onCharacterRemoving (ref), onPlayerChatted (ref), clearCharacterAnimations (ref)
	local var9 = ""
	local var10 = ""
	
	if p2 then
		if p2.UserId then
			var9 = tostring(p2.UserId)
		end
		if p2.Name then
			var10 = p2.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", "Player update", var9, var10))
	local userId = t_2[p2.UserId]
	
	if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") and userId and t_3[p2.UserId] then
		local var11 = ""
		local var12 = ""
		
		if p2 then
			if p2.UserId then
				var11 = tostring(p2.UserId)
			end
			if p2.Name then
				var12 = p2.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", var11, var12))
		
		return
	else
		clearAllConnections(p2)
		
		if userId then
			if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") or not t_3[p2.UserId] then
				local var13 = ""
				local var14 = ""
				
				if p2 then
					if p2.UserId then
						var13 = tostring(p2.UserId)
					end
					if p2.Name then
						var14 = p2.Name
					end
				end
				name:trace(string.format("%s {id: %s, name: %s}.", "Player update - joined", var13, var14))
				
				if p2.Character then
					onCharacterAdded(p2, p2.Character)
				end
				t_4[p2.UserId][t.CharacterAdded] = p2.CharacterAdded:Connect(function(p3)
					-- upvalues: onCharacterAdded (copy), p2 (ref)
					onCharacterAdded(p2, p3)
				end)
				t_4[p2.UserId][t.CharacterRemoving] = p2.CharacterRemoving:Connect(function(p3)
					-- upvalues: onCharacterRemoving (copy), p2 (ref)
					onCharacterRemoving(p2, p3)
				end)
				t_4[p2.UserId][t.PlayerChatted] = p2.Chatted:Connect(function(p3)
					-- upvalues: onPlayerChatted (copy), p2 (ref)
					onPlayerChatted(p2, p3)
				end)
				
				return
			else
				local var15 = ""
				local var16 = ""
				
				if p2 then
					if p2.UserId then
						var15 = tostring(p2.UserId)
					end
					if p2.Name then
						var16 = p2.Name
					end
				end
				name:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", var15, var16))
				
				return
			end
		else
			local var17 = ""
			local var18 = ""
			
			if p2 then
				if p2.UserId then
					var17 = tostring(p2.UserId)
				end
				if p2.Name then
					var18 = p2.Name
				end
			end
			name:trace(string.format("%s {id: %s, name: %s}.", "Player update - left", var17, var18))
			clearCharacterAnimations(p2)
		end
	end
end

local _ = function(p2, p3)
	-- upvalues: t_3 (ref)
	if t_3[p2] and t_3[p2].animationTrack then
		t_3[p2].animationTrack:TogglePause(p3)
	end
end

local function JoinAllExistingPlayers()
	-- upvalues: playersService (ref), t_2 (ref), playerUpdate (ref), name (ref)
	for i, v in ipairs(playersService:GetPlayers()) do
		t_2[v.UserId] = true
		playerUpdate(v)
	end
	playersService.PlayerRemoving:Connect(function(p2)
		-- upvalues: name (copy), t_2 (copy), playerUpdate (copy)
		local var9 = ""
		local var10 = ""
		
		if p2 then
			if p2.UserId then
				var9 = tostring(p2.UserId)
			end
			if p2.Name then
				var10 = p2.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Player leaving game", var9, var10))
		t_2[p2.UserId] = nil
		playerUpdate(p2)
	end)
	playersService.PlayerAdded:Connect(function(p2)
		-- upvalues: name (copy), t_2 (copy), playerUpdate (copy)
		local var9 = ""
		local var10 = ""
		
		if p2 then
			if p2.UserId then
				var9 = tostring(p2.UserId)
			end
			if p2.Name then
				var10 = p2.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Player joining game", var9, var10))
		t_2[p2.UserId] = true
		playerUpdate(p2)
	end)
end

local function ConnectStateChangeCallback()
	-- upvalues: default_1 (ref), playersService (ref), t_3 (ref), name (ref), t_1 (ref), playerUpdate (ref)
	local service = default_1:getService()
	local userId = playersService.LocalPlayer.UserId
	default_1.participantsUpdate.Event:Connect(function(p2)
		-- upvalues: userId (ref), t_3 (copy)
		for i, v in pairs(p2) do
			local var9 = tonumber(i)
			
			if var9 ~= userId then
				local isMutedLocally = v.isMutedLocally
				
				if t_3[var9] and t_3[var9].animationTrack then
					t_3[var9].animationTrack:TogglePause(isMutedLocally)
				end
			end
		end
	end)
	
	if service then
		service.ParticipantsStateChanged:Connect(function(p3, p4, _)
			-- upvalues: playersService (copy), name (copy), t_1 (copy), playerUpdate (copy)
			for i, v in ipairs(p3) do
				local var10 = playersService:GetPlayerByUserId(v)
				
				if var10 then
					local var11 = ""
					local var12 = ""
					
					if var10 then
						if var10.UserId then
							var11 = tostring(var10.UserId)
						end
						if var10.Name then
							var12 = var10.Name
						end
					end
					name:trace(string.format("%s {id: %s, name: %s}.", "Player leaving chat", var11, var12))
					t_1[var10.UserId] = nil
					playerUpdate(var10)
				end
			end
			for i, v_1 in ipairs(p4) do
				local var13 = playersService:GetPlayerByUserId(v_1)
				
				if var13 then
					local var14 = ""
					local var15 = ""
					
					if var13 then
						if var13.UserId then
							var14 = tostring(var13.UserId)
						end
						if var13.Name then
							var15 = var13.Name
						end
					end
					name:trace(string.format("%s {id: %s, name: %s}.", "Player joining chat", var14, var15))
					t_1[var13.UserId] = true
					playerUpdate(var13)
				end
			end
		end)
		
		return
	end
	name:trace("Could not find VoiceChatService")
end

local function AttemptToShowCameraPerformanceToast(p3)
	-- upvalues: getFFlagUXForCameraPerformanceIXPEnabledModule (ref), IXPServiceWrapper (ref), getFStringUXForCameraPerformanceIXPLayerNameModule (ref), timestamp (ref), UXForCameraPerformanceSessionDelay (ref), AttemptToShowCameraPerformanceToast (ref), appStorageService (ref), UXForCameraPerformanceDeviceDelay (ref), trackerMenuModule (ref), trackerPromptTypeModule (ref), rbxAnalyticsService (ref), playersService (ref)
	if getFFlagUXForCameraPerformanceIXPEnabledModule() then
		local ok, status = pcall(function()
			-- upvalues: IXPServiceWrapper (copy), getFStringUXForCameraPerformanceIXPLayerNameModule (copy)
			return IXPServiceWrapper:GetLayerData(getFStringUXForCameraPerformanceIXPLayerNameModule())
		end)
		
		if not ok then return end
		if not status then return end
		if not status.UXForCameraPerformanceEnabled then return end
	end
	local var10 = os.time() - timestamp
	
	if not p3 and var10 < UXForCameraPerformanceSessionDelay then
		task.delay(UXForCameraPerformanceSessionDelay - var10, function()
			-- upvalues: AttemptToShowCameraPerformanceToast (copy)
			AttemptToShowCameraPerformanceToast(true)
		end)
		
		return
	end
	local var11 = 0
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("CameraPerformanceUXUnixTimestamp")
	end)
	
	if ok then
		var11 = tonumber(status)
	else
		return
	end
	if os.time() - var11 < UXForCameraPerformanceDeviceDelay then
		return
	end
	pcall(function()
		-- upvalues: appStorageService (copy), var11 (write), trackerMenuModule (copy), trackerPromptTypeModule (copy), rbxAnalyticsService (copy), playersService (copy)
		appStorageService:SetItem("CameraPerformanceUXUnixTimestamp", tostring(var11))
		appStorageService:Flush()
		trackerMenuModule:showPrompt(trackerPromptTypeModule.LODCameraRecommendDisable)
		rbxAnalyticsService:SendEventDeferred("client", "avatarChat", "UXForCameraPerformanceShown", {
			userId = playersService.LocalPlayer.UserId,
			pid = tostring(game.PlaceId)
		})
	end)
end

function InitializeVoiceChat()
	-- upvalues: ConnectStateChangeCallback (ref), default_1 (ref), name (ref), var6 (write), playersService (ref), faceAnimatorService (ref)
	local var10 = function()
		-- upvalues: ConnectStateChangeCallback (copy)
		ConnectStateChangeCallback()
	end
	
	if not default_1 then
		ConnectStateChangeCallback()
		
		return
	end
	default_1:asyncInit():catch(function(_)
		-- upvalues: name (copy)
		name:trace("VoiceChat:asyncInit failed (possibly denied mic permission)")
	end):finally(var10)
	var6 = default_1.muteChanged.Event:connect(function(p3)
		-- upvalues: playersService (copy), name (copy), faceAnimatorService (copy)
		if not game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
			name:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(p3))
			faceAnimatorService.AudioAnimationEnabled = not p3
			
			return
		end
		local localPlayer = playersService.LocalPlayer
		local var11 = if localPlayer and localPlayer.Character then localPlayer.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
		name:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(p3) .. " hasFaceControls=" .. tostring(var11 ~= nil))
		faceAnimatorService.AudioAnimationEnabled = not p3 and var11 ~= nil
	end)
	local var11 = false
	
	if default_1.localMuted ~= nil then
		name:trace("Syncing audio processing with VoiceChat mute status: muted=" .. tostring(default_1.localMuted))
		var11 = not default_1.localMuted
	end
	if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
		local localPlayer = playersService.LocalPlayer
		local var12 = if localPlayer and localPlayer.Character then localPlayer.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
		name:trace("Syncing audio processing with Dynamic Head status: hasFaceControls=" .. tostring(var12 ~= nil))
		localPlayer = var11 and var12 ~= nil
		var11 = localPlayer
	end
	faceAnimatorService.AudioAnimationEnabled = var11
end

function CleanupVoiceChat()
	-- upvalues: var6 (write)
	if var6 then
		var6:Disconnect()
		var6 = nil
	end
end

function InitializeFacialAnimationStreaming(a)
	-- upvalues: var3 (write), var4 (write), faceAnimatorService (ref), name (ref), trackerMenuModule (ref), trackerPromptTypeModule (ref), disableCameraOnLowspecAndroidCalls (ref), var2 (write), getFFlagAvatarChatServiceEnabled (ref), var1 (ref), faceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature (ref), var5 (write), UXForCameraPerformanceEnabled (ref), AttemptToShowCameraPerformanceToast (ref), default (ref), enums (ref), JoinAllExistingPlayers (ref), facialAnimationStreamingHeartbeatStatsModule (ref)
	if var3 then return end
	var3 = true
	var4 = faceAnimatorService.TrackerError:Connect(function(p3)
		-- upvalues: name (copy), trackerMenuModule (copy), trackerPromptTypeModule (copy)
		name:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerError: %s", tostring(p3)), "", ""))
		
		if p3 == Enum.TrackerError.VideoNoPermission then
			trackerMenuModule:showPrompt(trackerPromptTypeModule.VideoNoPermission)
			
			return
		elseif p3 == Enum.TrackerError.VideoUnsupported then
			trackerMenuModule:showPrompt(trackerPromptTypeModule.VideoUnsupported)
			
			return
		elseif p3 == Enum.TrackerError.UnsupportedDevice then
			trackerMenuModule:showPrompt(trackerPromptTypeModule.UnsupportedDevice)
			
			return
		end
		trackerMenuModule:showPrompt(trackerPromptTypeModule.NotAvailable)
	end)
	
	if disableCameraOnLowspecAndroidCalls and not var2() then
		name:trace("Camera is disabled for user and place")
		
		return
	elseif getFFlagAvatarChatServiceEnabled() then
		faceAnimatorService:Init(var1:IsEnabled(a, Enum.AvatarChatServiceFeature.UserVideo), var1:IsEnabled(a, Enum.AvatarChatServiceFeature.UserAudio))
	end
	if faceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature then
		var5 = faceAnimatorService.TrackerPrompt:Connect(function(p3)
			-- upvalues: name (copy), UXForCameraPerformanceEnabled (copy), AttemptToShowCameraPerformanceToast (copy), trackerMenuModule (copy), trackerPromptTypeModule (copy)
			name:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerPrompt: %s", tostring(p3)), "", ""))
			
			if p3 == Enum.TrackerPromptEvent.LODCameraRecommendDisable then
				if UXForCameraPerformanceEnabled then
					AttemptToShowCameraPerformanceToast()
					
					return
				end
				trackerMenuModule:showPrompt(trackerPromptTypeModule.LODCameraRecommendDisable)
			end
		end)
	end
	default:getCallState():andThen(function(p3)
		-- upvalues: var3 (copy), enums (copy), faceAnimatorService (copy), JoinAllExistingPlayers (copy), facialAnimationStreamingHeartbeatStatsModule (copy)
		if not var3 then return end
		if p3.status == enums.CallStatus.Idle.rawValue() or p3.status == enums.CallStatus.Ringing.rawValue() then
			faceAnimatorService.VideoAnimationEnabled = false
		else
			faceAnimatorService.VideoAnimationEnabled = p3.camEnabled
		end
		InitializeVoiceChat()
		JoinAllExistingPlayers()
		facialAnimationStreamingHeartbeatStatsModule.Initialize()
	end)
end

function CleanupFacialAnimationStreaming()
	-- upvalues: var3 (write), facialAnimationStreamingHeartbeatStatsModule (ref), playersService (ref), t_2 (ref), playerUpdate (ref), var4 (write), var7 (write), var8 (write), faceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature (ref), var5 (write)
	if not var3 then return end
	var3 = false
	CleanupVoiceChat()
	facialAnimationStreamingHeartbeatStatsModule.Cleanup()
	
	for i, v in ipairs(playersService:GetPlayers()) do
		t_2[v.UserId] = nil
		playerUpdate(v)
	end
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
	if var7 then
		var7:Disconnect()
		var7 = nil
	end
	if var8 then
		var8:Disconnect()
		var8 = nil
	end
	if faceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature and var5 then
		var5:Disconnect()
		var5 = nil
	end
end

local function updateWithServiceState(p3)
	-- upvalues: name (ref), getFFlagAvatarChatServiceEnabled (ref), var1 (ref)
	name:trace(string.format("[updateWithServiceState] state: %s", tostring(p3)))
	
	if not getFFlagAvatarChatServiceEnabled() then
		CleanupFacialAnimationStreaming()
		
		return
	elseif (var1:IsEnabled(p3, Enum.AvatarChatServiceFeature.UserAudioEligible) or var1:IsEnabled(p3, Enum.AvatarChatServiceFeature.UserVideoEligible)) and var1:IsPlaceEnabled() then
		InitializeFacialAnimationStreaming(p3)
		
		return
	end
	CleanupFacialAnimationStreaming()
end

var7 = faceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function()
	-- upvalues: playersService (ref), faceAnimatorService (ref), t_3 (ref), name (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	if faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled then
		if not t_3[localPlayer.UserId] or not t_3[localPlayer.UserId].animationTrack then return end
		local var10 = ""
		local var11 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var10 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var11 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var10, var11))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
		
		return
	elseif t_3[localPlayer.UserId] and t_3[localPlayer.UserId].animationTrack then
		local var12 = ""
		local var13 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var12 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var13 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var12, var13))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end)
var8 = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function()
	-- upvalues: playersService (ref), faceAnimatorService (ref), t_3 (ref), name (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	if faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled then
		if not t_3[localPlayer.UserId] or not t_3[localPlayer.UserId].animationTrack then return end
		local var10 = ""
		local var11 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var10 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var11 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var10, var11))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
		
		return
	elseif t_3[localPlayer.UserId] and t_3[localPlayer.UserId].animationTrack then
		local var12 = ""
		local var13 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var12 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var13 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var12, var13))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end)

if getFFlagAvatarChatServiceEnabled() then
	if var1.ClientFeaturesInitialized then
		updateWithServiceState(var1.ClientFeatures)
	else
		local var10 = nil
		var10 = var1:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
			-- upvalues: updateWithServiceState (ref), var1 (ref), var10 (write)
			updateWithServiceState(var1.ClientFeatures)
			var10:Disconnect()
		end)
	end
end