local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)
local TryYieldModule = require(Parent.util.tryYield)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)
local RasterUtilModule = require(Parent.util.RasterUtil)
local TransparencyUtilModule = require(Parent.util.TransparencyUtil)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local ConstantsTransparencyValidationModule = require(Parent.ConstantsTransparencyValidation)

local function getViews()
	-- upvalues: ConstantsTransparencyValidationModule (copy)
	return {
		{
			axis1 = vector.create(1, 0, 0),
			axis2 = vector.create(0, 1, 0),
			normal = vector.create(0, 0, 1),
			viewId = ConstantsTransparencyValidationModule.CAMERA_ANGLES.Front
		},
		{
			axis1 = vector.create(1, 0, 0),
			axis2 = vector.create(0, 1, 0),
			normal = vector.create(0, 0, -1),
			viewId = ConstantsTransparencyValidationModule.CAMERA_ANGLES.Back
		},
		{
			axis1 = vector.create(0, 0, 1),
			axis2 = vector.create(0, 1, 0),
			normal = vector.create(-1, 0, 0),
			viewId = ConstantsTransparencyValidationModule.CAMERA_ANGLES.Left
		},
		{
			axis1 = vector.create(0, 0, 1),
			axis2 = vector.create(0, 1, 0),
			normal = vector.create(1, 0, 0),
			viewId = ConstantsTransparencyValidationModule.CAMERA_ANGLES.Right
		},
		{
			axis1 = vector.create(1, 0, 0),
			axis2 = vector.create(0, 0, 1),
			normal = vector.create(0, -1, 0),
			viewId = ConstantsTransparencyValidationModule.CAMERA_ANGLES.Top
		},
		{
			axis1 = vector.create(1, 0, 0),
			axis2 = vector.create(0, 0, 1),
			normal = vector.create(0, 1, 0),
			viewId = ConstantsTransparencyValidationModule.CAMERA_ANGLES.Bottom
		}
	}
end

local function _(Vector, Back)
	-- upvalues: ConstantsTransparencyValidationModule (copy)
	return if Back == ConstantsTransparencyValidationModule.CAMERA_ANGLES.Front or Back == ConstantsTransparencyValidationModule.CAMERA_ANGLES.Back then Vector.X / Vector.Y elseif Back == ConstantsTransparencyValidationModule.CAMERA_ANGLES.Left or Back == ConstantsTransparencyValidationModule.CAMERA_ANGLES.Right then Vector.Z / Vector.Y else Vector.X / Vector.Z
end

local function getScaleFactor(Vector, ViewId): Vector2
	-- upvalues: ConstantsTransparencyValidationModule (copy)
	local XRatio = if ViewId == ConstantsTransparencyValidationModule.CAMERA_ANGLES.Front or ViewId == ConstantsTransparencyValidationModule.CAMERA_ANGLES.Back then Vector.X / Vector.Y elseif ViewId == ConstantsTransparencyValidationModule.CAMERA_ANGLES.Left or ViewId == ConstantsTransparencyValidationModule.CAMERA_ANGLES.Right then Vector.Z / Vector.Y else Vector.X / Vector.Z
	local ASSETTRANSPARENCYRASTERSIZERatio = nil
	local ASSETTRANSPARENCYRASTERSIZE = nil
	
	if XRatio > 1 then
		ASSETTRANSPARENCYRASTERSIZERatio = ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE / XRatio
		ASSETTRANSPARENCYRASTERSIZE = ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	elseif XRatio < 1 then
		ASSETTRANSPARENCYRASTERSIZE = ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE * XRatio
		ASSETTRANSPARENCYRASTERSIZERatio = ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	else
		ASSETTRANSPARENCYRASTERSIZE = ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
		ASSETTRANSPARENCYRASTERSIZERatio = ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	end
	local _Vector2 = Vector2.new(ASSETTRANSPARENCYRASTERSIZE / ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, ASSETTRANSPARENCYRASTERSIZERatio / ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE)
	local Largest = math.max(_Vector2.X, _Vector2.Y)
	
	return if Largest > 1 then _Vector2 / Largest else _Vector2
end

local function addTransformedTriangle(EditableMesh, List, FaceId, p1, p2)
	-- upvalues: TransparencyUtilModule (copy)
	local config = { orderedVerts = {} }
	local FaceVertices = EditableMesh:GetFaceVertices(FaceId)
	local TransformTriangleToWorldResult, TransformTriangleToWorldResult2, TransformTriangleToWorldResult3, TransformTriangleToWorldResult4 = TransparencyUtilModule.transformTriangleToWorld(EditableMesh:GetPosition(FaceVertices[1]), EditableMesh:GetPosition(FaceVertices[2]), EditableMesh:GetPosition(FaceVertices[3]), p1, p2)
	table.insert(config.orderedVerts, TransformTriangleToWorldResult)
	table.insert(config.orderedVerts, TransformTriangleToWorldResult2)
	table.insert(config.orderedVerts, TransformTriangleToWorldResult3)
	config.normal = TransformTriangleToWorldResult4
	table.insert(List, config)
	
	return config
end

local function updateMinMaxBounds(p1, p2)
	local OrderedVert = p2.orderedVerts[1]
	local OrderedVert1 = p2.orderedVerts[2]
	local OrderedVert2 = p2.orderedVerts[3]
	local X = math.max(OrderedVert.X, OrderedVert1.X, OrderedVert2.X, p1.max.X)
	local Y = math.max(OrderedVert.Y, OrderedVert1.Y, OrderedVert2.Y, p1.max.Y)
	local Z = math.max(OrderedVert.Z, OrderedVert1.Z, OrderedVert2.Z, p1.max.Z)
	p1.min = Vector3.new(math.min(OrderedVert.X, OrderedVert1.X, OrderedVert2.X, p1.min.X), math.min(OrderedVert.Y, OrderedVert1.Y, OrderedVert2.Y, p1.min.Y), (math.min(OrderedVert.Z, OrderedVert1.Z, OrderedVert2.Z, p1.min.Z)))
	p1.max = Vector3.new(X, Y, Z)
end

local function getCombinedMeshData(EditableMesh, p1, Cframe, p2, p3, p4)
	-- upvalues: addTransformedTriangle (copy), updateMinMaxBounds (copy), TryYieldModule (copy)
	for _, face in EditableMesh:GetFaces() do
		updateMinMaxBounds(p2, (addTransformedTriangle(EditableMesh, p1, face, Cframe, p3)))
		TryYieldModule(p4)
	end
end

local function getOpacity(RasterMeshResult)
	local PixelsBuffer = RasterMeshResult:ReadPixelsBuffer(Vector2.new(0, 0), RasterMeshResult.Size)
	local Count = 0
	local Count1 = 0
	
	for i = 0, buffer.len(PixelsBuffer) - 1, 4 do
		local ByteValue = buffer.readu8(PixelsBuffer, i + 1)
		local ByteValue1 = buffer.readu8(PixelsBuffer, i + 2)
		
		if buffer.readu8(PixelsBuffer, i) == 0 and ByteValue == 0 and ByteValue1 == 0 then
			Count1 += 1
		end
		Count += 1
	end
	if Count == 0 then
		return false, 0
	else
		return true, 1 - Count1 / Count
	end
end

local function checkPartsTransparency(List)
	local List1 = {}
	
	for _, value in List do
		if value.Transparency ~= 0 then
			table.insert(List1, value.Name)
		end
	end
	if #List1 > 0 then
		return false, {
			string.format("The following parts have a non-zero transparency: %s. Part transparency should always be exactly zero.", table.concat(List1, ", "))
		}
	else
		return true, {}
	end
end

return function(Object, p5)
	-- upvalues: checkPartsTransparency (copy), BoundsCalculatorModule (copy), GetEditableMeshFromContextModule (copy), GetExpectedPartSizeModule (copy), getCombinedMeshData (copy), FailureReasonsAccumulatorModule (copy), getViews (copy), ConstantsTransparencyValidationModule (copy), getScaleFactor (copy), RasterUtilModule (copy), getOpacity (copy), AnalyticsModule (copy)
	local AssetTypeEnum = p5.assetTypeEnum
	local List = {}
	
	if Object:IsA("MeshPart") and p5.assetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(List, Object)
	else
		assert(Object:IsA("Folder") and p5.assetTypeEnum ~= Enum.AssetType.DynamicHead, string.format("BodyPart %s is not in the correct format.", Object:GetFullName()))
		
		for _, Part in Object:GetChildren() do
			assert(Part:IsA("MeshPart"), string.format("BodyPart %s contained child that is not a MeshPart.", Object:GetFullName()))
			table.insert(List, Part)
		end
	end
	local CheckPartsTransparencyResult, CheckPartsTransparencyResult2 = checkPartsTransparency(List)
	
	if not CheckPartsTransparencyResult then
		return false, CheckPartsTransparencyResult2
	end
	local IndividualAssetPartsData, IndividualAssetPartsData2, IndividualAssetPartsData3 = BoundsCalculatorModule.calculateIndividualAssetPartsData(Object, p5)
	
	if not IndividualAssetPartsData then
		return false, IndividualAssetPartsData2
	end
	local t = {}
	local config = {
		min = vector.create(1e999, 1e999, 1e999),
		max = vector.create(-1e999, -1e999, -1e999)
	}
	
	for _, value in List do
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(value, "MeshId", p5)
		
		if not MeshId then
			return false, {
				string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", value.Name)
			}
		end
		MeshId2:Triangulate()
		getCombinedMeshData(MeshId2, t, IndividualAssetPartsData3[value.Name].cframe, config, GetExpectedPartSizeModule(value, p5) / GetExpectedPartSizeModule(value, p5, true), p5)
	end
	if (config.max - config.min).Magnitude == 0 then
		return false, {
			string.format("Meshes %s should not have zero size", AssetTypeEnum.Name)
		}
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for _, value1 in getViews() do
		if #t == 0 then
			NewFailureReasonsAccumulator:updateReasons(false, {
				string.format("Mesh for %s has no triangles.", AssetTypeEnum.Name)
			})
		else
			local MaxDelta = config.max - config.min
			local RasterMeshResult = RasterUtilModule.rasterMesh(t, Vector2.new(ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE) * getScaleFactor(MaxDelta, value1.viewId), value1, config.min + MaxDelta / 2, MaxDelta, p5)
			local ASSETTRANSPARENCYTHRESHOLDEntry = ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[AssetTypeEnum][value1.viewId]
			local Opacity, Opacity2 = getOpacity(RasterMeshResult)
			
			if Opacity then
				if Opacity2 < ASSETTRANSPARENCYTHRESHOLDEntry then
					NewFailureReasonsAccumulator:updateReasons(false, {
						string.format("%s is not opaque enough from the %s. Opacity is %.2f but needs to be above %.2f.", AssetTypeEnum.Name, value1.viewId, Opacity2, ASSETTRANSPARENCYTHRESHOLDEntry)
					})
				end
				RasterMeshResult:Destroy()
			else
				NewFailureReasonsAccumulator:updateReasons(false, {
					string.format("Mesh for %s is completely invisible.", AssetTypeEnum.Name)
				})
				RasterMeshResult:Destroy()
			end
		end
	end
	if not NewFailureReasonsAccumulator:getFinalResults() then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAssetTransparency_AssetTransparencyThresholds, nil, p5)
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end