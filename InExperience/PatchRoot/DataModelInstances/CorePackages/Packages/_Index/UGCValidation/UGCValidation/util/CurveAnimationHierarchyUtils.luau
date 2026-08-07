local parent = script.Parent.Parent
local assetCalculatorModule = require(parent.util.AssetCalculator)
local flags = parent.flags
local getFFlagUGCValidateDuplicatesInAnimationModule = require(flags.getFFlagUGCValidateDuplicatesInAnimation)
local getFFlagUGCValidateRestrictNumFaceControlsModule = require(flags.getFFlagUGCValidateRestrictNumFaceControls)
local getFIntUGCValidateMaxTotalFaceControlsModule = require(flags.getFIntUGCValidateMaxTotalFaceControls)
local t = {}
local var5 = nil

function t.getBodyPartToParentMap() --[[ line: 14 ]]
	-- upvalues: var5 (write), assetCalculatorModule (ref)
	if not var5 then
		var5 = assetCalculatorModule.getBodyPartsToParents()
	end
	return var5
end

t.humanoidRootPartName = "HumanoidRootPart"
t.FaceControlsName = "FaceControls"

function t.folderHasAnimationTracks(p0) --[[ line: 24 ]]
	local vector3Curve
	local position = p0:FindFirstChild("Position")
	local rotation = p0:FindFirstChild("Rotation")
	
	if position ~= nil then
		vector3Curve = position:IsA("Vector3Curve")
		
		if not vector3Curve then
			vector3Curve = rotation ~= nil and (rotation:IsA("EulerRotationCurve") or rotation:IsA("RotationCurve"))
		end
		return vector3Curve
	end
end

function t.isBodyPartFolderNameValid(p1) --[[ line: 31 ]]
	-- upvalues: t (ref)
	return if t.getBodyPartToParentMap()[p1] == nil then p1 == t.humanoidRootPartName else true
end

function t.getBodyPartFolderRoot(p2) --[[ line: 36 ]]
	-- upvalues: t (ref)
	for i, v in p2:GetChildren() do
		if v:IsA("Folder") and t.isBodyPartFolderNameValid(v.Name) then
			return v
		end
	end
	return nil
end

function t.areChildrenAcceptable(p3, p4) --[[ line: 45 ]]
	if not p3 then
		return true
	end
	local function findAndRemoveMatching(p5) --[[ line: 50 ]]
		-- upvalues: p4 (ref)
		for i, v in p4 do
			if v.ClassName == p5.ClassName and v.Name == p5.Name then
				table.remove(p4, i)
				
				return true
			end
		end
		return false
	end
	
	for i, v in p3:GetChildren() do
		if not findAndRemoveMatching(v) then
			return false
		end
	end
	return true
end

function t.calculateAcceptableChildBodyPartFolders(p6) --[[ line: 70 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in t.getBodyPartToParentMap() do
		if v == p6 then
			table.insert(t_1, { ClassName = "Folder", Name = i })
		end
	end
	return t_1
end

function t.calculateAcceptableBodyPartFolderChildrenArray(p7, p8) --[[ line: 83 ]]
	-- upvalues: t (ref)
	local var11 = t.calculateAcceptableChildBodyPartFolders(p7.Name)
	
	if p7.Name == t.humanoidRootPartName then
		return var11
	end
	table.insert(var11, { ClassName = "Vector3Curve", Name = "Position" })
	table.insert(var11, {
		Name = "Rotation",
		ClassName = if p8 then "EulerRotationCurve" else "RotationCurve"
	})
	
	if p7.Name == "Head" then
		table.insert(var11, { ClassName = "Folder", Name = t.FaceControlsName })
		
		return var11
	end
	return var11
end

function t.calculateAcceptableCurveChildrenArray() --[[ line: 114 ]]
	return {
		{ ClassName = "FloatCurve", Name = "X" },
		{ ClassName = "FloatCurve", Name = "Y" },
		{ ClassName = "FloatCurve", Name = "Z" }
	}
end

function t.containsGrandChildren(p9) --[[ line: 131 ]]
	return if p9 then #p9:GetChildren() < #p9:GetDescendants() else false
end

function t.validateBodyPartFolderChildren(p10) --[[ line: 138 ]]
	-- upvalues: t (ref), getFFlagUGCValidateRestrictNumFaceControlsModule (ref), getFIntUGCValidateMaxTotalFaceControlsModule (ref)
	if not t.areChildrenAcceptable(p10, t.calculateAcceptableBodyPartFolderChildrenArray(p10, true)) then
		return false
	elseif not t.areChildrenAcceptable(p10:FindFirstChild("Position"), t.calculateAcceptableCurveChildrenArray()) then
		return false
	elseif not t.areChildrenAcceptable(p10:FindFirstChild("Rotation"), t.calculateAcceptableCurveChildrenArray()) then
		return false
	end
	local faceControlsName = p10:FindFirstChild(t.FaceControlsName)
	
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
	return if t.containsGrandChildren(p10:FindFirstChild("Position")) then false elseif t.containsGrandChildren(p10:FindFirstChild("Rotation")) then false else t.containsGrandChildren(faceControlsName)
end

function t.validateCurveAnimationBodyPartFolder(p11) --[[ line: 198 ]]
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), t (ref)
	local function validateBodyPartFolderInternal(p12) --[[ line: 199 ]]
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), t (copy), validateBodyPartFolderInternal (ref)
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			if not t.validateBodyPartFolderChildren(p12) then
				return false
			end
			for i, v in p12:GetChildren() do
				if v:IsA("Folder") and v.Name ~= t.FaceControlsName and not validateBodyPartFolderInternal(v) then
					return false
				end
			end
			return true
		else
			local name
			for i, v in p12:GetChildren() do
				if v:IsA("Folder") then
					if v.Name ~= t.humanoidRootPartName then
						name = t.getBodyPartToParentMap()[v.Name]
						
						if name then
							return name == p12.Name and validateBodyPartFolderInternal(v)
						end
					end
					return false
				end
			end
			return true
		end
	end
	
	return if t.isBodyPartFolderNameValid(p11.Name) then validateBodyPartFolderInternal(p11) else true
end

return t