local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local tryYieldModule = require(parent.util.tryYield)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local rasterUtilModule = require(parent.util.RasterUtil)
local transparencyUtilModule = require(parent.util.TransparencyUtil)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local constantsTransparencyValidationModule = require(parent.ConstantsTransparencyValidation)

local function getViews()
	-- upvalues: constantsTransparencyValidationModule (ref)
	return {
		{
			axis1 = Vector3.new(1, 0, 0),
			axis2 = Vector3.new(0, 1, 0),
			normal = Vector3.new(0, 0, 1),
			viewId = constantsTransparencyValidationModule.CAMERA_ANGLES.Front
		},
		{
			axis1 = Vector3.new(1, 0, 0),
			axis2 = Vector3.new(0, 1, 0),
			normal = Vector3.new(0, 0, -1),
			viewId = constantsTransparencyValidationModule.CAMERA_ANGLES.Back
		},
		{
			axis1 = Vector3.new(0, 0, 1),
			axis2 = Vector3.new(0, 1, 0),
			normal = Vector3.new(-1, 0, 0),
			viewId = constantsTransparencyValidationModule.CAMERA_ANGLES.Left
		},
		{
			axis1 = Vector3.new(0, 0, 1),
			axis2 = Vector3.new(0, 1, 0),
			normal = Vector3.new(1, 0, 0),
			viewId = constantsTransparencyValidationModule.CAMERA_ANGLES.Right
		},
		{
			axis1 = Vector3.new(1, 0, 0),
			axis2 = Vector3.new(0, 0, 1),
			normal = Vector3.new(0, -1, 0),
			viewId = constantsTransparencyValidationModule.CAMERA_ANGLES.Top
		},
		{
			axis1 = Vector3.new(1, 0, 0),
			axis2 = Vector3.new(0, 0, 1),
			normal = Vector3.new(0, 1, 0),
			viewId = constantsTransparencyValidationModule.CAMERA_ANGLES.Bottom
		}
	}
end

local function _(p1, p2)
	-- upvalues: constantsTransparencyValidationModule (ref)
	return if p2 == constantsTransparencyValidationModule.CAMERA_ANGLES.Front or p2 == constantsTransparencyValidationModule.CAMERA_ANGLES.Back then p1.X / p1.Y elseif p2 == constantsTransparencyValidationModule.CAMERA_ANGLES.Left or p2 == constantsTransparencyValidationModule.CAMERA_ANGLES.Right then p1.Z / p1.Y else p1.X / p1.Z
end

local function getScaleFactor(p1, p2)
	-- upvalues: constantsTransparencyValidationModule (ref)
	local var1, ASSET_TRANSPARENCY_RASTER_SIZE
	local var2 = if p2 == constantsTransparencyValidationModule.CAMERA_ANGLES.Front or p2 == constantsTransparencyValidationModule.CAMERA_ANGLES.Back then p1.X / p1.Y elseif p2 == constantsTransparencyValidationModule.CAMERA_ANGLES.Left or p2 == constantsTransparencyValidationModule.CAMERA_ANGLES.Right then p1.Z / p1.Y else p1.X / p1.Z
	local _ = nil
	local _ = nil
	
	if var2 > 1 then
		var1 = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE / var2
		ASSET_TRANSPARENCY_RASTER_SIZE = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	elseif var2 < 1 then
		ASSET_TRANSPARENCY_RASTER_SIZE = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE * var2
		var1 = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	else
		ASSET_TRANSPARENCY_RASTER_SIZE = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
		var1 = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	end
	local vector2 = Vector2.new(ASSET_TRANSPARENCY_RASTER_SIZE / constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, var1 / constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE)
	local maxValue = math.max(vector2.X, vector2.Y)
	
	return if maxValue > 1 then vector2 / maxValue else vector2
end

local function addTransformedTriangle(vectorA, vectorB, p1, p2, p3)
	-- upvalues: transparencyUtilModule (ref)
	local t = { orderedVerts = {} }
	local var1 = vectorA:GetFaceVertices(p1)
	local var2, var3, var4, var5 = transparencyUtilModule.transformTriangleToWorld(vectorA:GetPosition(var1[1]), vectorA:GetPosition(var1[2]), vectorA:GetPosition(var1[3]), p2, p3)
	table.insert(t.orderedVerts, var2)
	table.insert(t.orderedVerts, var3)
	table.insert(t.orderedVerts, var4)
	t.normal = var5
	table.insert(vectorB, t)
	
	return t
end

local function updateMinMaxBounds(a, b)
	local x = a.min.X
	local x_1 = a.max.X
	local y = a.min.Y
	local y_1 = a.max.Y
	local z = a.min.Z
	local z_1 = a.max.Z
	local var1 = b.orderedVerts[1]
	local var2 = b.orderedVerts[2]
	local var3 = b.orderedVerts[3]
	local minValue = math.min(var1.X, var2.X, var3.X, x)
	local maxValue = math.max(var1.X, var2.X, var3.X, x_1)
	local minValue_1 = math.min(var1.Y, var2.Y, var3.Y, y)
	local maxValue_1 = math.max(var1.Y, var2.Y, var3.Y, y_1)
	local maxValue_2 = math.max(var1.Z, var2.Z, var3.Z, z_1)
	a.min = Vector3.new(minValue, minValue_1, math.min(var1.Z, var2.Z, var3.Z, z))
	a.max = Vector3.new(maxValue, maxValue_1, maxValue_2)
end

local function getCombinedMeshData(p1, p2, p3, p4, p5, p6)
	-- upvalues: addTransformedTriangle (ref), updateMinMaxBounds (ref), tryYieldModule (ref)
	for i, v in p1:GetFaces() do
		updateMinMaxBounds(p4, addTransformedTriangle(p1, p2, v, p3, p5))
		tryYieldModule(p6)
	end
end

local function getOpacity(p7)
	local var1 = p7:ReadPixelsBuffer(Vector2.new(0, 0), p7.Size)
	local var2 = 0
	local var3 = 0
	
	for i = 0, buffer.len(var1) - 1, 4 do
		if buffer.readu8(var1, i) == 0 and buffer.readu8(var1, i + 1) == 0 and buffer.readu8(var1, i + 2) == 0 then
			var3 += 1
		end
		var2 += 1
	end
	if var2 == 0 then
		return false, 0
	end
	return true, 1 - var3 / var2
end

local function checkPartsTransparency(p8)
	local t = {}
	
	for i, v in p8 do
		if v.Transparency ~= 0 then
			table.insert(t, v.Name)
		end
	end
	if #t > 0 then
		return false, {
			string.format("The following parts have a non-zero transparency: %s. Part transparency should always be exactly zero.", table.concat(t, ", "))
		}
	end
	return true, {}
end

return function(value, p9)
	-- upvalues: checkPartsTransparency (ref), boundsCalculatorModule (ref), getEditableMeshFromContextModule (ref), getExpectedPartSizeModule (ref), getCombinedMeshData (ref), failureReasonsAccumulatorModule (ref), getViews (ref), constantsTransparencyValidationModule (ref), getScaleFactor (ref), rasterUtilModule (ref), getOpacity (ref), analyticsModule (ref)
	local assetTypeEnum = p9.assetTypeEnum
	local t = {}
	
	if value:IsA("MeshPart") and p9.assetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(t, value)
	else
		assert(value:IsA("Folder") and p9.assetTypeEnum ~= Enum.AssetType.DynamicHead, string.format("BodyPart %s is not in the correct format.", value:GetFullName()))
		
		for i, v in value:GetChildren() do
			assert(v:IsA("MeshPart"), string.format("BodyPart %s contained child that is not a MeshPart.", value:GetFullName()))
			table.insert(t, v)
		end
	end
	local var4, var5 = checkPartsTransparency(t)
	
	if not var4 then
		return false, var5
	end
	local var6, var7, var8 = boundsCalculatorModule.calculateIndividualAssetPartsData(value, p9)
	
	if not var6 then
		return false, var7
	end
	local t_1 = {}
	local t_2 = {
		min = Vector3.new(1e999, 1e999, 1e999),
		max = Vector3.new(-1e999, -1e999, -1e999)
	}
	
	for i, v in t do
		local i_1, var9 = getEditableMeshFromContextModule(v, "MeshId", p9)
		
		if i_1 then
			var9:Triangulate()
			getCombinedMeshData(var9, t_1, var8[v.Name].cframe, t_2, getExpectedPartSizeModule(v, p9) / getExpectedPartSizeModule(v, p9, true), p9)
			continue
		end
		return false, {
			string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v.Name)
		}
	end
	if (t_2.max - t_2.min).Magnitude == 0 then
		return false, {
			string.format("Meshes %s should not have zero size", assetTypeEnum.Name)
		}
	end
	local var10 = failureReasonsAccumulatorModule.new()
	
	for i_1, v_1 in getViews() do
		if #t_1 == 0 then
			var10:updateReasons(false, {
				string.format("Mesh for %s has no triangles.", assetTypeEnum.Name)
			})
		else
			local var11 = t_2.max - t_2.min
			local var12 = rasterUtilModule.rasterMesh(t_1, Vector2.new(constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE) * getScaleFactor(var11, v_1.viewId), v_1, t_2.min + var11 / 2, var11, p9)
			local viewId = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[assetTypeEnum][v_1.viewId]
			local var13, var14 = getOpacity(var12)
			
			if var13 then
				if var14 < viewId then
					var10:updateReasons(false, {
						string.format("%s is not opaque enough from the %s. Opacity is %.2f but needs to be above %.2f.", assetTypeEnum.Name, v_1.viewId, var14, viewId)
					})
				end
				var12:Destroy()
			else
				var10:updateReasons(false, {
					string.format("Mesh for %s is completely invisible.", assetTypeEnum.Name)
				})
				var12:Destroy()
			end
		end
	end
	if not var10:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetTransparency_AssetTransparencyThresholds, nil, p9)
	end
	return var10:getFinalResults()
end