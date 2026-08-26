local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localPlayer = playersService.LocalPlayer
local _ = coreGuiService.RobloxGui
local _ = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local _ = nil
local var1 = nil
local var2 = nil
local core = Enum.AnimationPriority.Core
local var3 = nil
local var4 = true
local var5 = false
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

local function _(p1)
	return if p1.Character then p1.Character:FindFirstChildOfClass("Humanoid") else nil
end

local _ = function(p1)
	local var6 = if p1.Character then p1.Character:FindFirstChildOfClass("Humanoid") else nil
	
	return if var6 then var6:FindFirstChildOfClass("Animator") else nil
end

local _ = function(p1)
	-- upvalues: core (write), var2 (write)
	core = p1
	
	if var2 then
		var2.Priority = core
	end
end

local _ = function(p1)
	-- upvalues: t (ref)
	if t[p1] ~= nil then
		t[p1]:Disconnect()
		t[p1] = nil
	end
end

local _ = function()
	-- upvalues: var3 (write), var2 (write), t (ref)
	var3 = nil
	
	if var2 ~= nil then
		var2:Play()
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

local function onEmoteTriggered(p1, p2)
	-- upvalues: var4 (write), var2 (write), var3 (write), var5 (write), t (ref), t_1 (ref)
	if not var4 or var2 == nil then return end
	if p1 and p2 then
		var2:Stop()
		var3 = p2
		var5 = true
		
		if t.currentEmoteTrackStopped ~= nil then
			t.currentEmoteTrackStopped:Disconnect()
			t.currentEmoteTrackStopped = nil
		end
		if t.emoteKeyframeReached ~= nil then
			t.emoteKeyframeReached:Disconnect()
			t.emoteKeyframeReached = nil
		end
		t.currentEmoteTrackStopped = var3.Stopped:Connect(function()
			-- upvalues: var3 (copy), var2 (copy), t_1 (copy), t (copy), var5 (copy)
			var3 = nil
			
			if var2 ~= nil then
				var2:Play()
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
			var5 = false
		end)
		t.emoteKeyframeReached = var3.KeyframeReached:Connect(function(p3)
			-- upvalues: var3 (copy), var2 (copy), t_1 (copy), t (copy), var5 (copy)
			if p3 == "End" and not var3.Looped then
				var3 = nil
				
				if var2 ~= nil then
					var2:Play()
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
				var5 = false
			end
		end)
	end
end

local function checkEmotePlaying(p1)
	-- upvalues: t_2 (ref), t (ref), var3 (write), var5 (write), var2 (write), checkEmotePlaying (ref), t_1 (ref)
	local var6 = false
	
	for i, v in pairs(p1:GetPlayingAnimationTracks()) do
		if v.IsPlaying and v.Animation.Parent and t_2[v.Animation.Parent.Name] then
			if t.currentEmoteTrackStopped ~= nil then
				t.currentEmoteTrackStopped:Disconnect()
				t.currentEmoteTrackStopped = nil
			end
			if t.emoteKeyframeReached ~= nil then
				t.emoteKeyframeReached:Disconnect()
				t.emoteKeyframeReached = nil
			end
			var3 = v
			var5 = false
			var2:Stop()
			t.currentEmoteTrackStopped = var3.Stopped:Connect(function()
				-- upvalues: checkEmotePlaying (copy), p1 (ref), var5 (copy), var3 (copy), var2 (copy), t_1 (copy), t (copy)
				wait(0.3)
				
				if not checkEmotePlaying(p1) and not var5 then
					var3 = nil
					
					if var2 ~= nil then
						var2:Play()
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
			t.emoteKeyframeReached = var3.KeyframeReached:Connect(function(p2)
				-- upvalues: checkEmotePlaying (copy), p1 (ref), var5 (copy), var3 (copy), var2 (copy), t_1 (copy), t (copy)
				if p2 == "End" then
					wait(0.3)
					
					if not checkEmotePlaying(p1) and not var5 then
						var3 = nil
						
						if var2 ~= nil then
							var2:Play()
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
			var6 = true
		end
	end
	return var6
end

local chattedConnection = localPlayer.Chatted:Connect(function(p2)
	-- upvalues: var4 (write), var2 (write), localPlayer (ref), t_2 (ref), checkEmotePlaying (ref)
	if not var4 or var2 == nil then return end
	if localPlayer.Character then
		local humanoid = localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		
		if humanoid then
			local var7 = ""
			
			if string.sub(p2, 1, 3) == "/e " then
				var7 = string.sub(p2, 4)
			elseif string.sub(p2, 1, 7) == "/emote " then
				var7 = string.sub(p2, 8)
			end
			if t_2[var7] then
				wait(0.3)
				checkEmotePlaying(humanoid)
			end
		end
	end
end)

chattedConnection = function()
	-- upvalues: var2 (write)
	if var2 ~= nil then
		var2:Stop()
		var2:Destroy()
		var2 = nil
	end
end

local _ = function()
	-- upvalues: var2 (write), t (ref), var1 (write)
	if var2 ~= nil then
		var2:Stop()
		var2:Destroy()
		var2 = nil
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
	var1 = nil
end

local _ = function(_, _, p2, p3)
	-- upvalues: var2 (write), var1 (write), core (write), var3 (write), t (ref), onEmoteTriggered (ref)
	var2 = p3:LoadAnimation(var1)
	var2.Priority = core
	task.delay(0.1, function()
		-- upvalues: var3 (copy), var1 (copy), var2 (copy), p3 (ref), core (copy), t (copy), p2 (ref), onEmoteTriggered (copy)
		if var3 == nil and var1 then
			if not var2 then
				var2 = p3:LoadAnimation(var1)
			end
			if var2 then
				var2.Priority = core
				var2:Play()
			end
		end
		if t.localEmote ~= nil then
			t.localEmote:Disconnect()
			t.localEmote = nil
		end
		t.localEmote = p2.EmoteTriggered:Connect(onEmoteTriggered)
	end)
end

local function updateCharacterMoodOnHumanoidAdded(p2, p3, p4)
	-- upvalues: var2 (write), var1 (write), core (write), var3 (write), t (ref), onEmoteTriggered (ref)
	local animator = p4:FindFirstChild("Animator")
	
	if animator then
		var2 = animator:LoadAnimation(var1)
		var2.Priority = core
		task.delay(0.1, function()
			-- upvalues: var3 (copy), var1 (copy), var2 (copy), animator (ref), core (copy), t (copy), p4 (ref), onEmoteTriggered (copy)
			if var3 == nil and var1 then
				if not var2 then
					var2 = animator:LoadAnimation(var1)
				end
				if var2 then
					var2.Priority = core
					var2:Play()
				end
			end
			if t.localEmote ~= nil then
				t.localEmote:Disconnect()
				t.localEmote = nil
			end
			t.localEmote = p4.EmoteTriggered:Connect(onEmoteTriggered)
		end)
	end
	if t.humanoidAnimatorAdded and t.humanoidAnimatorAdded ~= nil then
		t.humanoidAnimatorAdded:Disconnect()
		t.humanoidAnimatorAdded = nil
	end
	t.humanoidAnimatorAdded = p4.ChildAdded:Connect(function(p5)
		-- upvalues: p2 (ref), p3 (ref), p4 (ref), var2 (copy), var1 (copy), core (copy), var3 (copy), t (copy), onEmoteTriggered (copy)
		if p5.Name == "Animator" then
			local _ = p2
			local _ = p3
			local var7 = p4
			var2 = p5:LoadAnimation(var1)
			var2.Priority = core
			task.delay(0.1, function()
				-- upvalues: var3 (copy), var1 (copy), var2 (copy), p5 (ref), core (copy), t (copy), var7 (ref), onEmoteTriggered (copy)
				if var3 == nil and var1 then
					if not var2 then
						var2 = p5:LoadAnimation(var1)
					end
					if var2 then
						var2.Priority = core
						var2:Play()
					end
				end
				if t.localEmote ~= nil then
					t.localEmote:Disconnect()
					t.localEmote = nil
				end
				t.localEmote = var7.EmoteTriggered:Connect(onEmoteTriggered)
			end)
		end
	end)
end

local function updateCharacterMood(p2, p3)
	-- upvalues: var4 (write), t (ref), var2 (write), var1 (write), updateCharacterMood (ref), updateCharacterMoodOnHumanoidAdded (ref)
	if p2 == nil or p3 == nil or not var4 then return end
	if t.animationInstanceChanged and t.animationInstanceChanged ~= nil then
		t.animationInstanceChanged:Disconnect()
		t.animationInstanceChanged = nil
	end
	if t.characterHumanoidAdded and t.characterHumanoidAdded ~= nil then
		t.characterHumanoidAdded:Disconnect()
		t.characterHumanoidAdded = nil
	end
	if var2 ~= nil then
		var2:Stop()
		var2:Destroy()
		var2 = nil
	end
	var1 = p3
	t.animationInstanceChanged = var1.Changed:Connect(function(_)
		-- upvalues: updateCharacterMood (copy), p2 (ref), p3 (ref)
		updateCharacterMood(p2, p3)
	end)
	local humanoid = p2:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		updateCharacterMoodOnHumanoidAdded(p2, p3, humanoid)
	end
	t.characterHumanoidAdded = p2.ChildAdded:Connect(function(p4)
		-- upvalues: updateCharacterMoodOnHumanoidAdded (copy), p2 (ref), p3 (ref), humanoid (ref)
		if p4:IsA("Humanoid") then
			updateCharacterMoodOnHumanoidAdded(p2, p3, humanoid)
		end
	end)
end

function initAvatarMood(p2)
	-- upvalues: t (ref), var4 (write), updateCharacterMood (ref), localPlayer (ref), var2 (write), t_1 (ref), var1 (write)
	local moodsEnabled = p2:FindFirstChild("MoodsEnabled")
	
	if t.animateScriptMoodAdded ~= nil then
		t.animateScriptMoodAdded:Disconnect()
		t.animateScriptMoodAdded = nil
	end
	if t.animateScriptMoodRemoved ~= nil then
		t.animateScriptMoodRemoved:Disconnect()
		t.animateScriptMoodRemoved = nil
	end
	if moodsEnabled then
		var4 = false
		
		return
	end
	local mood = p2:FindFirstChild("mood")
	
	if mood then
		if #mood:GetChildren() > 0 then
			updateCharacterMood(localPlayer.Character, mood:FindFirstChildWhichIsA("Animation"))
		end
		if t.moodChildAdded ~= nil then
			t.moodChildAdded:Disconnect()
			t.moodChildAdded = nil
		end
		t.moodChildAdded = mood.ChildAdded:Connect(function(p3)
			-- upvalues: updateCharacterMood (copy), localPlayer (copy)
			if p3:IsA("Animation") then
				updateCharacterMood(localPlayer.Character, p3)
			end
		end)
	elseif var2 ~= nil then
		var2:Stop()
		var2:Destroy()
		var2 = nil
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
	var1 = nil
	t.animateScriptMoodAdded = p2.ChildAdded:Connect(function(p3)
		-- upvalues: updateCharacterMood (copy), localPlayer (copy), t (copy), var4 (copy)
		if p3.Name == "mood" then
			if #p3:GetChildren() > 0 then
				updateCharacterMood(localPlayer.Character, p3:GetChildren()[1])
			end
			if t.moodChildAdded ~= nil then
				t.moodChildAdded:Disconnect()
				t.moodChildAdded = nil
			end
			t.moodChildAdded = p3.ChildAdded:Connect(function(p4)
				-- upvalues: updateCharacterMood (copy), localPlayer (copy)
				updateCharacterMood(localPlayer.Character, p4)
			end)
			
			return
		elseif p3.Name == "MoodsEnabled" then
			var4 = false
		end
	end)
	t.animateScriptMoodRemoved = p2.ChildRemoved:Connect(function(p3)
		-- upvalues: p2 (ref), updateCharacterMood (copy), localPlayer (copy), var2 (copy), t_1 (copy), t (copy), var1 (copy)
		if p3.Name == "mood" then
			local mood = p2:FindFirstChild("mood")
			
			if mood then
				updateCharacterMood(localPlayer.Character, mood:FindFirstChildWhichIsA("Animation"))
				
				return
			elseif var2 ~= nil then
				var2:Stop()
				var2:Destroy()
				var2 = nil
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
			var1 = nil
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
	t.animateScriptAdded = localPlayer.Character.ChildAdded:Connect(function(p2)
		if p2.Name == "Animate" then
			initAvatarMood(p2)
		end
	end)
end

local function onHeadAdded(p2)
	-- upvalues: waitForAnimateScript (ref), t (ref)
	if p2:FindFirstChildWhichIsA("FaceControls") then
		waitForAnimateScript()
	end
	if t.headChildAdded ~= nil then
		t.headChildAdded:Disconnect()
		t.headChildAdded = nil
	end
	t.headChildAdded = p2.ChildAdded:Connect(function(p3)
		-- upvalues: waitForAnimateScript (copy)
		if p3:IsA("FaceControls") then
			waitForAnimateScript()
		end
	end)
end

local _ = function(p2)
	-- upvalues: t (ref), core (write), var2 (write)
	if t.StreamTrackStopped ~= nil then
		t.StreamTrackStopped:Disconnect()
		t.StreamTrackStopped = nil
	end
	core = Enum.AnimationPriority.Idle
	
	if var2 then
		var2.Priority = core
	end
	t.StreamTrackStopped = p2.Stopped:Connect(function()
		-- upvalues: t (copy), core (copy), var2 (copy)
		if t.StreamTrackStopped ~= nil then
			t.StreamTrackStopped:Disconnect()
			t.StreamTrackStopped = nil
		end
		core = Enum.AnimationPriority.Core
		
		if var2 then
			var2.Priority = core
		end
	end)
end

local function onAnimatorAdded(p2)
	-- upvalues: t (ref), t_1 (ref), core (write), var2 (write)
	if t.AnimationStreamTrackPlayed ~= nil then
		t.AnimationStreamTrackPlayed:Disconnect()
		t.AnimationStreamTrackPlayed = nil
	end
	t.AnimationStreamTrackPlayed = p2.AnimationStreamTrackPlayed:Connect(function(p3)
		-- upvalues: t_1 (copy), t (copy), core (copy), var2 (copy)
		local streamTrackStopped = t_1.StreamTrackStopped
		
		if t[streamTrackStopped] ~= nil then
			t[streamTrackStopped]:Disconnect()
			t[streamTrackStopped] = nil
		end
		core = Enum.AnimationPriority.Idle
		
		if var2 then
			var2.Priority = core
		end
		t[t_1.StreamTrackStopped] = p3.Stopped:Connect(function()
			-- upvalues: t (copy), core (copy), var2 (copy)
			if t.StreamTrackStopped ~= nil then
				t.StreamTrackStopped:Disconnect()
				t.StreamTrackStopped = nil
			end
			core = Enum.AnimationPriority.Core
			
			if var2 then
				var2.Priority = core
			end
		end)
	end)
	local var7 = nil
	
	for i, v in p2:GetPlayingAnimationTracksCoreScript() do
		if v:IsA("AnimationStreamTrack") then
			var7 = v
			break
		end
	end
	if var7 then
		local var8 = var7
		local streamTrackStopped = t_1.StreamTrackStopped
		
		if t[streamTrackStopped] ~= nil then
			t[streamTrackStopped]:Disconnect()
			t[streamTrackStopped] = nil
		end
		core = Enum.AnimationPriority.Idle
		
		if var2 then
			var2.Priority = core
		end
		t[t_1.StreamTrackStopped] = var8.Stopped:Connect(function()
			-- upvalues: t (copy), core (copy), var2 (copy)
			if t.StreamTrackStopped ~= nil then
				t.StreamTrackStopped:Disconnect()
				t.StreamTrackStopped = nil
			end
			core = Enum.AnimationPriority.Core
			
			if var2 then
				var2.Priority = core
			end
		end)
		
		return
	else
		core = Enum.AnimationPriority.Core
		
		if var2 then
			var2.Priority = core
		end
	end
end

local _ = function(p3, _)
	-- upvalues: t (ref), core (write), var2 (write), onAnimatorAdded (ref)
	if t.AnimationStreamTrackPlayed ~= nil then
		t.AnimationStreamTrackPlayed:Disconnect()
		t.AnimationStreamTrackPlayed = nil
	end
	if t.StreamTrackStopped ~= nil then
		t.StreamTrackStopped:Disconnect()
		t.StreamTrackStopped = nil
	end
	core = Enum.AnimationPriority.Core
	
	if var2 then
		var2.Priority = core
	end
	local var9 = if p3.Character then p3.Character:FindFirstChildOfClass("Humanoid") else nil
	local var10 = if var9 then var9:FindFirstChildOfClass("Animator") else nil
	
	if var10 then
		onAnimatorAdded(var10)
	end
end

local function onCharacterAdded(p3, p4)
	-- upvalues: onHeadAdded (ref), t (ref), var2 (write), onAnimatorAdded (ref), t_1 (ref), core (write)
	local head = p4:FindFirstChild("Head")
	
	if head then
		onHeadAdded(head)
	end
	t.characterChildAdded = p4.ChildAdded:Connect(function(p5)
		-- upvalues: onHeadAdded (copy)
		if p5.Name == "Head" then
			onHeadAdded(p5)
		end
	end)
	t.characterChildRemoved = p4.ChildRemoved:Connect(function(p5)
		-- upvalues: var2 (copy), p4 (ref), onHeadAdded (copy)
		if p5.Name == "Head" then
			if var2 ~= nil then
				var2:Stop()
				var2:Destroy()
				var2 = nil
			end
			local head = p4:FindFirstChild("Head")
			
			if head then
				onHeadAdded(head)
			end
		end
	end)
	t.DescendantAdded = p4.DescendantAdded:Connect(function(p5)
		-- upvalues: onAnimatorAdded (copy)
		if p5:IsA("Animator") then
			onAnimatorAdded(p5)
		end
	end)
	local animator = p4:FindFirstChildWhichIsA("Animator", true)
	
	if animator then
		onAnimatorAdded(animator)
	end
	t.DescendantRemoving = p4.DescendantRemoving:Connect(function(p5)
		-- upvalues: p3 (ref), t_1 (copy), t (copy), core (copy), var2 (copy), onAnimatorAdded (copy)
		if p5:IsA("Animator") then
			local var9 = p3
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
			
			if var2 then
				var2.Priority = core
			end
			local var10 = if var9.Character then var9.Character:FindFirstChildOfClass("Humanoid") else nil
			local var11 = if var10 then var10:FindFirstChildOfClass("Animator") else nil
			
			if var11 then
				onAnimatorAdded(var11)
			end
		end
	end)
end

local function onCharacterRemoving(_)
	-- upvalues: var2 (write), t (ref)
	if var2 ~= nil then
		var2:Stop()
		var2:Destroy()
		var2 = nil
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
localPlayer.CharacterAdded:Connect(function(p3)
	-- upvalues: onCharacterAdded (ref), localPlayer (ref)
	onCharacterAdded(localPlayer, p3)
end)
localPlayer.CharacterRemoving:Connect(onCharacterRemoving)