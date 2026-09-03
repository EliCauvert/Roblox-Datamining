local parent = script.Parent.Parent
local assetCalculatorModule = require(parent.util.AssetCalculator)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local list = {
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
local t = {
	Head = { "Spine", "Chest" },
	LeftUpperArm = { "Spine", "Chest", "LeftClavicle" },
	RightUpperArm = { "Spine", "Chest", "RightClavicle" }
}

local function buildPositionCurveSchema()
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

local function buildRotationCurveSchema()
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

local function buildFaceControlsSchema()
	-- upvalues: list (ref)
	local t = {}
	
	for i, v in list do
		table.insert(t, { ClassName = "FloatCurve", _optional = true, Name = v })
	end
	return {
		ClassName = "Folder",
		Name = "FaceControls",
		_optional = true,
		_children = t
	}
end

local function convertBoneSchemaToChildren(p1, p2)
	-- upvalues: buildPositionCurveSchema (ref), buildRotationCurveSchema (ref), convertBoneSchemaToChildren (ref)
	local t = {}
	
	for i, v in p1 do
		if v.ClassName == "Bone" then
			local t_1 = {}
			table.insert(t_1, buildPositionCurveSchema())
			table.insert(t_1, buildRotationCurveSchema())
			
			if v._children then
				for i_1, v_1 in convertBoneSchemaToChildren(v._children, p2) do
					table.insert(t_1, v_1)
				end
			end
			if p2 and p2[i] then
				for i_2, i_1 in p2[i] do
					table.insert(t_1, i_1)
				end
			end
			table.insert(t, {
				ClassName = "Folder",
				_optional = true,
				Name = i,
				_children = t_1
			})
		end
	end
	return t
end

local _ = nil

local var1 = function(p3, p4)
	-- upvalues: buildPositionCurveSchema (ref), buildRotationCurveSchema (ref), assetCalculatorModule (ref), var1 (write), r15plusUtilsModule (ref), t (ref), convertBoneSchemaToChildren (ref), buildFaceControlsSchema (ref)
	local t_1 = {}
	table.insert(t_1, buildPositionCurveSchema())
	table.insert(t_1, buildRotationCurveSchema())
	local bodyPartsToParents = assetCalculatorModule.getBodyPartsToParents()
	local t_2 = {}
	
	for i, v in p4 do
		local t_3 = {}
		
		for i_2, v_1 in bodyPartsToParents do
			if v_1 == v then
				table.insert(t_3, i_2)
			end
		end
		t_2[v] = var1(v, t_3)
	end
	for i, v_1 in p4 do
		table.insert(t_1, t_2[v_1])
	end
	local avatarBoneSchema = r15plusUtilsModule.getAvatarBoneSchema(p3)
	
	if next(avatarBoneSchema) ~= nil then
		local t_3 = {}
		
		if p3 == "UpperTorso" then
			for i_2, v_2 in t do
				if t_2[i_2] then
					for i_3, v_3 in v_2 do
						if not t_3[v_3] then
							t_3[v_3] = {}
						end
						table.insert(t_3[v_3], t_2[i_2])
					end
				end
			end
		end
		for i_2, v_2 in convertBoneSchemaToChildren(avatarBoneSchema, t_3) do
			table.insert(t_1, v_2)
		end
	end
	if p3 == "Head" then
		table.insert(t_1, buildFaceControlsSchema())
	end
	return {
		ClassName = "Folder",
		_optional = true,
		Name = p3,
		_children = t_1
	}
end

return (function()
	-- upvalues: assetCalculatorModule (ref), var1 (write)
	local t = {}
	
	for i, v in assetCalculatorModule.getBodyPartsToParents() do
		if v == "LowerTorso" then
			table.insert(t, i)
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
				_children = { var1("LowerTorso", t) }
			}
		}
	}
end)()