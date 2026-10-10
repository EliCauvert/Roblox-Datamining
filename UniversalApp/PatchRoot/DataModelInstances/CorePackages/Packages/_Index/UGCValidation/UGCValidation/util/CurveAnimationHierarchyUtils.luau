local assetCalculatorModule = require(script.Parent.Parent.util.AssetCalculator)
local t = {}
local var1 = nil

function t.getBodyPartToParentMap()
	-- upvalues: var1 (write), assetCalculatorModule (ref)
	if not var1 then
		var1 = assetCalculatorModule.getBodyPartsToParents()
	end
	return var1
end

t.humanoidRootPartName = "HumanoidRootPart"
t.FaceControlsName = "FaceControls"

function t.folderHasAnimationTracks(p1)
	local vector3Curve
	local position = p1:FindFirstChild("Position")
	local rotation = p1:FindFirstChild("Rotation")
	
	if position ~= nil then
		vector3Curve = position:IsA("Vector3Curve")
		
		if not vector3Curve then
			vector3Curve = rotation ~= nil and (rotation:IsA("EulerRotationCurve") or rotation:IsA("RotationCurve"))
		end
		return vector3Curve
	end
end

function t.isBodyPartFolderNameValid(p1)
	-- upvalues: t (ref)
	return if t.getBodyPartToParentMap()[p1] == nil then p1 == t.humanoidRootPartName else true
end

function t.getBodyPartFolderRoot(p1)
	-- upvalues: t (ref)
	for i, v in p1:GetChildren() do
		if v:IsA("Folder") and t.isBodyPartFolderNameValid(v.Name) then
			return v
		end
	end
	return nil
end

function t.areChildrenAcceptable(p2, p3)
	if not p2 then
		return true
	end
	local function findAndRemoveMatching(p4)
		-- upvalues: p3 (ref)
		for i, v in p3 do
			if v.ClassName == p4.ClassName and v.Name == p4.Name then
				table.remove(p3, i)
				
				return true
			end
		end
		return false
	end
	
	for i, v in p2:GetChildren() do
		if not findAndRemoveMatching(v) then
			return false
		end
	end
	return true
end

function t.calculateAcceptableChildBodyPartFolders(p5)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in t.getBodyPartToParentMap() do
		if v == p5 then
			table.insert(t_1, { ClassName = "Folder", Name = i })
		end
	end
	return t_1
end

function t.calculateAcceptableCurveChildrenArray()
	return {
		{ ClassName = "FloatCurve", Name = "X" },
		{ ClassName = "FloatCurve", Name = "Y" },
		{ ClassName = "FloatCurve", Name = "Z" }
	}
end

function t.containsGrandChildren(p6)
	return if p6 then #p6:GetChildren() < #p6:GetDescendants() else false
end

return t