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

local function getOpacity(p1)
	local var1 = p1:ReadPixelsBuffer(Vector2.new(0, 0), p1.Size)
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

local t_1 = {
	[Enum.AssetType.LeftArm] = true,
	[Enum.AssetType.RightArm] = true,
	[Enum.AssetType.LeftLeg] = true,
	[Enum.AssetType.RightLeg] = true
}

function t.run(p2, p3)
	-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref), assetCalculatorModule (ref), t_1 (ref), addTransformedTriangle (ref), updateMinMaxBounds (ref), tryYieldModule (ref), getViews (ref), constantsTransparencyValidationModule (ref), getScaleFactor (ref), rasterUtilModule (ref), getOpacity (ref)
	local rootInstance = p3.rootInstance
	local assetType = p3.uploadEnum.assetType
	local renderMeshesData = p3.renderMeshesData
	local t = {
		shouldYield = p3.consumerConfig.consumerEnv ~= validationEnumsModule.ConsumerEnv.Backend,
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
			p2:fail(errorSourceStringsModule.Keys.AssetOpacity_NonZeroTransparency, { PartName = v_1 })
		end
		return
	else
		local var4 = assetCalculatorModule.calculateAllTransformsForAsset(assetType, rootInstance)
		
		if t_1[assetType] then
			for i_1, v_1 in assetCalculatorModule.calculateStraightenedLimb(assetType, var4, function(p4)
				-- upvalues: rootInstance (ref)
				return rootInstance:FindFirstChild(p4)
			end) do
				var4[i_1] = v_1
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
				local var5 = v_1.Size / v_1.MeshSize
				local name = var4[v_1.Name] or CFrame.new()
				
				for i_2, v_3 in editable:GetFaces() do
					updateMinMaxBounds(t_5, addTransformedTriangle(editable, t_4, v_3, name, var5))
					tryYieldModule(t)
				end
			end
			p2:fail(errorSourceStringsModule.Keys.AssetOpacity_MeshLoadFailed, { PartName = v_1.Name })
			
			return
		end
		if (t_5.max - t_5.min).Magnitude == 0 then
			p2:fail(errorSourceStringsModule.Keys.AssetOpacity_ZeroSize, { AssetName = assetType.Name })
			
			return
		end
		for i_2, v_2 in getViews() do
			if #t_4 == 0 then
				p2:fail(errorSourceStringsModule.Keys.AssetOpacity_NoTriangles, { AssetName = assetType.Name })
			else
				local var6 = t_5.max - t_5.min
				local var7 = rasterUtilModule.rasterMesh(t_4, Vector2.new(constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, constantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE) * getScaleFactor(var6, v_2.viewId), v_2, t_5.min + var6 / 2, var6, t)
				local viewId = constantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[assetType][v_2.viewId]
				local var8, var9 = getOpacity(var7)
				
				if var8 then
					if var9 < viewId then
						p2:fail(errorSourceStringsModule.Keys.AssetOpacity_BelowThreshold, {
							AssetName = assetType.Name,
							ViewName = v_2.viewId,
							Opacity = string.format("%.2f", var9),
							Threshold = string.format("%.2f", viewId)
						})
					end
					var7:Destroy()
				else
					p2:fail(errorSourceStringsModule.Keys.AssetOpacity_Invisible, { AssetName = assetType.Name })
					var7:Destroy()
				end
			end
		end
	end
end

return t