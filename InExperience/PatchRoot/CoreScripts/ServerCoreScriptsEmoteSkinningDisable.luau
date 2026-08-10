local playersService = game:GetService("Players")
local insertService = game:GetService("InsertService")
local emoteSkinningDisableUseClassLookup = game:DefineFastFlag("EmoteSkinningDisableUseClassLookup", false)
local emoteSkinningDisableCleanupCharacterConnections = game:DefineFastFlag("EmoteSkinningDisableCleanupCharacterConnections", false)
local var4 = game:DefineFastInt("UGCEmoteSkinningDisableTranslationThresholdMillistuds", 100) * 0.001
local t = {}

local function getClipMetadata(p0) --[[ line: 18 ]]
	-- upvalues: t (ref), insertService (ref)
	if t[p0] then
		return t[p0]
	end
	local var13 = tonumber(p0:match("%d+"))
	
	if not var13 then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 28 ]]
		-- upvalues: insertService (copy), var13 (ref)
		return insertService:LoadAsset(var13)
	end)
	
	if not ok or not status then
		return nil
	end
	local animationClip = status:FindFirstChildWhichIsA("AnimationClip", true)
	
	if animationClip then
		local isUGCEmoteAttribute = animationClip:GetAttribute("isUGCEmote")
		local maxPartTranslationAttribute = animationClip:GetAttribute("maxPartTranslation")
		status:Destroy()
		local t_1 = {
			isUGCEmote = isUGCEmoteAttribute == true,
			maxTranslation = if typeof(maxPartTranslationAttribute) == "number" then maxPartTranslationAttribute else 0
		}
		t[p0] = t_1
		
		return t_1
	end
	status:Destroy()
	
	return nil
end

local function setAllJointsSkinning(value, p1) --[[ line: 55 ]]
	for i, v in value:GetDescendants() do
		if v:IsA("Motor6D") or v:IsA("AnimationConstraint") or (v:IsA("BallSocketConstraint") or v:IsA("Weld")) or v:IsA("RigidConstraint") then
			v.EnableSkinning = p1
		end
	end
end

local t_1 = {}
local t_2 = {}

local function _(p2) --[[ line: 68 | named "clearActiveEmoteConnection" ]]
	-- upvalues: t_1 (ref)
	if t_1[p2] then
		t_1[p2]:Disconnect()
		t_1[p2] = nil
	end
end

local _ = function(p3) --[[ line: 75 | named "clearAnimationPlayedConnection" ]]
	-- upvalues: t_2 (ref)
	if t_2[p3] then
		t_2[p3]:Disconnect()
		t_2[p3] = nil
	end
end

local function onCharacterRemoving(p4) --[[ line: 82 ]]
	-- upvalues: t_1 (ref), emoteSkinningDisableCleanupCharacterConnections (ref), t_2 (ref)
	if t_1[p4] then
		t_1[p4]:Disconnect()
		t_1[p4] = nil
	end
	if emoteSkinningDisableCleanupCharacterConnections and t_2[p4] then
		t_2[p4]:Disconnect()
		t_2[p4] = nil
	end
end

local _ = function(p5, p6) --[[ line: 89 | named "onAnimationPlayed" ]]
	-- upvalues: getClipMetadata (ref), var4 (ref), t_1 (ref), setAllJointsSkinning (ref)
	local animation = p6.Animation
	
	if not animation then return end
	local animationId = animation.AnimationId
	
	if animationId == "" then
		return
	end
	task.spawn(function() --[[ line: 100 ]]
		-- upvalues: getClipMetadata (copy), animationId (ref), var4 (copy), p6 (ref), p5 (ref), t_1 (copy), setAllJointsSkinning (copy)
		local var18 = getClipMetadata(animationId)
		
		if not var18 or not var18.isUGCEmote then return end
		if var18.maxTranslation <= var4 then return end
		if not p6.IsPlaying then return end
		if t_1[p5] then
			t_1[p5]:Disconnect()
			t_1[p5] = nil
		end
		setAllJointsSkinning(p5, false)
		t_1[p5] = p6.Stopped:Connect(function() --[[ line: 116 ]]
			-- upvalues: setAllJointsSkinning (copy), p5 (copy), t_1 (copy)
			setAllJointsSkinning(p5, true)
			
			if t_1[p5] then
				t_1[p5]:Disconnect()
				t_1[p5] = nil
			end
		end)
	end)
end

local function onCharacterAdded(p7) --[[ line: 123 ]]
	-- upvalues: emoteSkinningDisableUseClassLookup (ref), getClipMetadata (ref), var4 (ref), t_1 (ref), setAllJointsSkinning (ref), emoteSkinningDisableCleanupCharacterConnections (ref), t_2 (ref)
	local animator
	local _ = nil
	
	if emoteSkinningDisableUseClassLookup then
		local humanoid = p7:FindFirstChildOfClass("Humanoid")
		
		if not humanoid then return end
		animator = humanoid:FindFirstChildOfClass("Animator")
		
		if not animator then return end
	else
		animator = p7:WaitForChild("Humanoid"):WaitForChild("Animator")
	end
	local animationPlayedConnection = animator.AnimationPlayed:Connect(function(p8) --[[ line: 140 ]]
		-- upvalues: p7 (ref), getClipMetadata (copy), var4 (copy), t_1 (copy), setAllJointsSkinning (copy)
		local animation = p8.Animation
		
		if not animation then return end
		local animationId = animation.AnimationId
		
		if animationId == "" then
			return
		end
		task.spawn(function() --[[ line: 100 ]]
			-- upvalues: getClipMetadata (copy), animationId (ref), var4 (copy), p8 (ref), p7 (ref), t_1 (copy), setAllJointsSkinning (copy)
			local var18 = getClipMetadata(animationId)
			
			if not var18 or not var18.isUGCEmote then return end
			if var18.maxTranslation <= var4 then return end
			if not p8.IsPlaying then return end
			if t_1[p7] then
				t_1[p7]:Disconnect()
				t_1[p7] = nil
			end
			setAllJointsSkinning(p7, false)
			t_1[p7] = p8.Stopped:Connect(function() --[[ line: 116 ]]
				-- upvalues: setAllJointsSkinning (copy), p7 (copy), t_1 (copy)
				setAllJointsSkinning(p7, true)
				
				if t_1[p7] then
					t_1[p7]:Disconnect()
					t_1[p7] = nil
				end
			end)
		end)
	end)
	
	if emoteSkinningDisableCleanupCharacterConnections then
		if t_2[p7] then
			t_2[p7]:Disconnect()
			t_2[p7] = nil
		end
		t_2[p7] = animationPlayedConnection
	end
end

local function onPlayerAdded(p9) --[[ line: 150 ]]
	-- upvalues: onCharacterAdded (ref), onCharacterRemoving (ref)
	if p9.Character then
		onCharacterAdded(p9.Character)
	end
	p9.CharacterAdded:Connect(onCharacterAdded)
	p9.CharacterRemoving:Connect(onCharacterRemoving)
end

for i, v in playersService:GetPlayers() do
	task.spawn(onPlayerAdded, v)
end
playersService.PlayerAdded:Connect(onPlayerAdded)