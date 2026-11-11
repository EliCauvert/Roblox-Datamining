local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)
local CurveAnimBoneHierarchyUtilsModule = require(Parent.util.CurveAnimBoneHierarchyUtils)
local GetFFlagUGCValidateEmotesBonesAllowedModule = require(Parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local GetFFlagUGCValidateDuplicatesInAnimationModule = require(Parent.flags.getFFlagUGCValidateDuplicatesInAnimation)
local GetFFlagUGCValidateRestrictNumFaceControlsModule = require(Parent.flags.getFFlagUGCValidateRestrictNumFaceControls)
local GetFIntUGCValidateMaxTotalFaceControlsModule = require(Parent.flags.getFIntUGCValidateMaxTotalFaceControls)
local GetFFlagUGCValidateAnimBonesSupportModule = require(Parent.flags.getFFlagUGCValidateAnimBonesSupport)
local GetFFlagUGCValidationAnimationPackSupportModule = require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)
local config = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if GetFFlagUGCValidateAnimBonesSupportModule() and GetFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(config.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
config.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }
config.conditionalData = { ValidationEnumsModule.SharedDataMember.curveAnimBoneData }

function config.fflag()
	-- upvalues: GetFFlagUGCValidateEmotesBonesAllowedModule (copy), GetFFlagUGCValidateAnimBonesSupportModule (copy)
	return GetFFlagUGCValidateEmotesBonesAllowedModule() or GetFFlagUGCValidateAnimBonesSupportModule()
end

config.expectedFailures = {}
config.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function buildAcceptableForFolder(Object, p1)
	-- upvalues: CurveAnimBoneHierarchyUtilsModule (copy), CurveAnimationHierarchyUtilsModule (copy)
	if CurveAnimBoneHierarchyUtilsModule.isBoneFolderName(Object.Name) then
		local List = {}
		local ChildBoneNames = CurveAnimBoneHierarchyUtilsModule.getChildBoneNames(Object.Name)
		
		for _, childBoneName in ChildBoneNames do
			table.insert(List, { ClassName = "Folder", Name = childBoneName })
		end
		local Flag = false
		
		if #ChildBoneNames == 1 then
			local ChildBoneName = ChildBoneNames[1]
			
			for _, Folder in Object:GetChildren() do
				if Folder:IsA("Folder") and Folder.Name == ChildBoneName then
					Flag = true
					break
				end
			end
		end
		if not Flag then
			for _, value in CurveAnimationHierarchyUtilsModule.calculateAcceptableChildBodyPartFolders(p1) do
				table.insert(List, value)
			end
		end
		table.insert(List, { ClassName = "Vector3Curve", Name = "Position" })
		table.insert(List, { ClassName = "EulerRotationCurve", Name = "Rotation" })
		
		return List
	else
		local AcceptableChildBodyPartFolders = CurveAnimationHierarchyUtilsModule.calculateAcceptableChildBodyPartFolders(Object.Name)
		
		for _, Name in CurveAnimBoneHierarchyUtilsModule.getRootBoneNamesForBodyPart(Object.Name) do
			table.insert(AcceptableChildBodyPartFolders, { ClassName = "Folder", Name = Name })
		end
		if Object.Name == CurveAnimationHierarchyUtilsModule.humanoidRootPartName then
			return AcceptableChildBodyPartFolders
		end
		table.insert(AcceptableChildBodyPartFolders, { ClassName = "Vector3Curve", Name = "Position" })
		table.insert(AcceptableChildBodyPartFolders, { ClassName = "EulerRotationCurve", Name = "Rotation" })
		
		if Object.Name == "Head" then
			table.insert(AcceptableChildBodyPartFolders, {
				ClassName = "Folder",
				Name = CurveAnimationHierarchyUtilsModule.FaceControlsName
			})
		end
		return AcceptableChildBodyPartFolders
	end
end

local function getFirstUnacceptableChildDetail(Object, List): string?
	if not Object then
		return nil
	end
	local Flag = nil
	for _, child in Object:GetChildren() do
		Flag = false
		
		for i, value in List do
			if value.ClassName == child.ClassName and value.Name == child.Name then
				table.remove(List, i)
				Flag = true
				break
			end
		end
		if not Flag then
			return `unexpected {child.ClassName} '{child.Name}'`
		end
	end
	return nil
end

local function validateFolderStructure(Object, p2, p3)
	-- upvalues: buildAcceptableForFolder (copy), getFirstUnacceptableChildDetail (copy), CurveAnimationHierarchyUtilsModule (copy), GetFFlagUGCValidateRestrictNumFaceControlsModule (copy), GetFIntUGCValidateMaxTotalFaceControlsModule (copy)
	local FirstUnacceptableChildDetail = getFirstUnacceptableChildDetail(Object, (buildAcceptableForFolder(Object, p3)))
	
	if FirstUnacceptableChildDetail then
		return `{FirstUnacceptableChildDetail} under '{p4}'`
	end
	local Position = Object:FindFirstChild("Position")
	
	if not CurveAnimationHierarchyUtilsModule.areChildrenAcceptable(Position, (CurveAnimationHierarchyUtilsModule.calculateAcceptableCurveChildrenArray())) then
		return `unexpected child under '{p4}/Position'`
	end
	local Rotation = Object:FindFirstChild("Rotation")
	
	if not CurveAnimationHierarchyUtilsModule.areChildrenAcceptable(Rotation, (CurveAnimationHierarchyUtilsModule.calculateAcceptableCurveChildrenArray())) then
		return `unexpected child under '{p4}/Rotation'`
	end
	local FaceControlsName = Object:FindFirstChild(CurveAnimationHierarchyUtilsModule.FaceControlsName)
	
	if FaceControlsName then
		local Children = FaceControlsName:GetChildren()
		
		if GetFFlagUGCValidateRestrictNumFaceControlsModule() and GetFIntUGCValidateMaxTotalFaceControlsModule() < #Children then
			return `FaceControls under '{p4}' exceeds max count ({#Children})`
		end
		for _, FloatCurve in Children do
			if not FloatCurve:IsA("FloatCurve") then
				return `unexpected {FloatCurve.ClassName} '{FloatCurve.Name}' under '{p4}/FaceControls'`
			end
		end
	end
	return if CurveAnimationHierarchyUtilsModule.containsGrandChildren(Position) then `'{p4}/Position' contains unexpected grandchildren` elseif CurveAnimationHierarchyUtilsModule.containsGrandChildren(Rotation) then `'{p4}/Rotation' contains unexpected grandchildren` elseif CurveAnimationHierarchyUtilsModule.containsGrandChildren(FaceControlsName) then `'{p4}/FaceControls' contains unexpected grandchildren` else nil
end

local function validateHierarchyTree(Folder, Name, Name1, p4)
	-- upvalues: validateFolderStructure (copy), ErrorSourceStringsModule (copy), CurveAnimationHierarchyUtilsModule (copy), CurveAnimBoneHierarchyUtilsModule (copy), validateHierarchyTree (copy)
	local ValidateFolderStructureResult = validateFolderStructure(Folder, Name, Name1)
	
	if ValidateFolderStructureResult then
		p4:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidBodyPartHierarchyDetail, {
			folderName = Folder.Name,
			detail = ValidateFolderStructureResult
		})
		
		return
	end
	for _, Folder1 in Folder:GetChildren() do
		if Folder1:IsA("Folder") and Folder1.Name ~= CurveAnimationHierarchyUtilsModule.FaceControlsName then
			validateHierarchyTree(Folder1, `{Name}/{Folder1.Name}`, if CurveAnimBoneHierarchyUtilsModule.isBoneFolderName(Folder1.Name) then Name1 else Folder1.Name, p4)
		end
	end
end

function config.run(p5, p6)
	-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (copy), CurveAnimationHierarchyUtilsModule (copy), validateHierarchyTree (copy)
	for _, curveAnimation in p6.curveAnimations do
		local List = {}
		
		if GetFFlagUGCValidateDuplicatesInAnimationModule() then
			local BodyPartFolderRoot = CurveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(curveAnimation)
			
			if BodyPartFolderRoot then
				table.insert(List, BodyPartFolderRoot)
			end
		else
			for _, Folder in curveAnimation:GetChildren() do
				if Folder:IsA("Folder") and CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(Folder.Name) then
					table.insert(List, Folder)
				end
			end
		end
		for _, value in List do
			if CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(value.Name) then
				validateHierarchyTree(value, value.Name, value.Name, p5)
			end
		end
	end
end

return config