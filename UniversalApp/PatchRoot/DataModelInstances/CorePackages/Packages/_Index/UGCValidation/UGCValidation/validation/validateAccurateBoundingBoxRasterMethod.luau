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

local function _(p0)
	-- upvalues: getAttachmentCFrameInPartSpaceModule (ref)
	local neckRigAttachment = p0:FindFirstChild("NeckRigAttachment", true)
	
	return if neckRigAttachment then getAttachmentCFrameInPartSpaceModule(neckRigAttachment).Position / (p0.Size / p0.MeshSize) else nil
end

local function projectMeshLocalPointToImageRow(p1, p2)
	local viewSpaceBounds = p2.viewSpaceBounds
	
	return (((p2.view:Inverse() * p1).Y - (viewSpaceBounds.max.Y + viewSpaceBounds.min.Y) / 2) / ((viewSpaceBounds.max.Y - viewSpaceBounds.min.Y) / 2) * -0.5 + 0.5) * (p2.mask.Size.Y - 1)
end

local function cloneMaskZeroedBelowRow(p3, p4)
	-- upvalues: assetService (ref)
	local size = p3.Size
	local x = size.X
	local y = size.Y
	local zero = p3:ReadPixelsBuffer(Vector2.zero, size)
	local maxValue = math.max(0, math.min(y, math.floor(p4) + 1))
	
	if maxValue < y then
		buffer.fill(zero, maxValue * x * 4, 0, (y - maxValue) * x * 4)
	end
	local var30 = assetService:CreateEditableImage({ Size = size })
	var30:WritePixelsBuffer(Vector2.zero, size, zero)
	
	return var30
end

local _ = function(p5, p6, p7, p8, p9)
	local var31 = Vector2.new(p6, p8) * p5.size
	
	return p5:GetAreaDensityContinuous(var31, Vector2.new(p7, p9) * p5.size - var31)
end

local function shrinkBounds(p10, p11, p12)
	-- upvalues: floatVectorModule (ref)
	local _ = function(p13)
		return if p13 % 2 == 0 then p13 - 1 else p13 + 1
	end
	
	for i = 1, 4 do
		local var32 = p10[if i % 2 == 0 then i - 1 else i + 1]
		local var33 = 1 / p12[if i < 3 then "X" else "Y"]
		local var34 = floatVectorModule.new(p10)
		local var35 = p11(p10)
		local var36 = p10[i]
	end
end

local function createSimplex(p14, p15)
	-- upvalues: floatVectorModule (ref)
	local t = {}
	table.insert(t, p14)
	table.insert(t, p14 + floatVectorModule.new(p15, 0, 0, 0))
	table.insert(t, p14 + floatVectorModule.new(0, p15, 0, 0))
	table.insert(t, p14 + floatVectorModule.new(0, 0, p15, 0))
	table.insert(t, p14 + floatVectorModule.new(0, 0, 0, p15))
	
	return t
end

local function calculateMinimumBoundsForView(a, b)
	-- upvalues: floatVectorModule (ref), createSimplex (ref), summedAreaTableModule (ref), validateAccurateBoundingBoxFlagsModule (ref), nelderMeadModule (ref), tryYieldModule (ref), shrinkBounds (ref)
	local var40 = createSimplex(floatVectorModule.new(0, 1, 0, 1), 0.9)
	local mask = a.mask
	local size = mask.Size
	local var41 = summedAreaTableModule.new(size, function(p16)
		return if p16.R > 0 or p16.G > 0 or p16.B > 0 then 1 else 0
	end)
	var41:BuildSummedAreaTable(mask)
	local zeroAreaDensity = var41:GetAreaDensity(Vector2.zero, size)
	
	if zeroAreaDensity <= 0 then
		return false, {
			string.format("%s asset not visible from the %s, cannot determine quality of asset bounding box", b.assetTypeEnum.Name, a.viewId)
		}
	end
	local var43 = validateAccurateBoundingBoxFlagsModule.targetPercentage()
	local var44 = validateAccurateBoundingBoxFlagsModule.percentageWeight()
	
	local var45 = function(p17)
		-- upvalues: var41 (ref), zeroAreaDensity (ref), var43 (ref), var44 (ref)
		assert(p17:getSize() == 4)
		local var50 = 0
		
		if p17[1] <= p17[2] and p17[3] <= p17[4] then
			local var51 = var41
			local var52 = Vector2.new(p17[1], p17[3]) * var51.size
			var50 = var51:GetAreaDensityContinuous(var52, Vector2.new(p17[2], p17[4]) * var51.size - var52)
		end
		local vector2 = Vector2.new(p17[2] - p17[1], p17[4] - p17[3])
		
		return math.abs(var50 / zeroAreaDensity * 100 - var43) * var44 + (vector2.X + vector2.Y)
	end
	
	local var46 = validateAccurateBoundingBoxFlagsModule.maxIterations()
	local var47 = Vector2.new(1 / size.X, 1 / size.Y).Magnitude * validateAccurateBoundingBoxFlagsModule.convergedLength()
	local var48 = nelderMeadModule.new(var40, var45, function(p18, p19)
		-- upvalues: var46 (ref), nelderMeadModule (copy), var47 (ref), tryYieldModule (copy), b (ref)
		if var46 <= p19 then
			return true
		elseif nelderMeadModule.calculateMaxLengthBetweenVertices(p18) <= var47 then
			return true
		end
		tryYieldModule(b)
		
		return false
	end)
	var48:evaluate()
	local var49 = var48.simplex[1]
	shrinkBounds(var49, var45, size)
	
	return true, floatVectorModule.new(math.clamp(var49[1], 0, 1), math.clamp(var49[2], 0, 1), math.clamp(var49[3], 0, 1), math.clamp(var49[4], 0, 1))
end

local _ = function(p20, p21)
	return if p21:FuzzyEq(p20.XVector:Abs()) then true else p21:FuzzyEq(p20.YVector:Abs())
end

local function alignedExtentsFromReprojectedPoint(p22, p23)
	-- upvalues: extentsModule (ref)
	local t = { X = -1e999, Y = -1e999, Z = -1e999 }
	local t_1 = { X = 1e999, Y = 1e999, Z = 1e999 }
	
	if if (Vector3.new(1, 0, 0)):FuzzyEq(p23.XVector:Abs()) then true elseif (Vector3.new(1, 0, 0)):FuzzyEq(p23.YVector:Abs()) then true else false then
		t.X = math.max(t.X, p22.X)
		t_1.X = math.min(t_1.X, p22.X)
	end
	if if (Vector3.new(0, 1, 0)):FuzzyEq(p23.XVector:Abs()) then true elseif (Vector3.new(0, 1, 0)):FuzzyEq(p23.YVector:Abs()) then true else false then
		t.Y = math.max(t.Y, p22.Y)
		t_1.Y = math.min(t_1.Y, p22.Y)
	end
	if if (Vector3.new(0, 0, 1)):FuzzyEq(p23.XVector:Abs()) then true elseif (Vector3.new(0, 0, 1)):FuzzyEq(p23.YVector:Abs()) then true else false then
		t.Z = math.max(t.Z, p22.Z)
		t_1.Z = math.min(t_1.Z, p22.Z)
	end
	return extentsModule.fromMinMax(Vector3.new(t_1.X, t_1.Y, t_1.Z), Vector3.new(t.X, t.Y, t.Z))
end

local function calculateValidBounds(p24, p25)
	-- upvalues: extentsModule (ref), getFFlagUGCValidateTinyTrianglesIntersectFixModule (ref), calculateMinimumBoundsForView (ref), bodyAssetMasksRendererModule (ref), alignedExtentsFromReprojectedPoint (ref)
	local var56 = extentsModule.new()
	local var57 = if getFFlagUGCValidateTinyTrianglesIntersectFixModule() then {} else nil
	
	for i, v in p24 do
		local _ = nil
		local var58, var59 = calculateMinimumBoundsForView(v, p25)
		
		if var58 then
			local var60 = var59
			local var61 = alignedExtentsFromReprojectedPoint(v.view * bodyAssetMasksRendererModule.getViewSpacePositionFromNormalized(Vector2.new(var60[2], var60[3]), v.viewSpaceBounds), v.view)
			local var62 = alignedExtentsFromReprojectedPoint(v.view * bodyAssetMasksRendererModule.getViewSpacePositionFromNormalized(Vector2.new(var60[1], var60[4]), v.viewSpaceBounds), v.view)
			
			if getFFlagUGCValidateTinyTrianglesIntersectFixModule() then
				local var63 = extentsModule.new():unionExtents(var61):unionExtents(var62)
				local var64 = bodyAssetMasksRendererModule.opposingViewIds[i]
				
				if var57[var64] then
					var57[var64] = var63:intersectExtents(var57[var64])
				else
					var57[i] = var63
				end
			else
				var56 = var56:unionExtents(var61):unionExtents(var62)
			end
		end
		return false, var59
	end
	if getFFlagUGCValidateTinyTrianglesIntersectFixModule() then
		for i_1, v_1 in var57 do
			var56 = var56:unionExtents(v_1)
		end
		assert(var56:isValid())
	end
	return true, var56
end

local _ = function(p26, p27)
	return p27.CFrame * (p26 * (p27.Size / p27.MeshSize))
end

local function getHighestInflatingPointInEachAxis(p28, p29, p30, p31, p32)
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
	local var66 = p28:size()
	
	for i, v in p30 do
		local var67, var68, var69 = getMeshVertsModule({ editableMesh = v, fullName = i }, p32)
		
		if var67 then
			local var70 = p29[i]
			
			for i_1, v_1 in var69 do
				local var71 = var70.CFrame * (v_1 * var70.scale)
				local var72 = p31(i)
				local var73 = var72.CFrame * (v_1 * (var72.Size / var72.MeshSize))
				local var74 = (var71 - p28.max) / var66
				local var75 = (p28.min - var71) / var66
				
				for i_2, v_2 in { "X", "Y", "Z" } do
					local var76 = t[v_2]
					local positive = var76.positive
					local var77 = var74[v_2]
					
					if positive.inflationScale < var77 then
						positive.furthestPointWorldSpace = var73
						positive.inflationScale = var77
					end
					local negative = var76.negative
					local var78 = var75[v_2]
					
					if negative.inflationScale < var78 then
						negative.furthestPointWorldSpace = var73
						negative.inflationScale = var78
					end
				end
			end
		end
		return false, var68
	end
	return true, t
end

local function getBodyPartAssetEditableMeshes(value, p33)
	-- upvalues: getEditableMeshFromContextModule (ref)
	local t = {}
	
	if value:IsA("MeshPart") and p33.assetTypeEnum == Enum.AssetType.DynamicHead then
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
		local var81, var82 = getEditableMeshFromContextModule(v, "MeshId", p33)
		
		if not var81 then
			local formattedText = string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v.Name)
			
			if p33.isServer then
				error(formattedText)
			end
			return false, { formattedText }
		end
		t_1[v.Name] = var82
	end
	return true, t_1
end

local function tryReportInflationError(p34, p35)
	-- upvalues: failureReasonsAccumulatorModule (ref), validateAccurateBoundingBoxFlagsModule (ref)
	local var84 = failureReasonsAccumulatorModule.new()
	local var85 = validateAccurateBoundingBoxFlagsModule.AssetTypeToAxisThresholds[p35]
	
	for i, v in { "X", "Y", "Z" } do
		local var86 = p34[v]
		local var87 = var86.negative.inflationScale + var86.positive.inflationScale
		local var88 = var85[v]
		
		if var88 < var87 then
			local t = {}
			
			if var88 * 0.2 < var86.positive.inflationScale then
				table.insert(t, var86.positive.furthestPointWorldSpace)
			end
			if var88 * 0.2 < var86.negative.inflationScale then
				table.insert(t, var86.negative.furthestPointWorldSpace)
			end
			local var90 = ""
			
			if #t > 0 then
				var90 = " near " .. string.format("{%.4f, %.4f, %.4f}", t[1].X, t[1].Y, t[1].Z)
				
				if #t > 1 then
					var90 ..= string.format(", and {%.4f, %.4f, %.4f}", t[2].X, t[2].Y, t[2].Z)
				end
			end
			var84:updateReasons(false, {
				string.format("Detected low visibility geometry%s that increases %s bounding box size by %.2f%% (threshold is %.2f%%) in the %s axis. Remove the geometry or increase its size so that it is more visible", var90, p35.Name, var87 * 100, var88 * 100, v)
			})
		end
	end
	return var84
end

local t = {}
local var26 = nil

function t.getBoundsViewsForAssetType(value)
	-- upvalues: var26 (write), bodyAssetMasksRendererModule (ref)
	if not var26 then
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
		local var92 = t
		var92[bodyAssetMasksRendererModule.viewIds.Left] = false
		var92[bodyAssetMasksRendererModule.viewIds.Bottom] = false
		local t_1 = {}
		
		for i_1, v_1 in bodyAssetMasksRendererModule.viewIds do
			t_1[v_1] = true
		end
		local var94 = t_1
		var94[bodyAssetMasksRendererModule.viewIds.Right] = false
		var94[bodyAssetMasksRendererModule.viewIds.Bottom] = false
		local t_2 = {}
		
		for i_2, v_2 in bodyAssetMasksRendererModule.viewIds do
			t_2[v_2] = true
		end
		local var96 = t_2
		var96[bodyAssetMasksRendererModule.viewIds.Left] = false
		var96[bodyAssetMasksRendererModule.viewIds.Bottom] = false
		local t_3 = {}
		
		for i_3, v_3 in bodyAssetMasksRendererModule.viewIds do
			t_3[v_3] = true
		end
		local var98 = t_3
		var98[bodyAssetMasksRendererModule.viewIds.Right] = false
		var98[bodyAssetMasksRendererModule.viewIds.Bottom] = false
		var26 = {
			[Enum.AssetType.DynamicHead] = nil,
			[Enum.AssetType.Torso] = nil,
			[Enum.AssetType.LeftArm] = var92,
			[Enum.AssetType.RightArm] = var94,
			[Enum.AssetType.LeftLeg] = var96,
			[Enum.AssetType.RightLeg] = var98
		}
	end
	return var26[value]
end

function t.validate(p36, p37, p38)
	-- upvalues: t (ref), validateAccurateBoundingBoxFlagsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), bodyAssetMasksRendererModule (ref), projectMeshLocalPointToImageRow (ref), cloneMaskZeroedBelowRow (ref), calculateValidBounds (ref), assetCalculatorModule (ref), getBodyPartAssetEditableMeshes (ref), getHighestInflatingPointInEachAxis (ref), tryReportInflationError (ref), analyticsModule (ref)
	local assetTypeEnum = p38.assetTypeEnum
	assert(assetTypeEnum)
	
	local function findMeshHandle(p39)
		-- upvalues: assetTypeEnum (ref), p36 (ref)
		return if assetTypeEnum == Enum.AssetType.DynamicHead then p36 else p36:FindFirstChild(p39)
	end
	
	local boundsViewsForAssetType = t.getBoundsViewsForAssetType(assetTypeEnum)
	local t_1 = {}
	
	if boundsViewsForAssetType then
		for i, v in boundsViewsForAssetType do
			if v then
				assert(p37.bodyAssetMasks[i])
				t_1[i] = p37.bodyAssetMasks[i]
			end
		end
	else
		t_1 = p37.bodyAssetMasks
	end
	local t_2 = {}
	
	if assetTypeEnum == Enum.AssetType.DynamicHead and validateAccurateBoundingBoxFlagsModule.neckAttachmentCrop() then
		local neckRigAttachment = p36:FindFirstChild("NeckRigAttachment", true)
		local var105 = if not neckRigAttachment then nil else getAttachmentCFrameInPartSpaceModule(neckRigAttachment).Position / (p36.Size / p36.MeshSize)
		
		if var105 then
			local var106 = validateAccurateBoundingBoxFlagsModule.neckAttachmentCropMargin()
			local t_3 = {}
			
			for i, v in t_1 do
				if i ~= bodyAssetMasksRendererModule.viewIds.Top and i ~= bodyAssetMasksRendererModule.viewIds.Bottom then
					local mask = v.mask
					local var108 = cloneMaskZeroedBelowRow(mask, projectMeshLocalPointToImageRow(var105, v) + var106 * (mask.Size.Y - 1) / 2)
					table.insert(t_2, var108)
					t_3[i] = {
						mask = var108,
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
	local var109, var110 = (function()
		-- upvalues: calculateValidBounds (copy), t_1 (write), p38 (ref), assetCalculatorModule (copy), p36 (ref), getBodyPartAssetEditableMeshes (copy), getHighestInflatingPointInEachAxis (copy), findMeshHandle (ref), tryReportInflationError (copy), assetTypeEnum (ref), analyticsModule (copy)
		local _ = nil
		local var111, var112 = calculateValidBounds(t_1, p38)
		
		if not var111 then
			return false, var112
		end
		local assetMeshesValidationSpaceTransforms = assetCalculatorModule.getAssetMeshesValidationSpaceTransforms(p36, p38)
		local _ = nil
		local var114, var115 = getBodyPartAssetEditableMeshes(p36, p38)
		
		if not var114 then
			return false, var115
		end
		var116, var115 = getHighestInflatingPointInEachAxis(var112, assetMeshesValidationSpaceTransforms, var115, findMeshHandle, p38)
		
		if not var116 then
			return false, var115
		end
		var115 = tryReportInflationError(var115, assetTypeEnum)
		
		if not var115:getFinalResults() then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateAccurateBoundingBox, nil, p38)
		end
		return var115:getFinalResults()
	end)()
	
	for i, v in t_2 do
		v:Destroy()
	end
	return var109, var110
end

return t