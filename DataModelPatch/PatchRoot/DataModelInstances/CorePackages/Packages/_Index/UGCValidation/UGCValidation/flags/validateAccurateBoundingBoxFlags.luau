game:DefineFastString("UGCValidationAccurateBoundingBoxTargetPercentage", "98.0")
game:DefineFastString("UGCValidationAccurateBoundingBoxPercentageWeight", "0.05")
game:DefineFastInt("UGCValidationAccurateBoundingBoxMaxIterations", 500)
game:DefineFastString("UGCValidationAccurateBoundingBoxConvergedLength", "0.001")
game:DefineFastString("UGCValidateAccurateBoundingBoxInflationThreshold", "0.334")
game:DefineFastFlag("UGCValidateAccurateBoundingBoxRasterMethod", false)
game:DefineFastFlag("UGCValidateAccurateBoundingBoxRasterMethodNeckAttachmentCrop", false)
game:DefineFastString("UGCValidateAccurateBoundingBoxRasterMethodNeckAttachmentCropMargin", "0.05")
local ValidateAccurateBoundingBoxFlagsModule = {
	targetPercentage = function(): number
		return (tonumber(game:GetFastString("UGCValidationAccurateBoundingBoxTargetPercentage")))
	end,
	percentageWeight = function(): number
		return (tonumber(game:GetFastString("UGCValidationAccurateBoundingBoxPercentageWeight")))
	end,
	maxIterations = function()
		return game:GetFastInt("UGCValidationAccurateBoundingBoxMaxIterations")
	end,
	convergedLength = function(): number
		return (tonumber(game:GetFastString("UGCValidationAccurateBoundingBoxConvergedLength")))
	end,
	inflationThreshold = function(): number
		return (tonumber(game:GetFastString("UGCValidateAccurateBoundingBoxInflationThreshold")))
	end,
	neckAttachmentCrop = function()
		return game:GetFastFlag("UGCValidateAccurateBoundingBoxRasterMethodNeckAttachmentCrop")
	end,
	neckAttachmentCropMargin = function(): number
		return (tonumber(game:GetFastString("UGCValidateAccurateBoundingBoxRasterMethodNeckAttachmentCropMargin")))
	end
}
game:DefineFastString("UGCValidationInflationThresholdDynamicHeadX", "0.334")
game:DefineFastString("UGCValidationInflationThresholdDynamicHeadY", "0.334")
game:DefineFastString("UGCValidationInflationThresholdDynamicHeadZ", "0.334")
game:DefineFastString("UGCValidationInflationThresholdTorsoX", "0.334")
game:DefineFastString("UGCValidationInflationThresholdTorsoY", "0.334")
game:DefineFastString("UGCValidationInflationThresholdTorsoZ", "0.334")
game:DefineFastString("UGCValidationInflationThresholdArmsX", "1.0")
game:DefineFastString("UGCValidationInflationThresholdArmsY", "0.334")
game:DefineFastString("UGCValidationInflationThresholdArmsZ", "1.0")
game:DefineFastString("UGCValidationInflationThresholdLegsX", "0.7")
game:DefineFastString("UGCValidationInflationThresholdLegsY", "0.334")
game:DefineFastString("UGCValidationInflationThresholdLegsZ", "0.7")
local config = {
	X = tonumber(game:GetFastString("UGCValidationInflationThresholdArmsX")),
	Y = tonumber(game:GetFastString("UGCValidationInflationThresholdArmsY")),
	Z = tonumber(game:GetFastString("UGCValidationInflationThresholdArmsZ"))
}
local config1 = {
	X = tonumber(game:GetFastString("UGCValidationInflationThresholdLegsX")),
	Y = tonumber(game:GetFastString("UGCValidationInflationThresholdLegsY")),
	Z = tonumber(game:GetFastString("UGCValidationInflationThresholdLegsZ"))
}
ValidateAccurateBoundingBoxFlagsModule.AssetTypeToAxisThresholds = {
	[Enum.AssetType.DynamicHead] = {
		X = tonumber(game:GetFastString("UGCValidationInflationThresholdDynamicHeadX")),
		Y = tonumber(game:GetFastString("UGCValidationInflationThresholdDynamicHeadY")),
		Z = tonumber(game:GetFastString("UGCValidationInflationThresholdDynamicHeadZ"))
	},
	[Enum.AssetType.Torso] = {
		X = tonumber(game:GetFastString("UGCValidationInflationThresholdTorsoX")),
		Y = tonumber(game:GetFastString("UGCValidationInflationThresholdTorsoY")),
		Z = tonumber(game:GetFastString("UGCValidationInflationThresholdTorsoZ"))
	},
	[Enum.AssetType.LeftArm] = config,
	[Enum.AssetType.RightArm] = config,
	[Enum.AssetType.LeftLeg] = config1,
	[Enum.AssetType.RightLeg] = config1
}

return ValidateAccurateBoundingBoxFlagsModule