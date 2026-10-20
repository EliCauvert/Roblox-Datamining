local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)
local GetFFlagUGCValidateMaxTotalInstancesModule = require(Parent.flags.getFFlagUGCValidateMaxTotalInstances)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: GetFFlagUGCValidateMaxTotalInstancesModule (copy), ErrorSourceStringsModule (copy), CurveAnimationHierarchyUtilsModule (copy)
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
			if Count1 == 0 then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NoBodyRoot)
				break
			end
			for _, child in curveAnimation:GetChildren() do
				if child:IsA("MarkerCurve") or child:IsA("AnimationRigData") then
					if #child:GetChildren() > 0 then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_ChildrenOnMarkerOrRig)
						break
					end
				elseif not child:IsA("Folder") then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_UnexpectedChild, { childName = child.Name })
					break
				end
			end
		end
	end
}