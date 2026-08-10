local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local curveAnimBoneHierarchyUtilsModule = require(parent.util.CurveAnimBoneHierarchyUtils)
local curveAnimTranslationUtilsModule = require(parent.util.CurveAnimTranslationUtils)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local getFFlagUGCValidateAnimPartsRotationOnlyModule = require(parent.flags.getFFlagUGCValidateAnimPartsRotationOnly)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local getFFlagUGCValidateAnimTranslationThresholdModule = require(parent.flags.getFFlagUGCValidateAnimTranslationThreshold)
local UGCValidateBodyPartTranslationMaxDistanceHundredths = game:DefineFastInt("UGCValidateBodyPartTranslationMaxDistanceHundredths", 50)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if getFFlagUGCValidateAnimPartsRotationOnlyModule() and getFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }

if getFFlagUGCValidateAnimPartsRotationOnlyModule() then
	t.conditionalData = {}
else
	t.conditionalData = { validationEnumsModule.SharedDataMember.curveAnimBoneData }
end
function t.fflag() --[[ line: 31 ]]
	-- upvalues: getFFlagUGCValidateEmotesBonesAllowedModule (ref), getFFlagUGCValidateAnimPartsRotationOnlyModule (ref)
	return getFFlagUGCValidateEmotesBonesAllowedModule() or getFFlagUGCValidateAnimPartsRotationOnlyModule()
end

t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p0, p1) --[[ line: 37 ]]
	-- upvalues: getFFlagUGCValidateAnimPartsRotationOnlyModule (ref), validationEnumsModule (ref), UGCValidateBodyPartTranslationMaxDistanceHundredths (ref), curveAnimBoneHierarchyUtilsModule (ref), curveAnimationHierarchyUtilsModule (ref), getFFlagUGCValidateAnimTranslationThresholdModule (ref), curveAnimTranslationUtilsModule (ref), errorSourceStringsModule (ref)
	local var13
	local var11 = getFFlagUGCValidateAnimPartsRotationOnlyModule() and p1.uploadCategory == validationEnumsModule.UploadCategory.ANIMATION
	local var12 = UGCValidateBodyPartTranslationMaxDistanceHundredths / 100
	
	for i, v in p1.curveAnimations do
		local v_1
		if not var11 then
			var13 = false
			
			for i_1, v_1 in v:GetDescendants() do
				if v_1:IsA("Folder") and curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) then
					var13 = true
					break
				end
			end
			if var13 then
				for i_2, i_1 in v:GetDescendants() do
					if i_1:IsA("Folder") and curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(i_1.Name) then
						if getFFlagUGCValidateAnimTranslationThresholdModule() then
							v_1, var14 = curveAnimTranslationUtilsModule.translationExceedsThreshold(i_1, var12)
							
							if v_1 then
								p0:fail(errorSourceStringsModule.Keys.CurveAnim_BodyPartTranslationExceedsThreshold, {
									bodyPartName = i_1.Name,
									distance = string.format("%.3f", var14),
									maxDistance = string.format("%.3f", var12)
								})
							end
						elseif curveAnimTranslationUtilsModule.positionHasKeyframes(i_1) then
							if var11 then
								p0:fail(errorSourceStringsModule.Keys.CurveAnim_BodyPartHasPosition, { bodyPartName = i_1.Name })
							else
								p0:fail(errorSourceStringsModule.Keys.CurveAnim_BodyPartWithBoneHasPosition, { bodyPartName = i_1.Name })
							end
						end
					end
				end
			end
		end
	end
end

return t