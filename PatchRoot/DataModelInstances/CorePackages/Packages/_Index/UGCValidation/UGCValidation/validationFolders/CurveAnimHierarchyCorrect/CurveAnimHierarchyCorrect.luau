-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:46 2026 Pacific Standard Time.

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

function t.run(p0, p1) --[[ line: 27 ]]
	-- upvalues: getFFlagUGCValidateMaxTotalInstancesModule (ref), errorSourceStringsModule (ref), curveAnimationHierarchyUtilsModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref), getFFlagUGCValidateEmotesBonesAllowedModule (ref)
	for i, v in p1.curveAnimations do
		local count = #v:GetDescendants()
		
		if getFFlagUGCValidateMaxTotalInstancesModule() >= count then
			local var10 = 0
			
			for i_1, v_1 in v:GetChildren() do
				if v_1:IsA("Folder") and curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v_1.Name) then
					var10 += 1
					
					if var10 > 1 then
						p0:fail(errorSourceStringsModule.Keys.CurveAnim_MultipleBodyRoots)
						
						return
					end
				end
			end
			if not getFFlagUGCValidateDuplicatesInAnimationModule() or var10 ~= 0 then
				for i_1, v_1 in v:GetChildren() do
					if v_1:IsA("MarkerCurve") or v_1:IsA("AnimationRigData") then
						if getFFlagUGCValidateDuplicatesInAnimationModule() and #v_1:GetChildren() > 0 then
							p0:fail(errorSourceStringsModule.Keys.CurveAnim_ChildrenOnMarkerOrRig)
							
							return
						end
					end
					if v_1:IsA("Folder") then
						if getFFlagUGCValidateDuplicatesInAnimationModule() then
							if curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v_1.Name) or getFFlagUGCValidateEmotesBonesAllowedModule() then
								if not getFFlagUGCValidateEmotesBonesAllowedModule() and not curveAnimationHierarchyUtilsModule.validateCurveAnimationBodyPartFolder(v_1) then
									p0:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidBodyPartHierarchy, { folderName = v_1.Name })
									
									return
								end
							end
							p0:fail(errorSourceStringsModule.Keys.CurveAnim_UnexpectedChild, { childName = v_1.Name })
							
							return
						elseif not getFFlagUGCValidateEmotesBonesAllowedModule() and not curveAnimationHierarchyUtilsModule.validateCurveAnimationBodyPartFolder(v_1) then
							p0:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidBodyPartHierarchy, { folderName = v_1.Name })
							
							return
						end
					end
					p0:fail(errorSourceStringsModule.Keys.CurveAnim_UnexpectedChild, { childName = v_1.Name })
					
					return
				end
			end
			p0:fail(errorSourceStringsModule.Keys.CurveAnim_NoBodyRoot)
			
			return
		end
		p0:fail(errorSourceStringsModule.Keys.CurveAnim_TooManyDescendants, {
			count = tostring(count),
			maxAllowed = tostring(getFFlagUGCValidateMaxTotalInstancesModule())
		})
		
		return
	end
end

return t