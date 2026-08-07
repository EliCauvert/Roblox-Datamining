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

local function getViews() --[[ line: 23 ]]
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

local function _(p0, p1) --[[ line: 64 | named "getAspectRatio" ]]
	-- upvalues: constantsTransparencyValidationModule (ref)
	return if p1 == constantsTransparencyValidationModule.CAMERA_ANGLES.Front or p1 == constantsTransparencyValidationModule.CAMERA_ANGLES.Back then p0.X / p0.Y elseif p1 == constantsTransparencyValidationModule.CAMERA_ANGLES.Left or p1 == constantsTransparencyValidationModule.CAMERA_ANGLES.Right then p0.Z / p0.Y else p0.X / p0.Z
end

local function getScaleFactor(p2, p3) --[[ line: 81 ]]
	-- upvalues: constantsTransparencyValidationModule (ref)
	local var17, ASSET_TRANSPARENCY_RASTER_SIZE
	local var16 = if p3 == constantsTransparencyValidationModule.CAMERA_ANGLES.Front or p3 == constantsTransparencyValidationModule.CAMERA_ANGLES.Back then p2.X / p2.Y elseif p3 == constantsTransparencyValidationModule.CAMERA_ANGLES.Left or p3 == constantsTransparencyValidationModule.CAMERA_ANGLES.Right then p2.Z / p2.Y else p2.X / p2.Z
	local _ = nil
	local _ = nil
	
	if var16 > 1 then
		var17 = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE / var16
		ASSET_TRANSPARENCY_RASTER_SIZE = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	elseif var16 < 1 then
		ASSET_TRANSPARENCY_RASTER_SIZE = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE * var16
		var17 = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	else
		ASSET_TRANSPARENCY_RASTER_SIZE = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
		var17 = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	end
	local vector2 = Vector2.new(ASSET_TRANSPARENCY_RASTER_SIZE / constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, var17 / constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE)
	local maxValue = math.max(vector2.X, vector2.Y)
	
	return if maxValue > 1 then vector2 / maxValue else vector2
end

local function addTransformedTriangle(vectorA, vectorB, p4, p5, p6) --[[ line: 108 ]]
	-- upvalues: transparencyUtilModule (ref)
	local t = { orderedVerts = {} }
	local var21 = vectorA:GetFaceVertices(p4)
	local var22, var23, var24, var25 = transparencyUtilModule.transformTriangleToWorld(vectorA:GetPosition(var21[1]), vectorA:GetPosition(var21[2]), vectorA:GetPosition(var21[3]), p5, p6)
	table.insert(t.orderedVerts, var22)
	table.insert(t.orderedVerts, var23)
	table.insert(t.orderedVerts, var24)
	t.normal = var25
	table.insert(vectorB, t)
	
	return t
end

local function updateMinMaxBounds(a, b) --[[ line: 137 ]]
	local x = a.min.X
	local x_1 = a.max.X
	local y = a.min.Y
	local y_1 = a.max.Y
	local z = a.min.Z
	local z_1 = a.max.Z
	local var26 = b.orderedVerts[1]
	local var27 = b.orderedVerts[2]
	local var28 = b.orderedVerts[3]
	local minValue = math.min(var26.X, var27.X, var28.X, x)
	local maxValue = math.max(var26.X, var27.X, var28.X, x_1)
	local minValue_1 = math.min(var26.Y, var27.Y, var28.Y, y)
	local maxValue_1 = math.max(var26.Y, var27.Y, var28.Y, y_1)
	local maxValue_2 = math.max(var26.Z, var27.Z, var28.Z, z_1)
	a.min = Vector3.new(minValue, minValue_1, math.min(var26.Z, var27.Z, var28.Z, z))
	a.max = Vector3.new(maxValue, maxValue_1, maxValue_2)
end

local function getCombinedMeshData(p7, p8, p9, p10, p11, p12) --[[ line: 160 ]]
	-- upvalues: addTransformedTriangle (ref), updateMinMaxBounds (ref), tryYieldModule (ref)
	for i, v in p7:GetFaces() do
		updateMinMaxBounds(p10, addTransformedTriangle(p7, p8, v, p9, p11))
		tryYieldModule(p12)
	end
end

local function getOpacity(p13) --[[ line: 176 ]]
	local var34 = p13:ReadPixelsBuffer(Vector2.new(0, 0), p13.Size)
	local var35 = 0
	local var36 = 0
	
	for i = 0, buffer.len(var34) - 1, 4 do
		if buffer.readu8(var34, i) == 0 and buffer.readu8(var34, i + 1) == 0 and buffer.readu8(var34, i + 2) == 0 then
			var36 += 1
		end
		var35 += 1
	end
	if var35 == 0 then
		return false, 0
	end
	return true, 1 - var36 / var35
end

local function checkPartsTransparency(p14) --[[ line: 199 ]]
	local t = {}
	
	for i, v in p14 do
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

return function(value, p15) --[[ line: 220 | named "validateAssetTransparency" ]]
	-- upvalues: checkPartsTransparency (ref), boundsCalculatorModule (ref), getEditableMeshFromContextModule (ref), getExpectedPartSizeModule (ref), getCombinedMeshData (ref), failureReasonsAccumulatorModule (ref), getViews (ref), constantsTransparencyValidationModule (ref), getScaleFactor (ref), rasterUtilModule (ref), getOpacity (ref), analyticsModule (ref)
	local assetTypeEnum = p15.assetTypeEnum
	local t = {}
	
	if value:IsA("MeshPart") and p15.assetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(t, value)
	else
		assert(value:IsA("Folder") and p15.assetTypeEnum ~= Enum.AssetType.DynamicHead, string.format("BodyPart %s is not in the correct format.", value:GetFullName()))
		
		for i, v in value:GetChildren() do
			assert(v:IsA("MeshPart"), string.format("BodyPart %s contained child that is not a MeshPart.", value:GetFullName()))
			table.insert(t, v)
		end
	end
	local var39, var40 = checkPartsTransparency(t)
	
	if not var39 then
		return false, var40
	end
	local var41, var42, var43 = boundsCalculatorModule.calculateIndividualAssetPartsData(value, p15)
	
	if not var41 then
		return false, var42
	end
	local t_1 = {}
	local t_2 = {
		min = Vector3.new(1e999, 1e999, 1e999),
		max = Vector3.new(-1e999, -1e999, -1e999)
	}
	
	for i, v in t do
		local i_1, var51 = getEditableMeshFromContextModule(v, "MeshId", p15)
		
		if i_1 then
			var51:Triangulate()
			getCombinedMeshData(var51, t_1, var43[v.Name].cframe, t_2, getExpectedPartSizeModule(v, p15) / getExpectedPartSizeModule(v, p15, true), p15)
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
	local var46 = failureReasonsAccumulatorModule.new()
	
	for i_1, v_1 in getViews() do
		if #t_1 == 0 then
			var46:updateReasons(false, {
				string.format("Mesh for %s has no triangles.", assetTypeEnum.Name)
			})
		else
			local var47 = t_2.max - t_2.min
			local var48 = rasterUtilModule.rasterMesh(t_1, Vector2.new(constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE) * getScaleFactor(var47, v_1.viewId), v_1, t_2.min + var47 / 2, var47, p15)
			local viewId = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[assetTypeEnum][v_1.viewId]
			local var49, var50 = getOpacity(var48)
			
			if var49 then
				if var50 < viewId then
					var46:updateReasons(false, {
						string.format("%s is not opaque enough from the %s. Opacity is %.2f but needs to be above %.2f.", assetTypeEnum.Name, v_1.viewId, var50, viewId)
					})
				end
				var48:Destroy()
			else
				var46:updateReasons(false, {
					string.format("Mesh for %s is completely invisible.", assetTypeEnum.Name)
				})
				var48:Destroy()
			end
		end
	end
	if not var46:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetTransparency_AssetTransparencyThresholds, nil, p15)
	end
	return var46:getFinalResults()
end