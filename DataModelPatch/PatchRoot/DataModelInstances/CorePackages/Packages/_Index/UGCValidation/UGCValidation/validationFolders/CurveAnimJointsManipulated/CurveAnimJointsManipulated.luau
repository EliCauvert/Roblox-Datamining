local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local GetFFlagUGCValidateDuplicatesInAnimationModule = require(Parent.flags.getFFlagUGCValidateDuplicatesInAnimation)
local CurveAnimJointsManipulatedModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimJointsManipulatedModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimJointsManipulatedModule.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }
CurveAnimJointsManipulatedModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimJointsManipulatedModule.expectedFailures = {}
CurveAnimJointsManipulatedModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimJointsManipulatedModule.run(p1, p2)
	-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (copy), CurveAnimationHierarchyUtilsModule (copy), ErrorSourceStringsModule (copy)
	local Flag = nil
	for _, curveAnimation in p2.curveAnimations do
		local Descendants = nil
		if GetFFlagUGCValidateDuplicatesInAnimationModule() then
			local BodyPartFolderRoot = CurveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(curveAnimation)
			
			if not BodyPartFolderRoot then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NoJointManipulation)
				break
			end
			Descendants = BodyPartFolderRoot:GetDescendants()
			table.insert(Descendants, BodyPartFolderRoot)
		else
			Descendants = curveAnimation:GetDescendants()
		end
		Flag = false
		
		for _, Folder in Descendants do
			if Folder:IsA("Folder") and CurveAnimationHierarchyUtilsModule.getBodyPartToParentMap()[Folder.Name] then
				local Position = Folder:FindFirstChild("Position")
				local Rotation = Folder:FindFirstChild("Rotation")
				
				if Position and Position:IsA("Vector3Curve") and Rotation and Rotation:IsA("EulerRotationCurve") then
					Flag = true
					break
				end
			end
		end
		if not Flag then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NoJointManipulation)
			break
		end
	end
end

return CurveAnimJointsManipulatedModule