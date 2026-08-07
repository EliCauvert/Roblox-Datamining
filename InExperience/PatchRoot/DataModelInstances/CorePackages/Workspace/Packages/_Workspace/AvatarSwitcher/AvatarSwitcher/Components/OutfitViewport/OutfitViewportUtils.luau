local playersService = game:GetService("Players")
local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local t = {}
local avatarSwitcherEmoteIds = game:DefineFastString("AvatarSwitcherEmoteIds", "3344650532,3344585679,5911729486")
local fFlagAvatarSwitcherAccurateAvatarWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local avatarSwitcherMakeupSupport = game:DefineFastFlag("AvatarSwitcherMakeupSupport", false)

function t.buildOutfitModel(p0, p1) --[[ line: 17 ]]
	-- upvalues: playersService (ref), avatarEditorService (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref)
	if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
		local var7 = avatarEditorService:ConformToAvatarRulesAsync(playersService:GetHumanoidDescriptionFromOutfitIdAsync(p0))
		local var8 = playersService:CreateHumanoidModelFromDescriptionAsync(var7, p1)
		
		if fFlagAvatarSwitcherAccurateAvatarWarning then
			return var8, var7
		end
		return var8
	else
		local var9 = avatarEditorService:ConformToAvatarRules(playersService:GetHumanoidDescriptionFromOutfitId(p0))
		local var10 = playersService:CreateHumanoidModelFromDescription(var9, p1)
		
		if fFlagAvatarSwitcherAccurateAvatarWarning then
			return var10, var9
		end
		return var10
	end
end

function t.getCameraDistance(p2, p3) --[[ line: 40 ]]
	local _, boundingBox = p2:GetBoundingBox()
	
	return (boundingBox / 2).Magnitude / math.sin(math.rad(p3 / 2))
end

function t.loadIdleAnimationForAvatar(p4) --[[ line: 48 ]]
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
		local var17 = animator:LoadAnimation(animation)
		var17.Looped = true
		
		return var17
	end
	return nil
end

function t.loadAnimationTrackForAvatar(p5, p6) --[[ line: 76 ]]
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

function t.playRandomEmote(p7) --[[ line: 91 ]]
	-- upvalues: avatarSwitcherEmoteIds (ref), var5 (write), t (ref)
	local humanoid = p7:FindFirstChildOfClass("Humanoid")
	local var22 = humanoid and humanoid.RigType == Enum.HumanoidRigType.R15
	local var23 = nil
	local ok, status = pcall(function() --[[ line: 96 ]]
		-- upvalues: avatarSwitcherEmoteIds (copy)
		return string.split(avatarSwitcherEmoteIds)
	end)
	
	if var22 and ok and #status > 0 then
		local var24
		local _ = nil
		repeat
			var24 = status[math.random(#status)]
		until not (var24 == var5 and #status ~= 1)
		var23 = t.loadAnimationTrackForAvatar(var24, p7)
		var5 = var24
	end
	task.spawn(function() --[[ line: 111 ]]
		-- upvalues: var23 (write), p7 (ref), t (copy)
		if var23 then
			var23.Looped = false
			var23:Play()
			var23.Stopped:Wait()
		end
		if p7.Parent == nil then return end
		local var25 = t.loadIdleAnimationForAvatar(p7)
		
		if var25 then
			var25.Looped = true
			var25:Play()
		end
	end)
end

function t.hasMissingAccessoriesInHumanoid(p8, p9) --[[ line: 135 ]]
	return #p8:GetAccessories() < #p9:GetAccessories(true)
end

local function getAssetIdsInHumanoidDescription(value) --[[ line: 147 ]]
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

function t.hasMissingAssetsInDescription(value, p10) --[[ line: 188 ]]
	-- upvalues: getAssetIdsInHumanoidDescription (ref)
	local var27 = getAssetIdsInHumanoidDescription(value)
	
	for i, v in p10 do
		if not var27[v] then
			return true
		end
	end
	return false
end

return t