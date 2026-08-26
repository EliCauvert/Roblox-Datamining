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

local function hasFloatCurveKeys(p1)
	local floatCurve
	local x = p1:FindFirstChild("X")
	local y = p1:FindFirstChild("Y")
	local z = p1:FindFirstChild("Z")
	
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

local function _(p1)
	-- upvalues: hasFloatCurveKeys (ref)
	return if p1 then if p1:IsA("Vector3Curve") then hasFloatCurveKeys(p1) else false else false
end

local _ = function(p1)
	-- upvalues: hasFloatCurveKeys (ref)
	return if p1 then if p1:IsA("EulerRotationCurve") then hasFloatCurveKeys(p1) else false else false
end

function t.calculateAnimFramesAtOrigin(p1)
	-- upvalues: getFIntUGCValidateMaxAnimationFPSModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref), curveAnimationHierarchyUtilsModule (ref), hasFloatCurveKeys (ref), constantsModule (ref), faceControlsName (ref), rigBuilderModule (ref), assetCalculatorModule (ref), getFFlagUGCValidateCurveAnimFinalFrameBugModule (ref)
	local var1 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
	
	local function getCurveTracks()
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), curveAnimationHierarchyUtilsModule (copy), p1 (ref), hasFloatCurveKeys (copy), constantsModule (copy), faceControlsName (copy)
		local descendants
		local t = {}
		local _ = nil
		
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			local bodyPartFolderRoot = curveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(p1)
			assert(bodyPartFolderRoot, "CurveAnimation must have one and only one body part Folder child or HumanoidRootPart child.")
			descendants = bodyPartFolderRoot:GetDescendants()
			table.insert(descendants, bodyPartFolderRoot)
		else
			descendants = p1:GetDescendants()
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
	
	local function calculateCurveAnimLength(p2)
		local var2 = -1
		
		local function getMaxTimeFromFloatCurveChildren(a)
			-- upvalues: var2 (write)
			if not a then return end
			for i, v in a:GetChildren() do
				if v:IsA("FloatCurve") then
					for i_1, v_1 in v:GetKeys() do
						var2 = math.max(var2, v_1.Time)
					end
				end
			end
		end
		
		for i, v in p2 do
			getMaxTimeFromFloatCurveChildren(v.pos)
			getMaxTimeFromFloatCurveChildren(v.rot)
			getMaxTimeFromFloatCurveChildren(v.faceControls)
		end
		return var2
	end
	
	local function calculateTransformsAtTime(p3, p4)
		local t = {}
		
		for i, v in p4 do
			t[i] = (if v.rot then v.rot:GetRotationAtTime(p3) else CFrame.new()) + (if v.pos then Vector3.new(unpack(v.pos:GetValueAtTime(p3))) else Vector3.new(0, 0, 0))
		end
		return t
	end
	
	local function calculatePositionMagnitudeResultsAtTime(p5, p6)
		local t = {}
		
		for i, v in p6 do
			if v.pos then
				t[i] = Vector3.new(unpack(v.pos:GetValueAtTime(p5))).Magnitude
			end
		end
		return t
	end
	
	local var3 = rigBuilderModule.createDefaultCharacter(false)
	local t = {}
	
	for i, v in var3:GetChildren() do
		if curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v.Name) then
			t[v.Name] = v
		end
	end
	local var4 = getCurveTracks()
	local var5 = calculateCurveAnimLength(var4)
	local t_1 = {}
	local t_2 = {}
	
	local function _(p7)
		-- upvalues: calculateTransformsAtTime (ref), var4 (ref), assetCalculatorModule (copy), t (ref), t_1 (ref), t_2 (ref), calculatePositionMagnitudeResultsAtTime (ref)
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(p7, var4)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(p7, var4))
	end
	
	local var6 = 0
	while var6 <= var5 do
		if getFFlagUGCValidateCurveAnimFinalFrameBugModule() then
			local var7 = var6
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var7, var4)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var7, var4))
		else
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var6, var4)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var6, var4))
		end
		var6 += var1
	end
	if getFFlagUGCValidateCurveAnimFinalFrameBugModule() and var5 >= 0 then
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var5, var4)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var5, var4))
	end
	var3:Destroy()
	
	return t_1, var5, t_2, var4
end

return t