local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local GetFFlagUGCValidateDuplicatesInAnimationModule = require(Parent.flags.getFFlagUGCValidateDuplicatesInAnimation)
local GetFFlagUGCValidateMaxTotalInstancesModule = require(Parent.flags.getFFlagUGCValidateMaxTotalInstances)
local GetFFlagUGCValidateEmotesBonesAllowedModule = require(Parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local CurveAnimHierarchyCorrectModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimHierarchyCorrectModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimHierarchyCorrectModule.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }
CurveAnimHierarchyCorrectModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimHierarchyCorrectModule.expectedFailures = {}
CurveAnimHierarchyCorrectModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimHierarchyCorrectModule.run(p1, p2)
	-- upvalues: GetFFlagUGCValidateMaxTotalInstancesModule (copy), ErrorSourceStringsModule (copy), CurveAnimationHierarchyUtilsModule (copy), GetFFlagUGCValidateDuplicatesInAnimationModule (copy), GetFFlagUGCValidateEmotesBonesAllowedModule (copy)
	local Count = nil
	for _, curveAnimation in p2.curveAnimations do
		Count = #curveAnimation:GetDescendants()
		
		if GetFFlagUGCValidateMaxTotalInstancesModule() < Count then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_TooManyDescendants, {
				count = tostring(Count),
				maxAllowed = tostring(GetFFlagUGCValidateMaxTotalInstancesModule())
			})
			break
		end
		local Count1 = 0
		
		for _, Folder in curveAnimation:GetChildren() do
			if Folder:IsA("Folder") and CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(Folder.Name) then
				Count1 += 1
				
				if Count1 > 1 then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_MultipleBodyRoots)
					break
				end
			end
		end
		if GetFFlagUGCValidateDuplicatesInAnimationModule() and Count1 == 0 then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NoBodyRoot)
			break
		end
		for _, child in curveAnimation:GetChildren() do
			if child:IsA("MarkerCurve") or child:IsA("AnimationRigData") then
				if GetFFlagUGCValidateDuplicatesInAnimationModule() and #child:GetChildren() > 0 then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_ChildrenOnMarkerOrRig)
					break
				end
				continue
			end
			if not child:IsA("Folder") then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_UnexpectedChild, { childName = child.Name })
				break
			end
			if GetFFlagUGCValidateDuplicatesInAnimationModule() then
				if not CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(child.Name) and not GetFFlagUGCValidateEmotesBonesAllowedModule() then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_UnexpectedChild, { childName = child.Name })
					break
				end
				if not GetFFlagUGCValidateEmotesBonesAllowedModule() and not CurveAnimationHierarchyUtilsModule.validateCurveAnimationBodyPartFolder(child) then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidBodyPartHierarchy, { folderName = child.Name })
					break
				end
			elseif not GetFFlagUGCValidateEmotesBonesAllowedModule() and not CurveAnimationHierarchyUtilsModule.validateCurveAnimationBodyPartFolder(child) then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidBodyPartHierarchy, { folderName = child.Name })
				break
			end
		end
	end
end

return CurveAnimHierarchyCorrectModule