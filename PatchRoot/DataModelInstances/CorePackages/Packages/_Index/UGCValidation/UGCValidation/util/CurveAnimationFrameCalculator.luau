-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local assetCalculatorModule = require(parent.util.AssetCalculator)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local flags = parent.flags
local getFFlagUGCValidateDuplicatesInAnimationModule = require(flags.getFFlagUGCValidateDuplicatesInAnimation)
local getFIntUGCValidateMaxAnimationFPSModule = require(flags.getFIntUGCValidateMaxAnimationFPS)
local getFFlagUGCValidateCurveAnimFinalFrameBugModule = require(flags.getFFlagUGCValidateCurveAnimFinalFrameBug)
local t = {}
local faceControlsName = curveAnimationHierarchyUtilsModule.FaceControlsName

local function createDefaultCharacter(p0) --[[ line: 23 ]]
	-- upvalues: playersService (ref)
	local var10 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	
	for i, v in var10:GetDescendants() do
		if v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("MeshPart") then
			v.Transparency = 1
			v.CanCollide = false
		elseif v:IsA("Motor6D") and p0 then
			v:Destroy()
		end
	end
	return var10
end

local function hasFloatCurveKeys(p1) --[[ line: 53 ]]
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

local function _(p2) --[[ line: 63 | named "hasPositionKeys" ]]
	-- upvalues: hasFloatCurveKeys (ref)
	return if p2 then if p2:IsA("Vector3Curve") then hasFloatCurveKeys(p2) else false else false
end

local _ = function(p3) --[[ line: 74 | named "hasRotationKeys" ]]
	-- upvalues: hasFloatCurveKeys (ref)
	return if p3 then if p3:IsA("EulerRotationCurve") then hasFloatCurveKeys(p3) else false else false
end

function t.calculateAnimFramesAtOrigin(p4) --[[ line: 85 ]]
	-- upvalues: getFIntUGCValidateMaxAnimationFPSModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref), curveAnimationHierarchyUtilsModule (ref), hasFloatCurveKeys (ref), constantsModule (ref), faceControlsName (ref), createDefaultCharacter (ref), assetCalculatorModule (ref), getFFlagUGCValidateCurveAnimFinalFrameBugModule (ref)
	local var15 = 1 / getFIntUGCValidateMaxAnimationFPSModule()
	
	local function getCurveTracks() --[[ line: 92 ]]
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), curveAnimationHierarchyUtilsModule (copy), p4 (ref), hasFloatCurveKeys (copy), constantsModule (copy), faceControlsName (copy)
		local descendants
		local t = {}
		local _ = nil
		
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			local bodyPartFolderRoot = curveAnimationHierarchyUtilsModule.getBodyPartFolderRoot(p4)
			assert(bodyPartFolderRoot, "CurveAnimation must have one and only one body part Folder child or HumanoidRootPart child.")
			descendants = bodyPartFolderRoot:GetDescendants()
			table.insert(descendants, bodyPartFolderRoot)
		else
			descendants = p4:GetDescendants()
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
	
	local function calculateCurveAnimLength(p5) --[[ line: 125 ]]
		local var33 = -1
		
		local function getMaxTimeFromFloatCurveChildren(a) --[[ line: 128 ]]
			-- upvalues: var33 (write)
			if not a then return end
			for i, v in a:GetChildren() do
				if v:IsA("FloatCurve") then
					for i_1, v_1 in v:GetKeys() do
						var33 = math.max(var33, v_1.Time)
					end
				end
			end
		end
		
		for i, v in p5 do
			getMaxTimeFromFloatCurveChildren(v.pos)
			getMaxTimeFromFloatCurveChildren(v.rot)
			getMaxTimeFromFloatCurveChildren(v.faceControls)
		end
		return var33
	end
	
	local function calculateTransformsAtTime(p6, p7) --[[ line: 151 ]]
		local t = {}
		
		for i, v in p7 do
			t[i] = (if v.rot then v.rot:GetRotationAtTime(p6) else CFrame.new()) + (if v.pos then Vector3.new(unpack(v.pos:GetValueAtTime(p6))) else Vector3.new(0, 0, 0))
		end
		return t
	end
	
	local function calculatePositionMagnitudeResultsAtTime(p8, p9) --[[ line: 161 ]]
		local t = {}
		
		for i, v in p9 do
			if v.pos then
				t[i] = Vector3.new(unpack(v.pos:GetValueAtTime(p8))).Magnitude
			end
		end
		return t
	end
	
	local var20 = createDefaultCharacter(false)
	local t = {}
	
	for i, v in var20:GetChildren() do
		if curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v.Name) then
			t[v.Name] = v
		end
	end
	local var22 = getCurveTracks()
	local var23 = calculateCurveAnimLength(var22)
	local t_1 = {}
	local t_2 = {}
	
	local function _(p10) --[[ line: 187 | named "addData" ]]
		-- upvalues: calculateTransformsAtTime (ref), var22 (ref), assetCalculatorModule (copy), t (ref), t_1 (ref), t_2 (ref), calculatePositionMagnitudeResultsAtTime (ref)
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(p10, var22)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(p10, var22))
	end
	
	local var26 = 0
	while var26 <= var23 do
		if getFFlagUGCValidateCurveAnimFinalFrameBugModule() then
			local var27 = var26
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var27, var22)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var27, var22))
		else
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var26, var22)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var26, var22))
		end
		var26 += var15
	end
	if getFFlagUGCValidateCurveAnimFinalFrameBugModule() and var23 >= 0 then
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var23, var22)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var23, var22))
	end
	var20:Destroy()
	
	return t_1, var23, t_2, var22
end

return t