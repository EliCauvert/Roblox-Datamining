local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local curveAnimBoneHierarchyUtilsModule = require(parent.util.CurveAnimBoneHierarchyUtils)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local getFFlagUGCValidateAnimBonesSupportModule = require(parent.flags.getFFlagUGCValidateAnimBonesSupport)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if getFFlagUGCValidateAnimBonesSupportModule() and require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.conditionalData = { validationEnumsModule.SharedDataMember.curveAnimBoneData }

function t.fflag() --[[ line: 23 ]]
	-- upvalues: getFFlagUGCValidateEmotesBonesAllowedModule (ref), getFFlagUGCValidateAnimBonesSupportModule (ref)
	return getFFlagUGCValidateEmotesBonesAllowedModule() or getFFlagUGCValidateAnimBonesSupportModule()
end

t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p0, p1) --[[ line: 29 ]]
	-- upvalues: curveAnimationHierarchyUtilsModule (ref), curveAnimBoneHierarchyUtilsModule (ref), errorSourceStringsModule (ref)
	for i, v in p1.curveAnimations do
		for i_1, v_1 in v:GetDescendants() do
			if v_1:IsA("Folder") then
				if curveAnimationHierarchyUtilsModule.folderHasAnimationTracks(v_1) and not curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v_1.Name) and not curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) then
					p0:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidBoneName, { boneName = v_1.Name })
				end
			end
		end
	end
end

return t