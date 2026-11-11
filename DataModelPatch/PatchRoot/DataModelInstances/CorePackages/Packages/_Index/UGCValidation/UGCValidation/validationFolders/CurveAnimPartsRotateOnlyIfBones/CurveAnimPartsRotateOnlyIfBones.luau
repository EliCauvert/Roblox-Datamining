local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)
local CurveAnimBoneHierarchyUtilsModule = require(Parent.util.CurveAnimBoneHierarchyUtils)
local GetFFlagUGCValidateEmotesBonesAllowedModule = require(Parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local GetFFlagUGCValidateAnimPartsRotationOnlyModule = require(Parent.flags.getFFlagUGCValidateAnimPartsRotationOnly)
local GetFFlagUGCValidationAnimationPackSupportModule = require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)
local CurveAnimPartsRotateOnlyIfBonesModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if GetFFlagUGCValidateAnimPartsRotationOnlyModule() and GetFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(CurveAnimPartsRotateOnlyIfBonesModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimPartsRotateOnlyIfBonesModule.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }

if GetFFlagUGCValidateAnimPartsRotationOnlyModule() then
	CurveAnimPartsRotateOnlyIfBonesModule.conditionalData = {}
else
	CurveAnimPartsRotateOnlyIfBonesModule.conditionalData = { ValidationEnumsModule.SharedDataMember.curveAnimBoneData }
end
function CurveAnimPartsRotateOnlyIfBonesModule.fflag()
	-- upvalues: GetFFlagUGCValidateEmotesBonesAllowedModule (copy), GetFFlagUGCValidateAnimPartsRotationOnlyModule (copy)
	return GetFFlagUGCValidateEmotesBonesAllowedModule() or GetFFlagUGCValidateAnimPartsRotationOnlyModule()
end

CurveAnimPartsRotateOnlyIfBonesModule.expectedFailures = {}
CurveAnimPartsRotateOnlyIfBonesModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function bodyPartPositionHasKeyframes(Folder): boolean
	local Position = Folder:FindFirstChild("Position")
	
	if not Position or not Position:IsA("Vector3Curve") then
		return false
	end
	for _, ChildName in { "X", "Y", "Z" } do
		local Child = Position:FindFirstChild(ChildName)
		
		if Child and Child:IsA("FloatCurve") and #Child:GetKeys() > 0 then
			return true
		end
	end
	return false
end

function CurveAnimPartsRotateOnlyIfBonesModule.run(p1, p2)
	-- upvalues: GetFFlagUGCValidateAnimPartsRotationOnlyModule (copy), ValidationEnumsModule (copy), CurveAnimBoneHierarchyUtilsModule (copy), CurveAnimationHierarchyUtilsModule (copy), bodyPartPositionHasKeyframes (copy), ErrorSourceStringsModule (copy)
	local IsUploadCategoryMatch: boolean = GetFFlagUGCValidateAnimPartsRotationOnlyModule() and p2.uploadCategory == ValidationEnumsModule.UploadCategory.ANIMATION
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
			if Folder1:IsA("Folder") and CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(Folder1.Name) and bodyPartPositionHasKeyframes(Folder1) then
				if IsUploadCategoryMatch then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BodyPartHasPosition, { bodyPartName = Folder1.Name })
				else
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BodyPartWithBoneHasPosition, { bodyPartName = Folder1.Name })
				end
			end
		end
	end
end

return CurveAnimPartsRotateOnlyIfBonesModule