-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:46 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFFlagUGCValidateDuplicatesInAnimationModule = require(parent.flags.getFFlagUGCValidateDuplicatesInAnimation)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p0, p1) --[[ line: 25 ]]
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), curveAnimationHierarchyUtilsModule (ref), errorSourceStringsModule (ref)
	local bodyPartFolderRoot
	for i, v in p1.curveAnimations do
		local descendants
		local _ = nil
		
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			bodyPartFolderRoot = curveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(v)
			
			if bodyPartFolderRoot then
				descendants = bodyPartFolderRoot:GetDescendants()
				table.insert(descendants, bodyPartFolderRoot)
			end
			p0:fail(errorSourceStringsModule.Keys.CurveAnim_NoJointManipulation)
			
			return
		else
			descendants = v:GetDescendants()
		end
		bodyPartFolderRoot = false
		
		for i_1, v_1 in descendants do
			if v_1:IsA("Folder") and curveAnimationHierarchyUtilsModule.getBodyPartToParentMap()[v_1.Name] then
				local position = v_1:FindFirstChild("Position")
				local rotation = v_1:FindFirstChild("Rotation")
				
				if position and position:IsA("Vector3Curve") and (rotation and rotation:IsA("EulerRotationCurve")) then
					bodyPartFolderRoot = true
					break
				end
			end
		end
		if not bodyPartFolderRoot then
			p0:fail(errorSourceStringsModule.Keys.CurveAnim_NoJointManipulation)
			
			return
		end
	end
end

return t