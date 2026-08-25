local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localPlayer = playersService.LocalPlayer
local _ = coreGuiService.RobloxGui
local _ = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local _ = nil
local var3 = nil
local var4 = nil
local core = Enum.AnimationPriority.Core
local var5 = nil
local var6 = true
local var7 = false
local t = {}
local t_1 = {
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
local t_2 = {
	wave = true,
	point = true,
	dance = true,
	dance2 = true,
	dance3 = true,
	laugh = true,
	cheer = true
}

local function _(p0)
	return if p0.Character then p0.Character:FindFirstChildOfClass("Humanoid") else nil
end

local _ = function(p1)
	local var21 = if p1.Character then p1.Character:FindFirstChildOfClass("Humanoid") else nil
	
	return if var21 then var21:FindFirstChildOfClass("Animator") else nil
end

local _ = function(p2)
	-- upvalues: core (write), var4 (write)
	core = p2
	
	if var4 then
		var4.Priority = core
	end
end

local _ = function(p3)
	-- upvalues: t (ref)
	if t[p3] ~= nil then
		t[p3]:Disconnect()
		t[p3] = nil
	end
end

local _ = function()
	-- upvalues: var5 (write), var4 (write), t (ref)
	var5 = nil
	
	if var4 ~= nil then
		var4:Play()
	end
	if t.currentEmoteTrackStopped ~= nil then
		t.currentEmoteTrackStopped:Disconnect()
		t.currentEmoteTrackStopped = nil
	end
	if t.emoteKeyframeReached ~= nil then
		t.emoteKeyframeReached:Disconnect()
		t.emoteKeyframeReached = nil
	end
end

local function onEmoteTriggered(p4, p5)
	-- upvalues: var6 (write), var4 (write), var5 (write), var7 (write), t (ref), t_1 (ref)
	if not var6 or var4 == nil then return end
	if p4 and p5 then
		var4:Stop()
		var5 = p5
		var7 = true
		
		if t.currentEmoteTrackStopped ~= nil then
			t.currentEmoteTrackStopped:Disconnect()
			t.currentEmoteTrackStopped = nil
		end
		if t.emoteKeyframeReached ~= nil then
			t.emoteKeyframeReached:Disconnect()
			t.emoteKeyframeReached = nil
		end
		t.currentEmoteTrackStopped = var5.Stopped:Connect(function()
			-- upvalues: var5 (copy), var4 (copy), t_1 (copy), t (copy), var7 (copy)
			var5 = nil
			
			if var4 ~= nil then
				var4:Play()
			end
			local emoteStopped = t_1.EmoteStopped
			
			if t[emoteStopped] ~= nil then
				t[emoteStopped]:Disconnect()
				t[emoteStopped] = nil
			end
			local emoteKeyframeReached = t_1.EmoteKeyframeReached
			
			if t[emoteKeyframeReached] ~= nil then
				t[emoteKeyframeReached]:Disconnect()
				t[emoteKeyframeReached] = nil
			end
			var7 = false
		end)
		t.emoteKeyframeReached = var5.KeyframeReached:Connect(function(p6)
			-- upvalues: var5 (copy), var4 (copy), t_1 (copy), t (copy), var7 (copy)
			if p6 == "End" and not var5.Looped then
				var5 = nil
				
				if var4 ~= nil then
					var4:Play()
				end
				local emoteStopped = t_1.EmoteStopped
				
				if t[emoteStopped] ~= nil then
					t[emoteStopped]:Disconnect()
					t[emoteStopped] = nil
				end
				local emoteKeyframeReached = t_1.EmoteKeyframeReached
				
				if t[emoteKeyframeReached] ~= nil then
					t[emoteKeyframeReached]:Disconnect()
					t[emoteKeyframeReached] = nil
				end
				var7 = false
			end
		end)
	end
end

local function checkEmotePlaying(p7)
	-- upvalues: t_2 (ref), t (ref), var5 (write), var7 (write), var4 (write), checkEmotePlaying (ref), t_1 (ref)
	local var22 = false
	
	for i, v in pairs(p7:GetPlayingAnimationTracks()) do
		if v.IsPlaying and v.Animation.Parent and t_2[v.Animation.Parent.Name] then
			if t.currentEmoteTrackStopped ~= nil then
				t.currentEmoteTrackStopped:Disconnect()
				t.currentEmoteTrackStopped = nil
			end
			if t.emoteKeyframeReached ~= nil then
				t.emoteKeyframeReached:Disconnect()
				t.emoteKeyframeReached = nil
			end
			var5 = v
			var7 = false
			var4:Stop()
			t.currentEmoteTrackStopped = var5.Stopped:Connect(function()
				-- upvalues: checkEmotePlaying (copy), p7 (ref), var7 (copy), var5 (copy), var4 (copy), t_1 (copy), t (copy)
				wait(0.3)
				
				if not checkEmotePlaying(p7) and not var7 then
					var5 = nil
					
					if var4 ~= nil then
						var4:Play()
					end
					local emoteStopped = t_1.EmoteStopped
					
					if t[emoteStopped] ~= nil then
						t[emoteStopped]:Disconnect()
						t[emoteStopped] = nil
					end
					local emoteKeyframeReached = t_1.EmoteKeyframeReached
					
					if t[emoteKeyframeReached] ~= nil then
						t[emoteKeyframeReached]:Disconnect()
						t[emoteKeyframeReached] = nil
					end
				end
			end)
			t.emoteKeyframeReached = var5.KeyframeReached:Connect(function(p8)
				-- upvalues: checkEmotePlaying (copy), p7 (ref), var7 (copy), var5 (copy), var4 (copy), t_1 (copy), t (copy)
				if p8 == "End" then
					wait(0.3)
					
					if not checkEmotePlaying(p7) and not var7 then
						var5 = nil
						
						if var4 ~= nil then
							var4:Play()
						end
						local emoteStopped = t_1.EmoteStopped
						
						if t[emoteStopped] ~= nil then
							t[emoteStopped]:Disconnect()
							t[emoteStopped] = nil
						end
						local emoteKeyframeReached = t_1.EmoteKeyframeReached
						
						if t[emoteKeyframeReached] ~= nil then
							t[emoteKeyframeReached]:Disconnect()
							t[emoteKeyframeReached] = nil
						end
					end
				end
			end)
			var22 = true
		end
	end
	return var22
end

local chattedConnection = localPlayer.Chatted:Connect(function(p9)
	-- upvalues: var6 (write), var4 (write), localPlayer (ref), t_2 (ref), checkEmotePlaying (ref)
	if not var6 or var4 == nil then return end
	if localPlayer.Character then
		local humanoid = localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		
		if humanoid then
			local var24 = ""
			
			if string.sub(p9, 1, 3) == "/e " then
				var24 = string.sub(p9, 4)
			elseif string.sub(p9, 1, 7) == "/emote " then
				var24 = string.sub(p9, 8)
			end
			if t_2[var24] then
				wait(0.3)
				checkEmotePlaying(humanoid)
			end
		end
	end
end)

chattedConnection = function()
	-- upvalues: var4 (write)
	if var4 ~= nil then
		var4:Stop()
		var4:Destroy()
		var4 = nil
	end
end

local _ = function()
	-- upvalues: var4 (write), t (ref), var3 (write)
	if var4 ~= nil then
		var4:Stop()
		var4:Destroy()
		var4 = nil
	end
	if t.currentEmoteTrackStopped ~= nil then
		t.currentEmoteTrackStopped:Disconnect()
		t.currentEmoteTrackStopped = nil
	end
	if t.emoteKeyframeReached ~= nil then
		t.emoteKeyframeReached:Disconnect()
		t.emoteKeyframeReached = nil
	end
	if t.animationInstanceChanged ~= nil then
		t.animationInstanceChanged:Disconnect()
		t.animationInstanceChanged = nil
	end
	if t.localEmote ~= nil then
		t.localEmote:Disconnect()
		t.localEmote = nil
	end
	var3 = nil
end

local _ = function(_, _, p10, p11)
	-- upvalues: var4 (write), var3 (write), core (write), var5 (write), t (ref), onEmoteTriggered (ref)
	var4 = p11:LoadAnimation(var3)
	var4.Priority = core
	task.delay(0.1, function()
		-- upvalues: var5 (copy), var3 (copy), var4 (copy), p11 (ref), core (copy), t (copy), p10 (ref), onEmoteTriggered (copy)
		if var5 == nil and var3 then
			if not var4 then
				var4 = p11:LoadAnimation(var3)
			end
			if var4 then
				var4.Priority = core
				var4:Play()
			end
		end
		if t.localEmote ~= nil then
			t.localEmote:Disconnect()
			t.localEmote = nil
		end
		t.localEmote = p10.EmoteTriggered:Connect(onEmoteTriggered)
	end)
end

local function updateCharacterMoodOnHumanoidAdded(p12, p13, p14)
	-- upvalues: var4 (write), var3 (write), core (write), var5 (write), t (ref), onEmoteTriggered (ref)
	local animator = p14:FindFirstChild("Animator")
	
	if animator then
		var4 = animator:LoadAnimation(var3)
		var4.Priority = core
		task.delay(0.1, function()
			-- upvalues: var5 (copy), var3 (copy), var4 (copy), animator (ref), core (copy), t (copy), p14 (ref), onEmoteTriggered (copy)
			if var5 == nil and var3 then
				if not var4 then
					var4 = animator:LoadAnimation(var3)
				end
				if var4 then
					var4.Priority = core
					var4:Play()
				end
			end
			if t.localEmote ~= nil then
				t.localEmote:Disconnect()
				t.localEmote = nil
			end
			t.localEmote = p14.EmoteTriggered:Connect(onEmoteTriggered)
		end)
	end
	if t.humanoidAnimatorAdded and t.humanoidAnimatorAdded ~= nil then
		t.humanoidAnimatorAdded:Disconnect()
		t.humanoidAnimatorAdded = nil
	end
	t.humanoidAnimatorAdded = p14.ChildAdded:Connect(function(p15)
		-- upvalues: p12 (ref), p13 (ref), p14 (ref), var4 (copy), var3 (copy), core (copy), var5 (copy), t (copy), onEmoteTriggered (copy)
		if p15.Name == "Animator" then
			local _ = p12
			local _ = p13
			local var26 = p14
			var4 = p15:LoadAnimation(var3)
			var4.Priority = core
			task.delay(0.1, function()
				-- upvalues: var5 (copy), var3 (copy), var4 (copy), p15 (ref), core (copy), t (copy), var26 (ref), onEmoteTriggered (copy)
				if var5 == nil and var3 then
					if not var4 then
						var4 = p15:LoadAnimation(var3)
					end
					if var4 then
						var4.Priority = core
						var4:Play()
					end
				end
				if t.localEmote ~= nil then
					t.localEmote:Disconnect()
					t.localEmote = nil
				end
				t.localEmote = var26.EmoteTriggered:Connect(onEmoteTriggered)
			end)
		end
	end)
end

local function updateCharacterMood(p16, p17)
	-- upvalues: var6 (write), t (ref), var4 (write), var3 (write), updateCharacterMood (ref), updateCharacterMoodOnHumanoidAdded (ref)
	if p16 == nil or p17 == nil or not var6 then return end
	if t.animationInstanceChanged and t.animationInstanceChanged ~= nil then
		t.animationInstanceChanged:Disconnect()
		t.animationInstanceChanged = nil
	end
	if t.characterHumanoidAdded and t.characterHumanoidAdded ~= nil then
		t.characterHumanoidAdded:Disconnect()
		t.characterHumanoidAdded = nil
	end
	if var4 ~= nil then
		var4:Stop()
		var4:Destroy()
		var4 = nil
	end
	var3 = p17
	t.animationInstanceChanged = var3.Changed:Connect(function(_)
		-- upvalues: updateCharacterMood (copy), p16 (ref), p17 (ref)
		updateCharacterMood(p16, p17)
	end)
	local humanoid = p16:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		updateCharacterMoodOnHumanoidAdded(p16, p17, humanoid)
	end
	t.characterHumanoidAdded = p16.ChildAdded:Connect(function(p18)
		-- upvalues: updateCharacterMoodOnHumanoidAdded (copy), p16 (ref), p17 (ref), humanoid (ref)
		if p18:IsA("Humanoid") then
			updateCharacterMoodOnHumanoidAdded(p16, p17, humanoid)
		end
	end)
end

function initAvatarMood(p19)
	-- upvalues: t (ref), var6 (write), updateCharacterMood (ref), localPlayer (ref), var4 (write), t_1 (ref), var3 (write)
	local moodsEnabled = p19:FindFirstChild("MoodsEnabled")
	
	if t.animateScriptMoodAdded ~= nil then
		t.animateScriptMoodAdded:Disconnect()
		t.animateScriptMoodAdded = nil
	end
	if t.animateScriptMoodRemoved ~= nil then
		t.animateScriptMoodRemoved:Disconnect()
		t.animateScriptMoodRemoved = nil
	end
	if moodsEnabled then
		var6 = false
		
		return
	end
	local mood = p19:FindFirstChild("mood")
	
	if mood then
		if #mood:GetChildren() > 0 then
			updateCharacterMood(localPlayer.Character, mood:FindFirstChildWhichIsA("Animation"))
		end
		if t.moodChildAdded ~= nil then
			t.moodChildAdded:Disconnect()
			t.moodChildAdded = nil
		end
		t.moodChildAdded = mood.ChildAdded:Connect(function(p20)
			-- upvalues: updateCharacterMood (copy), localPlayer (copy)
			if p20:IsA("Animation") then
				updateCharacterMood(localPlayer.Character, p20)
			end
		end)
	elseif var4 ~= nil then
		var4:Stop()
		var4:Destroy()
		var4 = nil
	end
	local emoteStopped = t_1.EmoteStopped
	
	if t[emoteStopped] ~= nil then
		t[emoteStopped]:Disconnect()
		t[emoteStopped] = nil
	end
	local emoteKeyframeReached = t_1.EmoteKeyframeReached
	
	if t[emoteKeyframeReached] ~= nil then
		t[emoteKeyframeReached]:Disconnect()
		t[emoteKeyframeReached] = nil
	end
	local animationInstanceChanged = t_1.AnimationInstanceChanged
	
	if t[animationInstanceChanged] ~= nil then
		t[animationInstanceChanged]:Disconnect()
		t[animationInstanceChanged] = nil
	end
	local emoteTriggered = t_1.EmoteTriggered
	
	if t[emoteTriggered] ~= nil then
		t[emoteTriggered]:Disconnect()
		t[emoteTriggered] = nil
	end
	var3 = nil
	t.animateScriptMoodAdded = p19.ChildAdded:Connect(function(p21)
		-- upvalues: updateCharacterMood (copy), localPlayer (copy), t (copy), var6 (copy)
		if p21.Name == "mood" then
			if #p21:GetChildren() > 0 then
				updateCharacterMood(localPlayer.Character, p21:GetChildren()[1])
			end
			if t.moodChildAdded ~= nil then
				t.moodChildAdded:Disconnect()
				t.moodChildAdded = nil
			end
			t.moodChildAdded = p21.ChildAdded:Connect(function(p22)
				-- upvalues: updateCharacterMood (copy), localPlayer (copy)
				updateCharacterMood(localPlayer.Character, p22)
			end)
			
			return
		elseif p21.Name == "MoodsEnabled" then
			var6 = false
		end
	end)
	t.animateScriptMoodRemoved = p19.ChildRemoved:Connect(function(p23)
		-- upvalues: p19 (ref), updateCharacterMood (copy), localPlayer (copy), var4 (copy), t_1 (copy), t (copy), var3 (copy)
		if p23.Name == "mood" then
			local mood = p19:FindFirstChild("mood")
			
			if mood then
				updateCharacterMood(localPlayer.Character, mood:FindFirstChildWhichIsA("Animation"))
				
				return
			elseif var4 ~= nil then
				var4:Stop()
				var4:Destroy()
				var4 = nil
			end
			local emoteStopped = t_1.EmoteStopped
			
			if t[emoteStopped] ~= nil then
				t[emoteStopped]:Disconnect()
				t[emoteStopped] = nil
			end
			local emoteKeyframeReached = t_1.EmoteKeyframeReached
			
			if t[emoteKeyframeReached] ~= nil then
				t[emoteKeyframeReached]:Disconnect()
				t[emoteKeyframeReached] = nil
			end
			local animationInstanceChanged = t_1.AnimationInstanceChanged
			
			if t[animationInstanceChanged] ~= nil then
				t[animationInstanceChanged]:Disconnect()
				t[animationInstanceChanged] = nil
			end
			local emoteTriggered = t_1.EmoteTriggered
			
			if t[emoteTriggered] ~= nil then
				t[emoteTriggered]:Disconnect()
				t[emoteTriggered] = nil
			end
			var3 = nil
		end
	end)
end

local function waitForAnimateScript()
	-- upvalues: localPlayer (ref), t (ref)
	local animate = localPlayer.Character:FindFirstChild("Animate")
	
	if animate then
		initAvatarMood(animate)
	end
	if t.animateScriptAdded ~= nil then
		t.animateScriptAdded:Disconnect()
		t.animateScriptAdded = nil
	end
	t.animateScriptAdded = localPlayer.Character.ChildAdded:Connect(function(p24)
		if p24.Name == "Animate" then
			initAvatarMood(p24)
		end
	end)
end

local function onHeadAdded(p25)
	-- upvalues: waitForAnimateScript (ref), t (ref)
	if p25:FindFirstChildWhichIsA("FaceControls") then
		waitForAnimateScript()
	end
	if t.headChildAdded ~= nil then
		t.headChildAdded:Disconnect()
		t.headChildAdded = nil
	end
	t.headChildAdded = p25.ChildAdded:Connect(function(p26)
		-- upvalues: waitForAnimateScript (copy)
		if p26:IsA("FaceControls") then
			waitForAnimateScript()
		end
	end)
end

local _ = function(p27)
	-- upvalues: t (ref), core (write), var4 (write)
	if t.StreamTrackStopped ~= nil then
		t.StreamTrackStopped:Disconnect()
		t.StreamTrackStopped = nil
	end
	core = Enum.AnimationPriority.Idle
	
	if var4 then
		var4.Priority = core
	end
	t.StreamTrackStopped = p27.Stopped:Connect(function()
		-- upvalues: t (copy), core (copy), var4 (copy)
		if t.StreamTrackStopped ~= nil then
			t.StreamTrackStopped:Disconnect()
			t.StreamTrackStopped = nil
		end
		core = Enum.AnimationPriority.Core
		
		if var4 then
			var4.Priority = core
		end
	end)
end

local function onAnimatorAdded(p28)
	-- upvalues: t (ref), t_1 (ref), core (write), var4 (write)
	if t.AnimationStreamTrackPlayed ~= nil then
		t.AnimationStreamTrackPlayed:Disconnect()
		t.AnimationStreamTrackPlayed = nil
	end
	t.AnimationStreamTrackPlayed = p28.AnimationStreamTrackPlayed:Connect(function(p29)
		-- upvalues: t_1 (copy), t (copy), core (copy), var4 (copy)
		local streamTrackStopped = t_1.StreamTrackStopped
		
		if t[streamTrackStopped] ~= nil then
			t[streamTrackStopped]:Disconnect()
			t[streamTrackStopped] = nil
		end
		core = Enum.AnimationPriority.Idle
		
		if var4 then
			var4.Priority = core
		end
		t[t_1.StreamTrackStopped] = p29.Stopped:Connect(function()
			-- upvalues: t (copy), core (copy), var4 (copy)
			if t.StreamTrackStopped ~= nil then
				t.StreamTrackStopped:Disconnect()
				t.StreamTrackStopped = nil
			end
			core = Enum.AnimationPriority.Core
			
			if var4 then
				var4.Priority = core
			end
		end)
	end)
	local var32 = nil
	
	for i, v in p28:GetPlayingAnimationTracksCoreScript() do
		if v:IsA("AnimationStreamTrack") then
			var32 = v
			break
		end
	end
	if var32 then
		local var33 = var32
		local streamTrackStopped = t_1.StreamTrackStopped
		
		if t[streamTrackStopped] ~= nil then
			t[streamTrackStopped]:Disconnect()
			t[streamTrackStopped] = nil
		end
		core = Enum.AnimationPriority.Idle
		
		if var4 then
			var4.Priority = core
		end
		t[t_1.StreamTrackStopped] = var33.Stopped:Connect(function()
			-- upvalues: t (copy), core (copy), var4 (copy)
			if t.StreamTrackStopped ~= nil then
				t.StreamTrackStopped:Disconnect()
				t.StreamTrackStopped = nil
			end
			core = Enum.AnimationPriority.Core
			
			if var4 then
				var4.Priority = core
			end
		end)
		
		return
	else
		core = Enum.AnimationPriority.Core
		
		if var4 then
			var4.Priority = core
		end
	end
end

local _ = function(p30, _)
	-- upvalues: t (ref), core (write), var4 (write), onAnimatorAdded (ref)
	if t.AnimationStreamTrackPlayed ~= nil then
		t.AnimationStreamTrackPlayed:Disconnect()
		t.AnimationStreamTrackPlayed = nil
	end
	if t.StreamTrackStopped ~= nil then
		t.StreamTrackStopped:Disconnect()
		t.StreamTrackStopped = nil
	end
	core = Enum.AnimationPriority.Core
	
	if var4 then
		var4.Priority = core
	end
	local var34 = if p30.Character then p30.Character:FindFirstChildOfClass("Humanoid") else nil
	local var35 = if var34 then var34:FindFirstChildOfClass("Animator") else nil
	
	if var35 then
		onAnimatorAdded(var35)
	end
end

local function onCharacterAdded(p31, p32)
	-- upvalues: onHeadAdded (ref), t (ref), var4 (write), onAnimatorAdded (ref), t_1 (ref), core (write)
	local head = p32:FindFirstChild("Head")
	
	if head then
		onHeadAdded(head)
	end
	t.characterChildAdded = p32.ChildAdded:Connect(function(p33)
		-- upvalues: onHeadAdded (copy)
		if p33.Name == "Head" then
			onHeadAdded(p33)
		end
	end)
	t.characterChildRemoved = p32.ChildRemoved:Connect(function(p34)
		-- upvalues: var4 (copy), p32 (ref), onHeadAdded (copy)
		if p34.Name == "Head" then
			if var4 ~= nil then
				var4:Stop()
				var4:Destroy()
				var4 = nil
			end
			local head = p32:FindFirstChild("Head")
			
			if head then
				onHeadAdded(head)
			end
		end
	end)
	t.DescendantAdded = p32.DescendantAdded:Connect(function(p35)
		-- upvalues: onAnimatorAdded (copy)
		if p35:IsA("Animator") then
			onAnimatorAdded(p35)
		end
	end)
	local animator = p32:FindFirstChildWhichIsA("Animator", true)
	
	if animator then
		onAnimatorAdded(animator)
	end
	t.DescendantRemoving = p32.DescendantRemoving:Connect(function(p36)
		-- upvalues: p31 (ref), t_1 (copy), t (copy), core (copy), var4 (copy), onAnimatorAdded (copy)
		if p36:IsA("Animator") then
			local var39 = p31
			local animationStreamTrackPlayed = t_1.AnimationStreamTrackPlayed
			
			if t[animationStreamTrackPlayed] ~= nil then
				t[animationStreamTrackPlayed]:Disconnect()
				t[animationStreamTrackPlayed] = nil
			end
			local streamTrackStopped = t_1.StreamTrackStopped
			
			if t[streamTrackStopped] ~= nil then
				t[streamTrackStopped]:Disconnect()
				t[streamTrackStopped] = nil
			end
			core = Enum.AnimationPriority.Core
			
			if var4 then
				var4.Priority = core
			end
			local var40 = if var39.Character then var39.Character:FindFirstChildOfClass("Humanoid") else nil
			local var41 = if var40 then var40:FindFirstChildOfClass("Animator") else nil
			
			if var41 then
				onAnimatorAdded(var41)
			end
		end
	end)
end

local function onCharacterRemoving(_)
	-- upvalues: var4 (write), t (ref)
	if var4 ~= nil then
		var4:Stop()
		var4:Destroy()
		var4 = nil
	end
	for i, v in pairs(t) do
		if v then
			v:Disconnect()
		end
	end
	table.clear(t)
end

if localPlayer.Character then
	onCharacterAdded(localPlayer, localPlayer.Character)
end
localPlayer.CharacterAdded:Connect(function(p37)
	-- upvalues: onCharacterAdded (ref), localPlayer (ref)
	onCharacterAdded(localPlayer, p37)
end)
localPlayer.CharacterRemoving:Connect(onCharacterRemoving)