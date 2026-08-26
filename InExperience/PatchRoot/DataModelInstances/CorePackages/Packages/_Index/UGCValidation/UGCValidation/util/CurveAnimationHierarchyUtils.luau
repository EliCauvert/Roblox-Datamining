local parent = script.Parent.Parent
local assetCalculatorModule = require(parent.util.AssetCalculator)
local flags = parent.flags
local getFFlagUGCValidateDuplicatesInAnimationModule = require(flags.getFFlagUGCValidateDuplicatesInAnimation)
local getFFlagUGCValidateRestrictNumFaceControlsModule = require(flags.getFFlagUGCValidateRestrictNumFaceControls)
local getFIntUGCValidateMaxTotalFaceControlsModule = require(flags.getFIntUGCValidateMaxTotalFaceControls)
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

function t.calculateAcceptableBodyPartFolderChildrenArray(p6, p7)
	-- upvalues: t (ref)
	local var2 = t.calculateAcceptableChildBodyPartFolders(p6.Name)
	
	if p6.Name == t.humanoidRootPartName then
		return var2
	end
	table.insert(var2, { ClassName = "Vector3Curve", Name = "Position" })
	table.insert(var2, {
		Name = "Rotation",
		ClassName = if p7 then "EulerRotationCurve" else "RotationCurve"
	})
	
	if p6.Name == "Head" then
		table.insert(var2, { ClassName = "Folder", Name = t.FaceControlsName })
		
		return var2
	end
	return var2
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

function t.validateBodyPartFolderChildren(p6)
	-- upvalues: t (ref), getFFlagUGCValidateRestrictNumFaceControlsModule (ref), getFIntUGCValidateMaxTotalFaceControlsModule (ref)
	if not t.areChildrenAcceptable(p6, t.calculateAcceptableBodyPartFolderChildrenArray(p6, true)) then
		return false
	elseif not t.areChildrenAcceptable(p6:FindFirstChild("Position"), t.calculateAcceptableCurveChildrenArray()) then
		return false
	elseif not t.areChildrenAcceptable(p6:FindFirstChild("Rotation"), t.calculateAcceptableCurveChildrenArray()) then
		return false
	end
	local faceControlsName = p6:FindFirstChild(t.FaceControlsName)
	
	if faceControlsName then
		local children = faceControlsName:GetChildren()
		
		if getFFlagUGCValidateRestrictNumFaceControlsModule() and getFIntUGCValidateMaxTotalFaceControlsModule() < #children then
			return false
		end
		for i, v in children do
			if not v:IsA("FloatCurve") then
				return false
			end
		end
	end
	return if t.containsGrandChildren(p6:FindFirstChild("Position")) then false elseif t.containsGrandChildren(p6:FindFirstChild("Rotation")) then false else t.containsGrandChildren(faceControlsName)
end

function t.validateCurveAnimationBodyPartFolder(p7)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), t (ref)
	local function validateBodyPartFolderInternal(p8)
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), t (copy), validateBodyPartFolderInternal (ref)
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			if not t.validateBodyPartFolderChildren(p8) then
				return false
			end
			for i, v in p8:GetChildren() do
				if v:IsA("Folder") and v.Name ~= t.FaceControlsName and not validateBodyPartFolderInternal(v) then
					return false
				end
			end
			return true
		else
			local name
			for i, v in p8:GetChildren() do
				if v:IsA("Folder") then
					if v.Name ~= t.humanoidRootPartName then
						name = t.getBodyPartToParentMap()[v.Name]
						
						if name then
							return name == p8.Name and validateBodyPartFolderInternal(v)
						end
					end
					return false
				end
			end
			return true
		end
	end
	
	return if t.isBodyPartFolderNameValid(p7.Name) then validateBodyPartFolderInternal(p7) else true
end

return t