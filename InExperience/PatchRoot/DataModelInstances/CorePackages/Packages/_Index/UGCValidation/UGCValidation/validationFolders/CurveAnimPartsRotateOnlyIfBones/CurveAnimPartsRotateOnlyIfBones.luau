local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)
local CurveAnimBoneHierarchyUtilsModule = require(Parent.util.CurveAnimBoneHierarchyUtils)
local CurveAnimTranslationUtilsModule = require(Parent.util.CurveAnimTranslationUtils)
local UGCValidateBodyPartTranslationMaxDistanceHundredths = game:DefineFastInt("UGCValidateBodyPartTranslationMaxDistanceHundredths", 100)
local UGCValidateLowerTorsoTranslationMaxDistanceHundredths = game:DefineFastInt("UGCValidateLowerTorsoTranslationMaxDistanceHundredths", 200)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	conditionalData = {},
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), UGCValidateBodyPartTranslationMaxDistanceHundredths (copy), UGCValidateLowerTorsoTranslationMaxDistanceHundredths (copy), CurveAnimBoneHierarchyUtilsModule (copy), CurveAnimationHierarchyUtilsModule (copy), CurveAnimTranslationUtilsModule (copy), ErrorSourceStringsModule (copy)
		local IsUploadCategoryMatch = p2.uploadCategory == ValidationEnumsModule.UploadCategory.ANIMATION
		local UGCValidateBodyPartTranslationMaxDistanceHundredthsRatio = UGCValidateBodyPartTranslationMaxDistanceHundredths / 100
		local UGCValidateLowerTorsoTranslationMaxDistanceHundredthsRatio = UGCValidateLowerTorsoTranslationMaxDistanceHundredths / 100
		local Flag = nil
		
		for _, curveAnimation in p2.curveAnimations do
			if not IsUploadCategoryMatch then
				Flag = false
				
				for _, Folder in curveAnimation:GetDescendants() do
					if Folder:IsA("Folder") and CurveAnimBoneHierarchyUtilsModule.isBoneFolderName(Folder.Name) then
						Flag = true
						break
					end
				end
				if not Flag then
					continue
				end
			end
			for _, Folder1 in curveAnimation:GetDescendants() do
				if Folder1:IsA("Folder") and CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(Folder1.Name) then
					local UGCValidateLowerTorsoTranslationMaxDistanceHundredthsRatio1 = if Folder1.Name == "LowerTorso" then UGCValidateLowerTorsoTranslationMaxDistanceHundredthsRatio else UGCValidateBodyPartTranslationMaxDistanceHundredthsRatio
					local TranslationExceedsThresholdResult, TranslationExceedsThresholdResult2 = CurveAnimTranslationUtilsModule.translationExceedsThreshold(Folder1, UGCValidateLowerTorsoTranslationMaxDistanceHundredthsRatio1)
					
					if TranslationExceedsThresholdResult then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BodyPartTranslationExceedsThreshold, {
							bodyPartName = Folder1.Name,
							distance = string.format("%.3f", TranslationExceedsThresholdResult2),
							maxDistance = string.format("%.3f", UGCValidateLowerTorsoTranslationMaxDistanceHundredthsRatio1)
						})
					end
				end
			end
		end
	end
}