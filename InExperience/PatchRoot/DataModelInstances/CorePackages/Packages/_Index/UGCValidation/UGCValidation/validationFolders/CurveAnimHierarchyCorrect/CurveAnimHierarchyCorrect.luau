local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFFlagUGCValidateDuplicatesInAnimationModule = require(parent.flags.getFFlagUGCValidateDuplicatesInAnimation)
local getFFlagUGCValidateMaxTotalInstancesModule = require(parent.flags.getFFlagUGCValidateMaxTotalInstances)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if getFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p1, p2)
	-- upvalues: getFFlagUGCValidateMaxTotalInstancesModule (ref), errorSourceStringsModule (ref), curveAnimationHierarchyUtilsModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref), getFFlagUGCValidateEmotesBonesAllowedModule (ref)
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
			if not getFFlagUGCValidateDuplicatesInAnimationModule() or var1 ~= 0 then
				for i_1, v_1 in v:GetChildren() do
					if v_1:IsA("MarkerCurve") or v_1:IsA("AnimationRigData") then
						if getFFlagUGCValidateDuplicatesInAnimationModule() and #v_1:GetChildren() > 0 then
							p1:fail(errorSourceStringsModule.Keys.CurveAnim_ChildrenOnMarkerOrRig)
							
							return
						end
					end
					if v_1:IsA("Folder") then
						if getFFlagUGCValidateDuplicatesInAnimationModule() then
							if curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v_1.Name) or getFFlagUGCValidateEmotesBonesAllowedModule() then
								if not getFFlagUGCValidateEmotesBonesAllowedModule() and not curveAnimationHierarchyUtilsModule.validateCurveAnimationBodyPartFolder(v_1) then
									p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidBodyPartHierarchy, { folderName = v_1.Name })
									
									return
								end
							end
							p1:fail(errorSourceStringsModule.Keys.CurveAnim_UnexpectedChild, { childName = v_1.Name })
							
							return
						elseif not getFFlagUGCValidateEmotesBonesAllowedModule() and not curveAnimationHierarchyUtilsModule.validateCurveAnimationBodyPartFolder(v_1) then
							p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidBodyPartHierarchy, { folderName = v_1.Name })
							
							return
						end
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

return t