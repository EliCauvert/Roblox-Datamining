-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:40 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local assetCalculatorModule = require(parent.util.AssetCalculator)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local _ = require(parent.util.Types)
local getFStringUGCValidateBoundsInflationThresholdModule = require(parent.flags.getFStringUGCValidateBoundsInflationThreshold)

local function _(p0, p1) --[[ line: 30 | named "calculateExtentsUnion" ]]
	return { min = p0.min:Min(p1.min), max = p0.max:Max(p1.max) }
end

local function checkExtentsValid(p2) --[[ line: 37 ]]
	for i, v in { "X", "Y", "Z" } do
		if p2.max[v] < p2.min[v] then
			return false
		end
	end
	return true
end

local _ = function(p3, p4, p5, p6, p7) --[[ line: 46 | named "validationSpaceToWorldSpace" ]]
	return p6 * (p4:Inverse() * p3 / p5 * p7)
end

local function calculateAmountInflated(p8, p9) --[[ line: 59 ]]
	local t = { min = p8.min:Min(p9.min), max = p8.max:Max(p9.max) }
	t = 0
	
	for i, v in { "X", "Y", "Z" } do
		t = math.max(t, math.abs(math.abs(t.max[v] - t.min[v]) - math.abs(p8.max[v] - p8.min[v])))
	end
	return t
end

local function getPartNamesInAsset(value, p10) --[[ line: 76 ]]
	local t = {}
	
	if p10 == Enum.AssetType.DynamicHead then
		table.insert(t, value.Name)
		
		return t
	end
	for i, v in value:GetChildren() do
		if v:IsA("MeshPart") then
			table.insert(t, v.Name)
		end
	end
	return t
end

local function calculateMeshScales(p11, p12, p13) --[[ line: 92 ]]
	-- upvalues: getExpectedPartSizeModule (ref)
	local t = {}
	
	for i, v in p11 do
		local var17 = p13(v)
		t[v] = getExpectedPartSizeModule(var17, p12) / getExpectedPartSizeModule(var17, p12, true)
	end
	return t
end

local function checkInflatingGeo(p14, p15, p16, p17, p18, p19) --[[ line: 108 ]]
	-- upvalues: calculateAmountInflated (ref), getFStringUGCValidateBoundsInflationThresholdModule (ref)
	local t = {}
	
	for i, v in p15 do
		table.insert(t, {
			extents = v.extents,
			inflated = calculateAmountInflated(p14, v.extents),
			worldSpacePosition = v.worldSpacePosition
		})
	end
	table.sort(t, function(p20, p21) --[[ line: 125 ]]
		return p21.inflated < p20.inflated
	end)
	local var19 = tonumber(getFStringUGCValidateBoundsInflationThresholdModule())
	local t_1 = {}
	local var21 = 1
	while var21 <= #t and (var19 < t[var21].inflated and #t_1 < p16) do
		table.insert(t_1, t[var21])
		var21 += 1
	end
	if #t_1 > 0 then
		local var22 = ""
		
		for i_1 = 1, #t_1 do
			if i_1 > 1 then
				var22 = if i_1 == #t_1 then var22 .. ", and " else var22 .. ", "
			end
			local worldSpacePosition = t_1[i_1].worldSpacePosition
			var22 ..= string.format("{%.4f, %.4f, %.4f}", worldSpacePosition.X, worldSpacePosition.Y, worldSpacePosition.Z)
		end
		p19:updateReasons(false, {
			string.format("Detected %s centered around: %s that increases %s bounding box. Remove the geometry or increase its size so that it is more visible", p17, var22, p18.Name)
		})
	end
end

local function getWorldPositions(p22, p23, p24, p25, p26, p27) --[[ line: 167 ]]
	local t = {}
	
	for i, v in p26 do
		local var24 = p27(v)
		local cFrame = var24.CFrame
		local var25 = var24.Size / var24.MeshSize
		
		for i_1, v_1 in p22[v][p25] do
			table.insert(t, {
				extents = v_1,
				worldSpacePosition = cFrame * (p23[v]:Inverse() * ((v_1.min + v_1.max) / 2) / p24[v] * var25)
			})
		end
	end
	return t
end

return function(p28, p29) --[[ line: 202 | named "validateAccurateBoundingBox" ]]
	-- upvalues: getPartNamesInAsset (ref), assetCalculatorModule (ref), calculateMeshScales (ref), getEditableMeshFromContextModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), checkExtentsValid (ref), getWorldPositions (ref), failureReasonsAccumulatorModule (ref), checkInflatingGeo (ref), analyticsModule (ref)
	local assetTypeEnum = p29.assetTypeEnum
	assert(assetTypeEnum)
	local var26 = getPartNamesInAsset(p28, assetTypeEnum)
	local var27 = assetCalculatorModule.calculateAllTransformsForAsset(assetTypeEnum, p28)
	
	local function findMeshHandle(p30) --[[ line: 213 ]]
		-- upvalues: assetTypeEnum (ref), p28 (ref)
		return if assetTypeEnum == Enum.AssetType.DynamicHead then p28 else p28:FindFirstChild(p30)
	end
	
	if assetTypeEnum ~= Enum.AssetType.DynamicHead and assetTypeEnum ~= Enum.AssetType.Torso then
		for i, v in assetCalculatorModule.calculateStraightenedLimb(assetTypeEnum, var27, findMeshHandle) do
			var27[i] = v
		end
	end
	local var29 = calculateMeshScales(var26, p29, findMeshHandle)
	local t = {}
	
	for i, v in var26 do
		local var41 = if assetTypeEnum == Enum.AssetType.DynamicHead then p28 else p28:FindFirstChild(v)
		i_1, var42 = getEditableMeshFromContextModule(var41, "MeshId", p29)
		
		if i_1 then
			t[v] = var42
			continue
		end
		return false, {
			string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", var41.Name)
		}
	end
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i_1, v_1 in var26 do
		table.insert(t_1, t[v_1])
		table.insert(t_2, var27[v_1])
		table.insert(t_3, var29[v_1])
	end
	local var34, var35 = pcallDeferredModule(function() --[[ line: 254 ]]
		-- upvalues: UGCValidationService (copy), t_1 (ref), t_2 (ref), t_3 (ref)
		return UGCValidationService:GetBoundingBoxManipulationData(t_1, t_2, t_3)
	end, p29)
	
	if not var34 then
		local formattedText = string.format("Could not get bounding box manipulation metrics for %s", assetTypeEnum.Name)
		
		if p29.isServer then
			error(formattedText)
		else
			return false, { formattedText }
		end
	end
	local t_4 = { min = var35.minValidExtents, max = var35.maxValidExtents }
	
	if not checkExtentsValid(t_4) then
		return false, {
			string.format("%s mesh is too small or made of disconnected pieces that are too small", assetTypeEnum.Name)
		}
	end
	i_1 = {}
	
	for i_2, v_2 in var35.partsProblemGeos do
		i_1[var26[i_2]] = v_2
	end
	local var38 = getWorldPositions(i_1, var27, var29, "smallIslands", var26, findMeshHandle)
	local var39 = getWorldPositions(i_1, var27, var29, "skinnyTris", var26, findMeshHandle)
	local var40 = failureReasonsAccumulatorModule.new()
	checkInflatingGeo(t_4, var38, 3, "small geometry", assetTypeEnum, var40)
	checkInflatingGeo(t_4, var39, 3, "skinny triangle(s)", assetTypeEnum, var40)
	
	if not var40:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateAccurateBoundingBox, nil, p29)
	end
	return var40:getFinalResults()
end