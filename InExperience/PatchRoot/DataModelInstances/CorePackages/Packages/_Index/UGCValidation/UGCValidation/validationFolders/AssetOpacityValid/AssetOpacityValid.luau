local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local assetCalculatorModule = require(parent.util.AssetCalculator)
local rasterUtilModule = require(parent.util.RasterUtil)
local transparencyUtilModule = require(parent.util.TransparencyUtil)
local tryYieldModule = require(parent.util.tryYield)
local constantsTransparencyValidationModule = require(parent.ConstantsTransparencyValidation)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency),
	expectedFailures = {}
}

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

local function _(p0, p1)
	-- upvalues: constantsTransparencyValidationModule (ref)
	return if p1 == constantsTransparencyValidationModule.CAMERA_ANGLES.Front or p1 == constantsTransparencyValidationModule.CAMERA_ANGLES.Back then p0.X / p0.Y elseif p1 == constantsTransparencyValidationModule.CAMERA_ANGLES.Left or p1 == constantsTransparencyValidationModule.CAMERA_ANGLES.Right then p0.Z / p0.Y else p0.X / p0.Z
end

local function getScaleFactor(p2, p3)
	-- upvalues: constantsTransparencyValidationModule (ref)
	local var15, ASSET_TRANSPARENCY_RASTER_SIZE
	local var14 = if p3 == constantsTransparencyValidationModule.CAMERA_ANGLES.Front or p3 == constantsTransparencyValidationModule.CAMERA_ANGLES.Back then p2.X / p2.Y elseif p3 == constantsTransparencyValidationModule.CAMERA_ANGLES.Left or p3 == constantsTransparencyValidationModule.CAMERA_ANGLES.Right then p2.Z / p2.Y else p2.X / p2.Z
	local _ = nil
	local _ = nil
	
	if var14 > 1 then
		var15 = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE / var14
		ASSET_TRANSPARENCY_RASTER_SIZE = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	elseif var14 < 1 then
		ASSET_TRANSPARENCY_RASTER_SIZE = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE * var14
		var15 = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	else
		ASSET_TRANSPARENCY_RASTER_SIZE = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
		var15 = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE
	end
	local vector2 = Vector2.new(ASSET_TRANSPARENCY_RASTER_SIZE / constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, var15 / constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE)
	local maxValue = math.max(vector2.X, vector2.Y)
	
	return if maxValue > 1 then vector2 / maxValue else vector2
end

local function addTransformedTriangle(vectorA, vectorB, p4, p5, p6)
	-- upvalues: transparencyUtilModule (ref)
	local t = { orderedVerts = {} }
	local var19 = vectorA:GetFaceVertices(p4)
	local var20, var21, var22, var23 = transparencyUtilModule.transformTriangleToWorld(vectorA:GetPosition(var19[1]), vectorA:GetPosition(var19[2]), vectorA:GetPosition(var19[3]), p5, p6)
	table.insert(t.orderedVerts, var20)
	table.insert(t.orderedVerts, var21)
	table.insert(t.orderedVerts, var22)
	t.normal = var23
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
	local var24 = b.orderedVerts[1]
	local var25 = b.orderedVerts[2]
	local var26 = b.orderedVerts[3]
	local minValue = math.min(var24.X, var25.X, var26.X, x)
	local maxValue = math.max(var24.X, var25.X, var26.X, x_1)
	local minValue_1 = math.min(var24.Y, var25.Y, var26.Y, y)
	local maxValue_1 = math.max(var24.Y, var25.Y, var26.Y, y_1)
	local maxValue_2 = math.max(var24.Z, var25.Z, var26.Z, z_1)
	a.min = Vector3.new(minValue, minValue_1, math.min(var24.Z, var25.Z, var26.Z, z))
	a.max = Vector3.new(maxValue, maxValue_1, maxValue_2)
end

local function getOpacity(p7)
	local var32 = p7:ReadPixelsBuffer(Vector2.new(0, 0), p7.Size)
	local var33 = 0
	local var34 = 0
	
	for i = 0, buffer.len(var32) - 1, 4 do
		if buffer.readu8(var32, i) == 0 and buffer.readu8(var32, i + 1) == 0 and buffer.readu8(var32, i + 2) == 0 then
			var34 += 1
		end
		var33 += 1
	end
	if var33 == 0 then
		return false, 0
	end
	return true, 1 - var34 / var33
end

local t_1 = {
	[Enum.AssetType.LeftArm] = true,
	[Enum.AssetType.RightArm] = true,
	[Enum.AssetType.LeftLeg] = true,
	[Enum.AssetType.RightLeg] = true
}

function t.run(p8, p9)
	-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref), assetCalculatorModule (ref), t_1 (ref), addTransformedTriangle (ref), updateMinMaxBounds (ref), tryYieldModule (ref), getViews (ref), constantsTransparencyValidationModule (ref), getScaleFactor (ref), rasterUtilModule (ref), getOpacity (ref)
	local rootInstance = p9.rootInstance
	local assetType = p9.uploadEnum.assetType
	local renderMeshesData = p9.renderMeshesData
	local t = {
		shouldYield = p9.consumerConfig.consumerEnv ~= validationEnumsModule.ConsumerEnv.Backend,
		lastTickSeconds = tick()
	}
	local t_2 = {}
	
	if rootInstance:IsA("MeshPart") and assetType == Enum.AssetType.DynamicHead then
		table.insert(t_2, rootInstance)
	else
		for i, v in rootInstance:GetChildren() do
			if v:IsA("MeshPart") then
				table.insert(t_2, v)
			end
		end
	end
	local t_3 = {}
	
	for i, v in t_2 do
		if v.Transparency ~= 0 then
			table.insert(t_3, v.Name)
		end
	end
	if #t_3 > 0 then
		for i_1, v_1 in t_3 do
			p8:fail(errorSourceStringsModule.Keys.AssetOpacity_NonZeroTransparency, { PartName = v_1 })
		end
		return
	else
		local var38 = assetCalculatorModule.calculateAllTransformsForAsset(assetType, rootInstance)
		
		if t_1[assetType] then
			for i_1, v_1 in assetCalculatorModule.calculateStraightenedLimb(assetType, var38, function(p10)
				-- upvalues: rootInstance (ref)
				return rootInstance:FindFirstChild(p10)
			end) do
				var38[i_1] = v_1
			end
		end
		local v_2
		local t_4 = {}
		local t_5 = {
			min = Vector3.new(1e999, 1e999, 1e999),
			max = Vector3.new(-1e999, -1e999, -1e999)
		}
		
		for i_1, v_1 in t_2 do
			v_2 = renderMeshesData[v_1.Name]
			
			if v_2 then
				local editable = v_2.editable
				editable:Triangulate()
				local var45 = v_1.Size / v_1.MeshSize
				local name = var38[v_1.Name] or CFrame.new()
				
				for i_2, v_3 in editable:GetFaces() do
					updateMinMaxBounds(t_5, addTransformedTriangle(editable, t_4, v_3, name, var45))
					tryYieldModule(t)
				end
			end
			p8:fail(errorSourceStringsModule.Keys.AssetOpacity_MeshLoadFailed, { PartName = v_1.Name })
			
			return
		end
		if (t_5.max - t_5.min).Magnitude == 0 then
			p8:fail(errorSourceStringsModule.Keys.AssetOpacity_ZeroSize, { AssetName = assetType.Name })
			
			return
		end
		for i_2, v_2 in getViews() do
			if #t_4 == 0 then
				p8:fail(errorSourceStringsModule.Keys.AssetOpacity_NoTriangles, { AssetName = assetType.Name })
			else
				local var41 = t_5.max - t_5.min
				local var42 = rasterUtilModule.rasterMesh(t_4, Vector2.new(constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE) * getScaleFactor(var41, v_2.viewId), v_2, t_5.min + var41 / 2, var41, t)
				local viewId = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[assetType][v_2.viewId]
				local var43, var44 = getOpacity(var42)
				
				if var43 then
					if var44 < viewId then
						p8:fail(errorSourceStringsModule.Keys.AssetOpacity_BelowThreshold, {
							AssetName = assetType.Name,
							ViewName = v_2.viewId,
							Opacity = string.format("%.2f", var44),
							Threshold = string.format("%.2f", viewId)
						})
					end
					var42:Destroy()
				else
					p8:fail(errorSourceStringsModule.Keys.AssetOpacity_Invisible, { AssetName = assetType.Name })
					var42:Destroy()
				end
			end
		end
	end
end

return t