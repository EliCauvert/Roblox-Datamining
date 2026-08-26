local playersService = game:GetService("Players")
local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local t = {}
local avatarSwitcherEmoteIds = game:DefineFastString("AvatarSwitcherEmoteIds", "3344650532,3344585679,5911729486")
local fFlagAvatarSwitcherAccurateAvatarWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local avatarSwitcherMakeupSupport = game:DefineFastFlag("AvatarSwitcherMakeupSupport", false)

function t.buildOutfitModel(p1, p2)
	-- upvalues: playersService (ref), avatarEditorService (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref)
	local var1 = avatarEditorService:ConformToAvatarRulesAsync(playersService:GetHumanoidDescriptionFromOutfitIdAsync(p1))
	local var2 = playersService:CreateHumanoidModelFromDescriptionAsync(var1, p2)
	
	if fFlagAvatarSwitcherAccurateAvatarWarning then
		return var2, var1
	end
	return var2
end

function t.getCameraDistance(p1, p2)
	local _, boundingBox = p1:GetBoundingBox()
	
	return (boundingBox / 2).Magnitude / math.sin(math.rad(p2 / 2))
end

function t.loadIdleAnimationForAvatar(p1)
	local humanoid = p1:FindFirstChildOfClass("Humanoid")
	local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
	
	if not animator then
		return nil
	end
	local animate = p1:FindFirstChild("Animate")
	
	if not animate then
		return nil
	end
	local idle = animate:FindFirstChild("idle")
	
	if not idle then
		return nil
	end
	local animation = idle:FindFirstChildOfClass("Animation")
	
	if animation then
		local var1 = animator:LoadAnimation(animation)
		var1.Looped = true
		
		return var1
	end
	return nil
end

function t.loadAnimationTrackForAvatar(p1, p2)
	local humanoid = p2:FindFirstChildOfClass("Humanoid")
	local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
	
	if animator then
		local animation = Instance.new("Animation")
		animation.AnimationId = "rbxassetid://" .. p5
		
		return animator:LoadAnimation(animation)
	end
	return nil
end

local var1 = nil

function t.playRandomEmote(p1)
	-- upvalues: avatarSwitcherEmoteIds (ref), var1 (write), t (ref)
	local humanoid = p1:FindFirstChildOfClass("Humanoid")
	local var2 = humanoid and humanoid.RigType == Enum.HumanoidRigType.R15
	local var3 = nil
	local ok, status = pcall(function()
		-- upvalues: avatarSwitcherEmoteIds (copy)
		return string.split(avatarSwitcherEmoteIds)
	end)
	
	if var2 and ok and #status > 0 then
		local var4
		local _ = nil
		repeat
			var4 = status[math.random(#status)]
		until not (var4 == var1 and #status ~= 1)
		var3 = t.loadAnimationTrackForAvatar(var4, p1)
		var1 = var4
	end
	task.spawn(function()
		-- upvalues: var3 (write), p1 (ref), t (copy)
		if var3 then
			var3.Looped = false
			var3:Play()
			var3.Stopped:Wait()
		end
		if p1.Parent == nil then return end
		local var5 = t.loadIdleAnimationForAvatar(p1)
		
		if var5 then
			var5.Looped = true
			var5:Play()
		end
	end)
end

function t.hasMissingAccessoriesInHumanoid(p1, p2)
	return #p1:GetAccessories() < #p2:GetAccessories(true)
end

local function getAssetIdsInHumanoidDescription(value)
	-- upvalues: avatarSwitcherMakeupSupport (ref)
	local t = {}
	
	for i, v in value:GetAccessories(true) do
		t[v.AssetId] = true
	end
	t[value.Face] = true
	t[value.Head] = true
	t[value.Torso] = true
	t[value.LeftArm] = true
	t[value.RightArm] = true
	t[value.LeftLeg] = true
	t[value.RightLeg] = true
	t[value.GraphicTShirt] = true
	t[value.Pants] = true
	t[value.Shirt] = true
	t[value.ClimbAnimation] = true
	t[value.FallAnimation] = true
	t[value.IdleAnimation] = true
	t[value.JumpAnimation] = true
	t[value.MoodAnimation] = true
	t[value.RunAnimation] = true
	t[value.SwimAnimation] = true
	t[value.WalkAnimation] = true
	
	if avatarSwitcherMakeupSupport then
		for i, v_1 in value:GetChildren() do
			if v_1:IsA("MakeupDescription") then
				t[v_1.AssetId] = true
			end
		end
	end
	return t
end

function t.hasMissingAssetsInDescription(value, p1)
	-- upvalues: getAssetIdsInHumanoidDescription (ref)
	local var2 = getAssetIdsInHumanoidDescription(value)
	
	for i, v in p1 do
		if not var2[v] then
			return true
		end
	end
	return false
end

return t