local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local curveAnimBoneHierarchyUtilsModule = require(parent.util.CurveAnimBoneHierarchyUtils)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local getFFlagUGCValidateDuplicatesInAnimationModule = require(parent.flags.getFFlagUGCValidateDuplicatesInAnimation)
local getFFlagUGCValidateRestrictNumFaceControlsModule = require(parent.flags.getFFlagUGCValidateRestrictNumFaceControls)
local getFIntUGCValidateMaxTotalFaceControlsModule = require(parent.flags.getFIntUGCValidateMaxTotalFaceControls)
local getFFlagUGCValidateAnimBonesSupportModule = require(parent.flags.getFFlagUGCValidateAnimBonesSupport)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if getFFlagUGCValidateAnimBonesSupportModule() and require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.conditionalData = { validationEnumsModule.SharedDataMember.curveAnimBoneData }

function t.fflag()
	-- upvalues: getFFlagUGCValidateEmotesBonesAllowedModule (ref), getFFlagUGCValidateAnimBonesSupportModule (ref)
	return getFFlagUGCValidateEmotesBonesAllowedModule() or getFFlagUGCValidateAnimBonesSupportModule()
end

t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function buildAcceptableForFolder(p0, p1)
	-- upvalues: curveAnimBoneHierarchyUtilsModule (ref), curveAnimationHierarchyUtilsModule (ref)
	if curveAnimBoneHierarchyUtilsModule.isBoneFolderName(p0.Name) then
		local t = {}
		local childBoneNames = curveAnimBoneHierarchyUtilsModule.getChildBoneNames(p0.Name)
		
		for i, v in childBoneNames do
			table.insert(t, { ClassName = "Folder", Name = v })
		end
		local var16 = false
		
		if #childBoneNames == 1 then
			local var17 = childBoneNames[1]
			
			for i_1, v_1 in p0:GetChildren() do
				if v_1:IsA("Folder") and v_1.Name == var17 then
					var16 = true
					break
				end
			end
		end
		if not var16 then
			for i_1, v_1 in curveAnimationHierarchyUtilsModule.calculateAcceptableChildBodyPartFolders(p1) do
				table.insert(t, v_1)
			end
		end
		table.insert(t, { ClassName = "Vector3Curve", Name = "Position" })
		table.insert(t, { ClassName = "EulerRotationCurve", Name = "Rotation" })
		
		return t
	else
		local var18 = curveAnimationHierarchyUtilsModule.calculateAcceptableChildBodyPartFolders(p0.Name)
		
		for i, v in curveAnimBoneHierarchyUtilsModule.getRootBoneNamesForBodyPart(p0.Name) do
			table.insert(var18, { ClassName = "Folder", Name = v })
		end
		if p0.Name == curveAnimationHierarchyUtilsModule.humanoidRootPartName then
			return var18
		end
		table.insert(var18, { ClassName = "Vector3Curve", Name = "Position" })
		table.insert(var18, { ClassName = "EulerRotationCurve", Name = "Rotation" })
		
		if p0.Name == "Head" then
			table.insert(var18, {
				ClassName = "Folder",
				Name = curveAnimationHierarchyUtilsModule.FaceControlsName
			})
		end
		return var18
	end
end

local function getFirstUnacceptableChildDetail(p2, p3)
	if not p2 then
		return nil
	end
	local var19
	for i, v in p2:GetChildren() do
		var19 = false
		
		for i_1, v_1 in p3 do
			if v_1.ClassName == v.ClassName and v_1.Name == v.Name then
				table.remove(p3, i_1)
				var19 = true
				break
			end
		end
		if not var19 then
			return `unexpected {v.ClassName} '{v.Name}'`
		end
	end
	return nil
end

local function validateFolderStructure(p4, p5, p6)
	-- upvalues: buildAcceptableForFolder (ref), getFirstUnacceptableChildDetail (ref), curveAnimationHierarchyUtilsModule (ref), getFFlagUGCValidateRestrictNumFaceControlsModule (ref), getFIntUGCValidateMaxTotalFaceControlsModule (ref)
	local var20 = getFirstUnacceptableChildDetail(p4, buildAcceptableForFolder(p4, p6))
	
	if var20 then
		return `{var20} under '{p5}'`
	end
	local position = p4:FindFirstChild("Position")
	
	if not curveAnimationHierarchyUtilsModule.areChildrenAcceptable(position, curveAnimationHierarchyUtilsModule.calculateAcceptableCurveChildrenArray()) then
		return `unexpected child under '{p5}/Position'`
	end
	local rotation = p4:FindFirstChild("Rotation")
	
	if not curveAnimationHierarchyUtilsModule.areChildrenAcceptable(rotation, curveAnimationHierarchyUtilsModule.calculateAcceptableCurveChildrenArray()) then
		return `unexpected child under '{p5}/Rotation'`
	end
	local faceControlsName = p4:FindFirstChild(curveAnimationHierarchyUtilsModule.FaceControlsName)
	
	if faceControlsName then
		local children = faceControlsName:GetChildren()
		
		if getFFlagUGCValidateRestrictNumFaceControlsModule() and getFIntUGCValidateMaxTotalFaceControlsModule() < #children then
			return `FaceControls under '{p5}' exceeds max count ({#children})`
		end
		for i, v in children do
			if not v:IsA("FloatCurve") then
				return `unexpected {v.ClassName} '{v.Name}' under '{p5}/FaceControls'`
			end
		end
	end
	return if curveAnimationHierarchyUtilsModule.containsGrandChildren(position) then `'{p5}/Position' contains unexpected grandchildren` elseif curveAnimationHierarchyUtilsModule.containsGrandChildren(rotation) then `'{p5}/Rotation' contains unexpected grandchildren` elseif curveAnimationHierarchyUtilsModule.containsGrandChildren(faceControlsName) then `'{p5}/FaceControls' contains unexpected grandchildren` else nil
end

local function validateHierarchyTree(p7, p8, p9, p10)
	-- upvalues: validateFolderStructure (ref), errorSourceStringsModule (ref), curveAnimationHierarchyUtilsModule (ref), curveAnimBoneHierarchyUtilsModule (ref), validateHierarchyTree (ref)
	local var25 = validateFolderStructure(p7, p8, p9)
	
	if var25 then
		p10:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidBodyPartHierarchyDetail, { folderName = p7.Name, detail = var25 })
		
		return
	end
	for i, v in p7:GetChildren() do
		if v:IsA("Folder") and v.Name ~= curveAnimationHierarchyUtilsModule.FaceControlsName then
			validateHierarchyTree(v, `{p8}/{v.Name}`, if curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v.Name) then p9 else v.Name, p10)
		end
	end
end

function t.run(p11, p12)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), curveAnimationHierarchyUtilsModule (ref), validateHierarchyTree (ref)
	for i, v in p12.curveAnimations do
		local t = {}
		
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			local bodyPartFolderRoot = curveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(v)
			
			if bodyPartFolderRoot then
				table.insert(t, bodyPartFolderRoot)
			end
		else
			for i_1, v_1 in v:GetChildren() do
				if v_1:IsA("Folder") and curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v_1.Name) then
					table.insert(t, v_1)
				end
			end
		end
		for i_1, v_1 in t do
			if curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v_1.Name) then
				validateHierarchyTree(v_1, v_1.Name, v_1.Name, p11)
			end
		end
	end
end

return t