local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)

return {
	categories = {
		validationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		validationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { validationEnumsModule.SharedDataMember.curveAnimations },
	expectedFailures = {},
	prereqTests = {
		validationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: curveAnimationHierarchyUtilsModule (ref), errorSourceStringsModule (ref)
		local var1
		for i, v in p2.curveAnimations do
			local bodyPartFolderRoot = curveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(v)
			
			if bodyPartFolderRoot then
				local descendants = bodyPartFolderRoot:GetDescendants()
				table.insert(descendants, bodyPartFolderRoot)
				var1 = false
				
				for i_1, v_1 in descendants do
					if v_1:IsA("Folder") and curveAnimationHierarchyUtilsModule.getBodyPartToParentMap()[v_1.Name] then
						local position = v_1:FindFirstChild("Position")
						local rotation = v_1:FindFirstChild("Rotation")
						
						if position and position:IsA("Vector3Curve") and (rotation and rotation:IsA("EulerRotationCurve")) then
							var1 = true
							break
						end
					end
				end
				if not var1 then
					p1:fail(errorSourceStringsModule.Keys.CurveAnim_NoJointManipulation)
					
					return
				end
			end
			p1:fail(errorSourceStringsModule.Keys.CurveAnim_NoJointManipulation)
			
			return
		end
	end
}