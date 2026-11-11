local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local ValidateMakeupZoneIncludeToleranceHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneIncludeToleranceHundredthsPercent", 100)
local ValidateMakeupZoneExcludeHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneExcludeHundredthsPercent", 200)

local function createIncludeError(p1, p2, p3)
	-- upvalues: AnalyticsModule (copy)
	local AssetTypeEnum = p3.assetTypeEnum
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMakeupDecal_UVZoneError, nil, p3)
	
	return false, {
		string.format("Opaque area of ColorMap for %s does not fall within allowed UV area of [%s] and [%s] for asset type %s", p1.Name, tostring(p2.MinBound), tostring(p2.MaxBound), AssetTypeEnum.Name)
	}
end

local function createExcludeError(p1, p2, p3)
	-- upvalues: AnalyticsModule (copy)
	local AssetTypeEnum = p3.assetTypeEnum
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMakeupDecal_UVZoneError, nil, p3)
	
	return false, {
		string.format("Opaque pixels in ColorMap for %s were found within a restricted UV area of [%s] and [%s] for asset type %s", p1.Name, tostring(p2.MinBound), tostring(p2.MaxBound), AssetTypeEnum.Name)
	}
end

local function validateCoverageOutsideIncludeBounds(p1, EditableImage, Vector, Vector1, p2, p3)
	-- upvalues: ValidateMakeupZoneIncludeToleranceHundredthsPercent (copy), createIncludeError (copy)
	local ScaledX = (Vector1.X - Vector.X) * (Vector1.Y - Vector.Y) * ValidateMakeupZoneIncludeToleranceHundredthsPercent / 10000 * 255
	local Total = 0
	local PixelsBuffer = EditableImage:ReadPixelsBuffer(Vector2.new(0, 0), EditableImage.Size)
	local Count = 0
	local YDelta = EditableImage.Size.Y - 1
	
	for i = 0, buffer.len(PixelsBuffer) - 1, 4 do
		if Count == EditableImage.Size.X then
			Count = 0
			YDelta -= 1
		end
		local ByteValue = buffer.readu8(PixelsBuffer, i + 3)
		
		if ByteValue > 0 and (Count < Vector.X or YDelta < Vector.Y or Vector1.X < Count or Vector1.Y < YDelta) then
			Total += ByteValue
		end
		Count += 1
	end
	return ScaledX >= Total or createIncludeError(p1, p2, p3)
end

local function validateCoverageInsideExcludeBounds(p4, EditableImage, Vector, Vector1, p5, p6)
	-- upvalues: ValidateMakeupZoneExcludeHundredthsPercent (copy), createExcludeError (copy)
	local ScaledX = (Vector1.X - Vector.X) * (Vector1.Y - Vector.Y) * ValidateMakeupZoneExcludeHundredthsPercent / 10000 * 255
	local Total = 0
	local PixelsBuffer = EditableImage:ReadPixelsBuffer(Vector2.new(0, 0), EditableImage.Size)
	local Count = 0
	local YDelta = EditableImage.Size.Y - 1
	
	for i = 0, buffer.len(PixelsBuffer) - 1, 4 do
		if Count == EditableImage.Size.X then
			Count = 0
			YDelta -= 1
		end
		local ByteValue = buffer.readu8(PixelsBuffer, i + 3)
		
		if ByteValue > 0 and Vector.X < Count and Vector.Y < YDelta and Count < Vector1.X and YDelta < Vector1.Y then
			Total += ByteValue
		end
		Count += 1
	end
	return ScaledX >= Total or createExcludeError(p4, p5, p6)
end

return function(p7, p8, WrapTextureTransfer, List, p9)
	-- upvalues: FailureReasonsAccumulatorModule (copy), validateCoverageOutsideIncludeBounds (copy), validateCoverageInsideExcludeBounds (copy)
	local UVMaxBoundDelta = WrapTextureTransfer.UVMaxBound - WrapTextureTransfer.UVMinBound
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for _, value in List do
		local ScaledMinBound = (value.MinBound - WrapTextureTransfer.UVMinBound) / UVMaxBoundDelta * p8.Size
		local ScaledMaxBound = (value.MaxBound - WrapTextureTransfer.UVMinBound) / UVMaxBoundDelta * p8.Size
		
		if value.isIncludeBound then
			NewFailureReasonsAccumulator:updateReasons(validateCoverageOutsideIncludeBounds(p7, p8, ScaledMinBound, ScaledMaxBound, value, p9))
		else
			NewFailureReasonsAccumulator:updateReasons(validateCoverageInsideExcludeBounds(p7, p8, ScaledMinBound, ScaledMaxBound, value, p9))
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end