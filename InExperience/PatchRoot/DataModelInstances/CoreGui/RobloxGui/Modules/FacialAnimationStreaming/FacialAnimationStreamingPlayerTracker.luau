local LoadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature = game:GetEngineFeature("LoadStreamAnimationReplaceErrorsWithTelemetryFeature")
local Flags = script.Parent.Parent.Flags
local FFlagFacialAnimationStreamingClearTrackImprovementsV2Module = require(Flags.FFlagFacialAnimationStreamingClearTrackImprovementsV2)
local FFlagFacialAnimationStreamingValidateAnimatorBeforeRemovingModule = require(Flags.FFlagFacialAnimationStreamingValidateAnimatorBeforeRemoving)
local FFlagFacialAnimationStreamingSearchForReplacementWhenRemovingAnimatorModule = require(Flags.FFlagFacialAnimationStreamingSearchForReplacementWhenRemovingAnimator)
local FFlagStopStreamTrackOnDeathModule = require(Flags.FFlagStopStreamTrackOnDeath)
local FFlagFacialAnimationStreamingClearAllConnectionsFix2Module = require(Flags.FFlagFacialAnimationStreamingClearAllConnectionsFix2)
local FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule = require(Flags.FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2C)
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

return {
	Connections = Player,
	new = function(p1)
		-- upvalues: FFlagFacialAnimationStreamingClearAllConnectionsFix2Module (copy), Player (copy), FFlagFacialAnimationStreamingClearTrackImprovementsV2Module (copy), LoadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature (copy), FFlagFacialAnimationStreamingValidateAnimatorBeforeRemovingModule (copy), FFlagStopStreamTrackOnDeathModule (copy), FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule (copy), FFlagFacialAnimationStreamingSearchForReplacementWhenRemovingAnimatorModule (copy)
		local Players = p1.Players
		local FaceAnimatorService = p1.FaceAnimatorService
		local EmoteHelper = p1.EmoteHelper
		local VoiceChatServiceManager = p1.VoiceChatServiceManager
		local Log = p1.log
		local Wait1 = p1.wait or wait
		local CreateStreamAnimation = p1.createStreamAnimation or function()
			return Instance.new("TrackerStreamAnimation")
		end
		local t = {}
		local t1 = {}
		local t2 = {}
		local t3 = {}
		local t4 = {}
		
		local function _(p2, Player: Player)
			-- upvalues: Log (copy)
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
			Log:trace(string.format("%s {id: %s, name: %s}.", p2, v1, Name))
		end
		
		local _ = function(Player: Player, p2)
			-- upvalues: t2 (copy)
			if t2[Player.UserId] and t2[Player.UserId][p2] then
				t2[Player.UserId][p2]:Disconnect()
				t2[Player.UserId][p2] = nil
			end
		end
		
		local function clearAllConnections(Player1: Player)
			-- upvalues: FFlagFacialAnimationStreamingClearAllConnectionsFix2Module (upval), Player (upval), t2 (copy)
			if FFlagFacialAnimationStreamingClearAllConnectionsFix2Module then
				for _, value in pairs(Player) do
					if t2[Player1.UserId] and t2[Player1.UserId][value] then
						t2[Player1.UserId][value]:Disconnect()
						t2[Player1.UserId][value] = nil
					end
				end
			else
				for _, value1 in ipairs(Player) do
					if t2[Player1.UserId] and t2[Player1.UserId][value1] then
						t2[Player1.UserId][value1]:Disconnect()
						t2[Player1.UserId][value1] = nil
					end
				end
			end
			t2[Player1.UserId] = {}
		end
		
		local function clearCharacterAnimations(Player: Player)
			-- upvalues: Log (copy), t1 (copy), FFlagFacialAnimationStreamingClearTrackImprovementsV2Module (upval)
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
			Log:trace(string.format("%s {id: %s, name: %s}.", "clearCharacterAnimations", v1, Name))
			
			if t1[Player.UserId] then
				if FFlagFacialAnimationStreamingClearTrackImprovementsV2Module then
					if t1[Player.UserId].animationTrack then
						t1[Player.UserId].animationTrack:Stop(0)
						t1[Player.UserId].animationTrack = nil
					end
					if t1[Player.UserId].animation then
						t1[Player.UserId].animation = nil
					end
				else
					if t1[Player.UserId].animation then
						t1[Player.UserId].animation:Destroy()
						t1[Player.UserId].animation = nil
					end
					if t1[Player.UserId].animationTrack then
						t1[Player.UserId].animationTrack:Stop(0)
						t1[Player.UserId].animationTrack:Destroy()
						t1[Player.UserId].animationTrack = nil
					end
				end
				t1[Player.UserId] = nil
			end
		end
		
		local function getPlayerFaceControls(Player: Player)
			return if Player and Player.Character then Player.Character:FindFirstChildWhichIsA("FaceControls", true) else nil
		end
		
		local function getPlayerHumanoid(Player: Player)
			return if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil
		end
		
		local function getPlayerAnimator(Player: Player)
			local Humanoid = if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil
			
			return if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
		end
		
		local _ = function(Player: Player)
			-- upvalues: t1 (copy), Log (copy)
			if t1[Player.UserId] and t1[Player.UserId].animationTrack then
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
				Log:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v1, Name))
				t1[Player.UserId].animationTrack:AdjustWeight(0.1, 0.5)
			end
		end
		
		local _ = function(Player: Player)
			-- upvalues: t1 (copy), Log (copy)
			if t1[Player.UserId] and t1[Player.UserId].animationTrack then
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
				Log:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v1, Name))
				t1[Player.UserId].animationTrack:AdjustWeight(1, 0.5)
			end
		end
		
		local function updateStreamTrackStatus()
			-- upvalues: Players (copy), FaceAnimatorService (copy), t1 (copy), Log (copy)
			local LocalPlayer = Players.LocalPlayer
			
			if not LocalPlayer then return end
			if FaceAnimatorService.AudioAnimationEnabled or FaceAnimatorService.VideoAnimationEnabled then
				if t1[LocalPlayer.UserId] and t1[LocalPlayer.UserId].animationTrack then
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
					Log:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v1, Name))
					t1[LocalPlayer.UserId].animationTrack:AdjustWeight(1, 0.5)
					
					return
				end
			elseif t1[LocalPlayer.UserId] and t1[LocalPlayer.UserId].animationTrack then
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
				Log:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v2, Name))
				t1[LocalPlayer.UserId].animationTrack:AdjustWeight(0.1, 0.5)
			end
		end
		
		local function handleEmote(Player1: Player, AnyActiveDefaultChatTriggeredEmoteTrack, p2)
			-- upvalues: Log (copy), Player (upval), t2 (copy), t1 (copy), EmoteHelper (copy), FaceAnimatorService (copy)
			local Formatted = string.format("handleEmote {isChatTriggered:%s}", (tostring(p2)))
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
			Log:trace(string.format("%s {id: %s, name: %s}.", Formatted, v1, Name))
			
			if AnyActiveDefaultChatTriggeredEmoteTrack then
				local EmoteFinished = Player.EmoteFinished
				
				if t2[Player1.UserId] and t2[Player1.UserId][EmoteFinished] then
					t2[Player1.UserId][EmoteFinished]:Disconnect()
					t2[Player1.UserId][EmoteFinished] = nil
				end
				if t1[Player1.UserId] and t1[Player1.UserId].animationTrack then
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
					Log:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v2, Name1))
					t1[Player1.UserId].animationTrack:AdjustWeight(0.1, 0.5)
				end
				t2[Player1.UserId][Player.EmoteFinished] = EmoteHelper.createEmoteFinishEvent(Player1, AnyActiveDefaultChatTriggeredEmoteTrack, p2):Connect(function()
					-- upvalues: Player1 (copy), Player (upval), t2 (upval), FaceAnimatorService (upval), t1 (upval), Log (upval)
					local EmoteFinished = Player.EmoteFinished
					
					if t2[Player1.UserId] and t2[Player1.UserId][EmoteFinished] then
						t2[Player1.UserId][EmoteFinished]:Disconnect()
						t2[Player1.UserId][EmoteFinished] = nil
					end
					if FaceAnimatorService.AudioAnimationEnabled or FaceAnimatorService.VideoAnimationEnabled then
						if t1[Player1.UserId] and t1[Player1.UserId].animationTrack then
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
							Log:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v3, Name))
							t1[Player1.UserId].animationTrack:AdjustWeight(1, 0.5)
							
							return
						end
					elseif t1[Player1.UserId] and t1[Player1.UserId].animationTrack then
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
						Log:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v4, Name))
						t1[Player1.UserId].animationTrack:AdjustWeight(0.1, 0.5)
					end
				end)
			end
		end
		
		local function onPlayerChatted(Player: Player, Text: string)
			-- upvalues: EmoteHelper (copy), Wait1 (copy), handleEmote (copy)
			if if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil then
				local Segment: string? = nil
				
				if string.sub(Text, 1, 3) == "/e " then
					Segment = string.sub(Text, 4)
				elseif string.sub(Text, 1, 7) == "/emote " then
					Segment = string.sub(Text, 8)
				end
				if Segment and EmoteHelper.LegacyDefaultEmotes[Segment] then
					Wait1(EmoteHelper.EMOTE_LOOP_TRANSITION_WAIT_TIME)
					local AnyActiveDefaultChatTriggeredEmoteTrack = EmoteHelper.getAnyActiveDefaultChatTriggeredEmoteTrack(Player)
					
					if AnyActiveDefaultChatTriggeredEmoteTrack then
						handleEmote(Player, AnyActiveDefaultChatTriggeredEmoteTrack, true)
					end
				end
			end
		end
		
		local function onAnimatorAdded(Player1: Player, Object)
			-- upvalues: t1 (copy), Log (copy), Player (upval), t2 (copy), CreateStreamAnimation (copy), LoadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature (upval), FaceAnimatorService (copy), Players (copy), FFlagFacialAnimationStreamingValidateAnimatorBeforeRemovingModule (upval), t3 (copy)
			if not Object then return end
			if not Object.Parent or not Object.Parent:IsA("Humanoid") then return end
			if t1[Player1.UserId] then
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
				Log:trace(string.format("%s {id: %s, name: %s}.", "onAnimatorAdded already done; skipping", v1, Name))
				
				return
			else
				local AnimatorDataModelReady = Player.AnimatorDataModelReady
				
				if t2[Player1.UserId] and t2[Player1.UserId][AnimatorDataModelReady] then
					t2[Player1.UserId][AnimatorDataModelReady]:Disconnect()
					t2[Player1.UserId][AnimatorDataModelReady] = nil
				end
				local function v73()
					-- upvalues: CreateStreamAnimation (upval), Object (copy), Player1 (copy), LoadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature (upval), t1 (upval), FaceAnimatorService (upval), Players (upval), Log (upval), FFlagFacialAnimationStreamingValidateAnimatorBeforeRemovingModule (upval), t3 (upval)
					local config = { animation = CreateStreamAnimation() }
					
					if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
						config.animationTrack = Object:LoadStreamAnimationV2(config.animation, Player1)
					else
						config.animationTrack = Object:LoadStreamAnimation(config.animation)
					end
					if LoadStreamAnimationReplaceErrorsWithTelemetryFeatureEngineFeature and not config.animationTrack then return end
					config.animationTrack.Priority = Enum.AnimationPriority.Idle
					config.animationTrack:Play(0.1, 1)
					t1[Player1.UserId] = config
					local AudioAnimationEnabled = FaceAnimatorService.AudioAnimationEnabled or FaceAnimatorService.VideoAnimationEnabled
					
					if Player1 == Players.LocalPlayer and not AudioAnimationEnabled and t1[Player1.UserId] and t1[Player1.UserId].animationTrack then
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
						Log:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v2, Name))
						t1[Player1.UserId].animationTrack:AdjustWeight(0.1, 0.5)
					end
					if FFlagFacialAnimationStreamingValidateAnimatorBeforeRemovingModule then
						t3[Player1.UserId] = Object
					end
				end
				
				if Object:IsDescendantOf(game) then
					v73()
					
					return
				else
					t2[Player1.UserId][Player.AnimatorDataModelReady] = Object.AncestryChanged:Connect(function(_, _)
						-- upvalues: Object (copy), Player1 (copy), Player (upval), t2 (upval), v73 (copy)
						if Object:IsDescendantOf(game) then
							local AnimatorDataModelReady = Player.AnimatorDataModelReady
							
							if t2[Player1.UserId] and t2[Player1.UserId][AnimatorDataModelReady] then
								t2[Player1.UserId][AnimatorDataModelReady]:Disconnect()
								t2[Player1.UserId][AnimatorDataModelReady] = nil
							end
							v73()
						end
					end)
				end
			end
		end
		
		local function onHumanoidAdded(Player1: Player, Humanoid)
			-- upvalues: Player (upval), t2 (copy), handleEmote (copy), FFlagStopStreamTrackOnDeathModule (upval), clearCharacterAnimations (copy)
			if not Humanoid then return end
			local PlayerEmoted = Player.PlayerEmoted
			
			if t2[Player1.UserId] and t2[Player1.UserId][PlayerEmoted] then
				t2[Player1.UserId][PlayerEmoted]:Disconnect()
				t2[Player1.UserId][PlayerEmoted] = nil
			end
			t2[Player1.UserId][Player.PlayerEmoted] = Humanoid.EmoteTriggered:Connect(function(Success, AnimationTrack)
				-- upvalues: handleEmote (upval), Player1 (copy)
				if Success then
					handleEmote(Player1, AnimationTrack, false)
				end
			end)
			
			if FFlagStopStreamTrackOnDeathModule then
				local PlayerDied = Player.PlayerDied
				
				if t2[Player1.UserId] and t2[Player1.UserId][PlayerDied] then
					t2[Player1.UserId][PlayerDied]:Disconnect()
					t2[Player1.UserId][PlayerDied] = nil
				end
				t2[Player1.UserId][Player.PlayerDied] = Humanoid.Died:Connect(function()
					-- upvalues: clearCharacterAnimations (upval), Player1 (copy)
					clearCharacterAnimations(Player1)
				end)
			end
		end
		
		local function onFaceControlsAdded(Player: Player, p2)
			-- upvalues: FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule (upval), Players (copy), t4 (copy), VoiceChatServiceManager (copy), Log (copy), FaceAnimatorService (copy)
			assert(FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule)
			
			if Player ~= Players.LocalPlayer then return end
			if t4[Player.UserId] ~= nil and p2 == t4[Player.UserId] then return end
			t4[Player.UserId] = p2
			
			if t4[Player.UserId] then
				if VoiceChatServiceManager and VoiceChatServiceManager.localMuted == false then
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
					Log:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> enabling A2C (Mic is ON)...", v1, Name))
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
					Log:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> won't enable A2C (Mic is MUTED)...", v2, Name1))
					
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
				Log:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> disabling A2C...", v3, Name))
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
				Log:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> won't disable A2C (already is disabled)...", v4, Name2))
			end
		end
		
		local function onCharacterDescendantAdded(Player: Player, Object)
			-- upvalues: onAnimatorAdded (copy), onHumanoidAdded (copy), FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule (upval), onFaceControlsAdded (copy), getPlayerFaceControls (copy)
			if Object:IsDescendantOf(game) then
				if Object:IsA("Animator") then
					onAnimatorAdded(Player, Object)
					
					return
				end
				if Object:IsA("Humanoid") then
					onHumanoidAdded(Player, Object)
					
					return
				end
				if FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule and Object:IsA("MeshPart") and Object.Name == "Head" then
					onFaceControlsAdded(Player, getPlayerFaceControls(Player))
					
					return
				end
				if FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule and Object:IsA("FaceControls") then
					onFaceControlsAdded(Player, Object)
				end
			end
		end
		
		local function onCharacterDescendantRemoving(Player1: Player, Object)
			-- upvalues: FFlagFacialAnimationStreamingValidateAnimatorBeforeRemovingModule (upval), t3 (copy), Player (upval), t2 (copy), clearCharacterAnimations (copy), FFlagFacialAnimationStreamingSearchForReplacementWhenRemovingAnimatorModule (upval), onAnimatorAdded (copy), FFlagStopStreamTrackOnDeathModule (upval), FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule (upval), onFaceControlsAdded (copy), getPlayerFaceControls (copy)
			if Object:IsA("Animator") then
				if FFlagFacialAnimationStreamingValidateAnimatorBeforeRemovingModule then
					if Object == t3[Player1.UserId] then
						local AnimatorDataModelReady1 = Player.AnimatorDataModelReady
						
						if t2[Player1.UserId] and t2[Player1.UserId][AnimatorDataModelReady1] then
							t2[Player1.UserId][AnimatorDataModelReady1]:Disconnect()
							t2[Player1.UserId][AnimatorDataModelReady1] = nil
						end
						clearCharacterAnimations(Player1)
						t3[Player1.UserId] = nil
						
						if FFlagFacialAnimationStreamingSearchForReplacementWhenRemovingAnimatorModule then
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
					
					if t2[Player1.UserId] and t2[Player1.UserId][AnimatorDataModelReady] then
						t2[Player1.UserId][AnimatorDataModelReady]:Disconnect()
						t2[Player1.UserId][AnimatorDataModelReady] = nil
					end
					clearCharacterAnimations(Player1)
					
					return
				end
			elseif Object:IsA("Humanoid") then
				local PlayerEmoted = Player.PlayerEmoted
				
				if t2[Player1.UserId] and t2[Player1.UserId][PlayerEmoted] then
					t2[Player1.UserId][PlayerEmoted]:Disconnect()
					t2[Player1.UserId][PlayerEmoted] = nil
				end
				if FFlagStopStreamTrackOnDeathModule then
					local PlayerDied = Player.PlayerDied
					
					if t2[Player1.UserId] and t2[Player1.UserId][PlayerDied] then
						t2[Player1.UserId][PlayerDied]:Disconnect()
						t2[Player1.UserId][PlayerDied] = nil
						
						return
					end
				end
			elseif FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule and (Object:IsA("MeshPart") and Object.Name == "Head" or Object:IsA("FaceControls")) then
				onFaceControlsAdded(Player1, getPlayerFaceControls(Player1))
			end
		end
		
		local function onCharacterAdded(Player1: Player, Character)
			-- upvalues: Log (copy), Player (upval), t2 (copy), onCharacterDescendantAdded (copy), onCharacterDescendantRemoving (copy), FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule (upval), onFaceControlsAdded (copy), getPlayerFaceControls (copy), onHumanoidAdded (copy), getPlayerHumanoid (copy), onAnimatorAdded (copy), getPlayerAnimator (copy)
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
			Log:trace(string.format("%s {id: %s, name: %s}.", "Player character added", v1, Name))
			local CharacterDescendantAdded = Player.CharacterDescendantAdded
			
			if t2[Player1.UserId] and t2[Player1.UserId][CharacterDescendantAdded] then
				t2[Player1.UserId][CharacterDescendantAdded]:Disconnect()
				t2[Player1.UserId][CharacterDescendantAdded] = nil
			end
			local CharacterDescendantRemoving = Player.CharacterDescendantRemoving
			
			if t2[Player1.UserId] and t2[Player1.UserId][CharacterDescendantRemoving] then
				t2[Player1.UserId][CharacterDescendantRemoving]:Disconnect()
				t2[Player1.UserId][CharacterDescendantRemoving] = nil
			end
			t2[Player1.UserId][Player.CharacterDescendantAdded] = Character.DescendantAdded:Connect(function(Descendant)
				-- upvalues: onCharacterDescendantAdded (upval), Player1 (copy)
				onCharacterDescendantAdded(Player1, Descendant)
			end)
			t2[Player1.UserId][Player.CharacterDescendantRemoving] = Character.DescendantRemoving:Connect(function(Descendant)
				-- upvalues: onCharacterDescendantRemoving (upval), Player1 (copy)
				onCharacterDescendantRemoving(Player1, Descendant)
			end)
			
			if FFlagFacialAnimationStreamingIfNoDynamicHeadDisableA2CModule then
				onFaceControlsAdded(Player1, getPlayerFaceControls(Player1))
			end
			onHumanoidAdded(Player1, getPlayerHumanoid(Player1))
			onAnimatorAdded(Player1, getPlayerAnimator(Player1))
		end
		
		local _ = function(Player1: Player, _)
			-- upvalues: Log (copy), FFlagFacialAnimationStreamingClearAllConnectionsFix2Module (upval), Player (upval), t2 (copy), clearAllConnections (copy), clearCharacterAnimations (copy)
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
			Log:trace(string.format("%s {id: %s, name: %s}.", "Player character removing", v1, Name))
			
			if FFlagFacialAnimationStreamingClearAllConnectionsFix2Module then
				local CharacterDescendantAdded = Player.CharacterDescendantAdded
				
				if t2[Player1.UserId] and t2[Player1.UserId][CharacterDescendantAdded] then
					t2[Player1.UserId][CharacterDescendantAdded]:Disconnect()
					t2[Player1.UserId][CharacterDescendantAdded] = nil
				end
				local CharacterDescendantRemoving = Player.CharacterDescendantRemoving
				
				if t2[Player1.UserId] and t2[Player1.UserId][CharacterDescendantRemoving] then
					t2[Player1.UserId][CharacterDescendantRemoving]:Disconnect()
					t2[Player1.UserId][CharacterDescendantRemoving] = nil
				end
			else
				clearAllConnections(Player1)
			end
			clearCharacterAnimations(Player1)
		end
		
		local function playerUpdate(Player1: Player)
			-- upvalues: Log (copy), t (copy), FFlagFacialAnimationStreamingClearAllConnectionsFix2Module (upval), t1 (copy), clearAllConnections (copy), onCharacterAdded (copy), t2 (copy), Player (upval), clearCharacterAnimations (copy), onPlayerChatted (copy)
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
			Log:trace(string.format("%s {id: %s, name: %s}.", "Player update", v1, Name))
			local Entry = t[Player1.UserId]
			
			if FFlagFacialAnimationStreamingClearAllConnectionsFix2Module and Entry and t1[Player1.UserId] then
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
				Log:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", v2, Name1))
				
				return
			else
				clearAllConnections(Player1)
				
				if Entry then
					if FFlagFacialAnimationStreamingClearAllConnectionsFix2Module or not t1[Player1.UserId] then
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
						Log:trace(string.format("%s {id: %s, name: %s}.", "Player update - joined", v3, Name1))
						
						if Player1.Character then
							onCharacterAdded(Player1, Player1.Character)
						end
						t2[Player1.UserId][Player.CharacterAdded] = Player1.CharacterAdded:Connect(function(Character)
							-- upvalues: onCharacterAdded (upval), Player1 (copy)
							onCharacterAdded(Player1, Character)
						end)
						t2[Player1.UserId][Player.CharacterRemoving] = Player1.CharacterRemoving:Connect(function(_)
							-- upvalues: Player1 (copy), Log (upval), FFlagFacialAnimationStreamingClearAllConnectionsFix2Module (upval), Player (upval), t2 (upval), clearAllConnections (upval), clearCharacterAnimations (upval)
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
							Log:trace(string.format("%s {id: %s, name: %s}.", "Player character removing", v4, Name))
							
							if FFlagFacialAnimationStreamingClearAllConnectionsFix2Module then
								local CharacterDescendantAdded = Player.CharacterDescendantAdded
								
								if t2[Player1.UserId] and t2[Player1.UserId][CharacterDescendantAdded] then
									t2[Player1.UserId][CharacterDescendantAdded]:Disconnect()
									t2[Player1.UserId][CharacterDescendantAdded] = nil
								end
								local CharacterDescendantRemoving = Player.CharacterDescendantRemoving
								
								if t2[Player1.UserId] and t2[Player1.UserId][CharacterDescendantRemoving] then
									t2[Player1.UserId][CharacterDescendantRemoving]:Disconnect()
									t2[Player1.UserId][CharacterDescendantRemoving] = nil
								end
							else
								clearAllConnections(Player1)
							end
							clearCharacterAnimations(Player1)
						end)
						t2[Player1.UserId][Player.PlayerChatted] = Player1.Chatted:Connect(function(Message)
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
						Log:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", v4, Name2))
						
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
					Log:trace(string.format("%s {id: %s, name: %s}.", "Player update - left", v5, Name3))
					clearCharacterAnimations(Player1)
				end
			end
		end
		
		local function toggleMute(p2, Paused)
			-- upvalues: t1 (copy)
			if t1[p2] and t1[p2].animationTrack then
				t1[p2].animationTrack:TogglePause(Paused)
			end
		end
		
		local config = {
			setPlayerJoinedGame = function(Player: Player, p2)
				-- upvalues: t (copy), playerUpdate (copy)
				t[Player.UserId] = if p2 then true else nil
				playerUpdate(Player)
			end
		}
		
		function config.joinAllExistingPlayers()
			-- upvalues: Players (copy), config (copy), Log (copy)
			for _, player in ipairs(Players:GetPlayers()) do
				config.setPlayerJoinedGame(player, true)
			end
			Players.PlayerRemoving:Connect(function(Player: Player)
				-- upvalues: Log (upval), config (upval)
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
				Log:trace(string.format("%s {id: %s, name: %s}.", "Player leaving game", v1, Name))
				config.setPlayerJoinedGame(Player, false)
			end)
			Players.PlayerAdded:Connect(function(Player: Player)
				-- upvalues: Log (upval), config (upval)
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
				Log:trace(string.format("%s {id: %s, name: %s}.", "Player joining game", v1, Name))
				config.setPlayerJoinedGame(Player, true)
			end)
		end
		
		function config.leaveAllPlayers()
			-- upvalues: Players (copy), config (copy)
			for _, player in ipairs(Players:GetPlayers()) do
				config.setPlayerJoinedGame(player, false)
			end
		end
		
		config.playerUpdate = playerUpdate
		config.toggleMute = toggleMute
		config.updateStreamTrackStatus = updateStreamTrackStatus
		config.getPlayerFaceControls = getPlayerFaceControls
		
		function config.getStreamTrack(p2)
			-- upvalues: t1 (copy)
			local Entry = t1[p2]
			
			return if Entry then Entry.animationTrack else nil
		end
		
		function config.getConnectionCount(p2): number
			-- upvalues: t2 (copy)
			local Count = 0
			local Entry = t2[p2] or {}
			for _ in Entry do
				Count += 1
			end
			return Count
		end
		
		function config.getTrackedAnimator(p3)
			-- upvalues: t3 (copy)
			return t3[p3]
		end
		
		return config
	end
}