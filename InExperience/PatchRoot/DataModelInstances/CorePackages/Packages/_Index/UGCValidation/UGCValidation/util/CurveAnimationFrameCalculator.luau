local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)
local RigBuilderModule = require(Parent.util.RigBuilder)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Parent.flags.getFIntUGCValidateMaxAnimationFPS)
local FaceControlsName = CurveAnimationHierarchyUtilsModule.FaceControlsName

local function hasFloatCurveKeys(Object) --[[ Line: 20 ]]
	local X = Object:FindFirstChild("X")
	local Y = Object:FindFirstChild("Y")
	local Z = Object:FindFirstChild("Z")
	local IsFloatCurve = if X then X:IsA("FloatCurve") and #X:GetKeys() > 0 else false
	
	if not IsFloatCurve then
		IsFloatCurve = if Y then Y:IsA("FloatCurve") and #Y:GetKeys() > 0 else false
		
		if not IsFloatCurve then
			if Z then
				IsFloatCurve = Z:IsA("FloatCurve")
				
				if IsFloatCurve then
					return #Z:GetKeys() > 0
				end
			else
				IsFloatCurve = false
			end
		end
	end
	return IsFloatCurve
end

local function _(Vector3Curve) --[[ Line: 30 | Named "hasPositionKeys" ]]
	-- upvalues: hasFloatCurveKeys (copy)
	return if Vector3Curve and Vector3Curve:IsA("Vector3Curve") then hasFloatCurveKeys(Vector3Curve) else false
end

local _ = function(EulerRotationCurve) --[[ Line: 41 | Named "hasRotationKeys" ]]
	-- upvalues: hasFloatCurveKeys (copy)
	return if EulerRotationCurve and EulerRotationCurve:IsA("EulerRotationCurve") then hasFloatCurveKeys(EulerRotationCurve) else false
end

return {
	calculateAnimFramesAtOrigin = function(p1) --[[ Line: 52 ]]
		-- upvalues: GetFIntUGCValidateMaxAnimationFPSModule (copy), CurveAnimationHierarchyUtilsModule (copy), hasFloatCurveKeys (copy), ConstantsModule (copy), FaceControlsName (copy), RigBuilderModule (copy), AssetCalculatorModule (copy)
		local Amount = 1 / GetFIntUGCValidateMaxAnimationFPSModule()
		
		local function getCurveTracks() --[[ Line: 59 ]]
			-- upvalues: CurveAnimationHierarchyUtilsModule (upval), p1 (copy), hasFloatCurveKeys (upval), ConstantsModule (upval), FaceControlsName (upval)
			local t = {}
			local BodyPartFolderRoot = CurveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(p1)
			assert(BodyPartFolderRoot, "CurveAnimation must have one and only one body part Folder child or HumanoidRootPart child.")
			local Descendants = BodyPartFolderRoot:GetDescendants()
			table.insert(Descendants, BodyPartFolderRoot)
			
			for _, Folder in Descendants do
				if Folder:IsA("Folder") and CurveAnimationHierarchyUtilsModule.getBodyPartToParentMap()[Folder.Name] then
					local Position = Folder:FindFirstChild("Position")
					local Rotation = Folder:FindFirstChild("Rotation")
					local HasFloatCurveKeys = if Position and Position:IsA("Vector3Curve") then hasFloatCurveKeys(Position) else false
					local Position1 = if HasFloatCurveKeys then Position else nil
					local HasFloatCurveKeys1 = if Rotation and Rotation:IsA("EulerRotationCurve") then hasFloatCurveKeys(Rotation) else false
					t[Folder.Name] = {
						pos = Position1,
						rot = if HasFloatCurveKeys1 then Rotation else nil,
						faceControls = if Folder.Name == ConstantsModule.NAMED_R15_BODY_PARTS.Head then Folder:FindFirstChild(FaceControlsName) else nil
					}
				end
			end
			return t
		end
		
		local function calculateCurveAnimLength(List): number --[[ Line: 87 ]]
			local Largest = -1
			
			local function getMaxTimeFromFloatCurveChildren(FaceControls) --[[ Line: 90 ]]
				-- upvalues: Largest (ref)
				if not FaceControls then return end
				for _, FloatCurve in FaceControls:GetChildren() do
					if FloatCurve:IsA("FloatCurve") then
						for _, key in FloatCurve:GetKeys() do
							Largest = math.max(Largest, key.Time)
						end
					end
				end
			end
			
			for _, value in List do
				getMaxTimeFromFloatCurveChildren(value.pos)
				getMaxTimeFromFloatCurveChildren(value.rot)
				getMaxTimeFromFloatCurveChildren(value.faceControls)
			end
			return Largest
		end
		
		local function calculateTransformsAtTime(Total, List) --[[ Line: 113 ]]
			local t = {}
			
			for i, value in List do
				t[i] = (if value.rot then value.rot:GetRotationAtTime(Total) else CFrame.new()) + (if value.pos then Vector3.new(unpack(value.pos:GetValueAtTime(Total))) else vector.create(0, 0, 0))
			end
			return t
		end
		
		local function calculatePositionMagnitudeResultsAtTime(Total, List) --[[ Line: 123 ]]
			local Magnitudes = {}
			
			for i, value in List do
				if value.pos then
					Magnitudes[i] = Vector3.new(unpack(value.pos:GetValueAtTime(Total))).Magnitude
				end
			end
			return Magnitudes
		end
		
		local DefaultCharacter = RigBuilderModule.createDefaultCharacter(false)
		local t = {}
		
		for _, child in DefaultCharacter:GetChildren() do
			if CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(child.Name) then
				t[child.Name] = child
			end
		end
		local CurveTracks = getCurveTracks()
		local CurveAnimLength: number = calculateCurveAnimLength(CurveTracks)
		local AllTransformsForFullBodies = {}
		local List = {}
		
		local function _(p2) --[[ Line: 149 | Named "addData" ]]
			-- upvalues: calculateTransformsAtTime (copy), CurveTracks (copy), AssetCalculatorModule (upval), t (copy), AllTransformsForFullBodies (copy), List (copy), calculatePositionMagnitudeResultsAtTime (copy)
			table.insert(AllTransformsForFullBodies, (AssetCalculatorModule.calculateAllTransformsForFullBody(t, (calculateTransformsAtTime(p2, CurveTracks)))))
			table.insert(List, (calculatePositionMagnitudeResultsAtTime(p2, CurveTracks)))
		end
		
		local Total = 0
		while Total <= CurveAnimLength do
			table.insert(AllTransformsForFullBodies, (AssetCalculatorModule.calculateAllTransformsForFullBody(t, (calculateTransformsAtTime(Total, CurveTracks)))))
			table.insert(List, (calculatePositionMagnitudeResultsAtTime(Total, CurveTracks)))
			Total += Amount
		end
		if CurveAnimLength >= 0 then
			table.insert(AllTransformsForFullBodies, (AssetCalculatorModule.calculateAllTransformsForFullBody(t, (calculateTransformsAtTime(CurveAnimLength, CurveTracks)))))
			table.insert(List, (calculatePositionMagnitudeResultsAtTime(CurveAnimLength, CurveTracks)))
		end
		DefaultCharacter:Destroy()
		
		return AllTransformsForFullBodies, CurveAnimLength, List, CurveTracks
	end
}