local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local curveAnimBoneHierarchyUtilsModule = require(parent.util.CurveAnimBoneHierarchyUtils)

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
		-- upvalues: curveAnimationHierarchyUtilsModule (ref), curveAnimBoneHierarchyUtilsModule (ref), errorSourceStringsModule (ref)
		for i, v in p2.curveAnimations do
			for i_1, v_1 in v:GetDescendants() do
				if v_1:IsA("Folder") then
					if curveAnimationHierarchyUtilsModule.folderHasAnimationTracks(v_1) and not curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v_1.Name) and not curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) then
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidBoneName, { boneName = v_1.Name })
					end
				end
			end
		end
	end
}