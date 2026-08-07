local playersService = game:GetService("Players")
local insertService = game:GetService("InsertService")
local emoteSkinningDisableUseClassLookup = game:DefineFastFlag("EmoteSkinningDisableUseClassLookup", false)
local var3 = game:DefineFastInt("UGCEmoteSkinningDisableTranslationThresholdMillistuds", 100) * 0.001
local t = {}

local function getClipMetadata(p0) --[[ line: 16 ]]
	-- upvalues: t (ref), insertService (ref)
	if t[p0] then
		return t[p0]
	end
	local var11 = tonumber(p0:match("%d+"))
	
	if not var11 then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 26 ]]
		-- upvalues: insertService (copy), var11 (ref)
		return insertService:LoadAsset(var11)
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

local function setAllJointsSkinning(value, p1) --[[ line: 53 ]]
	for i, v in value:GetDescendants() do
		if v:IsA("Motor6D") or v:IsA("AnimationConstraint") or (v:IsA("BallSocketConstraint") or v:IsA("Weld")) or v:IsA("RigidConstraint") then
			v.EnableSkinning = p1
		end
	end
end

local t_1 = {}

local function _(p2) --[[ line: 65 | named "clearActiveEmoteConnection" ]]
	-- upvalues: t_1 (ref)
	if t_1[p2] then
		t_1[p2]:Disconnect()
		t_1[p2] = nil
	end
end

local function onCharacterRemoving(p3) --[[ line: 72 ]]
	-- upvalues: t_1 (ref)
	if t_1[p3] then
		t_1[p3]:Disconnect()
		t_1[p3] = nil
	end
end

local _ = function(p4, p5) --[[ line: 76 | named "onAnimationPlayed" ]]
	-- upvalues: getClipMetadata (ref), var3 (ref), t_1 (ref), setAllJointsSkinning (ref)
	local animation = p5.Animation
	
	if not animation then return end
	local animationId = animation.AnimationId
	
	if animationId == "" then
		return
	end
	task.spawn(function() --[[ line: 87 ]]
		-- upvalues: getClipMetadata (copy), animationId (ref), var3 (copy), p5 (ref), p4 (ref), t_1 (copy), setAllJointsSkinning (copy)
		local var16 = getClipMetadata(animationId)
		
		if not var16 or not var16.isUGCEmote then return end
		if var16.maxTranslation <= var3 then return end
		if not p5.IsPlaying then return end
		if t_1[p4] then
			t_1[p4]:Disconnect()
			t_1[p4] = nil
		end
		setAllJointsSkinning(p4, false)
		t_1[p4] = p5.Stopped:Connect(function() --[[ line: 103 ]]
			-- upvalues: setAllJointsSkinning (copy), p4 (copy), t_1 (copy)
			setAllJointsSkinning(p4, true)
			
			if t_1[p4] then
				t_1[p4]:Disconnect()
				t_1[p4] = nil
			end
		end)
	end)
end

local function onCharacterAdded(p6) --[[ line: 110 ]]
	-- upvalues: emoteSkinningDisableUseClassLookup (ref), getClipMetadata (ref), var3 (ref), t_1 (ref), setAllJointsSkinning (ref)
	local animator
	local _ = nil
	
	if emoteSkinningDisableUseClassLookup then
		local humanoid = p6:FindFirstChildOfClass("Humanoid")
		
		if not humanoid then return end
		animator = humanoid:FindFirstChildOfClass("Animator")
		
		if animator then
			animator.AnimationPlayed:Connect(function(p7) --[[ line: 127 ]]
				-- upvalues: p6 (ref), getClipMetadata (copy), var3 (copy), t_1 (copy), setAllJointsSkinning (copy)
				local animation = p7.Animation
				
				if not animation then return end
				local animationId = animation.AnimationId
				
				if animationId == "" then
					return
				end
				task.spawn(function() --[[ line: 87 ]]
					-- upvalues: getClipMetadata (copy), animationId (ref), var3 (copy), p7 (ref), p6 (ref), t_1 (copy), setAllJointsSkinning (copy)
					local var16 = getClipMetadata(animationId)
					
					if not var16 or not var16.isUGCEmote then return end
					if var16.maxTranslation <= var3 then return end
					if not p7.IsPlaying then return end
					if t_1[p6] then
						t_1[p6]:Disconnect()
						t_1[p6] = nil
					end
					setAllJointsSkinning(p6, false)
					t_1[p6] = p7.Stopped:Connect(function() --[[ line: 103 ]]
						-- upvalues: setAllJointsSkinning (copy), p6 (copy), t_1 (copy)
						setAllJointsSkinning(p6, true)
						
						if t_1[p6] then
							t_1[p6]:Disconnect()
							t_1[p6] = nil
						end
					end)
				end)
			end)
			
			return
		else
			return
		end
	else
		animator = p6:WaitForChild("Humanoid"):WaitForChild("Animator")
	end
end

local function onPlayerAdded(p8) --[[ line: 132 ]]
	-- upvalues: onCharacterAdded (ref), onCharacterRemoving (ref)
	if p8.Character then
		onCharacterAdded(p8.Character)
	end
	p8.CharacterAdded:Connect(onCharacterAdded)
	p8.CharacterRemoving:Connect(onCharacterRemoving)
end

for i, v in playersService:GetPlayers() do
	task.spawn(onPlayerAdded, v)
end
playersService.PlayerAdded:Connect(onPlayerAdded)