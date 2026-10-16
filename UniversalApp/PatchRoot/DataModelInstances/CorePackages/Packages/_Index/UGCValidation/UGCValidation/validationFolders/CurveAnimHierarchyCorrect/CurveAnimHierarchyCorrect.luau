local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local getFFlagUGCValidateMaxTotalInstancesModule = require(parent.flags.getFFlagUGCValidateMaxTotalInstances)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)

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
		-- upvalues: getFFlagUGCValidateMaxTotalInstancesModule (ref), errorSourceStringsModule (ref), curveAnimationHierarchyUtilsModule (ref), getFFlagUGCValidateEmotesBonesAllowedModule (ref)
		for i, v in p2.curveAnimations do
			local count = #v:GetDescendants()
			
			if getFFlagUGCValidateMaxTotalInstancesModule() >= count then
				local var1 = 0
				
				for i_1, v_1 in v:GetChildren() do
					if v_1:IsA("Folder") and curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v_1.Name) then
						var1 += 1
						
						if var1 > 1 then
							p1:fail(errorSourceStringsModule.Keys.CurveAnim_MultipleBodyRoots)
							
							return
						end
					end
				end
				if var1 ~= 0 then
					for i_1, v_1 in v:GetChildren() do
						if v_1:IsA("MarkerCurve") or v_1:IsA("AnimationRigData") then
							if #v_1:GetChildren() > 0 then
								p1:fail(errorSourceStringsModule.Keys.CurveAnim_ChildrenOnMarkerOrRig)
								
								return
							end
						end
						if v_1:IsA("Folder") then
							if curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v_1.Name) or getFFlagUGCValidateEmotesBonesAllowedModule() then
								if not getFFlagUGCValidateEmotesBonesAllowedModule() and not curveAnimationHierarchyUtilsModule.validateCurveAnimationBodyPartFolder(v_1) then
									p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidBodyPartHierarchy, { folderName = v_1.Name })
									
									return
								end
							end
							p1:fail(errorSourceStringsModule.Keys.CurveAnim_UnexpectedChild, { childName = v_1.Name })
							
							return
						end
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_UnexpectedChild, { childName = v_1.Name })
						
						return
					end
				end
				p1:fail(errorSourceStringsModule.Keys.CurveAnim_NoBodyRoot)
				
				return
			end
			p1:fail(errorSourceStringsModule.Keys.CurveAnim_TooManyDescendants, {
				count = tostring(count),
				maxAllowed = tostring(getFFlagUGCValidateMaxTotalInstancesModule())
			})
			
			return
		end
	end
}