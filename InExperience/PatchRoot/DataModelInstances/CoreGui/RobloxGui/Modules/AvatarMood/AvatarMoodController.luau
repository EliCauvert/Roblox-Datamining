local config = {
	EmoteStopped = "currentEmoteTrackStopped",
	EmoteKeyframeReached = "emoteKeyframeReached",
	AnimationInstanceChanged = "animationInstanceChanged",
	EmoteTriggered = "localEmote",
	AnimateScriptAdded = "animateScriptAdded",
	AnimateScriptMoodAdded = "animateScriptMoodAdded",
	AnimateScriptMoodRemoved = "animateScriptMoodRemoved",
	MoodChildAdded = "moodChildAdded",
	HeadChildAdded = "headChildAdded",
	CharacterHumanoidAdded = "characterHumanoidAdded",
	HumanoidAnimatorAdded = "humanoidAnimatorAdded",
	CharacterChildAdded = "characterChildAdded",
	CharacterChildRemoved = "characterChildRemoved",
	DescendantAdded = "DescendantAdded",
	DescendantRemoving = "DescendantRemoving",
	AnimationStreamTrackPlayed = "AnimationStreamTrackPlayed",
	StreamTrackStopped = "StreamTrackStopped"
}
local config1 = {
	wave = true,
	point = true,
	dance = true,
	dance2 = true,
	dance3 = true,
	laugh = true,
	cheer = true
}

return {
	EMOTE_LOOP_TRANSITION_TIME = 0.3,
	MOOD_START_DELAY = 0.1,
	new = function(p1)
		-- upvalues: config (copy), config1 (copy)
		local LocalPlayer = p1.localPlayer
		local Wait1 = p1.wait or wait
		local Delay = p1.delay or task.delay
		local Animation = nil
		local AnimationTrack = nil
		local Core = Enum.AnimationPriority.Core
		local AnimationTrack1 = nil
		local Flag = true
		local Flag1 = false
		local StoppedConnections = {}
		
		local function _(Player: Player)
			return if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil
		end
		
		local _ = function(Player: Player)
			local Humanoid = if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil
			
			return if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
		end
		
		local _ = function(p2)
			-- upvalues: Core (ref), AnimationTrack (ref)
			Core = p2
			
			if AnimationTrack then
				AnimationTrack.Priority = Core
			end
		end
		
		local _ = function(Key)
			-- upvalues: StoppedConnections (copy)
			if StoppedConnections[Key] ~= nil then
				StoppedConnections[Key]:Disconnect()
				StoppedConnections[Key] = nil
			end
		end
		
		local _ = function()
			-- upvalues: AnimationTrack1 (ref), AnimationTrack (ref), StoppedConnections (copy)
			AnimationTrack1 = nil
			
			if AnimationTrack ~= nil then
				AnimationTrack:Play()
			end
			if StoppedConnections.currentEmoteTrackStopped ~= nil then
				StoppedConnections.currentEmoteTrackStopped:Disconnect()
				StoppedConnections.currentEmoteTrackStopped = nil
			end
			if StoppedConnections.emoteKeyframeReached ~= nil then
				StoppedConnections.emoteKeyframeReached:Disconnect()
				StoppedConnections.emoteKeyframeReached = nil
			end
		end
		
		local function onEmoteTriggered(Success, AnimationTrack2)
			-- upvalues: Flag (ref), AnimationTrack (ref), AnimationTrack1 (ref), Flag1 (ref), StoppedConnections (copy), config (upval)
			if not Flag or AnimationTrack == nil then return end
			if Success and AnimationTrack2 then
				AnimationTrack:Stop()
				AnimationTrack1 = AnimationTrack2
				Flag1 = true
				
				if StoppedConnections.currentEmoteTrackStopped ~= nil then
					StoppedConnections.currentEmoteTrackStopped:Disconnect()
					StoppedConnections.currentEmoteTrackStopped = nil
				end
				if StoppedConnections.emoteKeyframeReached ~= nil then
					StoppedConnections.emoteKeyframeReached:Disconnect()
					StoppedConnections.emoteKeyframeReached = nil
				end
				StoppedConnections.currentEmoteTrackStopped = AnimationTrack1.Stopped:Connect(function()
					-- upvalues: AnimationTrack1 (upval), AnimationTrack (upval), config (upval), StoppedConnections (upval), Flag1 (upval)
					AnimationTrack1 = nil
					
					if AnimationTrack ~= nil then
						AnimationTrack:Play()
					end
					local EmoteStopped = config.EmoteStopped
					
					if StoppedConnections[EmoteStopped] ~= nil then
						StoppedConnections[EmoteStopped]:Disconnect()
						StoppedConnections[EmoteStopped] = nil
					end
					local EmoteKeyframeReached = config.EmoteKeyframeReached
					
					if StoppedConnections[EmoteKeyframeReached] ~= nil then
						StoppedConnections[EmoteKeyframeReached]:Disconnect()
						StoppedConnections[EmoteKeyframeReached] = nil
					end
					Flag1 = false
				end)
				StoppedConnections.emoteKeyframeReached = AnimationTrack1.KeyframeReached:Connect(function(KeyframeName)
					-- upvalues: AnimationTrack1 (upval), AnimationTrack (upval), config (upval), StoppedConnections (upval), Flag1 (upval)
					if KeyframeName == "End" and not AnimationTrack1.Looped then
						AnimationTrack1 = nil
						
						if AnimationTrack ~= nil then
							AnimationTrack:Play()
						end
						local EmoteStopped = config.EmoteStopped
						
						if StoppedConnections[EmoteStopped] ~= nil then
							StoppedConnections[EmoteStopped]:Disconnect()
							StoppedConnections[EmoteStopped] = nil
						end
						local EmoteKeyframeReached = config.EmoteKeyframeReached
						
						if StoppedConnections[EmoteKeyframeReached] ~= nil then
							StoppedConnections[EmoteKeyframeReached]:Disconnect()
							StoppedConnections[EmoteKeyframeReached] = nil
						end
						Flag1 = false
					end
				end)
			end
		end
		
		local _ = nil
		
		local function checkEmotePlaying(Humanoid): boolean
			-- upvalues: config1 (upval), StoppedConnections (copy), AnimationTrack1 (ref), Flag1 (ref), AnimationTrack (ref), Wait1 (copy), checkEmotePlaying (ref), config (upval)
			local Flag = false
			
			for _, playingAnimationTrack in pairs((Humanoid:GetPlayingAnimationTracks())) do
				if playingAnimationTrack.IsPlaying and playingAnimationTrack.Animation.Parent and config1[playingAnimationTrack.Animation.Parent.Name] then
					if StoppedConnections.currentEmoteTrackStopped ~= nil then
						StoppedConnections.currentEmoteTrackStopped:Disconnect()
						StoppedConnections.currentEmoteTrackStopped = nil
					end
					if StoppedConnections.emoteKeyframeReached ~= nil then
						StoppedConnections.emoteKeyframeReached:Disconnect()
						StoppedConnections.emoteKeyframeReached = nil
					end
					AnimationTrack1 = playingAnimationTrack
					Flag1 = false
					AnimationTrack:Stop()
					StoppedConnections.currentEmoteTrackStopped = AnimationTrack1.Stopped:Connect(function()
						-- upvalues: Wait1 (upval), checkEmotePlaying (upval), Humanoid (copy), Flag1 (upval), AnimationTrack1 (upval), AnimationTrack (upval), config (upval), StoppedConnections (upval)
						Wait1(0.3)
						
						if not checkEmotePlaying(Humanoid) and not Flag1 then
							AnimationTrack1 = nil
							
							if AnimationTrack ~= nil then
								AnimationTrack:Play()
							end
							local EmoteStopped = config.EmoteStopped
							
							if StoppedConnections[EmoteStopped] ~= nil then
								StoppedConnections[EmoteStopped]:Disconnect()
								StoppedConnections[EmoteStopped] = nil
							end
							local EmoteKeyframeReached = config.EmoteKeyframeReached
							
							if StoppedConnections[EmoteKeyframeReached] ~= nil then
								StoppedConnections[EmoteKeyframeReached]:Disconnect()
								StoppedConnections[EmoteKeyframeReached] = nil
							end
						end
					end)
					StoppedConnections.emoteKeyframeReached = AnimationTrack1.KeyframeReached:Connect(function(KeyframeName)
						-- upvalues: Wait1 (upval), checkEmotePlaying (upval), Humanoid (copy), Flag1 (upval), AnimationTrack1 (upval), AnimationTrack (upval), config (upval), StoppedConnections (upval)
						if KeyframeName == "End" then
							Wait1(0.3)
							
							if not checkEmotePlaying(Humanoid) and not Flag1 then
								AnimationTrack1 = nil
								
								if AnimationTrack ~= nil then
									AnimationTrack:Play()
								end
								local EmoteStopped = config.EmoteStopped
								
								if StoppedConnections[EmoteStopped] ~= nil then
									StoppedConnections[EmoteStopped]:Disconnect()
									StoppedConnections[EmoteStopped] = nil
								end
								local EmoteKeyframeReached = config.EmoteKeyframeReached
								
								if StoppedConnections[EmoteKeyframeReached] ~= nil then
									StoppedConnections[EmoteKeyframeReached]:Disconnect()
									StoppedConnections[EmoteKeyframeReached] = nil
								end
							end
						end
					end)
					Flag = true
				end
			end
			return Flag
		end
		
		local _ = function()
			-- upvalues: AnimationTrack (ref)
			if AnimationTrack ~= nil then
				AnimationTrack:Stop()
				AnimationTrack:Destroy()
				AnimationTrack = nil
			end
		end
		
		local _ = function()
			-- upvalues: AnimationTrack (ref), StoppedConnections (copy), Animation (ref)
			if AnimationTrack ~= nil then
				AnimationTrack:Stop()
				AnimationTrack:Destroy()
				AnimationTrack = nil
			end
			if StoppedConnections.currentEmoteTrackStopped ~= nil then
				StoppedConnections.currentEmoteTrackStopped:Disconnect()
				StoppedConnections.currentEmoteTrackStopped = nil
			end
			if StoppedConnections.emoteKeyframeReached ~= nil then
				StoppedConnections.emoteKeyframeReached:Disconnect()
				StoppedConnections.emoteKeyframeReached = nil
			end
			if StoppedConnections.animationInstanceChanged ~= nil then
				StoppedConnections.animationInstanceChanged:Disconnect()
				StoppedConnections.animationInstanceChanged = nil
			end
			if StoppedConnections.localEmote ~= nil then
				StoppedConnections.localEmote:Disconnect()
				StoppedConnections.localEmote = nil
			end
			Animation = nil
		end
		
		local _ = function(_, _, p2, Animator: Animator)
			-- upvalues: AnimationTrack (ref), Animation (ref), Core (ref), Delay (copy), AnimationTrack1 (ref), StoppedConnections (copy), onEmoteTriggered (copy)
			AnimationTrack = Animator:LoadAnimation(Animation)
			AnimationTrack.Priority = Core
			Delay(0.1, function()
				-- upvalues: AnimationTrack1 (upval), Animation (upval), AnimationTrack (upval), Animator (copy), Core (upval), StoppedConnections (upval), p2 (copy), onEmoteTriggered (upval)
				if AnimationTrack1 == nil and Animation then
					if not AnimationTrack then
						AnimationTrack = Animator:LoadAnimation(Animation)
					end
					if AnimationTrack then
						AnimationTrack.Priority = Core
						AnimationTrack:Play()
					end
				end
				if StoppedConnections.localEmote ~= nil then
					StoppedConnections.localEmote:Disconnect()
					StoppedConnections.localEmote = nil
				end
				StoppedConnections.localEmote = p2.EmoteTriggered:Connect(onEmoteTriggered)
			end)
		end
		
		local function updateCharacterMoodOnHumanoidAdded(p2, p3, Humanoid)
			-- upvalues: AnimationTrack (ref), Animation (ref), Core (ref), Delay (copy), AnimationTrack1 (ref), StoppedConnections (copy), onEmoteTriggered (copy)
			local Animator = Humanoid:FindFirstChild("Animator")
			
			if Animator then
				AnimationTrack = Animator:LoadAnimation(Animation)
				AnimationTrack.Priority = Core
				Delay(0.1, function()
					-- upvalues: AnimationTrack1 (upval), Animation (upval), AnimationTrack (upval), Animator (copy), Core (upval), StoppedConnections (upval), Humanoid (copy), onEmoteTriggered (upval)
					if AnimationTrack1 == nil and Animation then
						if not AnimationTrack then
							AnimationTrack = Animator:LoadAnimation(Animation)
						end
						if AnimationTrack then
							AnimationTrack.Priority = Core
							AnimationTrack:Play()
						end
					end
					if StoppedConnections.localEmote ~= nil then
						StoppedConnections.localEmote:Disconnect()
						StoppedConnections.localEmote = nil
					end
					StoppedConnections.localEmote = Humanoid.EmoteTriggered:Connect(onEmoteTriggered)
				end)
			end
			if StoppedConnections.humanoidAnimatorAdded and StoppedConnections.humanoidAnimatorAdded ~= nil then
				StoppedConnections.humanoidAnimatorAdded:Disconnect()
				StoppedConnections.humanoidAnimatorAdded = nil
			end
			StoppedConnections.humanoidAnimatorAdded = Humanoid.ChildAdded:Connect(function(Child: Animator)
				-- upvalues: p2 (copy), p3 (copy), Humanoid (copy), AnimationTrack (upval), Animation (upval), Core (upval), Delay (upval), AnimationTrack1 (upval), StoppedConnections (upval), onEmoteTriggered (upval)
				if Child.Name == "Animator" then
					AnimationTrack = Child:LoadAnimation(Animation)
					AnimationTrack.Priority = Core
					Delay(0.1, function()
						-- upvalues: AnimationTrack1 (upval), Animation (upval), AnimationTrack (upval), Child (copy), Core (upval), StoppedConnections (upval), Humanoid (copy), onEmoteTriggered (upval)
						if AnimationTrack1 == nil and Animation then
							if not AnimationTrack then
								AnimationTrack = Child:LoadAnimation(Animation)
							end
							if AnimationTrack then
								AnimationTrack.Priority = Core
								AnimationTrack:Play()
							end
						end
						if StoppedConnections.localEmote ~= nil then
							StoppedConnections.localEmote:Disconnect()
							StoppedConnections.localEmote = nil
						end
						StoppedConnections.localEmote = Humanoid.EmoteTriggered:Connect(onEmoteTriggered)
					end)
				end
			end)
		end
		
		local _ = nil
		
		local function updateCharacterMood(Character, Animation1)
			-- upvalues: Flag (ref), StoppedConnections (copy), AnimationTrack (ref), Animation (ref), updateCharacterMood (ref), updateCharacterMoodOnHumanoidAdded (copy)
			if Character == nil or Animation1 == nil or not Flag then return end
			if StoppedConnections.animationInstanceChanged and StoppedConnections.animationInstanceChanged ~= nil then
				StoppedConnections.animationInstanceChanged:Disconnect()
				StoppedConnections.animationInstanceChanged = nil
			end
			if StoppedConnections.characterHumanoidAdded and StoppedConnections.characterHumanoidAdded ~= nil then
				StoppedConnections.characterHumanoidAdded:Disconnect()
				StoppedConnections.characterHumanoidAdded = nil
			end
			if AnimationTrack ~= nil then
				AnimationTrack:Stop()
				AnimationTrack:Destroy()
				AnimationTrack = nil
			end
			Animation = Animation1
			StoppedConnections.animationInstanceChanged = Animation.Changed:Connect(function(_)
				-- upvalues: updateCharacterMood (upval), Character (copy), Animation1 (copy)
				updateCharacterMood(Character, Animation1)
			end)
			local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
			
			if Humanoid then
				updateCharacterMoodOnHumanoidAdded(Character, Animation1, Humanoid)
			end
			StoppedConnections.characterHumanoidAdded = Character.ChildAdded:Connect(function(Child: Humanoid)
				-- upvalues: updateCharacterMoodOnHumanoidAdded (upval), Character (copy), Animation1 (copy), Humanoid (copy)
				if Child:IsA("Humanoid") then
					updateCharacterMoodOnHumanoidAdded(Character, Animation1, Humanoid)
				end
			end)
		end
		
		local function initAvatarMood(Object)
			-- upvalues: StoppedConnections (copy), Flag (ref), updateCharacterMood (ref), LocalPlayer (copy), AnimationTrack (ref), config (upval), Animation (ref)
			local MoodsEnabled = Object:FindFirstChild("MoodsEnabled")
			
			if StoppedConnections.animateScriptMoodAdded ~= nil then
				StoppedConnections.animateScriptMoodAdded:Disconnect()
				StoppedConnections.animateScriptMoodAdded = nil
			end
			if StoppedConnections.animateScriptMoodRemoved ~= nil then
				StoppedConnections.animateScriptMoodRemoved:Disconnect()
				StoppedConnections.animateScriptMoodRemoved = nil
			end
			if MoodsEnabled then
				Flag = false
				
				return
			end
			local Mood = Object:FindFirstChild("mood")
			
			if Mood then
				if #Mood:GetChildren() > 0 then
					updateCharacterMood(LocalPlayer.Character, Mood:FindFirstChildWhichIsA("Animation"))
				end
				if StoppedConnections.moodChildAdded ~= nil then
					StoppedConnections.moodChildAdded:Disconnect()
					StoppedConnections.moodChildAdded = nil
				end
				StoppedConnections.moodChildAdded = Mood.ChildAdded:Connect(function(Child)
					-- upvalues: updateCharacterMood (upval), LocalPlayer (upval)
					if Child:IsA("Animation") then
						updateCharacterMood(LocalPlayer.Character, Child)
					end
				end)
			else
				if AnimationTrack ~= nil then
					AnimationTrack:Stop()
					AnimationTrack:Destroy()
					AnimationTrack = nil
				end
				local EmoteStopped = config.EmoteStopped
				
				if StoppedConnections[EmoteStopped] ~= nil then
					StoppedConnections[EmoteStopped]:Disconnect()
					StoppedConnections[EmoteStopped] = nil
				end
				local EmoteKeyframeReached = config.EmoteKeyframeReached
				
				if StoppedConnections[EmoteKeyframeReached] ~= nil then
					StoppedConnections[EmoteKeyframeReached]:Disconnect()
					StoppedConnections[EmoteKeyframeReached] = nil
				end
				local AnimationInstanceChanged = config.AnimationInstanceChanged
				
				if StoppedConnections[AnimationInstanceChanged] ~= nil then
					StoppedConnections[AnimationInstanceChanged]:Disconnect()
					StoppedConnections[AnimationInstanceChanged] = nil
				end
				local EmoteTriggered = config.EmoteTriggered
				
				if StoppedConnections[EmoteTriggered] ~= nil then
					StoppedConnections[EmoteTriggered]:Disconnect()
					StoppedConnections[EmoteTriggered] = nil
				end
				Animation = nil
			end
			StoppedConnections.animateScriptMoodAdded = Object.ChildAdded:Connect(function(Child)
				-- upvalues: updateCharacterMood (upval), LocalPlayer (upval), StoppedConnections (upval), Flag (upval)
				if Child.Name == "mood" then
					if #Child:GetChildren() > 0 then
						updateCharacterMood(LocalPlayer.Character, Child:GetChildren()[1])
					end
					if StoppedConnections.moodChildAdded ~= nil then
						StoppedConnections.moodChildAdded:Disconnect()
						StoppedConnections.moodChildAdded = nil
					end
					StoppedConnections.moodChildAdded = Child.ChildAdded:Connect(function(Child)
						-- upvalues: updateCharacterMood (upval), LocalPlayer (upval)
						updateCharacterMood(LocalPlayer.Character, Child)
					end)
					
					return
				elseif Child.Name == "MoodsEnabled" then
					Flag = false
				end
			end)
			StoppedConnections.animateScriptMoodRemoved = Object.ChildRemoved:Connect(function(Child)
				-- upvalues: Object (copy), updateCharacterMood (upval), LocalPlayer (upval), AnimationTrack (upval), config (upval), StoppedConnections (upval), Animation (upval)
				if Child.Name == "mood" then
					local Mood = Object:FindFirstChild("mood")
					
					if Mood then
						updateCharacterMood(LocalPlayer.Character, Mood:FindFirstChildWhichIsA("Animation"))
						
						return
					end
					if AnimationTrack ~= nil then
						AnimationTrack:Stop()
						AnimationTrack:Destroy()
						AnimationTrack = nil
					end
					local EmoteStopped = config.EmoteStopped
					
					if StoppedConnections[EmoteStopped] ~= nil then
						StoppedConnections[EmoteStopped]:Disconnect()
						StoppedConnections[EmoteStopped] = nil
					end
					local EmoteKeyframeReached = config.EmoteKeyframeReached
					
					if StoppedConnections[EmoteKeyframeReached] ~= nil then
						StoppedConnections[EmoteKeyframeReached]:Disconnect()
						StoppedConnections[EmoteKeyframeReached] = nil
					end
					local AnimationInstanceChanged = config.AnimationInstanceChanged
					
					if StoppedConnections[AnimationInstanceChanged] ~= nil then
						StoppedConnections[AnimationInstanceChanged]:Disconnect()
						StoppedConnections[AnimationInstanceChanged] = nil
					end
					local EmoteTriggered = config.EmoteTriggered
					
					if StoppedConnections[EmoteTriggered] ~= nil then
						StoppedConnections[EmoteTriggered]:Disconnect()
						StoppedConnections[EmoteTriggered] = nil
					end
					Animation = nil
				end
			end)
		end
		
		local function waitForAnimateScript()
			-- upvalues: LocalPlayer (copy), initAvatarMood (copy), StoppedConnections (copy)
			local Animate = LocalPlayer.Character:FindFirstChild("Animate")
			
			if Animate then
				initAvatarMood(Animate)
			end
			if StoppedConnections.animateScriptAdded ~= nil then
				StoppedConnections.animateScriptAdded:Disconnect()
				StoppedConnections.animateScriptAdded = nil
			end
			StoppedConnections.animateScriptAdded = LocalPlayer.Character.ChildAdded:Connect(function(Child)
				-- upvalues: initAvatarMood (upval)
				if Child.Name == "Animate" then
					initAvatarMood(Child)
				end
			end)
		end
		
		local function onHeadAdded(Head)
			-- upvalues: waitForAnimateScript (copy), StoppedConnections (copy)
			if Head:FindFirstChildWhichIsA("FaceControls") then
				waitForAnimateScript()
			end
			if StoppedConnections.headChildAdded ~= nil then
				StoppedConnections.headChildAdded:Disconnect()
				StoppedConnections.headChildAdded = nil
			end
			StoppedConnections.headChildAdded = Head.ChildAdded:Connect(function(Child)
				-- upvalues: waitForAnimateScript (upval)
				if Child:IsA("FaceControls") then
					waitForAnimateScript()
				end
			end)
		end
		
		local _ = function(p2)
			-- upvalues: StoppedConnections (copy), Core (ref), AnimationTrack (ref)
			if StoppedConnections.StreamTrackStopped ~= nil then
				StoppedConnections.StreamTrackStopped:Disconnect()
				StoppedConnections.StreamTrackStopped = nil
			end
			Core = Enum.AnimationPriority.Idle
			
			if AnimationTrack then
				AnimationTrack.Priority = Core
			end
			StoppedConnections.StreamTrackStopped = p2.Stopped:Connect(function()
				-- upvalues: StoppedConnections (upval), Core (upval), AnimationTrack (upval)
				if StoppedConnections.StreamTrackStopped ~= nil then
					StoppedConnections.StreamTrackStopped:Disconnect()
					StoppedConnections.StreamTrackStopped = nil
				end
				Core = Enum.AnimationPriority.Core
				
				if AnimationTrack then
					AnimationTrack.Priority = Core
				end
			end)
		end
		
		local function onAnimatorAdded(Animator)
			-- upvalues: StoppedConnections (copy), config (upval), Core (ref), AnimationTrack (ref)
			if StoppedConnections.AnimationStreamTrackPlayed ~= nil then
				StoppedConnections.AnimationStreamTrackPlayed:Disconnect()
				StoppedConnections.AnimationStreamTrackPlayed = nil
			end
			StoppedConnections.AnimationStreamTrackPlayed = Animator.AnimationStreamTrackPlayed:Connect(function(AnimationTrack1)
				-- upvalues: config (upval), StoppedConnections (upval), Core (upval), AnimationTrack (upval)
				local StreamTrackStopped = config.StreamTrackStopped
				
				if StoppedConnections[StreamTrackStopped] ~= nil then
					StoppedConnections[StreamTrackStopped]:Disconnect()
					StoppedConnections[StreamTrackStopped] = nil
				end
				Core = Enum.AnimationPriority.Idle
				
				if AnimationTrack then
					AnimationTrack.Priority = Core
				end
				StoppedConnections[config.StreamTrackStopped] = AnimationTrack1.Stopped:Connect(function()
					-- upvalues: StoppedConnections (upval), Core (upval), AnimationTrack (upval)
					if StoppedConnections.StreamTrackStopped ~= nil then
						StoppedConnections.StreamTrackStopped:Disconnect()
						StoppedConnections.StreamTrackStopped = nil
					end
					Core = Enum.AnimationPriority.Core
					
					if AnimationTrack then
						AnimationTrack.Priority = Core
					end
				end)
			end)
			local v1 = nil
			
			for _, AnimationStreamTrack in Animator:GetPlayingAnimationTracksCoreScript() do
				if AnimationStreamTrack:IsA("AnimationStreamTrack") then
					v1 = AnimationStreamTrack
					break
				end
			end
			if v1 then
				local StreamTrackStopped = config.StreamTrackStopped
				
				if StoppedConnections[StreamTrackStopped] ~= nil then
					StoppedConnections[StreamTrackStopped]:Disconnect()
					StoppedConnections[StreamTrackStopped] = nil
				end
				Core = Enum.AnimationPriority.Idle
				
				if AnimationTrack then
					AnimationTrack.Priority = Core
				end
				StoppedConnections[config.StreamTrackStopped] = v1.Stopped:Connect(function()
					-- upvalues: StoppedConnections (upval), Core (upval), AnimationTrack (upval)
					if StoppedConnections.StreamTrackStopped ~= nil then
						StoppedConnections.StreamTrackStopped:Disconnect()
						StoppedConnections.StreamTrackStopped = nil
					end
					Core = Enum.AnimationPriority.Core
					
					if AnimationTrack then
						AnimationTrack.Priority = Core
					end
				end)
				
				return
			else
				Core = Enum.AnimationPriority.Core
				
				if AnimationTrack then
					AnimationTrack.Priority = Core
				end
			end
		end
		
		local _ = function(Player: Player, _)
			-- upvalues: StoppedConnections (copy), Core (ref), AnimationTrack (ref), onAnimatorAdded (copy)
			if StoppedConnections.AnimationStreamTrackPlayed ~= nil then
				StoppedConnections.AnimationStreamTrackPlayed:Disconnect()
				StoppedConnections.AnimationStreamTrackPlayed = nil
			end
			if StoppedConnections.StreamTrackStopped ~= nil then
				StoppedConnections.StreamTrackStopped:Disconnect()
				StoppedConnections.StreamTrackStopped = nil
			end
			Core = Enum.AnimationPriority.Core
			
			if AnimationTrack then
				AnimationTrack.Priority = Core
			end
			local Humanoid = if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil
			local Animator = if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
			
			if Animator then
				onAnimatorAdded(Animator)
			end
		end
		
		local function onCharacterAdded(Player: Player, Object)
			-- upvalues: onHeadAdded (copy), StoppedConnections (copy), AnimationTrack (ref), onAnimatorAdded (copy), config (upval), Core (ref)
			local Head = Object:FindFirstChild("Head")
			
			if Head then
				onHeadAdded(Head)
			end
			StoppedConnections.characterChildAdded = Object.ChildAdded:Connect(function(Child)
				-- upvalues: onHeadAdded (upval)
				if Child.Name == "Head" then
					onHeadAdded(Child)
				end
			end)
			StoppedConnections.characterChildRemoved = Object.ChildRemoved:Connect(function(Child)
				-- upvalues: AnimationTrack (upval), Object (copy), onHeadAdded (upval)
				if Child.Name == "Head" then
					if AnimationTrack ~= nil then
						AnimationTrack:Stop()
						AnimationTrack:Destroy()
						AnimationTrack = nil
					end
					local Head = Object:FindFirstChild("Head")
					
					if Head then
						onHeadAdded(Head)
					end
				end
			end)
			StoppedConnections.DescendantAdded = Object.DescendantAdded:Connect(function(Descendant: Animator)
				-- upvalues: onAnimatorAdded (upval)
				if Descendant:IsA("Animator") then
					onAnimatorAdded(Descendant)
				end
			end)
			local Animator = Object:FindFirstChildWhichIsA("Animator", true)
			
			if Animator then
				onAnimatorAdded(Animator)
			end
			StoppedConnections.DescendantRemoving = Object.DescendantRemoving:Connect(function(Descendant: Animator)
				-- upvalues: Player (copy), config (upval), StoppedConnections (upval), Core (upval), AnimationTrack (upval), onAnimatorAdded (upval)
				if Descendant:IsA("Animator") then
					local AnimationStreamTrackPlayed = config.AnimationStreamTrackPlayed
					
					if StoppedConnections[AnimationStreamTrackPlayed] ~= nil then
						StoppedConnections[AnimationStreamTrackPlayed]:Disconnect()
						StoppedConnections[AnimationStreamTrackPlayed] = nil
					end
					local StreamTrackStopped = config.StreamTrackStopped
					
					if StoppedConnections[StreamTrackStopped] ~= nil then
						StoppedConnections[StreamTrackStopped]:Disconnect()
						StoppedConnections[StreamTrackStopped] = nil
					end
					Core = Enum.AnimationPriority.Core
					
					if AnimationTrack then
						AnimationTrack.Priority = Core
					end
					local Humanoid = if Player.Character then Player.Character:FindFirstChildOfClass("Humanoid") else nil
					local Animator = if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
					
					if Animator then
						onAnimatorAdded(Animator)
					end
				end
			end)
		end
		
		return {
			onCharacterAdded = function(p2)
				-- upvalues: onCharacterAdded (copy), LocalPlayer (copy)
				onCharacterAdded(LocalPlayer, p2)
			end,
			onCharacterRemoving = function(_)
				-- upvalues: AnimationTrack (ref), StoppedConnections (copy)
				if AnimationTrack ~= nil then
					AnimationTrack:Stop()
					AnimationTrack:Destroy()
					AnimationTrack = nil
				end
				for _, stoppedConnection in pairs(StoppedConnections) do
					if stoppedConnection then
						stoppedConnection:Disconnect()
					end
				end
				table.clear(StoppedConnections)
			end,
			onChatted = function(Text: string)
				-- upvalues: Flag (ref), AnimationTrack (ref), LocalPlayer (copy), config1 (upval), Wait1 (copy), checkEmotePlaying (ref)
				if not Flag or AnimationTrack == nil then return end
				if LocalPlayer.Character then
					local Humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
					
					if Humanoid then
						local Segment = ""
						
						if string.sub(Text, 1, 3) == "/e " then
							Segment = string.sub(Text, 4)
						elseif string.sub(Text, 1, 7) == "/emote " then
							Segment = string.sub(Text, 8)
						end
						if config1[Segment] then
							Wait1(0.3)
							checkEmotePlaying(Humanoid)
						end
					end
				end
			end,
			getMoodTrack = function()
				-- upvalues: AnimationTrack (ref)
				return AnimationTrack
			end,
			getMoodPriority = function()
				-- upvalues: Core (ref)
				return Core
			end,
			isEnabled = function()
				-- upvalues: Flag (ref)
				return Flag
			end,
			getConnectionCount = function(): number
				-- upvalues: StoppedConnections (copy)
				local Count = 0
				
				for _ in StoppedConnections do
					Count += 1
				end
				return Count
			end
		}
	end
}