local Parent = script.Parent.Parent
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local Flags = Parent.flags
local GetFFlagUGCValidateDuplicatesInAnimationModule = require(Flags.getFFlagUGCValidateDuplicatesInAnimation)
local GetFFlagUGCValidateRestrictNumFaceControlsModule = require(Flags.getFFlagUGCValidateRestrictNumFaceControls)
local GetFIntUGCValidateMaxTotalFaceControlsModule = require(Flags.getFIntUGCValidateMaxTotalFaceControls)
local BodyPartsToParents = nil
local CurveAnimationHierarchyUtils = {
	getBodyPartToParentMap = function()
		-- upvalues: BodyPartsToParents (ref), AssetCalculatorModule (copy)
		if not BodyPartsToParents then
			BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
		end
		return BodyPartsToParents
	end,
	humanoidRootPartName = "HumanoidRootPart",
	FaceControlsName = "FaceControls",
	folderHasAnimationTracks = function(Object)
		local Position = Object:FindFirstChild("Position")
		local Rotation = Object:FindFirstChild("Rotation")
		
		return if Position == nil then Rotation ~= nil and (Rotation:IsA("EulerRotationCurve") or Rotation:IsA("RotationCurve")) else Position:IsA("Vector3Curve") or Rotation ~= nil and (Rotation:IsA("EulerRotationCurve") or Rotation:IsA("RotationCurve"))
	end
}

function CurveAnimationHierarchyUtils.isBodyPartFolderNameValid(Name): boolean
	-- upvalues: CurveAnimationHierarchyUtils (copy)
	return CurveAnimationHierarchyUtils.getBodyPartToParentMap()[Name] ~= nil or Name == CurveAnimationHierarchyUtils.humanoidRootPartName
end

function CurveAnimationHierarchyUtils.getBodyPartFolderRoot(Object)
	-- upvalues: CurveAnimationHierarchyUtils (copy)
	for _, Folder in Object:GetChildren() do
		if Folder:IsA("Folder") and CurveAnimationHierarchyUtils.isBodyPartFolderNameValid(Folder.Name) then
			return Folder
		end
	end
	return nil
end

function CurveAnimationHierarchyUtils.areChildrenAcceptable(Position, List): boolean
	if not Position then
		return true
	end
	local function findAndRemoveMatching(p1): boolean
		-- upvalues: List (copy)
		for i, value in List do
			if value.ClassName == p1.ClassName and value.Name == p1.Name then
				table.remove(List, i)
				
				return true
			end
		end
		return false
	end
	
	for _, child in Position:GetChildren() do
		if not findAndRemoveMatching(child) then
			return false
		end
	end
	return true
end

function CurveAnimationHierarchyUtils.calculateAcceptableChildBodyPartFolders(Name)
	-- upvalues: CurveAnimationHierarchyUtils (copy)
	local List = {}
	
	for Name1, value in CurveAnimationHierarchyUtils.getBodyPartToParentMap() do
		if value == Name then
			table.insert(List, { ClassName = "Folder", Name = Name1 })
		end
	end
	return List
end

function CurveAnimationHierarchyUtils.calculateAcceptableBodyPartFolderChildrenArray(p2, p3)
	-- upvalues: CurveAnimationHierarchyUtils (copy)
	local AcceptableChildBodyPartFolders = CurveAnimationHierarchyUtils.calculateAcceptableChildBodyPartFolders(p2.Name)
	
	if p2.Name == CurveAnimationHierarchyUtils.humanoidRootPartName then
		return AcceptableChildBodyPartFolders
	end
	table.insert(AcceptableChildBodyPartFolders, { ClassName = "Vector3Curve", Name = "Position" })
	table.insert(AcceptableChildBodyPartFolders, {
		Name = "Rotation",
		ClassName = if p3 then "EulerRotationCurve" else "RotationCurve"
	})
	
	if p2.Name == "Head" then
		table.insert(AcceptableChildBodyPartFolders, {
			ClassName = "Folder",
			Name = CurveAnimationHierarchyUtils.FaceControlsName
		})
		
		return AcceptableChildBodyPartFolders
	else
		return AcceptableChildBodyPartFolders
	end
end

function CurveAnimationHierarchyUtils.calculateAcceptableCurveChildrenArray()
	return {
		{ ClassName = "FloatCurve", Name = "X" },
		{ ClassName = "FloatCurve", Name = "Y" },
		{ ClassName = "FloatCurve", Name = "Z" }
	}
end

function CurveAnimationHierarchyUtils.containsGrandChildren(Object): boolean
	return if Object then #Object:GetChildren() < #Object:GetDescendants() else false
end

function CurveAnimationHierarchyUtils.validateBodyPartFolderChildren(Object): boolean
	-- upvalues: CurveAnimationHierarchyUtils (copy), GetFFlagUGCValidateRestrictNumFaceControlsModule (copy), GetFIntUGCValidateMaxTotalFaceControlsModule (copy)
	if not CurveAnimationHierarchyUtils.areChildrenAcceptable(Object, (CurveAnimationHierarchyUtils.calculateAcceptableBodyPartFolderChildrenArray(Object, true))) then
		return false
	end
	if not CurveAnimationHierarchyUtils.areChildrenAcceptable(Object:FindFirstChild("Position"), (CurveAnimationHierarchyUtils.calculateAcceptableCurveChildrenArray())) then
		return false
	end
	if not CurveAnimationHierarchyUtils.areChildrenAcceptable(Object:FindFirstChild("Rotation"), (CurveAnimationHierarchyUtils.calculateAcceptableCurveChildrenArray())) then
		return false
	end
	local FaceControlsName = Object:FindFirstChild(CurveAnimationHierarchyUtils.FaceControlsName)
	
	if FaceControlsName then
		local Children = FaceControlsName:GetChildren()
		
		if GetFFlagUGCValidateRestrictNumFaceControlsModule() and GetFIntUGCValidateMaxTotalFaceControlsModule() < #Children then
			return false
		end
		for _, FloatCurve in Children do
			if not FloatCurve:IsA("FloatCurve") then
				return false
			end
		end
	end
	return not CurveAnimationHierarchyUtils.containsGrandChildren(Object:FindFirstChild("Position")) and (not CurveAnimationHierarchyUtils.containsGrandChildren(Object:FindFirstChild("Rotation")) and not CurveAnimationHierarchyUtils.containsGrandChildren(FaceControlsName))
end

function CurveAnimationHierarchyUtils.validateCurveAnimationBodyPartFolder(p2)
	-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (copy), CurveAnimationHierarchyUtils (copy)
	local function validateBodyPartFolderInternal(Folder)
		-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (upval), CurveAnimationHierarchyUtils (upval), validateBodyPartFolderInternal (copy)
		if GetFFlagUGCValidateDuplicatesInAnimationModule() then
			if not CurveAnimationHierarchyUtils.validateBodyPartFolderChildren(Folder) then
				return false
			end
			for _, Folder1 in Folder:GetChildren() do
				if Folder1:IsA("Folder") and Folder1.Name ~= CurveAnimationHierarchyUtils.FaceControlsName and not validateBodyPartFolderInternal(Folder1) then
					return false
				end
			end
			return true
		else
			local BodyPartToParent = nil
			for _, Folder2 in Folder:GetChildren() do
				if Folder2:IsA("Folder") then
					if Folder2.Name == CurveAnimationHierarchyUtils.humanoidRootPartName then
						return false
					end
					BodyPartToParent = CurveAnimationHierarchyUtils.getBodyPartToParentMap()[Folder2.Name]
					
					if BodyPartToParent then
						return BodyPartToParent == Folder.Name and validateBodyPartFolderInternal(Folder2)
					end
				end
			end
			return true
		end
	end
	
	return not CurveAnimationHierarchyUtils.isBodyPartFolderNameValid(p2.Name) or validateBodyPartFolderInternal(p2)
end

return CurveAnimationHierarchyUtils