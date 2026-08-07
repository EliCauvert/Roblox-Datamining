-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:32 2026 Pacific Standard Time.

local parent = script.Parent
local getFIntUGCValidationHeadThresholdModule = require(parent.flags.getFIntUGCValidationHeadThreshold)
local getFIntUGCValidationTorsoThresholdFrontModule = require(parent.flags.getFIntUGCValidationTorsoThresholdFront)
local getFIntUGCValidationTorsoThresholdBackModule = require(parent.flags.getFIntUGCValidationTorsoThresholdBack)
local getFIntUGCValidationTorsoThresholdSideModule = require(parent.flags.getFIntUGCValidationTorsoThresholdSide)
local getFIntUGCValidationTorsoThresholdTopBottomModule = require(parent.flags.getFIntUGCValidationTorsoThresholdTopBottom)
local getFIntUGCValidationArmThresholdFrontModule = require(parent.flags.getFIntUGCValidationArmThresholdFront)
local getFIntUGCValidationArmThresholdBackModule = require(parent.flags.getFIntUGCValidationArmThresholdBack)
local getFIntUGCValidationArmThresholdSideModule = require(parent.flags.getFIntUGCValidationArmThresholdSide)
local getFIntUGCValidationArmThresholdTopBottomModule = require(parent.flags.getFIntUGCValidationArmThresholdTopBottom)
local getFIntUGCValidationLegThresholdFrontModule = require(parent.flags.getFIntUGCValidationLegThresholdFront)
local getFIntUGCValidationLegThresholdBackModule = require(parent.flags.getFIntUGCValidationLegThresholdBack)
local getFIntUGCValidationLegThresholdSideModule = require(parent.flags.getFIntUGCValidationLegThresholdSide)
local getFIntUGCValidationLegThresholdTopBottomModule = require(parent.flags.getFIntUGCValidationLegThresholdTopBottom)
local t = {
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
t.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.DynamicHead] = {
	[t.CAMERA_ANGLES.Front] = getFIntUGCValidationHeadThresholdModule() / 100,
	[t.CAMERA_ANGLES.Back] = getFIntUGCValidationHeadThresholdModule() / 100,
	[t.CAMERA_ANGLES.Left] = getFIntUGCValidationHeadThresholdModule() / 100,
	[t.CAMERA_ANGLES.Right] = getFIntUGCValidationHeadThresholdModule() / 100,
	[t.CAMERA_ANGLES.Top] = getFIntUGCValidationHeadThresholdModule() / 100,
	[t.CAMERA_ANGLES.Bottom] = getFIntUGCValidationHeadThresholdModule() / 100
}
t.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.Torso] = {
	[t.CAMERA_ANGLES.Front] = getFIntUGCValidationTorsoThresholdFrontModule() / 100,
	[t.CAMERA_ANGLES.Back] = getFIntUGCValidationTorsoThresholdBackModule() / 100,
	[t.CAMERA_ANGLES.Left] = getFIntUGCValidationTorsoThresholdSideModule() / 100,
	[t.CAMERA_ANGLES.Right] = getFIntUGCValidationTorsoThresholdSideModule() / 100,
	[t.CAMERA_ANGLES.Top] = getFIntUGCValidationTorsoThresholdTopBottomModule() / 100,
	[t.CAMERA_ANGLES.Bottom] = getFIntUGCValidationTorsoThresholdTopBottomModule() / 100
}
local t_1 = {
	[t.CAMERA_ANGLES.Front] = getFIntUGCValidationArmThresholdFrontModule() / 100,
	[t.CAMERA_ANGLES.Back] = getFIntUGCValidationArmThresholdBackModule() / 100,
	[t.CAMERA_ANGLES.Left] = getFIntUGCValidationArmThresholdSideModule() / 100,
	[t.CAMERA_ANGLES.Right] = getFIntUGCValidationArmThresholdSideModule() / 100,
	[t.CAMERA_ANGLES.Top] = getFIntUGCValidationArmThresholdTopBottomModule() / 100,
	[t.CAMERA_ANGLES.Bottom] = getFIntUGCValidationArmThresholdTopBottomModule() / 100
}
t.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.LeftArm] = t_1
t.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.RightArm] = t_1
local t_2 = {
	[t.CAMERA_ANGLES.Front] = getFIntUGCValidationLegThresholdFrontModule() / 100,
	[t.CAMERA_ANGLES.Back] = getFIntUGCValidationLegThresholdBackModule() / 100,
	[t.CAMERA_ANGLES.Left] = getFIntUGCValidationLegThresholdSideModule() / 100,
	[t.CAMERA_ANGLES.Right] = getFIntUGCValidationLegThresholdSideModule() / 100,
	[t.CAMERA_ANGLES.Top] = getFIntUGCValidationLegThresholdTopBottomModule() / 100,
	[t.CAMERA_ANGLES.Bottom] = getFIntUGCValidationLegThresholdTopBottomModule() / 100
}
t.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.LeftLeg] = t_2
t.ASSET_TRANSPARENCY_THRESHOLDS[Enum.AssetType.RightLeg] = t_2
t.ASSET_TRANSPARENCY_RASTER_SIZE = 100

return t