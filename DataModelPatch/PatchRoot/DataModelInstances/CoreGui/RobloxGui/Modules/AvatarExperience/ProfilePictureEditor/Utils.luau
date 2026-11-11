local CorePackages = game:GetService("CorePackages")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetAvatarEditorStructureModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorStructure)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.ProfilePictureEditor.Constants)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local GetEmotesCategoryModule = require(Modules.AvatarExperience.Common.getEmotesCategory)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetFFlagAXExtractEmotesCategoryModule = require(Modules.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory)
local List = {
	PPEThumbnailTypeModule.Closeup,
	PPEThumbnailTypeModule.FullBody
}

return {
	ConvertThumbnailTypeToInt = function(Value): number
		-- upvalues: List (copy)
		return table.find(List, Value)
	end,
	ConvertThumbnailTypeToEnum = function(Closeup)
		-- upvalues: PPEThumbnailTypeModule (copy)
		return if Closeup == PPEThumbnailTypeModule.Closeup then Enum.AvatarThumbnailCustomizationType.Closeup else Enum.AvatarThumbnailCustomizationType.FullBody
	end,
	isPPEScreenUsingPeekabooWidget = function(ProfilePictureEditorCamera): boolean
		-- upvalues: AvatarScreen (copy)
		return ProfilePictureEditorCamera == AvatarScreen.ProfilePictureEditorCamera or ProfilePictureEditorCamera == AvatarScreen.ProfilePictureEditorFinal
	end,
	getEmotesCategorySubcategoryAndInfo = function()
		-- upvalues: GetFFlagAXExtractEmotesCategoryModule (copy), GetEmotesCategoryModule (copy), GetAvatarEditorStructureModule (copy), ConstantsModule (copy), UtilsModule (copy)
		if GetFFlagAXExtractEmotesCategoryModule() then
			return nil, nil, (GetEmotesCategoryModule())
		else
			local AssetTypeToCategorySubcategoryEntry = GetAvatarEditorStructureModule().AssetTypeToCategorySubcategory[ConstantsModule.AssetTypeIdStrings.EmoteAnimation]
			local Category = AssetTypeToCategorySubcategoryEntry.category
			local Subcategory = AssetTypeToCategorySubcategoryEntry.subcategory
			
			return Category, Subcategory, (UtilsModule.getAvatarEditorCategoryInfo(Category, Subcategory))
		end
	end,
	getSliderValueFromYRotDeg = function(p1): number
		-- upvalues: ConstantsModule1 (copy)
		return (math.clamp(p1 * ConstantsModule1.SliderMax / ConstantsModule1.YRotMaxDeg, -ConstantsModule1.SliderMax, ConstantsModule1.SliderMax))
	end,
	getYRotDegFromSliderValue = function(p1): number
		-- upvalues: ConstantsModule1 (copy)
		return (math.clamp(p1 * ConstantsModule1.YRotMaxDeg / ConstantsModule1.SliderMax, -ConstantsModule1.YRotMaxDeg, ConstantsModule1.YRotMaxDeg))
	end,
	getCameraDistanceScaleFromSliderValue = function(p1): number
		-- upvalues: ConstantsModule1 (copy)
		local NewSliderMax = -p1 / ConstantsModule1.SliderMax + 1
		
		return (1 - ConstantsModule1.ZoomMinScale) * NewSliderMax * NewSliderMax + ConstantsModule1.ZoomMinScale
	end,
	getSliderValueFromCameraDistanceScale = function(p1): number
		-- upvalues: ConstantsModule1 (copy)
		return (math.clamp((math.sqrt((p1 - ConstantsModule1.ZoomMinScale) / (1 - ConstantsModule1.ZoomMinScale)) - 1) * -ConstantsModule1.SliderMax, -ConstantsModule1.SliderMax, ConstantsModule1.SliderMax))
	end
}