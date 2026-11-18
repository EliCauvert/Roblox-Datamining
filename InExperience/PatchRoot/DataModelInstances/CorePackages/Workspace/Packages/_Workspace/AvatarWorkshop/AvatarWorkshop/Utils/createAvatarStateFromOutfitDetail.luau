local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Parent.DataHydration.AvatarInventory)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local WearOutfitAssetsModule = require(AvatarWorkshop.Utils.wearOutfitAssets)

local function _(p1, p2)
	return if p1 then Color3.fromHex(p1) else p2
end

return function(p1)
	-- upvalues: WearOutfitAssetsModule (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	local BodyColor3s = p1.bodyColor3s
	local HeadColor3 = BodyColor3s.headColor3
	local HeadColor = HumanoidDescription.HeadColor
	HumanoidDescription.HeadColor = if HeadColor3 then Color3.fromHex(HeadColor3) else HeadColor
	local TorsoColor3 = BodyColor3s.torsoColor3
	local TorsoColor = HumanoidDescription.TorsoColor
	HumanoidDescription.TorsoColor = if TorsoColor3 then Color3.fromHex(TorsoColor3) else TorsoColor
	local LeftArmColor3 = BodyColor3s.leftArmColor3
	local LeftArmColor = HumanoidDescription.LeftArmColor
	HumanoidDescription.LeftArmColor = if LeftArmColor3 then Color3.fromHex(LeftArmColor3) else LeftArmColor
	local RightArmColor3 = BodyColor3s.rightArmColor3
	local RightArmColor = HumanoidDescription.RightArmColor
	HumanoidDescription.RightArmColor = if RightArmColor3 then Color3.fromHex(RightArmColor3) else RightArmColor
	local LeftLegColor3 = BodyColor3s.leftLegColor3
	local LeftLegColor = HumanoidDescription.LeftLegColor
	HumanoidDescription.LeftLegColor = if LeftLegColor3 then Color3.fromHex(LeftLegColor3) else LeftLegColor
	local RightLegColor3 = BodyColor3s.rightLegColor3
	local RightLegColor = HumanoidDescription.RightLegColor
	HumanoidDescription.RightLegColor = if RightLegColor3 then Color3.fromHex(RightLegColor3) else RightLegColor
	local Scales = p1.scales
	HumanoidDescription.HeightScale = Scales.height or HumanoidDescription.HeightScale
	HumanoidDescription.WidthScale = Scales.width or HumanoidDescription.WidthScale
	HumanoidDescription.HeadScale = Scales.head or HumanoidDescription.HeadScale
	HumanoidDescription.DepthScale = Scales.depth or HumanoidDescription.DepthScale
	HumanoidDescription.ProportionScale = Scales.proportion or HumanoidDescription.ProportionScale
	HumanoidDescription.BodyTypeScale = Scales.bodyType or HumanoidDescription.BodyTypeScale
	
	return {
		humanoidDescription = HumanoidDescription,
		rigType = if p1.playerAvatarType == "R6" then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15,
		gearId = WearOutfitAssetsModule(HumanoidDescription, p1)
	}
end