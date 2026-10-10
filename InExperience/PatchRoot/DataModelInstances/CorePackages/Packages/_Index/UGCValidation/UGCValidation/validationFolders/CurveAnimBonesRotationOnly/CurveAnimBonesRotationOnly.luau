local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimBoneHierarchyUtilsModule = require(parent.util.CurveAnimBoneHierarchyUtils)
local curveAnimTranslationUtilsModule = require(parent.util.CurveAnimTranslationUtils)
local getFFlagUGCValidateAnimTranslationThresholdModule = require(parent.flags.getFFlagUGCValidateAnimTranslationThreshold)
local UGCValidateBoneTranslationMaxDistanceHundredths = game:DefineFastInt("UGCValidateBoneTranslationMaxDistanceHundredths", 100)

return {
	categories = {
		validationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		validationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { validationEnumsModule.SharedDataMember.curveAnimations },
	conditionalData = { validationEnumsModule.SharedDataMember.curveAnimBoneData },
	expectedFailures = {},
	prereqTests = {
		validationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: UGCValidateBoneTranslationMaxDistanceHundredths (ref), curveAnimBoneHierarchyUtilsModule (ref), getFFlagUGCValidateAnimTranslationThresholdModule (ref), curveAnimTranslationUtilsModule (ref), errorSourceStringsModule (ref)
		local var1 = UGCValidateBoneTranslationMaxDistanceHundredths / 100
		
		for i, v in p2.curveAnimations do
			for i_1, v_1 in v:GetDescendants() do
				if v_1:IsA("Folder") and curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) then
					if getFFlagUGCValidateAnimTranslationThresholdModule() then
						local var2, var3 = curveAnimTranslationUtilsModule.translationExceedsThreshold(v_1, var1)
						
						if var2 then
							p1:fail(errorSourceStringsModule.Keys.CurveAnim_BoneTranslationExceedsThreshold, {
								boneName = v_1.Name,
								distance = string.format("%.3f", var3),
								maxDistance = string.format("%.3f", var1)
							})
						end
					elseif curveAnimTranslationUtilsModule.positionHasKeyframes(v_1) then
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_BonePositionNotAllowed, { boneName = v_1.Name })
					end
				end
			end
		end
	end
}