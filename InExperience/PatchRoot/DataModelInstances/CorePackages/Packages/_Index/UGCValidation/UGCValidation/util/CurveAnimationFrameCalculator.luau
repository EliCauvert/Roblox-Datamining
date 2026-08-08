local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local assetCalculatorModule = require(parent.util.AssetCalculator)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local rigBuilderModule = require(parent.util.RigBuilder)
local flags = parent.flags
local getFFlagUGCValidateDuplicatesInAnimationModule = require(flags.getFFlagUGCValidateDuplicatesInAnimation)
local getFIntUGCValidateMaxAnimationFPSModule = require(flags.getFIntUGCValidateMaxAnimationFPS)
local getFFlagUGCValidateCurveAnimFinalFrameBugModule = require(flags.getFFlagUGCValidateCurveAnimFinalFrameBug)
local t = {}
local faceControlsName = curveAnimationHierarchyUtilsModule.FaceControlsName

local function hasFloatCurveKeys(p0) --[[ line: 22 ]]
	local floatCurve
	local x = p0:FindFirstChild("X")
	local y = p0:FindFirstChild("Y")
	local z = p0:FindFirstChild("Z")
	
	if x then
		floatCurve = x:IsA("FloatCurve")
		
		if floatCurve then
			floatCurve = #x:GetKeys() > 0
			floatCurve = nil
		end
	else
		floatCurve = false
	end
	if not floatCurve then
		if y then
			floatCurve = y:IsA("FloatCurve")
			
			if floatCurve then
				floatCurve = #y:GetKeys() > 0
				floatCurve = nil
			end
		else
			floatCurve = false
		end
		if not floatCurve then
			if z then
				floatCurve = z:IsA("FloatCurve")
				
				return floatCurve and #z:GetKeys() > 0
			end
			floatCurve = false
		end
	end
end

local function _(p1) --[[ line: 32 | named "hasPositionKeys" ]]
	-- upvalues: hasFloatCurveKeys (ref)
	return if p1 then if p1:IsA("Vector3Curve") then hasFloatCurveKeys(p1) else false else false
end

local _ = function(p2) --[[ line: 43 | named "hasRotationKeys" ]]
	-- upvalues: hasFloatCurveKeys (ref)
	return if p2 then if p2:IsA("EulerRotationCurve") then hasFloatCurveKeys(p2) else false else false
end

function t.calculateAnimFramesAtOrigin(p3) --[[ line: 54 ]]
	-- upvalues: getFIntUGCValidateMaxAnimationFPSModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref), curveAnimationHierarchyUtilsModule (ref), hasFloatCurveKeys (ref), constantsModule (ref), faceControlsName (ref), rigBuilderModule (ref), assetCalculatorModule (ref), getFFlagUGCValidateCurveAnimFinalFrameBugModule (ref)
	local var13 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
	
	local function getCurveTracks() --[[ line: 61 ]]
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), curveAnimationHierarchyUtilsModule (copy), p3 (ref), hasFloatCurveKeys (copy), constantsModule (copy), faceControlsName (copy)
		local descendants
		local t = {}
		local _ = nil
		
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			local bodyPartFolderRoot = curveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(p3)
			assert(bodyPartFolderRoot, "CurveAnimation must have one and only one body part Folder child or HumanoidRootPart child.")
			descendants = bodyPartFolderRoot:GetDescendants()
			table.insert(descendants, bodyPartFolderRoot)
		else
			descendants = p3:GetDescendants()
		end
		for i, v in descendants do
			if v:IsA("Folder") and curveAnimationHierarchyUtilsModule.getBodyPartToParentMap()[v.Name] then
				local position = v:FindFirstChild("Position")
				local rotation = v:FindFirstChild("Rotation")
				t[v.Name] = {
					pos = if if not position then false elseif not position:IsA("Vector3Curve") then false else hasFloatCurveKeys(position) then position else nil,
					rot = if if not rotation then false elseif not rotation:IsA("EulerRotationCurve") then false else hasFloatCurveKeys(rotation) then rotation else nil,
					faceControls = if v.Name == constantsModule.NAMED_R15_BODY_PARTS.Head then v:FindFirstChild(faceControlsName) else nil
				}
			end
		end
		return t
	end
	
	local function calculateCurveAnimLength(p4) --[[ line: 94 ]]
		local var31 = -1
		
		local function getMaxTimeFromFloatCurveChildren(a) --[[ line: 97 ]]
			-- upvalues: var31 (write)
			if not a then return end
			for i, v in a:GetChildren() do
				if v:IsA("FloatCurve") then
					for i_1, v_1 in v:GetKeys() do
						var31 = math.max(var31, v_1.Time)
					end
				end
			end
		end
		
		for i, v in p4 do
			getMaxTimeFromFloatCurveChildren(v.pos)
			getMaxTimeFromFloatCurveChildren(v.rot)
			getMaxTimeFromFloatCurveChildren(v.faceControls)
		end
		return var31
	end
	
	local function calculateTransformsAtTime(p5, p6) --[[ line: 120 ]]
		local t = {}
		
		for i, v in p6 do
			t[i] = (if v.rot then v.rot:GetRotationAtTime(p5) else CFrame.new()) + (if v.pos then Vector3.new(unpack(v.pos:GetValueAtTime(p5))) else Vector3.new(0, 0, 0))
		end
		return t
	end
	
	local function calculatePositionMagnitudeResultsAtTime(p7, p8) --[[ line: 130 ]]
		local t = {}
		
		for i, v in p8 do
			if v.pos then
				t[i] = Vector3.new(unpack(v.pos:GetValueAtTime(p7))).Magnitude
			end
		end
		return t
	end
	
	local var18 = rigBuilderModule.createDefaultCharacter(false)
	local t = {}
	
	for i, v in var18:GetChildren() do
		if curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v.Name) then
			t[v.Name] = v
		end
	end
	local var20 = getCurveTracks()
	local var21 = calculateCurveAnimLength(var20)
	local t_1 = {}
	local t_2 = {}
	
	local function _(p9) --[[ line: 156 | named "addData" ]]
		-- upvalues: calculateTransformsAtTime (ref), var20 (ref), assetCalculatorModule (copy), t (ref), t_1 (ref), t_2 (ref), calculatePositionMagnitudeResultsAtTime (ref)
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(p9, var20)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(p9, var20))
	end
	
	local var24 = 0
	while var24 <= var21 do
		if getFFlagUGCValidateCurveAnimFinalFrameBugModule() then
			local var25 = var24
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var25, var20)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var25, var20))
		else
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var24, var20)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var24, var20))
		end
		var24 += var13
	end
	if getFFlagUGCValidateCurveAnimFinalFrameBugModule() and var21 >= 0 then
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var21, var20)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var21, var20))
	end
	var18:Destroy()
	
	return t_1, var21, t_2, var20
end

return t