local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SelectAssetTypeIdModule = require(Modules.AvatarExperience.AccessoryAdjustment.Selectors.selectAssetTypeId)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils = AvatarExperienceFlagsModule.FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils
local FFlagAXProvideAccessoryAdjustmentDefaults = AvatarExperienceFlagsModule.FFlagAXProvideAccessoryAdjustmentDefaults
local FFlagAXAccessoryAdjustmentReturnOnNil = AvatarExperienceFlagsModule.FFlagAXAccessoryAdjustmentReturnOnNil
local config = {
	position = { xPosition = -0.25, yPosition = -0.25, zPosition = -0.25 },
	rotation = { xRotation = -15, yRotation = -30, zRotation = -30 },
	scale = { xScale = 0.8, yScale = 0.8, zScale = 0.8 }
}
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(Text: string, p1)
	return p1[string.lower((string.sub(Text, 1, 1))) .. string.sub(Text, 2)]
end)

return function(p1)
	-- upvalues: ConstantsModule (copy), SelectAssetTypeIdModule (copy), FFlagAXAccessoryAdjustmentReturnOnNil (copy), config (copy), ConstantsModule1 (copy), FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils (copy), FFlagAXProvideAccessoryAdjustmentDefaults (copy), MutedErrorFunction (copy), MemoizeResult (copy)
	local AvatarSetting = p1.AvatarExperience.AvatarEditor.AvatarSettings[ConstantsModule.AvatarSettings.accessoryRefinementLowerBounds]
	local SelectAssetTypeIdModuleResult = SelectAssetTypeIdModule(p1)
	
	if FFlagAXAccessoryAdjustmentReturnOnNil and not SelectAssetTypeIdModuleResult then
		return config
	end
	local AssetTypeIdStringToNameEntry: string = ConstantsModule1.AssetTypeIdStringToName[SelectAssetTypeIdModuleResult]
	
	if not FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils then
		return MemoizeResult(AssetTypeIdStringToNameEntry, AvatarSetting)
	elseif FFlagAXProvideAccessoryAdjustmentDefaults and not AssetTypeIdStringToNameEntry then
		MutedErrorFunction(`[selectLowerAdjustmentLimits] No accessory type name found for asset type id: {SelectAssetTypeIdModuleResult}`)
		
		return config
	else
		return AvatarSetting[string.lower((string.sub(AssetTypeIdStringToNameEntry, 1, 1))) .. string.sub(AssetTypeIdStringToNameEntry, 2)]
	end
end