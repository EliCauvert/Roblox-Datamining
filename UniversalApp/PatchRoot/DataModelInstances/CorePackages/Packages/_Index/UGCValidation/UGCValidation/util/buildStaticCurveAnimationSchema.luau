local Parent = script.Parent.Parent
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local Names = {
	"ChinRaiserUpperLip", "ChinRaiser", "FlatPucker", "Funneler", "LowerLipSuck",
	"LipPresser", "LipsTogether", "MouthLeft", "MouthRight", "Pucker",
	"UpperLipSuck", "LeftCheekPuff", "LeftDimpler", "LeftLipCornerDown",
	"LeftLowerLipDepressor", "LeftLipCornerPuller", "LeftLipStretcher",
	"LeftUpperLipRaiser", "RightCheekPuff", "RightDimpler", "RightLipCornerDown",
	"RightLowerLipDepressor", "RightLipCornerPuller", "RightLipStretcher",
	"RightUpperLipRaiser", "JawDrop", "JawLeft", "JawRight", "Corrugator",
	"LeftBrowLowerer", "LeftOuterBrowRaiser", "LeftNoseWrinkler",
	"LeftInnerBrowRaiser", "RightBrowLowerer", "RightOuterBrowRaiser",
	"RightInnerBrowRaiser", "RightNoseWrinkler", "EyesLookDown", "EyesLookLeft",
	"EyesLookUp", "EyesLookRight", "LeftCheekRaiser", "LeftEyeUpperLidRaiser",
	"LeftEyeClosed", "RightCheekRaiser", "RightEyeUpperLidRaiser",
	"RightEyeClosed", "TongueDown", "TongueOut", "TongueUp"
}
local config = {
	Head = { "Spine", "Chest" },
	LeftUpperArm = { "Spine", "Chest", "LeftClavicle" },
	RightUpperArm = { "Spine", "Chest", "RightClavicle" }
}

local function buildPositionCurveSchema() --[[ Line: 83 ]]
	return {
		ClassName = "Vector3Curve",
		Name = "Position",
		_optional = true,
		_children = {
			{ ClassName = "FloatCurve", Name = "X", _optional = true },
			{ ClassName = "FloatCurve", Name = "Y", _optional = true },
			{ ClassName = "FloatCurve", Name = "Z", _optional = true }
		}
	}
end

local function buildRotationCurveSchema() --[[ Line: 96 ]]
	return {
		ClassName = "EulerRotationCurve",
		Name = "Rotation",
		_optional = true,
		_children = {
			{ ClassName = "FloatCurve", Name = "X", _optional = true },
			{ ClassName = "FloatCurve", Name = "Y", _optional = true },
			{ ClassName = "FloatCurve", Name = "Z", _optional = true }
		}
	}
end

local function buildFaceControlsSchema() --[[ Line: 109 ]]
	-- upvalues: Names (copy)
	local _children = {}
	
	for _, name in Names do
		table.insert(_children, { ClassName = "FloatCurve", _optional = true, Name = name })
	end
	return {
		ClassName = "Folder",
		Name = "FaceControls",
		_optional = true,
		_children = _children
	}
end

local function convertBoneSchemaToChildren(AvatarBoneSchema, p1) --[[ Line: 129 ]]
	-- upvalues: buildPositionCurveSchema (copy), buildRotationCurveSchema (copy), convertBoneSchemaToChildren (copy)
	local List = {}
	
	for Name, Bone in AvatarBoneSchema do
		if Bone.ClassName == "Bone" then
			local List1 = {}
			table.insert(List1, (buildPositionCurveSchema()))
			table.insert(List1, (buildRotationCurveSchema()))
			
			if Bone._children then
				for _, value in convertBoneSchemaToChildren(Bone._children, p1) do
					table.insert(List1, value)
				end
			end
			if p1 and p1[Name] then
				for _, value1 in p1[Name] do
					table.insert(List1, value1)
				end
			end
			table.insert(List, {
				ClassName = "Folder",
				_optional = true,
				Name = Name,
				_children = List1
			})
		end
	end
	return List
end

local _ = nil

local function v10(Name, List) --[[ Line: 176 ]]
	-- upvalues: buildPositionCurveSchema (copy), buildRotationCurveSchema (copy), AssetCalculatorModule (copy), v10 (ref), R15plusUtilsModule (copy), config (copy), convertBoneSchemaToChildren (copy), buildFaceControlsSchema (copy)
	local List1 = {}
	table.insert(List1, (buildPositionCurveSchema()))
	table.insert(List1, (buildRotationCurveSchema()))
	local BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
	local t = {}
	
	for _, value in List do
		local List2 = {}
		
		for i, bodyPartsToParent in BodyPartsToParents do
			if bodyPartsToParent == value then
				table.insert(List2, i)
			end
		end
		t[value] = v10(value, List2)
	end
	for _, value1 in List do
		table.insert(List1, t[value1])
	end
	local AvatarBoneSchema = R15plusUtilsModule.getAvatarBoneSchema(Name)
	
	if next(AvatarBoneSchema) ~= nil then
		local t1 = {}
		
		if Name == "UpperTorso" then
			for i1, value2 in config do
				if t[i1] then
					for _, value3 in value2 do
						if not t1[value3] then
							t1[value3] = {}
						end
						table.insert(t1[value3], t[i1])
					end
				end
			end
		end
		for _, value4 in convertBoneSchemaToChildren(AvatarBoneSchema, t1) do
			table.insert(List1, value4)
		end
	end
	if Name == "Head" then
		table.insert(List1, (buildFaceControlsSchema()))
	end
	return {
		ClassName = "Folder",
		_optional = true,
		Name = Name,
		_children = List1
	}
end

return ((function() --[[ Line: 242 | Named "buildSchema" ]]
	-- upvalues: AssetCalculatorModule (copy), v10 (ref)
	local List = {}
	
	for i, value in AssetCalculatorModule.getBodyPartsToParents() do
		if value == "LowerTorso" then
			table.insert(List, i)
		end
	end
	return {
		ClassName = "CurveAnimation",
		_children = {
			{ ClassName = "AnimationRigData" },
			{ ClassName = "MarkerCurve", _optional = true },
			{
				ClassName = "Folder",
				Name = "HumanoidRootPart",
				_children = { (v10("LowerTorso", List)) }
			}
		}
	}
end)())