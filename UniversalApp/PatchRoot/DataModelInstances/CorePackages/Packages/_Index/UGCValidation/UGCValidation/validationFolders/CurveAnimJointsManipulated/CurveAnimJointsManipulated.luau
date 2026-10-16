local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)

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
	run = function(p1, p2) --[[ Line: 18 ]]
		-- upvalues: CurveAnimationHierarchyUtilsModule (copy), ErrorSourceStringsModule (copy)
		local Flag = nil
		for _, curveAnimation in p2.curveAnimations do
			local BodyPartFolderRoot = CurveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(curveAnimation)
			
			if not BodyPartFolderRoot then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NoJointManipulation)
				break
			end
			local Descendants = BodyPartFolderRoot:GetDescendants()
			table.insert(Descendants, BodyPartFolderRoot)
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
}