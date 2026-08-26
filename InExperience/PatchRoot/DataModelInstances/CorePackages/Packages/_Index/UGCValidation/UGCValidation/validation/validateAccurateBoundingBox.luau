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

local function _(p1, p2)
	return { min = p1.min:Min(p2.min), max = p1.max:Max(p2.max) }
end

local function checkExtentsValid(p1)
	for i, v in { "X", "Y", "Z" } do
		if p1.max[v] < p1.min[v] then
			return false
		end
	end
	return true
end

local _ = function(p2, p3, p4, p5, p6)
	return p5 * (p3:Inverse() * p2 / p4 * p6)
end

local function calculateAmountInflated(p2, p3)
	local t = { min = p2.min:Min(p3.min), max = p2.max:Max(p3.max) }
	t = 0
	
	for i, v in { "X", "Y", "Z" } do
		t = math.max(t, math.abs(math.abs(t.max[v] - t.min[v]) - math.abs(p2.max[v] - p2.min[v])))
	end
	return t
end

local function getPartNamesInAsset(value, p4)
	local t = {}
	
	if p4 == Enum.AssetType.DynamicHead then
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

local function calculateMeshScales(p5, p6, p7)
	-- upvalues: getExpectedPartSizeModule (ref)
	local t = {}
	
	for i, v in p5 do
		local var1 = p7(v)
		t[v] = getExpectedPartSizeModule(var1, p6) / getExpectedPartSizeModule(var1, p6, true)
	end
	return t
end

local function checkInflatingGeo(p8, p9, p10, p11, p12, p13)
	-- upvalues: calculateAmountInflated (ref), getFStringUGCValidateBoundsInflationThresholdModule (ref)
	local t = {}
	
	for i, v in p9 do
		table.insert(t, {
			extents = v.extents,
			inflated = calculateAmountInflated(p8, v.extents),
			worldSpacePosition = v.worldSpacePosition
		})
	end
	table.sort(t, function(p14, p15)
		return p15.inflated < p14.inflated
	end)
	local var2 = tonumber(getFStringUGCValidateBoundsInflationThresholdModule())
	local t_1 = {}
	local var3 = 1
	while var3 <= #t and (var2 < t[var3].inflated and #t_1 < p10) do
		table.insert(t_1, t[var3])
		var3 += 1
	end
	if #t_1 > 0 then
		local var4 = ""
		
		for i_1 = 1, #t_1 do
			if i_1 > 1 then
				var4 = if i_1 == #t_1 then var4 .. ", and " else var4 .. ", "
			end
			local worldSpacePosition = t_1[i_1].worldSpacePosition
			var4 ..= string.format("{%.4f, %.4f, %.4f}", worldSpacePosition.X, worldSpacePosition.Y, worldSpacePosition.Z)
		end
		p13:updateReasons(false, {
			string.format("Detected %s centered around: %s that increases %s bounding box. Remove the geometry or increase its size so that it is more visible", p11, var4, p12.Name)
		})
	end
end

local function getWorldPositions(p14, p15, p16, p17, p18, p19)
	local t = {}
	
	for i, v in p18 do
		local var5 = p19(v)
		local cFrame = var5.CFrame
		local var6 = var5.Size / var5.MeshSize
		
		for i_1, v_1 in p14[v][p17] do
			table.insert(t, {
				extents = v_1,
				worldSpacePosition = cFrame * (p15[v]:Inverse() * ((v_1.min + v_1.max) / 2) / p16[v] * var6)
			})
		end
	end
	return t
end

return function(p20, p21)
	-- upvalues: getPartNamesInAsset (ref), assetCalculatorModule (ref), calculateMeshScales (ref), getEditableMeshFromContextModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), checkExtentsValid (ref), getWorldPositions (ref), failureReasonsAccumulatorModule (ref), checkInflatingGeo (ref), analyticsModule (ref)
	local assetTypeEnum = p21.assetTypeEnum
	assert(assetTypeEnum)
	local var7 = getPartNamesInAsset(p20, assetTypeEnum)
	local var8 = assetCalculatorModule.calculateAllTransformsForAsset(assetTypeEnum, p20)
	
	local function findMeshHandle(p22)
		-- upvalues: assetTypeEnum (ref), p20 (ref)
		return if assetTypeEnum == Enum.AssetType.DynamicHead then p20 else p20:FindFirstChild(p22)
	end
	
	if assetTypeEnum ~= Enum.AssetType.DynamicHead and assetTypeEnum ~= Enum.AssetType.Torso then
		for i, v in assetCalculatorModule.calculateStraightenedLimb(assetTypeEnum, var8, findMeshHandle) do
			var8[i] = v
		end
	end
	local var9 = calculateMeshScales(var7, p21, findMeshHandle)
	local t = {}
	
	for i, v in var7 do
		local var10 = if assetTypeEnum == Enum.AssetType.DynamicHead then p20 else p20:FindFirstChild(v)
		i_1, var42 = getEditableMeshFromContextModule(var10, "MeshId", p21)
		
		if i_1 then
			t[v] = var42
			continue
		end
		return false, {
			string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", var10.Name)
		}
	end
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i_1, v_1 in var7 do
		table.insert(t_1, t[v_1])
		table.insert(t_2, var8[v_1])
		table.insert(t_3, var9[v_1])
	end
	local var11, var12 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), t_1 (ref), t_2 (ref), t_3 (ref)
		return UGCValidationService:GetBoundingBoxManipulationData(t_1, t_2, t_3)
	end, p21)
	
	if not var11 then
		local formattedText = string.format("Could not get bounding box manipulation metrics for %s", assetTypeEnum.Name)
		
		if p21.isServer then
			error(formattedText)
		else
			return false, { formattedText }
		end
	end
	local t_4 = { min = var12.minValidExtents, max = var12.maxValidExtents }
	
	if not checkExtentsValid(t_4) then
		return false, {
			string.format("%s mesh is too small or made of disconnected pieces that are too small", assetTypeEnum.Name)
		}
	end
	i_1 = {}
	
	for i_2, v_2 in var12.partsProblemGeos do
		i_1[var7[i_2]] = v_2
	end
	local var13 = getWorldPositions(i_1, var8, var9, "smallIslands", var7, findMeshHandle)
	local var14 = getWorldPositions(i_1, var8, var9, "skinnyTris", var7, findMeshHandle)
	local var15 = failureReasonsAccumulatorModule.new()
	checkInflatingGeo(t_4, var13, 3, "small geometry", assetTypeEnum, var15)
	checkInflatingGeo(t_4, var14, 3, "skinny triangle(s)", assetTypeEnum, var15)
	
	if not var15:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateAccurateBoundingBox, nil, p21)
	end
	return var15:getFinalResults()
end