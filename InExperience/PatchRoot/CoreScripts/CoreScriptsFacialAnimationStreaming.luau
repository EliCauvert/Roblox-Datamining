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
local getFFlagAvatarChatServiceEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local var10 = if getFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil
local faceAnimatorService = game:GetService("FaceAnimatorService")
local UXForCameraPerformanceEnabled = game:DefineFastFlag("UXForCameraPerformanceEnabled", false)
local disableCameraOnLowspecAndroidCalls = game:DefineFastFlag("DisableCameraOnLowspecAndroidCalls", false)
local UXForCameraPerformanceSessionDelay = game:DefineFastInt("UXForCameraPerformanceSessionDelay", 300)
local UXForCameraPerformanceDeviceDelay = game:DefineFastInt("UXForCameraPerformanceDeviceDelay", 43200)
local getFFlagUXForCameraPerformanceIXPEnabledModule = require(robloxGui.Modules.Flags.GetFFlagUXForCameraPerformanceIXPEnabled)
local getFStringUXForCameraPerformanceIXPLayerNameModule = require(robloxGui.Modules.Flags.GetFStringUXForCameraPerformanceIXPLayerName)
local var18 = if disableCameraOnLowspecAndroidCalls then require(robloxGui.Modules.Settings.isCamEnabledForUserAndPlace) else function() --[[ line: 47 ]]
	return true
end
local facialAnimationStreamingHeartbeatStatsModule = require(robloxGui.Modules.FacialAnimationStreaming.FacialAnimationStreamingHeartbeatStats)

if not faceAnimatorService or not var10 then return end
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
local var24 = false
local timestamp = os.time()
local t_1 = {}
local t_2 = {}
local t_3 = {}
local t_4 = {}
local t_5 = {}
local t_6 = {}
local var32 = nil
local var33 = nil
local var34 = nil
local var35 = nil
local var36 = nil

local function _(p0, p1) --[[ line: 106 | named "playerTrace" ]]
	-- upvalues: name (ref)
	local var57 = ""
	local var58 = ""
	
	if p1 then
		if p1.UserId then
			var57 = tostring(p1.UserId)
		end
		if p1.Name then
			var58 = p1.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", p0, var57, var58))
end

local _ = function(p2, p3) --[[ line: 120 | named "clearConnection" ]]
	-- upvalues: t_4 (ref)
	if t_4[p2.UserId] and t_4[p2.UserId][p3] then
		t_4[p2.UserId][p3]:Disconnect()
		t_4[p2.UserId][p3] = nil
	end
end

local function clearAllConnections(p4) --[[ line: 127 ]]
	-- upvalues: t (ref), t_4 (ref)
	if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
		for i, v in pairs(t) do
			if t_4[p4.UserId] and t_4[p4.UserId][v] then
				t_4[p4.UserId][v]:Disconnect()
				t_4[p4.UserId][v] = nil
			end
		end
	else
		for i, v in ipairs(t) do
			if t_4[p4.UserId] and t_4[p4.UserId][v] then
				t_4[p4.UserId][v]:Disconnect()
				t_4[p4.UserId][v] = nil
			end
		end
	end
	t_4[p4.UserId] = {}
end

local function clearCharacterAnimations(p5) --[[ line: 141 ]]
	-- upvalues: name (ref), t_3 (ref), facialAnimationStreamingClearTrackImprovementsV2 (ref)
	local var59 = ""
	local var60 = ""
	
	if p5 then
		if p5.UserId then
			var59 = tostring(p5.UserId)
		end
		if p5.Name then
			var60 = p5.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", "clearCharacterAnimations", var59, var60))
	
	if t_3[p5.UserId] then
		if facialAnimationStreamingClearTrackImprovementsV2 then
			if t_3[p5.UserId].animationTrack then
				t_3[p5.UserId].animationTrack:Stop(0)
				t_3[p5.UserId].animationTrack = nil
			end
			if t_3[p5.UserId].animation then
				t_3[p5.UserId].animation = nil
			end
		elseif t_3[p5.UserId].animation then
			t_3[p5.UserId].animation:Destroy()
			t_3[p5.UserId].animation = nil
		end
		if t_3[p5.UserId].animationTrack then
			t_3[p5.UserId].animationTrack:Stop(0)
			t_3[p5.UserId].animationTrack:Destroy()
			t_3[p5.UserId].animationTrack = nil
		end
		t_3[p5.UserId] = nil
	end
end

local function getPlayerFaceControls(p6) --[[ line: 168 ]]
	return if p6 and p6.Character then p6.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
end

local function getPlayerHumanoid(p7) --[[ line: 176 ]]
	return if p7.Character then p7.Character:FindFirstChildOfClass("Humanoid") else nil
end

local function getPlayerAnimator(p8) --[[ line: 184 ]]
	local var61 = if p8.Character then p8.Character:FindFirstChildOfClass("Humanoid") else nil
	
	return if var61 then var61:FindFirstChildOfClass("Animator") else nil
end

local _ = function(a) --[[ line: 193 | named "pauseStreamingAnimationForPlayer" ]]
	-- upvalues: t_3 (ref), name (ref)
	if t_3[a.UserId] and t_3[a.UserId].animationTrack then
		local var62 = ""
		local var63 = ""
		
		if a then
			if a.UserId then
				var62 = tostring(a.UserId)
			end
			if a.Name then
				var63 = a.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var62, var63))
		t_3[a.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end

local _ = function(a) --[[ line: 204 | named "resumeStreamingAnimationForPlayer" ]]
	-- upvalues: t_3 (ref), name (ref)
	if t_3[a.UserId] and t_3[a.UserId].animationTrack then
		local var64 = ""
		local var65 = ""
		
		if a then
			if a.UserId then
				var64 = tostring(a.UserId)
			end
			if a.Name then
				var65 = a.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var64, var65))
		t_3[a.UserId].animationTrack:AdjustWeight(1, 0.5)
	end
end

local _ = function() --[[ line: 211 | named "updateStreamTrackStatus" ]]
	-- upvalues: playersService (ref), faceAnimatorService (ref), t_3 (ref), name (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	if faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled then
		if not t_3[localPlayer.UserId] or not t_3[localPlayer.UserId].animationTrack then return end
		local var66 = ""
		local var67 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var66 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var67 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var66, var67))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
		
		return
	elseif t_3[localPlayer.UserId] and t_3[localPlayer.UserId].animationTrack then
		local var68 = ""
		local var69 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var68 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var69 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var68, var69))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end

local function handleEmote(p9, p10, p11) --[[ line: 225 ]]
	-- upvalues: name (ref), t (ref), t_4 (ref), t_3 (ref), emoteHelperModule (ref), faceAnimatorService (ref)
	local formattedText = string.format("handleEmote {isChatTriggered:%s}", tostring(p11))
	local var71 = ""
	local var72 = ""
	
	if p9 then
		if p9.UserId then
			var71 = tostring(p9.UserId)
		end
		if p9.Name then
			var72 = p9.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", formattedText, var71, var72))
	
	if p10 then
		local emoteFinished = t.EmoteFinished
		
		if t_4[p9.UserId] and t_4[p9.UserId][emoteFinished] then
			t_4[p9.UserId][emoteFinished]:Disconnect()
			t_4[p9.UserId][emoteFinished] = nil
		end
		if t_3[p9.UserId] and t_3[p9.UserId].animationTrack then
			local var73 = ""
			local var74 = ""
			
			if p9 then
				if p9.UserId then
					var73 = tostring(p9.UserId)
				end
				if p9.Name then
					var74 = p9.Name
				end
			end
			name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var73, var74))
			t_3[p9.UserId].animationTrack:AdjustWeight(0.1, 0.5)
		end
		t_4[p9.UserId][t.EmoteFinished] = emoteHelperModule.createEmoteFinishEvent(p9, p10, p11):Connect(function() --[[ line: 240 ]]
			-- upvalues: p9 (ref), t (copy), t_4 (copy), faceAnimatorService (copy), t_3 (copy), name (copy)
			local var75
			local emoteFinished = t.EmoteFinished
			
			if t_4[p9.UserId] and t_4[p9.UserId][emoteFinished] then
				t_4[p9.UserId][emoteFinished]:Disconnect()
				t_4[p9.UserId][emoteFinished] = nil
			end
			if faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled then
				var75 = p9
				
				if not t_3[var75.UserId] or not t_3[var75.UserId].animationTrack then return end
				local var76 = ""
				local var77 = ""
				
				if var75 then
					if var75.UserId then
						var76 = tostring(var75.UserId)
					end
					if var75.Name then
						var77 = var75.Name
					end
				end
				name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var76, var77))
				t_3[var75.UserId].animationTrack:AdjustWeight(1, 0.5)
				
				return
			else
				var75 = p9
				
				if t_3[var75.UserId] and t_3[var75.UserId].animationTrack then
					local var78 = ""
					local var79 = ""
					
					if var75 then
						if var75.UserId then
							var78 = tostring(var75.UserId)
						end
						if var75.Name then
							var79 = var75.Name
						end
					end
					name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var78, var79))
					t_3[var75.UserId].animationTrack:AdjustWeight(0.1, 0.5)
				end
			end
		end)
	end
end

local function onPlayerChatted(p12, p13) --[[ line: 256 ]]
	-- upvalues: emoteHelperModule (ref), handleEmote (ref)
	if if p12.Character then p12.Character:FindFirstChildOfClass("Humanoid") else nil then
		local substring = nil
		
		if string.sub(p13, 1, 3) == "/e " then
			substring = string.sub(p13, 4)
		elseif string.sub(p13, 1, 7) == "/emote " then
			substring = string.sub(p13, 8)
		end
		if substring and emoteHelperModule.LegacyDefaultEmotes[substring] then
			wait(emoteHelperModule.EMOTE_LOOP_TRANSITION_WAIT_TIME)
			local anyActiveDefaultChatTriggeredEmoteTrack = emoteHelperModule.getAnyActiveDefaultChatTriggeredEmoteTrack(p12)
			
			if anyActiveDefaultChatTriggeredEmoteTrack then
				handleEmote(p12, anyActiveDefaultChatTriggeredEmoteTrack, true)
			end
		end
	end
end

local function onAnimatorAdded(p14, p15) --[[ line: 279 ]]
	-- upvalues: t_3 (ref), name (ref), t (ref), t_4 (ref), loadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature (ref), faceAnimatorService (ref), playersService (ref), t_5 (ref)
	if not p15 then return end
	if not p15.Parent or not p15.Parent:IsA("Humanoid") then return end
	if t_3[p14.UserId] then
		local var82 = ""
		local var83 = ""
		
		if p14 then
			if p14.UserId then
				var82 = tostring(p14.UserId)
			end
			if p14.Name then
				var83 = p14.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "onAnimatorAdded already done; skipping", var82, var83))
		
		return
	else
		local animatorDataModelReady = t.AnimatorDataModelReady
		
		if t_4[p14.UserId] and t_4[p14.UserId][animatorDataModelReady] then
			t_4[p14.UserId][animatorDataModelReady]:Disconnect()
			t_4[p14.UserId][animatorDataModelReady] = nil
		end
		local var84 = function() --[[ line: 297 ]]
			-- upvalues: p15 (ref), p14 (ref), loadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature (copy), t_3 (copy), faceAnimatorService (copy), playersService (copy), name (copy), t_5 (copy)
			local t = { animation = Instance.new("TrackerStreamAnimation") }
			
			if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
				t.animationTrack = p15:LoadStreamAnimationV2(t.animation, p14)
			else
				t.animationTrack = p15:LoadStreamAnimation(t.animation)
			end
			if loadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature and not t.animationTrack then return end
			t.animationTrack.Priority = Enum.AnimationPriority.Idle
			t.animationTrack:Play(0.1, 1)
			t_3[p14.UserId] = t
			
			if p14 == playersService.LocalPlayer and not (faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled) then
				local var86 = p14
				
				if t_3[var86.UserId] and t_3[var86.UserId].animationTrack then
					local var87 = ""
					local var88 = ""
					
					if var86 then
						if var86.UserId then
							var87 = tostring(var86.UserId)
						end
						if var86.Name then
							var88 = var86.Name
						end
					end
					name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var87, var88))
					t_3[var86.UserId].animationTrack:AdjustWeight(0.1, 0.5)
				end
			end
			if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
				t_5[p14.UserId] = p15
			end
		end
		
		if p15:IsDescendantOf(game) then
			var84()
			
			return
		end
		t_4[p14.UserId][t.AnimatorDataModelReady] = p15.AncestryChanged:Connect(function(_, _) --[[ line: 335 ]]
			-- upvalues: p15 (ref), p14 (ref), t (copy), t_4 (copy), var84 (ref)
			if p15:IsDescendantOf(game) then
				local animatorDataModelReady = t.AnimatorDataModelReady
				
				if t_4[p14.UserId] and t_4[p14.UserId][animatorDataModelReady] then
					t_4[p14.UserId][animatorDataModelReady]:Disconnect()
					t_4[p14.UserId][animatorDataModelReady] = nil
				end
				var84()
			end
		end)
	end
end

local function onHumanoidAdded(p16, p17) --[[ line: 347 ]]
	-- upvalues: t (ref), t_4 (ref), handleEmote (ref), clearCharacterAnimations (ref)
	if not p17 then return end
	local playerEmoted = t.PlayerEmoted
	
	if t_4[p16.UserId] and t_4[p16.UserId][playerEmoted] then
		t_4[p16.UserId][playerEmoted]:Disconnect()
		t_4[p16.UserId][playerEmoted] = nil
	end
	t_4[p16.UserId][t.PlayerEmoted] = p17.EmoteTriggered:Connect(function(p18, p19) --[[ line: 355 ]]
		-- upvalues: handleEmote (copy), p16 (ref)
		if p18 then
			handleEmote(p16, p19, false)
		end
	end)
	
	if game:GetFastFlag("StopStreamTrackOnDeath") then
		local playerDied = t.PlayerDied
		
		if t_4[p16.UserId] and t_4[p16.UserId][playerDied] then
			t_4[p16.UserId][playerDied]:Disconnect()
			t_4[p16.UserId][playerDied] = nil
		end
		t_4[p16.UserId][t.PlayerDied] = p17.Died:Connect(function() --[[ line: 365 ]]
			-- upvalues: clearCharacterAnimations (copy), p16 (ref)
			clearCharacterAnimations(p16)
		end)
	end
end

local function onFaceControlsAdded(p20, p21) --[[ line: 371 ]]
	-- upvalues: playersService (ref), t_6 (ref), default_1 (ref), name (ref), faceAnimatorService (ref)
	assert(game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C"))
	
	if p20 ~= playersService.LocalPlayer then return end
	if t_6[p20.UserId] ~= nil and p21 == t_6[p20.UserId] then return end
	t_6[p20.UserId] = p21
	
	if t_6[p20.UserId] then
		if default_1 and not default_1.localMuted then
			local var89 = ""
			local var90 = ""
			
			if p20 then
				if p20.UserId then
					var89 = tostring(p20.UserId)
				end
				if p20.Name then
					var90 = p20.Name
				end
			end
			name:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> enabling A2C (Mic is ON)...", var89, var90))
			faceAnimatorService.AudioAnimationEnabled = true
			
			return
		else
			local var91 = ""
			local var92 = ""
			
			if p20 then
				if p20.UserId then
					var91 = tostring(p20.UserId)
				end
				if p20.Name then
					var92 = p20.Name
				end
			end
			name:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> won't enable A2C (Mic is MUTED)...", var91, var92))
			
			return
		end
	elseif faceAnimatorService.AudioAnimationEnabled then
		local var93 = ""
		local var94 = ""
		
		if p20 then
			if p20.UserId then
				var93 = tostring(p20.UserId)
			end
			if p20.Name then
				var94 = p20.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> disabling A2C...", var93, var94))
		faceAnimatorService.AudioAnimationEnabled = false
		
		return
	else
		local var95 = ""
		local var96 = ""
		
		if p20 then
			if p20.UserId then
				var95 = tostring(p20.UserId)
			end
			if p20.Name then
				var96 = p20.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> won't disable A2C (already is disabled)...", var95, var96))
	end
end

local function onCharacterDescendantAdded(p22, p23) --[[ line: 406 ]]
	-- upvalues: onAnimatorAdded (ref), onHumanoidAdded (ref), onFaceControlsAdded (ref), getPlayerFaceControls (ref)
	if p23:IsDescendantOf(game) then
		if p23:IsA("Animator") then
			onAnimatorAdded(p22, p23)
			
			return
		elseif p23:IsA("Humanoid") then
			onHumanoidAdded(p22, p23)
			
			return
		elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and p23:IsA("MeshPart") and p23.Name == "Head" then
			onFaceControlsAdded(p22, getPlayerFaceControls(p22))
			
			return
		elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and p23:IsA("FaceControls") then
			onFaceControlsAdded(p22, p23)
		end
	end
end

local function onCharacterDescendantRemoving(p24, p25) --[[ line: 426 ]]
	-- upvalues: t_5 (ref), t (ref), t_4 (ref), clearCharacterAnimations (ref), onAnimatorAdded (ref), onFaceControlsAdded (ref), getPlayerFaceControls (ref)
	if p25:IsA("Animator") then
		if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
			if p25 == t_5[p24.UserId] then
				local animatorDataModelReady = t.AnimatorDataModelReady
				
				if t_4[p24.UserId] and t_4[p24.UserId][animatorDataModelReady] then
					t_4[p24.UserId][animatorDataModelReady]:Disconnect()
					t_4[p24.UserId][animatorDataModelReady] = nil
				end
				clearCharacterAnimations(p24)
				t_5[p24.UserId] = nil
				
				if game:GetFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator") then
					local var97 = if p24.Character then p24.Character:FindFirstChildOfClass("Humanoid") else nil
					local var98 = if var97 then var97:FindFirstChildOfClass("Animator") else nil
					
					if var98 then
						onAnimatorAdded(p24, var98)
						
						return
					end
				end
			end
		else
			local animatorDataModelReady = t.AnimatorDataModelReady
			
			if t_4[p24.UserId] and t_4[p24.UserId][animatorDataModelReady] then
				t_4[p24.UserId][animatorDataModelReady]:Disconnect()
				t_4[p24.UserId][animatorDataModelReady] = nil
			end
			clearCharacterAnimations(p24)
			
			return
		end
	elseif p25:IsA("Humanoid") then
		local playerEmoted = t.PlayerEmoted
		
		if t_4[p24.UserId] and t_4[p24.UserId][playerEmoted] then
			t_4[p24.UserId][playerEmoted]:Disconnect()
			t_4[p24.UserId][playerEmoted] = nil
		end
		if game:GetFastFlag("StopStreamTrackOnDeath") then
			local playerDied = t.PlayerDied
			
			if t_4[p24.UserId] and t_4[p24.UserId][playerDied] then
				t_4[p24.UserId][playerDied]:Disconnect()
				t_4[p24.UserId][playerDied] = nil
				
				return
			end
		end
	elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and (p25:IsA("MeshPart") and p25.Name == "Head" or p25:IsA("FaceControls")) then
		onFaceControlsAdded(p24, getPlayerFaceControls(p24))
	end
end

local function onCharacterAdded(p26, p27) --[[ line: 459 ]]
	-- upvalues: name (ref), t (ref), t_4 (ref), onCharacterDescendantAdded (ref), onCharacterDescendantRemoving (ref), onFaceControlsAdded (ref), getPlayerFaceControls (ref), onHumanoidAdded (ref), getPlayerHumanoid (ref), onAnimatorAdded (ref), getPlayerAnimator (ref)
	local var99 = ""
	local var100 = ""
	
	if p26 then
		if p26.UserId then
			var99 = tostring(p26.UserId)
		end
		if p26.Name then
			var100 = p26.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", "Player character added", var99, var100))
	local characterDescendantAdded = t.CharacterDescendantAdded
	
	if t_4[p26.UserId] and t_4[p26.UserId][characterDescendantAdded] then
		t_4[p26.UserId][characterDescendantAdded]:Disconnect()
		t_4[p26.UserId][characterDescendantAdded] = nil
	end
	local characterDescendantRemoving = t.CharacterDescendantRemoving
	
	if t_4[p26.UserId] and t_4[p26.UserId][characterDescendantRemoving] then
		t_4[p26.UserId][characterDescendantRemoving]:Disconnect()
		t_4[p26.UserId][characterDescendantRemoving] = nil
	end
	t_4[p26.UserId][t.CharacterDescendantAdded] = p27.DescendantAdded:Connect(function(p28) --[[ line: 468 ]]
		-- upvalues: onCharacterDescendantAdded (copy), p26 (ref)
		onCharacterDescendantAdded(p26, p28)
	end)
	t_4[p26.UserId][t.CharacterDescendantRemoving] = p27.DescendantRemoving:Connect(function(p29) --[[ line: 473 ]]
		-- upvalues: onCharacterDescendantRemoving (copy), p26 (ref)
		onCharacterDescendantRemoving(p26, p29)
	end)
	
	if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
		onFaceControlsAdded(p26, getPlayerFaceControls(p26))
	end
	onHumanoidAdded(p26, getPlayerHumanoid(p26))
	onAnimatorAdded(p26, getPlayerAnimator(p26))
end

local function onCharacterRemoving(p30, _) --[[ line: 487 ]]
	-- upvalues: name (ref), t (ref), t_4 (ref), clearAllConnections (ref), clearCharacterAnimations (ref)
	local var101 = ""
	local var102 = ""
	
	if p30 then
		if p30.UserId then
			var101 = tostring(p30.UserId)
		end
		if p30.Name then
			var102 = p30.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", "Player character removing", var101, var102))
	
	if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
		local characterDescendantAdded = t.CharacterDescendantAdded
		
		if t_4[p30.UserId] and t_4[p30.UserId][characterDescendantAdded] then
			t_4[p30.UserId][characterDescendantAdded]:Disconnect()
			t_4[p30.UserId][characterDescendantAdded] = nil
		end
		local characterDescendantRemoving = t.CharacterDescendantRemoving
		
		if t_4[p30.UserId] and t_4[p30.UserId][characterDescendantRemoving] then
			t_4[p30.UserId][characterDescendantRemoving]:Disconnect()
			t_4[p30.UserId][characterDescendantRemoving] = nil
		end
	else
		clearAllConnections(p30)
	end
	clearCharacterAnimations(p30)
end

local function playerUpdate(p31) --[[ line: 501 ]]
	-- upvalues: name (ref), t_2 (ref), t_3 (ref), clearAllConnections (ref), onCharacterAdded (ref), t_4 (ref), t (ref), onCharacterRemoving (ref), onPlayerChatted (ref), clearCharacterAnimations (ref)
	local var103 = ""
	local var104 = ""
	
	if p31 then
		if p31.UserId then
			var103 = tostring(p31.UserId)
		end
		if p31.Name then
			var104 = p31.Name
		end
	end
	name:trace(string.format("%s {id: %s, name: %s}.", "Player update", var103, var104))
	local userId = t_2[p31.UserId]
	
	if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") and userId and t_3[p31.UserId] then
		local var105 = ""
		local var106 = ""
		
		if p31 then
			if p31.UserId then
				var105 = tostring(p31.UserId)
			end
			if p31.Name then
				var106 = p31.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", var105, var106))
		
		return
	else
		clearAllConnections(p31)
		
		if userId then
			if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") or not t_3[p31.UserId] then
				local var109 = ""
				local var110 = ""
				
				if p31 then
					if p31.UserId then
						var109 = tostring(p31.UserId)
					end
					if p31.Name then
						var110 = p31.Name
					end
				end
				name:trace(string.format("%s {id: %s, name: %s}.", "Player update - joined", var109, var110))
				
				if p31.Character then
					onCharacterAdded(p31, p31.Character)
				end
				t_4[p31.UserId][t.CharacterAdded] = p31.CharacterAdded:Connect(function(p32) --[[ line: 529 ]]
					-- upvalues: onCharacterAdded (copy), p31 (ref)
					onCharacterAdded(p31, p32)
				end)
				t_4[p31.UserId][t.CharacterRemoving] = p31.CharacterRemoving:Connect(function(p33) --[[ line: 533 ]]
					-- upvalues: onCharacterRemoving (copy), p31 (ref)
					onCharacterRemoving(p31, p33)
				end)
				t_4[p31.UserId][t.PlayerChatted] = p31.Chatted:Connect(function(p34) --[[ line: 537 ]]
					-- upvalues: onPlayerChatted (copy), p31 (ref)
					onPlayerChatted(p31, p34)
				end)
				
				return
			else
				local var107 = ""
				local var108 = ""
				
				if p31 then
					if p31.UserId then
						var107 = tostring(p31.UserId)
					end
					if p31.Name then
						var108 = p31.Name
					end
				end
				name:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", var107, var108))
				
				return
			end
		else
			local var111 = ""
			local var112 = ""
			
			if p31 then
				if p31.UserId then
					var111 = tostring(p31.UserId)
				end
				if p31.Name then
					var112 = p31.Name
				end
			end
			name:trace(string.format("%s {id: %s, name: %s}.", "Player update - left", var111, var112))
			clearCharacterAnimations(p31)
		end
	end
end

local _ = function(p35, p36) --[[ line: 546 | named "toggleMute" ]]
	-- upvalues: t_3 (ref)
	if t_3[p35] and t_3[p35].animationTrack then
		t_3[p35].animationTrack:TogglePause(p36)
	end
end

local function JoinAllExistingPlayers() --[[ line: 552 ]]
	-- upvalues: playersService (ref), t_2 (ref), playerUpdate (ref), name (ref)
	for i, v in ipairs(playersService:GetPlayers()) do
		t_2[v.UserId] = true
		playerUpdate(v)
	end
	playersService.PlayerRemoving:Connect(function(p37) --[[ line: 558 ]]
		-- upvalues: name (copy), t_2 (copy), playerUpdate (copy)
		local var113 = ""
		local var114 = ""
		
		if p37 then
			if p37.UserId then
				var113 = tostring(p37.UserId)
			end
			if p37.Name then
				var114 = p37.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Player leaving game", var113, var114))
		t_2[p37.UserId] = nil
		playerUpdate(p37)
	end)
	playersService.PlayerAdded:Connect(function(p38) --[[ line: 564 ]]
		-- upvalues: name (copy), t_2 (copy), playerUpdate (copy)
		local var115 = ""
		local var116 = ""
		
		if p38 then
			if p38.UserId then
				var115 = tostring(p38.UserId)
			end
			if p38.Name then
				var116 = p38.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Player joining game", var115, var116))
		t_2[p38.UserId] = true
		playerUpdate(p38)
	end)
end

local function ConnectStateChangeCallback() --[[ line: 571 ]]
	-- upvalues: default_1 (ref), playersService (ref), t_3 (ref), name (ref), t_1 (ref), playerUpdate (ref)
	local service = default_1:getService()
	local userId = playersService.LocalPlayer.UserId
	default_1.participantsUpdate.Event:Connect(function(p39) --[[ line: 575 ]]
		-- upvalues: userId (ref), t_3 (copy)
		for i, v in pairs(p39) do
			local var118 = tonumber(i)
			
			if var118 ~= userId then
				local isMutedLocally = v.isMutedLocally
				
				if t_3[var118] and t_3[var118].animationTrack then
					t_3[var118].animationTrack:TogglePause(isMutedLocally)
				end
			end
		end
	end)
	
	if service then
		service.ParticipantsStateChanged:Connect(function(p40, p41, _) --[[ line: 585 ]]
			-- upvalues: playersService (copy), name (copy), t_1 (copy), playerUpdate (copy)
			for i, v in ipairs(p40) do
				local var122 = playersService:GetPlayerByUserId(v)
				
				if var122 then
					local var123 = ""
					local var124 = ""
					
					if var122 then
						if var122.UserId then
							var123 = tostring(var122.UserId)
						end
						if var122.Name then
							var124 = var122.Name
						end
					end
					name:trace(string.format("%s {id: %s, name: %s}.", "Player leaving chat", var123, var124))
					t_1[var122.UserId] = nil
					playerUpdate(var122)
				end
			end
			for i, v_1 in ipairs(p41) do
				local var119 = playersService:GetPlayerByUserId(v_1)
				
				if var119 then
					local var120 = ""
					local var121 = ""
					
					if var119 then
						if var119.UserId then
							var120 = tostring(var119.UserId)
						end
						if var119.Name then
							var121 = var119.Name
						end
					end
					name:trace(string.format("%s {id: %s, name: %s}.", "Player joining chat", var120, var121))
					t_1[var119.UserId] = true
					playerUpdate(var119)
				end
			end
		end)
		
		return
	end
	name:trace("Could not find VoiceChatService")
end

local function AttemptToShowCameraPerformanceToast(p42) --[[ line: 611 ]]
	-- upvalues: getFFlagUXForCameraPerformanceIXPEnabledModule (ref), IXPServiceWrapper (ref), getFStringUXForCameraPerformanceIXPLayerNameModule (ref), timestamp (ref), UXForCameraPerformanceSessionDelay (ref), AttemptToShowCameraPerformanceToast (ref), appStorageService (ref), UXForCameraPerformanceDeviceDelay (ref), trackerMenuModule (ref), trackerPromptTypeModule (ref), rbxAnalyticsService (ref), playersService (ref)
	if getFFlagUXForCameraPerformanceIXPEnabledModule() then
		local ok, status = pcall(function() --[[ line: 614 ]]
			-- upvalues: IXPServiceWrapper (copy), getFStringUXForCameraPerformanceIXPLayerNameModule (copy)
			return IXPServiceWrapper:GetLayerData(getFStringUXForCameraPerformanceIXPLayerNameModule())
		end)
		
		if not ok then return end
		if not status then return end
		if not status.UXForCameraPerformanceEnabled then return end
	end
	local var125 = os.time() - timestamp
	
	if not p42 and var125 < UXForCameraPerformanceSessionDelay then
		task.delay(UXForCameraPerformanceSessionDelay - var125, function() --[[ line: 635 ]]
			-- upvalues: AttemptToShowCameraPerformanceToast (copy)
			AttemptToShowCameraPerformanceToast(true)
		end)
		
		return
	end
	local var126 = 0
	local ok, status = pcall(function() --[[ line: 643 ]]
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("CameraPerformanceUXUnixTimestamp")
	end)
	
	if ok then
		var126 = tonumber(status)
	else
		return
	end
	if os.time() - var126 < UXForCameraPerformanceDeviceDelay then
		return
	end
	pcall(function() --[[ line: 655 ]]
		-- upvalues: appStorageService (copy), var126 (write), trackerMenuModule (copy), trackerPromptTypeModule (copy), rbxAnalyticsService (copy), playersService (copy)
		appStorageService:SetItem("CameraPerformanceUXUnixTimestamp", tostring(var126))
		appStorageService:Flush()
		trackerMenuModule:showPrompt(trackerPromptTypeModule.LODCameraRecommendDisable)
		rbxAnalyticsService:SendEventDeferred("client", "avatarChat", "UXForCameraPerformanceShown", {
			userId = playersService.LocalPlayer.UserId,
			pid = tostring(game.PlaceId)
		})
	end)
end

function InitializeVoiceChat() --[[ line: 677 ]]
	-- upvalues: ConnectStateChangeCallback (ref), default_1 (ref), name (ref), var34 (write), playersService (ref), faceAnimatorService (ref)
	local var127 = function() --[[ line: 678 ]]
		-- upvalues: ConnectStateChangeCallback (copy)
		ConnectStateChangeCallback()
	end
	
	if not default_1 then
		ConnectStateChangeCallback()
		
		return
	end
	default_1:asyncInit():catch(function(_) --[[ line: 684 ]]
		-- upvalues: name (copy)
		name:trace("VoiceChat:asyncInit failed (possibly denied mic permission)")
	end):finally(var127)
	var34 = default_1.muteChanged.Event:connect(function(p43) --[[ line: 690 ]]
		-- upvalues: playersService (copy), name (copy), faceAnimatorService (copy)
		if not game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
			name:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(p43))
			faceAnimatorService.AudioAnimationEnabled = not p43
			
			return
		end
		local localPlayer = playersService.LocalPlayer
		local var130 = if localPlayer and localPlayer.Character then localPlayer.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
		name:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(p43) .. " hasFaceControls=" .. tostring(var130 ~= nil))
		faceAnimatorService.AudioAnimationEnabled = not p43 and var130 ~= nil
	end)
	local var128 = false
	
	if default_1.localMuted ~= nil then
		name:trace("Syncing audio processing with VoiceChat mute status: muted=" .. tostring(default_1.localMuted))
		var128 = not default_1.localMuted
	end
	if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
		local localPlayer = playersService.LocalPlayer
		local var129 = if localPlayer and localPlayer.Character then localPlayer.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
		name:trace("Syncing audio processing with Dynamic Head status: hasFaceControls=" .. tostring(var129 ~= nil))
		localPlayer = var128 and var129 ~= nil
		var128 = localPlayer
	end
	faceAnimatorService.AudioAnimationEnabled = var128
end

function CleanupVoiceChat() --[[ line: 728 ]]
	-- upvalues: var34 (write)
	if var34 then
		var34:Disconnect()
		var34 = nil
	end
end

function InitializeFacialAnimationStreaming(a) --[[ line: 735 ]]
	-- upvalues: var24 (write), var32 (write), faceAnimatorService (ref), name (ref), trackerMenuModule (ref), trackerPromptTypeModule (ref), disableCameraOnLowspecAndroidCalls (ref), var18 (write), getFFlagAvatarChatServiceEnabled (ref), var10 (ref), faceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature (ref), var33 (write), UXForCameraPerformanceEnabled (ref), AttemptToShowCameraPerformanceToast (ref), default (ref), enums (ref), JoinAllExistingPlayers (ref), facialAnimationStreamingHeartbeatStatsModule (ref)
	if var24 then return end
	var24 = true
	var32 = faceAnimatorService.TrackerError:Connect(function(p44) --[[ line: 743 ]]
		-- upvalues: name (copy), trackerMenuModule (copy), trackerPromptTypeModule (copy)
		name:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerError: %s", tostring(p44)), "", ""))
		
		if p44 == Enum.TrackerError.VideoNoPermission then
			trackerMenuModule:showPrompt(trackerPromptTypeModule.VideoNoPermission)
			
			return
		elseif p44 == Enum.TrackerError.VideoUnsupported then
			trackerMenuModule:showPrompt(trackerPromptTypeModule.VideoUnsupported)
			
			return
		elseif p44 == Enum.TrackerError.UnsupportedDevice then
			trackerMenuModule:showPrompt(trackerPromptTypeModule.UnsupportedDevice)
			
			return
		end
		trackerMenuModule:showPrompt(trackerPromptTypeModule.NotAvailable)
	end)
	
	if disableCameraOnLowspecAndroidCalls and not var18() then
		name:trace("Camera is disabled for user and place")
		
		return
	elseif getFFlagAvatarChatServiceEnabled() then
		faceAnimatorService:Init(var10:IsEnabled(a, Enum.AvatarChatServiceFeature.UserVideo), var10:IsEnabled(a, Enum.AvatarChatServiceFeature.UserAudio))
	end
	if faceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature then
		var33 = faceAnimatorService.TrackerPrompt:Connect(function(p45) --[[ line: 770 ]]
			-- upvalues: name (copy), UXForCameraPerformanceEnabled (copy), AttemptToShowCameraPerformanceToast (copy), trackerMenuModule (copy), trackerPromptTypeModule (copy)
			name:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerPrompt: %s", tostring(p45)), "", ""))
			
			if p45 == Enum.TrackerPromptEvent.LODCameraRecommendDisable then
				if UXForCameraPerformanceEnabled then
					AttemptToShowCameraPerformanceToast()
					
					return
				end
				trackerMenuModule:showPrompt(trackerPromptTypeModule.LODCameraRecommendDisable)
			end
		end)
	end
	default:getCallState():andThen(function(p46) --[[ line: 783 ]]
		-- upvalues: var24 (copy), enums (copy), faceAnimatorService (copy), JoinAllExistingPlayers (copy), facialAnimationStreamingHeartbeatStatsModule (copy)
		if not var24 then return end
		if p46.status == enums.CallStatus.Idle.rawValue() or p46.status == enums.CallStatus.Ringing.rawValue() then
			faceAnimatorService.VideoAnimationEnabled = false
		else
			faceAnimatorService.VideoAnimationEnabled = p46.camEnabled
		end
		InitializeVoiceChat()
		JoinAllExistingPlayers()
		facialAnimationStreamingHeartbeatStatsModule.Initialize()
	end)
end

function CleanupFacialAnimationStreaming() --[[ line: 808 ]]
	-- upvalues: var24 (write), facialAnimationStreamingHeartbeatStatsModule (ref), playersService (ref), t_2 (ref), playerUpdate (ref), var32 (write), var35 (write), var36 (write), faceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature (ref), var33 (write)
	if not var24 then return end
	var24 = false
	CleanupVoiceChat()
	facialAnimationStreamingHeartbeatStatsModule.Cleanup()
	
	for i, v in ipairs(playersService:GetPlayers()) do
		t_2[v.UserId] = nil
		playerUpdate(v)
	end
	if var32 then
		var32:Disconnect()
		var32 = nil
	end
	if var35 then
		var35:Disconnect()
		var35 = nil
	end
	if var36 then
		var36:Disconnect()
		var36 = nil
	end
	if faceAnimatorNotifyLODRecommendCameraInputDisableEngineFeature and var33 then
		var33:Disconnect()
		var33 = nil
	end
end

local function updateWithServiceState(p47) --[[ line: 846 ]]
	-- upvalues: name (ref), getFFlagAvatarChatServiceEnabled (ref), var10 (ref)
	name:trace(string.format("[updateWithServiceState] state: %s", tostring(p47)))
	
	if not getFFlagAvatarChatServiceEnabled() then
		CleanupFacialAnimationStreaming()
		
		return
	elseif (var10:IsEnabled(p47, Enum.AvatarChatServiceFeature.UserAudioEligible) or var10:IsEnabled(p47, Enum.AvatarChatServiceFeature.UserVideoEligible)) and var10:IsPlaceEnabled() then
		InitializeFacialAnimationStreaming(p47)
		
		return
	end
	CleanupFacialAnimationStreaming()
end

var35 = faceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function() --[[ line: 867 ]]
	-- upvalues: playersService (ref), faceAnimatorService (ref), t_3 (ref), name (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	if faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled then
		if not t_3[localPlayer.UserId] or not t_3[localPlayer.UserId].animationTrack then return end
		local var131 = ""
		local var132 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var131 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var132 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var131, var132))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
		
		return
	elseif t_3[localPlayer.UserId] and t_3[localPlayer.UserId].animationTrack then
		local var133 = ""
		local var134 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var133 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var134 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var133, var134))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end)
var36 = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ line: 871 ]]
	-- upvalues: playersService (ref), faceAnimatorService (ref), t_3 (ref), name (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	if faceAnimatorService.AudioAnimationEnabled or faceAnimatorService.VideoAnimationEnabled then
		if not t_3[localPlayer.UserId] or not t_3[localPlayer.UserId].animationTrack then return end
		local var135 = ""
		local var136 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var135 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var136 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", var135, var136))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
		
		return
	elseif t_3[localPlayer.UserId] and t_3[localPlayer.UserId].animationTrack then
		local var137 = ""
		local var138 = ""
		
		if localPlayer then
			if localPlayer.UserId then
				var137 = tostring(localPlayer.UserId)
			end
			if localPlayer.Name then
				var138 = localPlayer.Name
			end
		end
		name:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", var137, var138))
		t_3[localPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
	end
end)

if getFFlagAvatarChatServiceEnabled() then
	if var10.ClientFeaturesInitialized then
		updateWithServiceState(var10.ClientFeatures)
	else
		local var56 = nil
		var56 = var10:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ line: 881 ]]
			-- upvalues: updateWithServiceState (ref), var10 (ref), var56 (write)
			updateWithServiceState(var10.ClientFeatures)
			var56:Disconnect()
		end)
	end
end