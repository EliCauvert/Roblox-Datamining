local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
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

function t.fflag() --[[ line: 22 ]]
	-- upvalues: getFFlagUGCValidateEmotesBonesAllowedModule (ref), getFFlagUGCValidateAnimBonesSupportModule (ref)
	return getFFlagUGCValidateEmotesBonesAllowedModule() or getFFlagUGCValidateAnimBonesSupportModule()
end

t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function bonePositionHasKeyframes(p0) --[[ line: 28 ]]
	local position = p0:FindFirstChild("Position")
	
	if not position or not position:IsA("Vector3Curve") then
		return false
	end
	for i, v in { "X", "Y", "Z" } do
		local var8 = position:FindFirstChild(v)
		
		if var8 and var8:IsA("FloatCurve") and #var8:GetKeys() > 0 then
			return true
		end
	end
	return false
end

function t.run(p1, p2) --[[ line: 42 ]]
	-- upvalues: curveAnimBoneHierarchyUtilsModule (ref), bonePositionHasKeyframes (ref), errorSourceStringsModule (ref)
	for i, v in p2.curveAnimations do
		for i_1, v_1 in v:GetDescendants() do
			if v_1:IsA("Folder") and curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) and bonePositionHasKeyframes(v_1) then
				p1:fail(errorSourceStringsModule.Keys.CurveAnim_BonePositionNotAllowed, { boneName = v_1.Name })
			end
		end
	end
end

return t