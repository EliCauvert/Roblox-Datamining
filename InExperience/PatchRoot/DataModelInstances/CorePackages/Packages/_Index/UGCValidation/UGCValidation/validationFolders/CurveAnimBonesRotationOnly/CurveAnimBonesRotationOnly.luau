local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimBoneHierarchyUtilsModule = require(Parent.util.CurveAnimBoneHierarchyUtils)
local CurveAnimTranslationUtilsModule = require(Parent.util.CurveAnimTranslationUtils)
local GetFFlagUGCValidateAnimTranslationThresholdModule = require(Parent.flags.getFFlagUGCValidateAnimTranslationThreshold)
local UGCValidateBoneTranslationMaxDistanceHundredths = game:DefineFastInt("UGCValidateBoneTranslationMaxDistanceHundredths", 100)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	conditionalData = { ValidationEnumsModule.SharedDataMember.curveAnimBoneData },
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: UGCValidateBoneTranslationMaxDistanceHundredths (copy), CurveAnimBoneHierarchyUtilsModule (copy), GetFFlagUGCValidateAnimTranslationThresholdModule (copy), CurveAnimTranslationUtilsModule (copy), ErrorSourceStringsModule (copy)
		local UGCValidateBoneTranslationMaxDistanceHundredthsRatio = UGCValidateBoneTranslationMaxDistanceHundredths / 100
		
		for _, curveAnimation in p2.curveAnimations do
			for _, Folder in curveAnimation:GetDescendants() do
				if Folder:IsA("Folder") and CurveAnimBoneHierarchyUtilsModule.isBoneFolderName(Folder.Name) then
					if GetFFlagUGCValidateAnimTranslationThresholdModule() then
						local TranslationExceedsThresholdResult, TranslationExceedsThresholdResult2 = CurveAnimTranslationUtilsModule.translationExceedsThreshold(Folder, UGCValidateBoneTranslationMaxDistanceHundredthsRatio)
						
						if TranslationExceedsThresholdResult then
							p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BoneTranslationExceedsThreshold, {
								boneName = Folder.Name,
								distance = string.format("%.3f", TranslationExceedsThresholdResult2),
								maxDistance = string.format("%.3f", UGCValidateBoneTranslationMaxDistanceHundredthsRatio)
							})
						end
					elseif CurveAnimTranslationUtilsModule.positionHasKeyframes(Folder) then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BonePositionNotAllowed, { boneName = Folder.Name })
					end
				end
			end
		end
	end
}