local AssetCalculatorModule = require(script.Parent.Parent.util.AssetCalculator)
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

function CurveAnimationHierarchyUtils.areChildrenAcceptable(Object, List): boolean
	if not Object then
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
	
	for _, child in Object:GetChildren() do
		if not findAndRemoveMatching(child) then
			return false
		end
	end
	return true
end

function CurveAnimationHierarchyUtils.calculateAcceptableChildBodyPartFolders(p2)
	-- upvalues: CurveAnimationHierarchyUtils (copy)
	local List = {}
	
	for Name, value in CurveAnimationHierarchyUtils.getBodyPartToParentMap() do
		if value == p2 then
			table.insert(List, { ClassName = "Folder", Name = Name })
		end
	end
	return List
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

return CurveAnimationHierarchyUtils