local Players = game:GetService("Players")
local AvatarEditorService = game:GetService("AvatarEditorService")
local AvatarSwitcherEmoteIds = game:DefineFastString("AvatarSwitcherEmoteIds", "3344650532,3344585679,5911729486")
local FFlagAvatarSwitcherAccurateAvatarWarning = require(script:FindFirstAncestor("AvatarSwitcher").Parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local AvatarSwitcherMakeupSupport = game:DefineFastFlag("AvatarSwitcherMakeupSupport", false)
local OutfitViewportUtils = {
	buildOutfitModel = function(OutfitId, RigType)
		-- upvalues: Players (copy), AvatarEditorService (copy), FFlagAvatarSwitcherAccurateAvatarWarning (copy)
		local ConformToAvatarRulesAsyncResult = AvatarEditorService:ConformToAvatarRulesAsync((Players:GetHumanoidDescriptionFromOutfitIdAsync(OutfitId)))
		local HumanoidModelFromDescriptionAsync = Players:CreateHumanoidModelFromDescriptionAsync(ConformToAvatarRulesAsyncResult, RigType)
		
		if FFlagAvatarSwitcherAccurateAvatarWarning then
			return HumanoidModelFromDescriptionAsync, ConformToAvatarRulesAsyncResult
		else
			return HumanoidModelFromDescriptionAsync
		end
	end,
	getCameraDistance = function(Model: Model, p1: number)
		local _, BoundingSize = Model:GetBoundingBox()
		
		return (BoundingSize / 2).Magnitude / math.sin((math.rad(p1 / 2)))
	end,
	loadIdleAnimationForAvatar = function(Object)
		local Humanoid = Object:FindFirstChildOfClass("Humanoid")
		local Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
		
		if not Animator then
			return nil
		end
		local Animate = Object:FindFirstChild("Animate")
		
		if not Animate then
			return nil
		end
		local Idle = Animate:FindFirstChild("idle")
		
		if not Idle then
			return nil
		end
		local Animation = Idle:FindFirstChildOfClass("Animation")
		
		if Animation then
			local AnimationTrack = Animator:LoadAnimation(Animation)
			AnimationTrack.Looped = true
			
			return AnimationTrack
		else
			return nil
		end
	end,
	loadAnimationTrackForAvatar = function(Text, Object)
		local Humanoid = Object:FindFirstChildOfClass("Humanoid")
		local Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
		
		if Animator then
			local Animation = Instance.new("Animation")
			Animation.AnimationId = "rbxassetid://" .. Text
			
			return (Animator:LoadAnimation(Animation))
		else
			return nil
		end
	end
}
local v1 = nil

function OutfitViewportUtils.playRandomEmote(Object)
	-- upvalues: AvatarSwitcherEmoteIds (copy), v1 (ref), OutfitViewportUtils (copy)
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	local IsRigTypeMatch: boolean = Humanoid and Humanoid.RigType == Enum.HumanoidRigType.R15
	local AnimationTrackForAvatar = nil
	local Success, Result = pcall(function()
		-- upvalues: AvatarSwitcherEmoteIds (upval)
		return string.split(AvatarSwitcherEmoteIds)
	end)
	local Entry = nil
	
	if IsRigTypeMatch and Success and #Result > 0 then
		repeat
			Entry = Result[math.random(#Result)]
		until Entry ~= v1 or #Result == 1
		AnimationTrackForAvatar = OutfitViewportUtils.loadAnimationTrackForAvatar(Entry, Object)
		v1 = Entry
	end
	task.spawn(function()
		-- upvalues: AnimationTrackForAvatar (ref), Object (copy), OutfitViewportUtils (upval)
		if AnimationTrackForAvatar then
			AnimationTrackForAvatar.Looped = false
			AnimationTrackForAvatar:Play()
			AnimationTrackForAvatar.Stopped:Wait()
		end
		if Object.Parent == nil then return end
		local IdleAnimationForAvatar = OutfitViewportUtils.loadIdleAnimationForAvatar(Object)
		
		if IdleAnimationForAvatar then
			IdleAnimationForAvatar.Looped = true
			IdleAnimationForAvatar:Play()
		end
	end)
end

function OutfitViewportUtils.hasMissingAccessoriesInHumanoid(Humanoid: Humanoid, Humanoid1: Humanoid): boolean
	return #Humanoid:GetAccessories() < #Humanoid1:GetAccessories(true)
end

local function getAssetIdsInHumanoidDescription(Character)
	-- upvalues: AvatarSwitcherMakeupSupport (copy)
	local t = {}
	
	for _, accessory in Character:GetAccessories(true) do
		t[accessory.AssetId] = true
	end
	t[Character.Face] = true
	t[Character.Head] = true
	t[Character.Torso] = true
	t[Character.LeftArm] = true
	t[Character.RightArm] = true
	t[Character.LeftLeg] = true
	t[Character.RightLeg] = true
	t[Character.GraphicTShirt] = true
	t[Character.Pants] = true
	t[Character.Shirt] = true
	t[Character.ClimbAnimation] = true
	t[Character.FallAnimation] = true
	t[Character.IdleAnimation] = true
	t[Character.JumpAnimation] = true
	t[Character.MoodAnimation] = true
	t[Character.RunAnimation] = true
	t[Character.SwimAnimation] = true
	t[Character.WalkAnimation] = true
	
	if AvatarSwitcherMakeupSupport then
		for _, MakeupDescription in Character:GetChildren() do
			if MakeupDescription:IsA("MakeupDescription") then
				t[MakeupDescription.AssetId] = true
			end
		end
	end
	return t
end

function OutfitViewportUtils.hasMissingAssetsInDescription(Character, List): boolean
	-- upvalues: getAssetIdsInHumanoidDescription (copy)
	local AssetIdsInHumanoidDescription = getAssetIdsInHumanoidDescription(Character)
	
	for _, value in List do
		if not AssetIdsInHumanoidDescription[value] then
			return true
		end
	end
	return false
end

return OutfitViewportUtils