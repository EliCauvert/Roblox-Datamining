local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)
local CurveAnimBoneHierarchyUtilsModule = require(Parent.util.CurveAnimBoneHierarchyUtils)
local CurveAnimTranslationUtilsModule = require(Parent.util.CurveAnimTranslationUtils)
local GetFFlagUGCValidateAnimPartsRotationOnlyModule = require(Parent.flags.getFFlagUGCValidateAnimPartsRotationOnly)
local GetFFlagUGCValidateAnimTranslationThresholdModule = require(Parent.flags.getFFlagUGCValidateAnimTranslationThreshold)
local UGCValidateBodyPartTranslationMaxDistanceHundredths = game:DefineFastInt("UGCValidateBodyPartTranslationMaxDistanceHundredths", 100)
local UGCValidateLowerTorsoTranslationMaxDistanceHundredths = game:DefineFastInt("UGCValidateLowerTorsoTranslationMaxDistanceHundredths", 200)
local CurveAnimPartsRotateOnlyIfBonesModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if GetFFlagUGCValidateAnimPartsRotationOnlyModule() then
	table.insert(CurveAnimPartsRotateOnlyIfBonesModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimPartsRotateOnlyIfBonesModule.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }

if GetFFlagUGCValidateAnimPartsRotationOnlyModule() then
	CurveAnimPartsRotateOnlyIfBonesModule.conditionalData = {}
else
	CurveAnimPartsRotateOnlyIfBonesModule.conditionalData = { ValidationEnumsModule.SharedDataMember.curveAnimBoneData }
end
CurveAnimPartsRotateOnlyIfBonesModule.expectedFailures = {}
CurveAnimPartsRotateOnlyIfBonesModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimPartsRotateOnlyIfBonesModule.run(p1, p2) --[[ Line: 34 ]]
	-- upvalues: GetFFlagUGCValidateAnimPartsRotationOnlyModule (copy), ValidationEnumsModule (copy), UGCValidateBodyPartTranslationMaxDistanceHundredths (copy), UGCValidateLowerTorsoTranslationMaxDistanceHundredths (copy), CurveAnimBoneHierarchyUtilsModule (copy), CurveAnimationHierarchyUtilsModule (copy), GetFFlagUGCValidateAnimTranslationThresholdModule (copy), CurveAnimTranslationUtilsModule (copy), ErrorSourceStringsModule (copy)
	local IsUploadCategoryMatch: boolean = GetFFlagUGCValidateAnimPartsRotationOnlyModule() and p2.uploadCategory == ValidationEnumsModule.UploadCategory.ANIMATION
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
				if GetFFlagUGCValidateAnimTranslationThresholdModule() then
					local UGCValidateLowerTorsoTranslationMaxDistanceHundredthsRatio1 = if Folder1.Name == "LowerTorso" then UGCValidateLowerTorsoTranslationMaxDistanceHundredthsRatio else UGCValidateBodyPartTranslationMaxDistanceHundredthsRatio
					local TranslationExceedsThresholdResult, TranslationExceedsThresholdResult2 = CurveAnimTranslationUtilsModule.translationExceedsThreshold(Folder1, UGCValidateLowerTorsoTranslationMaxDistanceHundredthsRatio1)
					
					if TranslationExceedsThresholdResult then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BodyPartTranslationExceedsThreshold, {
							bodyPartName = Folder1.Name,
							distance = string.format("%.3f", TranslationExceedsThresholdResult2),
							maxDistance = string.format("%.3f", UGCValidateLowerTorsoTranslationMaxDistanceHundredthsRatio1)
						})
					end
				elseif CurveAnimTranslationUtilsModule.positionHasKeyframes(Folder1) then
					if IsUploadCategoryMatch then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BodyPartHasPosition, { bodyPartName = Folder1.Name })
					else
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BodyPartWithBoneHasPosition, { bodyPartName = Folder1.Name })
					end
				end
			end
		end
	end
end

return CurveAnimPartsRotateOnlyIfBonesModule