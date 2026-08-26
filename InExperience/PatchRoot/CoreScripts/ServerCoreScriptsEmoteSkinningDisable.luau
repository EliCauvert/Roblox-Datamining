local playersService = game:GetService("Players")
local insertService = game:GetService("InsertService")
local emoteSkinningDisableUseClassLookup = game:DefineFastFlag("EmoteSkinningDisableUseClassLookup", false)
local emoteSkinningDisableCleanupCharacterConnections = game:DefineFastFlag("EmoteSkinningDisableCleanupCharacterConnections", false)
local var1 = game:DefineFastInt("UGCEmoteSkinningDisableTranslationThresholdMillistuds", 100) * 0.001
local t = {}

local function getClipMetadata(p1)
	-- upvalues: t (ref), insertService (ref)
	if t[p1] then
		return t[p1]
	end
	local var2 = tonumber(p1:match("%d+"))
	
	if not var2 then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: insertService (copy), var2 (ref)
		return insertService:LoadAsset(var2)
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
		t[p1] = t_1
		
		return t_1
	end
	status:Destroy()
	
	return nil
end

local function setAllJointsSkinning(value, p1)
	for i, v in value:GetDescendants() do
		if v:IsA("Motor6D") or v:IsA("AnimationConstraint") or (v:IsA("BallSocketConstraint") or v:IsA("Weld")) or v:IsA("RigidConstraint") then
			v.EnableSkinning = p1
		end
	end
end

local t_1 = {}
local t_2 = {}

local function _(p2)
	-- upvalues: t_1 (ref)
	if t_1[p2] then
		t_1[p2]:Disconnect()
		t_1[p2] = nil
	end
end

local _ = function(p2)
	-- upvalues: t_2 (ref)
	if t_2[p2] then
		t_2[p2]:Disconnect()
		t_2[p2] = nil
	end
end

local function onCharacterRemoving(p2)
	-- upvalues: t_1 (ref), emoteSkinningDisableCleanupCharacterConnections (ref), t_2 (ref)
	if t_1[p2] then
		t_1[p2]:Disconnect()
		t_1[p2] = nil
	end
	if emoteSkinningDisableCleanupCharacterConnections and t_2[p2] then
		t_2[p2]:Disconnect()
		t_2[p2] = nil
	end
end

local _ = function(p2, p3)
	-- upvalues: getClipMetadata (ref), var1 (ref), t_1 (ref), setAllJointsSkinning (ref)
	local animation = p3.Animation
	
	if not animation then return end
	local animationId = animation.AnimationId
	
	if animationId == "" then
		return
	end
	task.spawn(function()
		-- upvalues: getClipMetadata (copy), animationId (ref), var1 (copy), p3 (ref), p2 (ref), t_1 (copy), setAllJointsSkinning (copy)
		local var2 = getClipMetadata(animationId)
		
		if not var2 or not var2.isUGCEmote then return end
		if var2.maxTranslation <= var1 then return end
		if not p3.IsPlaying then return end
		if t_1[p2] then
			t_1[p2]:Disconnect()
			t_1[p2] = nil
		end
		setAllJointsSkinning(p2, false)
		t_1[p2] = p3.Stopped:Connect(function()
			-- upvalues: setAllJointsSkinning (copy), p2 (copy), t_1 (copy)
			setAllJointsSkinning(p2, true)
			
			if t_1[p2] then
				t_1[p2]:Disconnect()
				t_1[p2] = nil
			end
		end)
	end)
end

local function onCharacterAdded(p2)
	-- upvalues: emoteSkinningDisableUseClassLookup (ref), getClipMetadata (ref), var1 (ref), t_1 (ref), setAllJointsSkinning (ref), emoteSkinningDisableCleanupCharacterConnections (ref), t_2 (ref)
	local animator
	local _ = nil
	
	if emoteSkinningDisableUseClassLookup then
		local humanoid = p2:FindFirstChildOfClass("Humanoid")
		
		if not humanoid then return end
		animator = humanoid:FindFirstChildOfClass("Animator")
		
		if not animator then return end
	else
		animator = p2:WaitForChild("Humanoid"):WaitForChild("Animator")
	end
	local animationPlayedConnection = animator.AnimationPlayed:Connect(function(p3)
		-- upvalues: p2 (ref), getClipMetadata (copy), var1 (copy), t_1 (copy), setAllJointsSkinning (copy)
		local animation = p3.Animation
		
		if not animation then return end
		local animationId = animation.AnimationId
		
		if animationId == "" then
			return
		end
		task.spawn(function()
			-- upvalues: getClipMetadata (copy), animationId (ref), var1 (copy), p3 (ref), p2 (ref), t_1 (copy), setAllJointsSkinning (copy)
			local var2 = getClipMetadata(animationId)
			
			if not var2 or not var2.isUGCEmote then return end
			if var2.maxTranslation <= var1 then return end
			if not p3.IsPlaying then return end
			if t_1[p2] then
				t_1[p2]:Disconnect()
				t_1[p2] = nil
			end
			setAllJointsSkinning(p2, false)
			t_1[p2] = p3.Stopped:Connect(function()
				-- upvalues: setAllJointsSkinning (copy), p2 (copy), t_1 (copy)
				setAllJointsSkinning(p2, true)
				
				if t_1[p2] then
					t_1[p2]:Disconnect()
					t_1[p2] = nil
				end
			end)
		end)
	end)
	
	if emoteSkinningDisableCleanupCharacterConnections then
		if t_2[p2] then
			t_2[p2]:Disconnect()
			t_2[p2] = nil
		end
		t_2[p2] = animationPlayedConnection
	end
end

local function onPlayerAdded(p2)
	-- upvalues: onCharacterAdded (ref), onCharacterRemoving (ref)
	if p2.Character then
		onCharacterAdded(p2.Character)
	end
	p2.CharacterAdded:Connect(onCharacterAdded)
	p2.CharacterRemoving:Connect(onCharacterRemoving)
end

for i, v in playersService:GetPlayers() do
	task.spawn(onPlayerAdded, v)
end
playersService.PlayerAdded:Connect(onPlayerAdded)