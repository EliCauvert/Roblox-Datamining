local assetService = game:GetService("AssetService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local bodyAssetMasksRendererModule = require(parent.util.bodyAssetMasksRenderer)
local nelderMeadModule = require(parent.util.nelderMead)
local summedAreaTableModule = require(parent.util.SummedAreaTable)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local assetCalculatorModule = require(parent.util.AssetCalculator)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getMeshVertsModule = require(parent.util.getMeshVerts)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local _ = require(parent.util.Types)
local floatVectorModule = require(parent.util.FloatVector)
local extentsModule = require(parent.util.Extents)
local tryYieldModule = require(parent.util.tryYield)
local validateAccurateBoundingBoxFlagsModule = require(parent.flags.validateAccurateBoundingBoxFlags)
local getFFlagUGCValidateTinyTrianglesIntersectFixModule = require(parent.flags.getFFlagUGCValidateTinyTrianglesIntersectFix)

local function _(p1)
	-- upvalues: getAttachmentCFrameInPartSpaceModule (ref)
	local neckRigAttachment = p1:FindFirstChild("NeckRigAttachment", true)
	
	return if neckRigAttachment then getAttachmentCFrameInPartSpaceModule(neckRigAttachment).Position / (p1.Size / p1.MeshSize) else nil
end

local function projectMeshLocalPointToImageRow(p1, p2)
	local viewSpaceBounds = p2.viewSpaceBounds
	
	return (((p2.view:Inverse() * p1).Y - (viewSpaceBounds.max.Y + viewSpaceBounds.min.Y) / 2) / ((viewSpaceBounds.max.Y - viewSpaceBounds.min.Y) / 2) * -0.5 + 0.5) * (p2.mask.Size.Y - 1)
end

local function cloneMaskZeroedBelowRow(p1, p2)
	-- upvalues: assetService (ref)
	local size = p1.Size
	local x = size.X
	local y = size.Y
	local zero = p1:ReadPixelsBuffer(Vector2.zero, size)
	local maxValue = math.max(0, math.min(y, math.floor(p2) + 1))
	
	if maxValue < y then
		buffer.fill(zero, maxValue * x * 4, 0, (y - maxValue) * x * 4)
	end
	local var1 = assetService:CreateEditableImage({ Size = size })
	var1:WritePixelsBuffer(Vector2.zero, size, zero)
	
	return var1
end

local _ = function(p1, p2, p3, p4, p5)
	local var1 = Vector2.new(p2, p4) * p1.size
	
	return p1:GetAreaDensityContinuous(var1, Vector2.new(p3, p5) * p1.size - var1)
end

local function shrinkBounds(p1, p2, p3)
	-- upvalues: floatVectorModule (ref)
	local _ = function(p4)
		return if p4 % 2 == 0 then p4 - 1 else p4 + 1
	end
	
	for i = 1, 4 do
		local var1 = p1[if i % 2 == 0 then i - 1 else i + 1]
		local var2 = 1 / p3[if i < 3 then "X" else "Y"]
		local var3 = floatVectorModule.new(p1)
		local var4 = p2(p1)
		local var5 = p1[i]
	end
end

local function createSimplex(p4, p5)
	-- upvalues: floatVectorModule (ref)
	local t = {}
	table.insert(t, p4)
	table.insert(t, p4 + floatVectorModule.new(p5, 0, 0, 0))
	table.insert(t, p4 + floatVectorModule.new(0, p5, 0, 0))
	table.insert(t, p4 + floatVectorModule.new(0, 0, p5, 0))
	table.insert(t, p4 + floatVectorModule.new(0, 0, 0, p5))
	
	return t
end

local function calculateMinimumBoundsForView(a, b)
	-- upvalues: floatVectorModule (ref), createSimplex (ref), summedAreaTableModule (ref), validateAccurateBoundingBoxFlagsModule (ref), nelderMeadModule (ref), tryYieldModule (ref), shrinkBounds (ref)
	local var6 = createSimplex(floatVectorModule.new(0, 1, 0, 1), 0.9)
	local mask = a.mask
	local size = mask.Size
	local var7 = summedAreaTableModule.new(size, function(p4)
		return if p4.R > 0 or p4.G > 0 or p4.B > 0 then 1 else 0
	end)
	var7:BuildSummedAreaTable(mask)
	local zeroAreaDensity = var7:GetAreaDensity(Vector2.zero, size)
	
	if zeroAreaDensity <= 0 then
		return false, {
			string.format("%s asset not visible from the %s, cannot determine quality of asset bounding box", b.assetTypeEnum.Name, a.viewId)
		}
	end
	local var8 = validateAccurateBoundingBoxFlagsModule.targetPercentage()
	local var9 = validateAccurateBoundingBoxFlagsModule.percentageWeight()
	
	local var10 = function(p4)
		-- upvalues: var7 (ref), zeroAreaDensity (ref), var8 (ref), var9 (ref)
		assert(p4:getSize() == 4)
		local var11 = 0
		
		if p4[1] <= p4[2] and p4[3] <= p4[4] then
			local var12 = var7
			local var13 = Vector2.new(p4[1], p4[3]) * var12.size
			var11 = var12:GetAreaDensityContinuous(var13, Vector2.new(p4[2], p4[4]) * var12.size - var13)
		end
		local vector2 = Vector2.new(p4[2] - p4[1], p4[4] - p4[3])
		
		return math.abs(var11 / zeroAreaDensity * 100 - var8) * var9 + (vector2.X + vector2.Y)
	end
	
	local var11 = validateAccurateBoundingBoxFlagsModule.maxIterations()
	local var12 = Vector2.new(1 / size.X, 1 / size.Y).Magnitude * validateAccurateBoundingBoxFlagsModule.convergedLength()
	local var13 = nelderMeadModule.new(var6, var10, function(p4, p5)
		-- upvalues: var11 (ref), nelderMeadModule (copy), var12 (ref), tryYieldModule (copy), b (ref)
		if var11 <= p5 then
			return true
		elseif nelderMeadModule.calculateMaxLengthBetweenVertices(p4) <= var12 then
			return true
		end
		tryYieldModule(b)
		
		return false
	end)
	var13:evaluate()
	local var14 = var13.simplex[1]
	shrinkBounds(var14, var10, size)
	
	return true, floatVectorModule.new(math.clamp(var14[1], 0, 1), math.clamp(var14[2], 0, 1), math.clamp(var14[3], 0, 1), math.clamp(var14[4], 0, 1))
end

local _ = function(p4, p5)
	return if p5:FuzzyEq(p4.XVector:Abs()) then true else p5:FuzzyEq(p4.YVector:Abs())
end

local function alignedExtentsFromReprojectedPoint(p4, p5)
	-- upvalues: extentsModule (ref)
	local t = { X = -1e999, Y = -1e999, Z = -1e999 }
	local t_1 = { X = 1e999, Y = 1e999, Z = 1e999 }
	
	if if (Vector3.new(1, 0, 0)):FuzzyEq(p5.XVector:Abs()) then true elseif (Vector3.new(1, 0, 0)):FuzzyEq(p5.YVector:Abs()) then true else false then
		t.X = math.max(t.X, p4.X)
		t_1.X = math.min(t_1.X, p4.X)
	end
	if if (Vector3.new(0, 1, 0)):FuzzyEq(p5.XVector:Abs()) then true elseif (Vector3.new(0, 1, 0)):FuzzyEq(p5.YVector:Abs()) then true else false then
		t.Y = math.max(t.Y, p4.Y)
		t_1.Y = math.min(t_1.Y, p4.Y)
	end
	if if (Vector3.new(0, 0, 1)):FuzzyEq(p5.XVector:Abs()) then true elseif (Vector3.new(0, 0, 1)):FuzzyEq(p5.YVector:Abs()) then true else false then
		t.Z = math.max(t.Z, p4.Z)
		t_1.Z = math.min(t_1.Z, p4.Z)
	end
	return extentsModule.fromMinMax(Vector3.new(t_1.X, t_1.Y, t_1.Z), Vector3.new(t.X, t.Y, t.Z))
end

local function calculateValidBounds(p4, p5)
	-- upvalues: extentsModule (ref), getFFlagUGCValidateTinyTrianglesIntersectFixModule (ref), calculateMinimumBoundsForView (ref), bodyAssetMasksRendererModule (ref), alignedExtentsFromReprojectedPoint (ref)
	local var6 = extentsModule.new()
	local var7 = if getFFlagUGCValidateTinyTrianglesIntersectFixModule() then {} else nil
	
	for i, v in p4 do
		local _ = nil
		local var8, var9 = calculateMinimumBoundsForView(v, p5)
		
		if var8 then
			local var10 = var9
			local var11 = alignedExtentsFromReprojectedPoint(v.view * bodyAssetMasksRendererModule.getViewSpacePositionFromNormalized(Vector2.new(var10[2], var10[3]), v.viewSpaceBounds), v.view)
			local var12 = alignedExtentsFromReprojectedPoint(v.view * bodyAssetMasksRendererModule.getViewSpacePositionFromNormalized(Vector2.new(var10[1], var10[4]), v.viewSpaceBounds), v.view)
			
			if getFFlagUGCValidateTinyTrianglesIntersectFixModule() then
				local var13 = extentsModule.new():unionExtents(var11):unionExtents(var12)
				local var14 = bodyAssetMasksRendererModule.opposingViewIds[i]
				
				if var7[var14] then
					var7[var14] = var13:intersectExtents(var7[var14])
				else
					var7[i] = var13
				end
			else
				var6 = var6:unionExtents(var11):unionExtents(var12)
			end
		end
		return false, var9
	end
	if getFFlagUGCValidateTinyTrianglesIntersectFixModule() then
		for i_1, v_1 in var7 do
			var6 = var6:unionExtents(v_1)
		end
		assert(var6:isValid())
	end
	return true, var6
end

local _ = function(p6, p7)
	return p7.CFrame * (p6 * (p7.Size / p7.MeshSize))
end

local function getHighestInflatingPointInEachAxis(p6, p7, p8, p9, p10)
	-- upvalues: getMeshVertsModule (ref)
	local t = {
		X = {
			positive = { inflationScale = 0, furthestPointWorldSpace = nil },
			negative = { inflationScale = 0, furthestPointWorldSpace = nil }
		},
		Y = {
			positive = { inflationScale = 0, furthestPointWorldSpace = nil },
			negative = { inflationScale = 0, furthestPointWorldSpace = nil }
		},
		Z = {
			positive = { inflationScale = 0, furthestPointWorldSpace = nil },
			negative = { inflationScale = 0, furthestPointWorldSpace = nil }
		}
	}
	local var15 = p6:size()
	
	for i, v in p8 do
		local var16, var17, var18 = getMeshVertsModule({ editableMesh = v, fullName = i }, p10)
		
		if var16 then
			local var19 = p7[i]
			
			for i_1, v_1 in var18 do
				local var20 = var19.CFrame * (v_1 * var19.scale)
				local var21 = p9(i)
				local var22 = var21.CFrame * (v_1 * (var21.Size / var21.MeshSize))
				local var23 = (var20 - p6.max) / var15
				local var24 = (p6.min - var20) / var15
				
				for i_2, v_2 in { "X", "Y", "Z" } do
					local var25 = t[v_2]
					local positive = var25.positive
					local var26 = var23[v_2]
					
					if positive.inflationScale < var26 then
						positive.furthestPointWorldSpace = var22
						positive.inflationScale = var26
					end
					local negative = var25.negative
					local var27 = var24[v_2]
					
					if negative.inflationScale < var27 then
						negative.furthestPointWorldSpace = var22
						negative.inflationScale = var27
					end
				end
			end
		end
		return false, var17
	end
	return true, t
end

local function getBodyPartAssetEditableMeshes(value, p11)
	-- upvalues: getEditableMeshFromContextModule (ref)
	local t = {}
	
	if value:IsA("MeshPart") and p11.assetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(t, value)
	else
		for i, v in value:GetChildren() do
			if v:IsA("MeshPart") then
				table.insert(t, v)
			end
		end
	end
	local t_1 = {}
	
	for i, v in t do
		local var28, var29 = getEditableMeshFromContextModule(v, "MeshId", p11)
		
		if not var28 then
			local formattedText = string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v.Name)
			
			if p11.isServer then
				error(formattedText)
			end
			return false, { formattedText }
		end
		t_1[v.Name] = var29
	end
	return true, t_1
end

local function tryReportInflationError(p12, p13)
	-- upvalues: failureReasonsAccumulatorModule (ref), validateAccurateBoundingBoxFlagsModule (ref)
	local var30 = failureReasonsAccumulatorModule.new()
	local var31 = validateAccurateBoundingBoxFlagsModule.AssetTypeToAxisThresholds[p13]
	
	for i, v in { "X", "Y", "Z" } do
		local var32 = p12[v]
		local var33 = var32.negative.inflationScale + var32.positive.inflationScale
		local var34 = var31[v]
		
		if var34 < var33 then
			local t = {}
			
			if var34 * 0.2 < var32.positive.inflationScale then
				table.insert(t, var32.positive.furthestPointWorldSpace)
			end
			if var34 * 0.2 < var32.negative.inflationScale then
				table.insert(t, var32.negative.furthestPointWorldSpace)
			end
			local var35 = ""
			
			if #t > 0 then
				var35 = " near " .. string.format("{%.4f, %.4f, %.4f}", t[1].X, t[1].Y, t[1].Z)
				
				if #t > 1 then
					var35 ..= string.format(", and {%.4f, %.4f, %.4f}", t[2].X, t[2].Y, t[2].Z)
				end
			end
			var30:updateReasons(false, {
				string.format("Detected low visibility geometry%s that increases %s bounding box size by %.2f%% (threshold is %.2f%%) in the %s axis. Remove the geometry or increase its size so that it is more visible", var35, p13.Name, var33 * 100, var34 * 100, v)
			})
		end
	end
	return var30
end

local t = {}
local var36 = nil

function t.getBoundsViewsForAssetType(value)
	-- upvalues: var36 (write), bodyAssetMasksRendererModule (ref)
	if not var36 then
		local _ = function()
			-- upvalues: bodyAssetMasksRendererModule (copy)
			local t = {}
			
			for i, v in bodyAssetMasksRendererModule.viewIds do
				t[v] = true
			end
			return t
		end
		
		local t = {}
		
		for i, v in bodyAssetMasksRendererModule.viewIds do
			t[v] = true
		end
		local var37 = t
		var37[bodyAssetMasksRendererModule.viewIds.Left] = false
		var37[bodyAssetMasksRendererModule.viewIds.Bottom] = false
		local t_1 = {}
		
		for i_1, v_1 in bodyAssetMasksRendererModule.viewIds do
			t_1[v_1] = true
		end
		local var38 = t_1
		var38[bodyAssetMasksRendererModule.viewIds.Right] = false
		var38[bodyAssetMasksRendererModule.viewIds.Bottom] = false
		local t_2 = {}
		
		for i_2, v_2 in bodyAssetMasksRendererModule.viewIds do
			t_2[v_2] = true
		end
		local var39 = t_2
		var39[bodyAssetMasksRendererModule.viewIds.Left] = false
		var39[bodyAssetMasksRendererModule.viewIds.Bottom] = false
		local t_3 = {}
		
		for i_3, v_3 in bodyAssetMasksRendererModule.viewIds do
			t_3[v_3] = true
		end
		local var40 = t_3
		var40[bodyAssetMasksRendererModule.viewIds.Right] = false
		var40[bodyAssetMasksRendererModule.viewIds.Bottom] = false
		var36 = {
			[Enum.AssetType.DynamicHead] = nil,
			[Enum.AssetType.Torso] = nil,
			[Enum.AssetType.LeftArm] = var37,
			[Enum.AssetType.RightArm] = var38,
			[Enum.AssetType.LeftLeg] = var39,
			[Enum.AssetType.RightLeg] = var40
		}
	end
	return var36[value]
end

function t.validate(p14, p15, p16)
	-- upvalues: t (ref), validateAccurateBoundingBoxFlagsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), bodyAssetMasksRendererModule (ref), projectMeshLocalPointToImageRow (ref), cloneMaskZeroedBelowRow (ref), calculateValidBounds (ref), assetCalculatorModule (ref), getBodyPartAssetEditableMeshes (ref), getHighestInflatingPointInEachAxis (ref), tryReportInflationError (ref), analyticsModule (ref)
	local assetTypeEnum = p16.assetTypeEnum
	assert(assetTypeEnum)
	
	local function findMeshHandle(p17)
		-- upvalues: assetTypeEnum (ref), p14 (ref)
		return if assetTypeEnum == Enum.AssetType.DynamicHead then p14 else p14:FindFirstChild(p17)
	end
	
	local boundsViewsForAssetType = t.getBoundsViewsForAssetType(assetTypeEnum)
	local t_1 = {}
	
	if boundsViewsForAssetType then
		for i, v in boundsViewsForAssetType do
			if v then
				assert(p15.bodyAssetMasks[i])
				t_1[i] = p15.bodyAssetMasks[i]
			end
		end
	else
		t_1 = p15.bodyAssetMasks
	end
	local t_2 = {}
	
	if assetTypeEnum == Enum.AssetType.DynamicHead and validateAccurateBoundingBoxFlagsModule.neckAttachmentCrop() then
		local neckRigAttachment = p14:FindFirstChild("NeckRigAttachment", true)
		local var41 = if not neckRigAttachment then nil else getAttachmentCFrameInPartSpaceModule(neckRigAttachment).Position / (p14.Size / p14.MeshSize)
		
		if var41 then
			local var42 = validateAccurateBoundingBoxFlagsModule.neckAttachmentCropMargin()
			local t_3 = {}
			
			for i, v in t_1 do
				if i ~= bodyAssetMasksRendererModule.viewIds.Top and i ~= bodyAssetMasksRendererModule.viewIds.Bottom then
					local mask = v.mask
					local var43 = cloneMaskZeroedBelowRow(mask, projectMeshLocalPointToImageRow(var41, v) + var42 * (mask.Size.Y - 1) / 2)
					table.insert(t_2, var43)
					t_3[i] = {
						mask = var43,
						view = v.view,
						viewSpaceBounds = v.viewSpaceBounds,
						viewId = v.viewId
					}
				else
					t_3[i] = v
				end
			end
			t_1 = t_3
		end
	end
	local var44, var45 = (function()
		-- upvalues: calculateValidBounds (copy), t_1 (write), p16 (ref), assetCalculatorModule (copy), p14 (ref), getBodyPartAssetEditableMeshes (copy), getHighestInflatingPointInEachAxis (copy), findMeshHandle (ref), tryReportInflationError (copy), assetTypeEnum (ref), analyticsModule (copy)
		local _ = nil
		local var46, var47 = calculateValidBounds(t_1, p16)
		
		if not var46 then
			return false, var47
		end
		local assetMeshesValidationSpaceTransforms = assetCalculatorModule.getAssetMeshesValidationSpaceTransforms(p14, p16)
		local _ = nil
		local var48, var49 = getBodyPartAssetEditableMeshes(p14, p16)
		
		if not var48 then
			return false, var49
		end
		var116, var115 = getHighestInflatingPointInEachAxis(var47, assetMeshesValidationSpaceTransforms, var49, findMeshHandle, p16)
		
		if not var116 then
			return false, var49
		end
		var49 = tryReportInflationError(var49, assetTypeEnum)
		
		if not var49:getFinalResults() then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateAccurateBoundingBox, nil, p16)
		end
		return var49:getFinalResults()
	end)()
	
	for i, v in t_2 do
		v:Destroy()
	end
	return var44, var45
end

return t