local Parent = script.Parent
local GetFIntUGCValidationHeadThresholdModule = require(Parent.flags.getFIntUGCValidationHeadThreshold)
local GetFIntUGCValidationTorsoThresholdFrontModule = require(Parent.flags.getFIntUGCValidationTorsoThresholdFront)
local GetFIntUGCValidationTorsoThresholdBackModule = require(Parent.flags.getFIntUGCValidationTorsoThresholdBack)
local GetFIntUGCValidationTorsoThresholdSideModule = require(Parent.flags.getFIntUGCValidationTorsoThresholdSide)
local GetFIntUGCValidationTorsoThresholdTopBottomModule = require(Parent.flags.getFIntUGCValidationTorsoThresholdTopBottom)
local GetFIntUGCValidationArmThresholdFrontModule = require(Parent.flags.getFIntUGCValidationArmThresholdFront)
local GetFIntUGCValidationArmThresholdBackModule = require(Parent.flags.getFIntUGCValidationArmThresholdBack)
local GetFIntUGCValidationArmThresholdSideModule = require(Parent.flags.getFIntUGCValidationArmThresholdSide)
local GetFIntUGCValidationArmThresholdTopBottomModule = require(Parent.flags.getFIntUGCValidationArmThresholdTopBottom)
local GetFIntUGCValidationLegThresholdFrontModule = require(Parent.flags.getFIntUGCValidationLegThresholdFront)
local GetFIntUGCValidationLegThresholdBackModule = require(Parent.flags.getFIntUGCValidationLegThresholdBack)
local GetFIntUGCValidationLegThresholdSideModule = require(Parent.flags.getFIntUGCValidationLegThresholdSide)
local GetFIntUGCValidationLegThresholdTopBottomModule = require(Parent.flags.getFIntUGCValidationLegThresholdTopBottom)
local ConstantsTransparencyValidationModule = {
	CAMERA_ANGLES = {
		Front = "Front",
		Back = "Back",
		Left = "Left",
		Right = "Right",
		Top = "Top",
		Bottom = "Bottom"
	},
	ASSET_TRANSPARENCY_THRESHOLDS = {}
}
ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.DynamicHead] = {
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Front] = GetFIntUGCValidationHeadThresholdModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Back] = GetFIntUGCValidationHeadThresholdModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Left] = GetFIntUGCValidationHeadThresholdModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Right] = GetFIntUGCValidationHeadThresholdModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Top] = GetFIntUGCValidationHeadThresholdModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Bottom] = GetFIntUGCValidationHeadThresholdModule() / 100
}
ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.Torso] = {
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Front] = GetFIntUGCValidationTorsoThresholdFrontModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Back] = GetFIntUGCValidationTorsoThresholdBackModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Left] = GetFIntUGCValidationTorsoThresholdSideModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Right] = GetFIntUGCValidationTorsoThresholdSideModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Top] = GetFIntUGCValidationTorsoThresholdTopBottomModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Bottom] = GetFIntUGCValidationTorsoThresholdTopBottomModule() / 100
}
local config = {
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Front] = GetFIntUGCValidationArmThresholdFrontModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Back] = GetFIntUGCValidationArmThresholdBackModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Left] = GetFIntUGCValidationArmThresholdSideModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Right] = GetFIntUGCValidationArmThresholdSideModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Top] = GetFIntUGCValidationArmThresholdTopBottomModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Bottom] = GetFIntUGCValidationArmThresholdTopBottomModule() / 100
}
ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.LeftArm] = config
ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.RightArm] = config
local config1 = {
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Front] = GetFIntUGCValidationLegThresholdFrontModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Back] = GetFIntUGCValidationLegThresholdBackModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Left] = GetFIntUGCValidationLegThresholdSideModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Right] = GetFIntUGCValidationLegThresholdSideModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Top] = GetFIntUGCValidationLegThresholdTopBottomModule() / 100,
	[ConstantsTransparencyValidationModule.CAMERA_ANGLES.Bottom] = GetFIntUGCValidationLegThresholdTopBottomModule() / 100
}
ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.LeftLeg] = config1
ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.RightLeg] = config1
ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE = 100

return ConstantsTransparencyValidationModule