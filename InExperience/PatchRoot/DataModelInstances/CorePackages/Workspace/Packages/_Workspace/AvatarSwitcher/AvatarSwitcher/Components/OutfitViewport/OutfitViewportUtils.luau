local playersService = game:GetService("Players")
local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local t = {}
local avatarSwitcherEmoteIds = game:DefineFastString("AvatarSwitcherEmoteIds", "3344650532,3344585679,5911729486")
local fFlagAvatarSwitcherAccurateAvatarWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local avatarSwitcherMakeupSupport = game:DefineFastFlag("AvatarSwitcherMakeupSupport", false)

function t.buildOutfitModel(p0, p1)
	-- upvalues: playersService (ref), avatarEditorService (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref)
	local var7 = avatarEditorService:ConformToAvatarRulesAsync(playersService:GetHumanoidDescriptionFromOutfitIdAsync(p0))
	local var8 = playersService:CreateHumanoidModelFromDescriptionAsync(var7, p1)
	
	if fFlagAvatarSwitcherAccurateAvatarWarning then
		return var8, var7
	end
	return var8
end

function t.getCameraDistance(p2, p3)
	local _, boundingBox = p2:GetBoundingBox()
	
	return (boundingBox / 2).Magnitude / math.sin(math.rad(p3 / 2))
end

function t.loadIdleAnimationForAvatar(p4)
	local humanoid = p4:FindFirstChildOfClass("Humanoid")
	local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
	
	if not animator then
		return nil
	end
	local animate = p4:FindFirstChild("Animate")
	
	if not animate then
		return nil
	end
	local idle = animate:FindFirstChild("idle")
	
	if not idle then
		return nil
	end
	local animation = idle:FindFirstChildOfClass("Animation")
	
	if animation then
		local var15 = animator:LoadAnimation(animation)
		var15.Looped = true
		
		return var15
	end
	return nil
end

function t.loadAnimationTrackForAvatar(p5, p6)
	local humanoid = p6:FindFirstChildOfClass("Humanoid")
	local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
	
	if animator then
		local animation = Instance.new("Animation")
		animation.AnimationId = "rbxassetid://" .. p5
		
		return animator:LoadAnimation(animation)
	end
	return nil
end

local var5 = nil

function t.playRandomEmote(p7)
	-- upvalues: avatarSwitcherEmoteIds (ref), var5 (write), t (ref)
	local humanoid = p7:FindFirstChildOfClass("Humanoid")
	local var20 = humanoid and humanoid.RigType == Enum.HumanoidRigType.R15
	local var21 = nil
	local ok, status = pcall(function()
		-- upvalues: avatarSwitcherEmoteIds (copy)
		return string.split(avatarSwitcherEmoteIds)
	end)
	
	if var20 and ok and #status > 0 then
		local var22
		local _ = nil
		repeat
			var22 = status[math.random(#status)]
		until not (var22 == var5 and #status ~= 1)
		var21 = t.loadAnimationTrackForAvatar(var22, p7)
		var5 = var22
	end
	task.spawn(function()
		-- upvalues: var21 (write), p7 (ref), t (copy)
		if var21 then
			var21.Looped = false
			var21:Play()
			var21.Stopped:Wait()
		end
		if p7.Parent == nil then return end
		local var23 = t.loadIdleAnimationForAvatar(p7)
		
		if var23 then
			var23.Looped = true
			var23:Play()
		end
	end)
end

function t.hasMissingAccessoriesInHumanoid(p8, p9)
	return #p8:GetAccessories() < #p9:GetAccessories(true)
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

function t.hasMissingAssetsInDescription(value, p10)
	-- upvalues: getAssetIdsInHumanoidDescription (ref)
	local var25 = getAssetIdsInHumanoidDescription(value)
	
	for i, v in p10 do
		if not var25[v] then
			return true
		end
	end
	return false
end

return t