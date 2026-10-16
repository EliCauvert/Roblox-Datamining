local AssetService = game:GetService("AssetService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local BodyAssetMasksRendererModule = require(Parent.util.bodyAssetMasksRenderer)
local NelderMeadModule = require(Parent.util.nelderMead)
local SummedAreaTableModule = require(Parent.util.SummedAreaTable)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetMeshVertsModule = require(Parent.util.getMeshVerts)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)
local _ = require(Parent.util.Types)
local FloatVectorModule = require(Parent.util.FloatVector)
local ExtentsModule = require(Parent.util.Extents)
local TryYieldModule = require(Parent.util.tryYield)
local ValidateAccurateBoundingBoxFlagsModule = require(Parent.flags.validateAccurateBoundingBoxFlags)
local GetFFlagUGCValidateTinyTrianglesIntersectFixModule = require(Parent.flags.getFFlagUGCValidateTinyTrianglesIntersectFix)

local function _(Object) --[[ Line: 39 | Named "getHeadNeckAttachmentMeshLocalPosition" ]]
	-- upvalues: GetAttachmentCFrameInPartSpaceModule (copy)
	local NeckRigAttachment = Object:FindFirstChild("NeckRigAttachment", true)
	
	return if NeckRigAttachment then GetAttachmentCFrameInPartSpaceModule(NeckRigAttachment).Position / (Object.Size / Object.MeshSize) else nil
end

local function projectMeshLocalPointToImageRow(PositionRatio, p1): number --[[ Line: 53 ]]
	local ViewSpaceBounds = p1.viewSpaceBounds
	
	return (((p1.view:Inverse() * PositionRatio).Y - (ViewSpaceBounds.max.Y + ViewSpaceBounds.min.Y) / 2) / ((ViewSpaceBounds.max.Y - ViewSpaceBounds.min.Y) / 2) * -0.5 + 0.5) * (p1.mask.Size.Y - 1)
end

local function cloneMaskZeroedBelowRow(Mask, Value: number) --[[ Line: 69 ]]
	-- upvalues: AssetService (copy)
	local Size = Mask.Size
	local X = Size.X
	local Y: number = Size.Y
	local PixelsBuffer = Mask:ReadPixelsBuffer(Vector2.zero, Size)
	local Largest = math.max(0, (math.min(Y, math.floor(Value) + 1)))
	
	if Largest < Y then
		buffer.fill(PixelsBuffer, Largest * X * 4, 0, (Y - Largest) * X * 4)
	end
	local EditableImage = AssetService:CreateEditableImage({ Size = Size })
	EditableImage:WritePixelsBuffer(Vector2.zero, Size, PixelsBuffer)
	
	return EditableImage
end

local _ = function(p1, X, X1, Y, Y1) --[[ Line: 89 | Named "sampleAreaTable" ]]
	local ScaledVector = Vector2.new(X, Y) * p1.size
	
	return (p1:GetAreaDensityContinuous(ScaledVector, Vector2.new(X1, Y1) * p1.size - ScaledVector))
end

local function shrinkBounds(SimplexEntry, Callback, Size) --[[ Line: 101 ]]
	-- upvalues: FloatVectorModule (copy)
	local function _(p1: number): number --[[ Line: 102 ]]
		return if p1 % 2 == 0 then p1 - 1 else p1 + 1
	end
	
	for i = 1, 4 do
		local SimplexEntry1 = SimplexEntry[if i % 2 == 0 then i - 1 else i + 1]
		local v1 = 1 / Size[if i < 3 then "X" else "Y"]
		local NewFloatVector = FloatVectorModule.new(SimplexEntry)
		local CallbackResult = Callback(SimplexEntry)
		local SimplexEntry2 = SimplexEntry[i]
		while v1 <= math.abs(SimplexEntry2 - SimplexEntry1) do
			local SimplexEntryRatio = (SimplexEntry2 + SimplexEntry1) / 2
			NewFloatVector[i] = SimplexEntryRatio
			local CallbackResult1 = Callback(NewFloatVector)
			
			if CallbackResult1 < CallbackResult then
				NewFloatVector[i] = SimplexEntryRatio + (SimplexEntry1 - SimplexEntryRatio) * 0.01
				
				if Callback(NewFloatVector) - CallbackResult1 > 0 then
					SimplexEntry1 = SimplexEntry2
				end
				SimplexEntry2 = SimplexEntryRatio
				CallbackResult = CallbackResult1
			else
				SimplexEntry1 = SimplexEntryRatio
			end
		end
		SimplexEntry[i] = SimplexEntry2
	end
end

local function createSimplex(NewResult, p1) --[[ Line: 146 ]]
	-- upvalues: FloatVectorModule (copy)
	local List = {}
	table.insert(List, NewResult)
	table.insert(List, NewResult + FloatVectorModule.new(p1, 0, 0, 0))
	table.insert(List, NewResult + FloatVectorModule.new(0, p1, 0, 0))
	table.insert(List, NewResult + FloatVectorModule.new(0, 0, p1, 0))
	table.insert(List, NewResult + FloatVectorModule.new(0, 0, 0, p1))
	
	return List
end

local function calculateMinimumBoundsForView(p1, p2) --[[ Line: 156 ]]
	-- upvalues: FloatVectorModule (copy), createSimplex (copy), SummedAreaTableModule (copy), ValidateAccurateBoundingBoxFlagsModule (copy), NelderMeadModule (copy), TryYieldModule (copy), shrinkBounds (copy)
	local Simplex = createSimplex(FloatVectorModule.new(0, 1, 0, 1), 0.9)
	local Mask = p1.mask
	local Size = Mask.Size
	local NewSummedAreaTable = SummedAreaTableModule.new(Size, function(p3): number --[[ Line: 165 ]]
		return if p3.R > 0 or p3.G > 0 or p3.B > 0 then 1 else 0
	end)
	NewSummedAreaTable:BuildSummedAreaTable(Mask)
	local AreaDensity: number = NewSummedAreaTable:GetAreaDensity(Vector2.zero, Size)
	
	if AreaDensity <= 0 then
		return false, {
			string.format("%s asset not visible from the %s, cannot determine quality of asset bounding box", p2.assetTypeEnum.Name, p1.viewId)
		}
	else
		local TargetPercentageResult = ValidateAccurateBoundingBoxFlagsModule.targetPercentage()
		local PercentageWeightResult = ValidateAccurateBoundingBoxFlagsModule.percentageWeight()
		
		local function v57(Entry) --[[ Line: 189 ]]
			-- upvalues: NewSummedAreaTable (copy), AreaDensity (copy), TargetPercentageResult (copy), PercentageWeightResult (copy)
			assert(Entry:getSize() == 4)
			local AreaDensityContinuous = 0
			
			if Entry[1] <= Entry[2] and Entry[3] <= Entry[4] then
				local ScaledVector = Vector2.new(Entry[1], Entry[3]) * NewSummedAreaTable.size
				AreaDensityContinuous = NewSummedAreaTable:GetAreaDensityContinuous(ScaledVector, Vector2.new(Entry[2], Entry[4]) * NewSummedAreaTable.size - ScaledVector)
			end
			local _Vector2 = Vector2.new(Entry[2] - Entry[1], Entry[4] - Entry[3])
			
			return math.abs(AreaDensityContinuous / AreaDensity * 100 - TargetPercentageResult) * PercentageWeightResult + (_Vector2.X + _Vector2.Y)
		end
		
		local MaxIterationsResult = ValidateAccurateBoundingBoxFlagsModule.maxIterations()
		local ScaledMagnitude = Vector2.new(1 / Size.X, 1 / Size.Y).Magnitude * ValidateAccurateBoundingBoxFlagsModule.convergedLength()
		local NewNelderMead = NelderMeadModule.new(Simplex, v57, function(p3, p4): boolean --[[ Line: 209 ]]
			-- upvalues: MaxIterationsResult (copy), NelderMeadModule (upval), ScaledMagnitude (copy), TryYieldModule (upval), p2 (copy)
			if MaxIterationsResult <= p4 then
				return true
			elseif NelderMeadModule.calculateMaxLengthBetweenVertices(p3) <= ScaledMagnitude then
				return true
			else
				TryYieldModule(p2)
				
				return false
			end
		end)
		NewNelderMead:evaluate()
		local SimplexEntry = NewNelderMead.simplex[1]
		shrinkBounds(SimplexEntry, v57, Size)
		
		return true, (FloatVectorModule.new(math.clamp(SimplexEntry[1], 0, 1), math.clamp(SimplexEntry[2], 0, 1), math.clamp(SimplexEntry[3], 0, 1), (math.clamp(SimplexEntry[4], 0, 1))))
	end
end

local _ = function(CF, Vector): boolean --[[ Line: 242 | Named "transformIsAlignedWithAxis" ]]
	return if Vector:FuzzyEq(CF.XVector:Abs()) then true elseif Vector:FuzzyEq(CF.YVector:Abs()) then true else false
end

local function alignedExtentsFromReprojectedPoint(Vector, CF) --[[ Line: 252 ]]
	-- upvalues: ExtentsModule (copy)
	local Vector1 = { X = -1e999, Y = -1e999, Z = -1e999 }
	local Vector4 = { X = 1e999, Y = 1e999, Z = 1e999 }
	
	if if (vector.create(1, 0, 0)):FuzzyEq(CF.XVector:Abs()) then true elseif (vector.create(1, 0, 0)):FuzzyEq(CF.YVector:Abs()) then true else false then
		Vector1.X = math.max(Vector1.X, Vector.X)
		Vector4.X = math.min(Vector4.X, Vector.X)
	end
	if if (vector.create(0, 1, 0)):FuzzyEq(CF.XVector:Abs()) then true elseif (vector.create(0, 1, 0)):FuzzyEq(CF.YVector:Abs()) then true else false then
		Vector1.Y = math.max(Vector1.Y, Vector.Y)
		Vector4.Y = math.min(Vector4.Y, Vector.Y)
	end
	if if (vector.create(0, 0, 1)):FuzzyEq(CF.XVector:Abs()) then true elseif (vector.create(0, 0, 1)):FuzzyEq(CF.YVector:Abs()) then true else false then
		Vector1.Z = math.max(Vector1.Z, Vector.Z)
		Vector4.Z = math.min(Vector4.Z, Vector.Z)
	end
	return ExtentsModule.fromMinMax(Vector3.new(Vector4.X, Vector4.Y, Vector4.Z), (Vector3.new(Vector1.X, Vector1.Y, Vector1.Z)))
end

local function calculateValidBounds(BodyAssetMasks, p1) --[[ Line: 279 ]]
	-- upvalues: ExtentsModule (copy), GetFFlagUGCValidateTinyTrianglesIntersectFixModule (copy), calculateMinimumBoundsForView (copy), BodyAssetMasksRendererModule (copy), alignedExtentsFromReprojectedPoint (copy)
	local NewExtents = ExtentsModule.new()
	local T = if GetFFlagUGCValidateTinyTrianglesIntersectFixModule() then {} else nil
	local MinimumBoundsForView2 = nil
	for i, bodyAssetMask in BodyAssetMasks do
		local MinimumBoundsForView
		MinimumBoundsForView, MinimumBoundsForView2 = calculateMinimumBoundsForView(bodyAssetMask, p1)
		
		if not MinimumBoundsForView then
			return false, MinimumBoundsForView2
		end
		local ScaledView = bodyAssetMask.view * BodyAssetMasksRendererModule.getViewSpacePositionFromNormalized(Vector2.new(MinimumBoundsForView2[1], MinimumBoundsForView2[4]), bodyAssetMask.viewSpaceBounds)
		local AlignedExtentsFromReprojectedPointResult = alignedExtentsFromReprojectedPoint(bodyAssetMask.view * BodyAssetMasksRendererModule.getViewSpacePositionFromNormalized(Vector2.new(MinimumBoundsForView2[2], MinimumBoundsForView2[3]), bodyAssetMask.viewSpaceBounds), bodyAssetMask.view)
		local AlignedExtentsFromReprojectedPointResult1 = alignedExtentsFromReprojectedPoint(ScaledView, bodyAssetMask.view)
		
		if GetFFlagUGCValidateTinyTrianglesIntersectFixModule() then
			local UnionExtentsResult = ExtentsModule.new():unionExtents(AlignedExtentsFromReprojectedPointResult):unionExtents(AlignedExtentsFromReprojectedPointResult1)
			local OpposingViewId = BodyAssetMasksRendererModule.opposingViewIds[i]
			
			if T[OpposingViewId] then
				T[OpposingViewId] = UnionExtentsResult:intersectExtents(T[OpposingViewId])
			else
				T[i] = UnionExtentsResult
			end
		else
			NewExtents = NewExtents:unionExtents(AlignedExtentsFromReprojectedPointResult):unionExtents(AlignedExtentsFromReprojectedPointResult1)
		end
	end
	if GetFFlagUGCValidateTinyTrianglesIntersectFixModule() then
		for _, value in T do
			NewExtents = NewExtents:unionExtents(value)
		end
		assert(NewExtents:isValid())
	end
	return true, NewExtents
end

local _ = function(p2, p3) --[[ Line: 336 | Named "worldSpacePositionFromPointInMeshPart" ]]
	return p3.CFrame * (p2 * (p3.Size / p3.MeshSize))
end

local function getHighestInflatingPointInEachAxis(p2, AssetMeshesValidationSpaceTransforms, EditableMeshes, Callback, p3) --[[ Line: 353 ]]
	-- upvalues: GetMeshVertsModule (copy)
	local config = {
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
	local SizeResult = p2:size()
	local MeshVertsModule2 = nil
	
	for FullName, editableMesh in EditableMeshes do
		local MeshVertsModule, MeshVertsModule3
		MeshVertsModule, MeshVertsModule2, MeshVertsModule3 = GetMeshVertsModule({ editableMesh = editableMesh, fullName = FullName }, p3)
		
		if not MeshVertsModule then
			return false, MeshVertsModule2
		end
		local AssetMeshesValidationSpaceTransform = AssetMeshesValidationSpaceTransforms[FullName]
		
		for _, value in MeshVertsModule3 do
			local ScaledScale = AssetMeshesValidationSpaceTransform.CFrame * (value * AssetMeshesValidationSpaceTransform.scale)
			local CallbackResult = Callback(FullName)
			local ScaledSize = CallbackResult.CFrame * (value * (CallbackResult.Size / CallbackResult.MeshSize))
			local ScaledScaleRatio = (ScaledScale - p2.max) / SizeResult
			local MinRatio = (p2.min - ScaledScale) / SizeResult
			
			for _, value1 in { "X", "Y", "Z" } do
				local Entry = config[value1]
				local Positive = Entry.positive
				local ScaledScaleRatioEntry = ScaledScaleRatio[value1]
				
				if Positive.inflationScale < ScaledScaleRatioEntry then
					Positive.furthestPointWorldSpace = ScaledSize
					Positive.inflationScale = ScaledScaleRatioEntry
				end
				local Negative = Entry.negative
				local MinRatioEntry = MinRatio[value1]
				
				if Negative.inflationScale < MinRatioEntry then
					Negative.furthestPointWorldSpace = ScaledSize
					Negative.inflationScale = MinRatioEntry
				end
			end
		end
	end
	return true, config
end

local function getBodyPartAssetEditableMeshes(Part: Part, p4) --[[ Line: 413 ]]
	-- upvalues: GetEditableMeshFromContextModule (copy)
	local List = {}
	
	if Part:IsA("MeshPart") and p4.assetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(List, Part)
	else
		for _, Part1 in Part:GetChildren() do
			if Part1:IsA("MeshPart") then
				table.insert(List, Part1)
			end
		end
	end
	local t = {}
	local Formatted = nil
	
	for _, value in List do
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(value, "MeshId", p4)
		
		if not MeshId then
			Formatted = string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", value.Name)
			
			if not p4.isServer then
				return false, { Formatted }
			end
			error(Formatted)
		end
		t[value.Name] = MeshId2
	end
	return true, t
end

local function tryReportInflationError(p5, AssetTypeEnum) --[[ Line: 448 ]]
	-- upvalues: FailureReasonsAccumulatorModule (copy), ValidateAccurateBoundingBoxFlagsModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local AssetTypeToAxisThreshold = ValidateAccurateBoundingBoxFlagsModule.AssetTypeToAxisThresholds[AssetTypeEnum]
	
	for _, value in { "X", "Y", "Z" } do
		local v2 = p5[value]
		local NewInflationScale = v2.negative.inflationScale + v2.positive.inflationScale
		local AssetTypeToAxisThresholdEntry: number = AssetTypeToAxisThreshold[value]
		
		if AssetTypeToAxisThresholdEntry < NewInflationScale then
			local FurthestPointWorldSpaces = {}
			
			if AssetTypeToAxisThresholdEntry * 0.2 < v2.positive.inflationScale then
				table.insert(FurthestPointWorldSpaces, v2.positive.furthestPointWorldSpace)
			end
			if AssetTypeToAxisThresholdEntry * 0.2 < v2.negative.inflationScale then
				table.insert(FurthestPointWorldSpaces, v2.negative.furthestPointWorldSpace)
			end
			local Text = ""
			
			if #FurthestPointWorldSpaces > 0 then
				Text = " near " .. string.format("{%.4f, %.4f, %.4f}", FurthestPointWorldSpaces[1].X, FurthestPointWorldSpaces[1].Y, FurthestPointWorldSpaces[1].Z)
				
				if #FurthestPointWorldSpaces > 1 then
					Text ..= string.format(", and {%.4f, %.4f, %.4f}", FurthestPointWorldSpaces[2].X, FurthestPointWorldSpaces[2].Y, FurthestPointWorldSpaces[2].Z)
				end
			end
			NewFailureReasonsAccumulator:updateReasons(false, {
				string.format("Detected low visibility geometry%s that increases %s bounding box size by %.2f%% (threshold is %.2f%%) in the %s axis. Remove the geometry or increase its size so that it is more visible", Text, AssetTypeEnum.Name, NewInflationScale * 100, AssetTypeToAxisThresholdEntry * 100, value)
			})
		end
	end
	return NewFailureReasonsAccumulator
end

local Config = nil
local ValidateAccurateBoundingBoxRasterMethodModule = {
	getBoundsViewsForAssetType = function(AssetTypeEnum) --[[ Line: 506 ]]
		-- upvalues: Config (ref), BodyAssetMasksRendererModule (copy)
		if not Config then
			local function _() --[[ Line: 508 ]]
				-- upvalues: BodyAssetMasksRendererModule (upval)
				local t = {}
				
				for _, viewId in BodyAssetMasksRendererModule.viewIds do
					t[viewId] = true
				end
				return t
			end
			
			local t = {}
			
			for _, viewId in BodyAssetMasksRendererModule.viewIds do
				t[viewId] = true
			end
			t[BodyAssetMasksRendererModule.viewIds.Left] = false
			t[BodyAssetMasksRendererModule.viewIds.Bottom] = false
			local t1 = {}
			
			for _, viewId1 in BodyAssetMasksRendererModule.viewIds do
				t1[viewId1] = true
			end
			t1[BodyAssetMasksRendererModule.viewIds.Right] = false
			t1[BodyAssetMasksRendererModule.viewIds.Bottom] = false
			local t2 = {}
			
			for _, viewId2 in BodyAssetMasksRendererModule.viewIds do
				t2[viewId2] = true
			end
			t2[BodyAssetMasksRendererModule.viewIds.Left] = false
			t2[BodyAssetMasksRendererModule.viewIds.Bottom] = false
			local t3 = {}
			
			for _, viewId3 in BodyAssetMasksRendererModule.viewIds do
				t3[viewId3] = true
			end
			t3[BodyAssetMasksRendererModule.viewIds.Right] = false
			t3[BodyAssetMasksRendererModule.viewIds.Bottom] = false
			Config = {
				[Enum.AssetType.DynamicHead] = nil,
				[Enum.AssetType.Torso] = nil,
				[Enum.AssetType.LeftArm] = t,
				[Enum.AssetType.RightArm] = t1,
				[Enum.AssetType.LeftLeg] = t2,
				[Enum.AssetType.RightLeg] = t3
			}
		end
		return Config[AssetTypeEnum]
	end
}

function ValidateAccurateBoundingBoxRasterMethodModule.validate(Object, p6, p7) --[[ Line: 545 ]]
	-- upvalues: ValidateAccurateBoundingBoxRasterMethodModule (copy), ValidateAccurateBoundingBoxFlagsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy), BodyAssetMasksRendererModule (copy), projectMeshLocalPointToImageRow (copy), cloneMaskZeroedBelowRow (copy), calculateValidBounds (copy), AssetCalculatorModule (copy), getBodyPartAssetEditableMeshes (copy), getHighestInflatingPointInEachAxis (copy), tryReportInflationError (copy), AnalyticsModule (copy)
	local AssetTypeEnum = p7.assetTypeEnum
	assert(AssetTypeEnum)
	
	local function findMeshHandle(ChildName) --[[ Line: 553 ]]
		-- upvalues: AssetTypeEnum (copy), Object (copy)
		return if AssetTypeEnum == Enum.AssetType.DynamicHead then Object else Object:FindFirstChild(ChildName)
	end
	
	local BoundsViewsForAssetType = ValidateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(AssetTypeEnum)
	local BodyAssetMasks = {}
	
	if BoundsViewsForAssetType then
		for i, value in BoundsViewsForAssetType do
			if value then
				assert(p6.bodyAssetMasks[i])
				BodyAssetMasks[i] = p6.bodyAssetMasks[i]
			end
		end
	else
		BodyAssetMasks = p6.bodyAssetMasks
	end
	local List = {}
	
	if AssetTypeEnum == Enum.AssetType.DynamicHead and ValidateAccurateBoundingBoxFlagsModule.neckAttachmentCrop() then
		local NeckRigAttachment = Object:FindFirstChild("NeckRigAttachment", true)
		local PositionRatio = if NeckRigAttachment then GetAttachmentCFrameInPartSpaceModule(NeckRigAttachment).Position / (Object.Size / Object.MeshSize) else nil
		
		if PositionRatio then
			local NeckAttachmentCropMarginResult = ValidateAccurateBoundingBoxFlagsModule.neckAttachmentCropMargin()
			local t = {}
			
			for i1, bodyAssetMask in BodyAssetMasks do
				if i1 ~= BodyAssetMasksRendererModule.viewIds.Top and i1 ~= BodyAssetMasksRendererModule.viewIds.Bottom then
					local Mask = bodyAssetMask.mask
					local CloneMaskZeroedBelowRowResult = cloneMaskZeroedBelowRow(Mask, projectMeshLocalPointToImageRow(PositionRatio, bodyAssetMask) + NeckAttachmentCropMarginResult * (Mask.Size.Y - 1) / 2)
					table.insert(List, CloneMaskZeroedBelowRowResult)
					t[i1] = {
						mask = CloneMaskZeroedBelowRowResult,
						view = bodyAssetMask.view,
						viewSpaceBounds = bodyAssetMask.viewSpaceBounds,
						viewId = bodyAssetMask.viewId
					}
				else
					t[i1] = bodyAssetMask
				end
			end
			BodyAssetMasks = t
		end
	end
	local v3, v4 = (function() --[[ Line: 611 ]]
		-- upvalues: calculateValidBounds (upval), BodyAssetMasks (ref), p7 (copy), AssetCalculatorModule (upval), Object (copy), getBodyPartAssetEditableMeshes (upval), getHighestInflatingPointInEachAxis (upval), findMeshHandle (copy), tryReportInflationError (upval), AssetTypeEnum (copy), AnalyticsModule (upval)
		local ValidBounds, ValidBounds2 = calculateValidBounds(BodyAssetMasks, p7)
		
		if not ValidBounds then
			return false, ValidBounds2
		end
		local AssetMeshesValidationSpaceTransforms = AssetCalculatorModule.getAssetMeshesValidationSpaceTransforms(Object, p7)
		local BodyPartAssetEditableMeshes, BodyPartAssetEditableMeshes2 = getBodyPartAssetEditableMeshes(Object, p7)
		
		if not BodyPartAssetEditableMeshes then
			return false, BodyPartAssetEditableMeshes2
		end
		local HighestInflatingPointInEachAxis, HighestInflatingPointInEachAxis2 = getHighestInflatingPointInEachAxis(ValidBounds2, AssetMeshesValidationSpaceTransforms, BodyPartAssetEditableMeshes2, findMeshHandle, p7)
		
		if not HighestInflatingPointInEachAxis then
			return false, HighestInflatingPointInEachAxis2
		end
		local TryReportInflationErrorResult = tryReportInflationError(HighestInflatingPointInEachAxis2, AssetTypeEnum)
		
		if not TryReportInflationErrorResult:getFinalResults() then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAccurateBoundingBox, nil, p7)
		end
		return TryReportInflationErrorResult:getFinalResults()
	end)()
	
	for _, value1 in List do
		value1:Destroy()
	end
	return v3, v4
end

return ValidateAccurateBoundingBoxRasterMethodModule