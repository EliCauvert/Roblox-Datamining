local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local RasterUtilModule = require(Parent.util.RasterUtil)
local TransparencyUtilModule = require(Parent.util.TransparencyUtil)
local TryYieldModule = require(Parent.util.tryYield)
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

local function addTransformedTriangle(Editable, List, FaceId, p1, SizeRatio)
	-- upvalues: TransparencyUtilModule (copy)
	local config = { orderedVerts = {} }
	local FaceVertices = Editable:GetFaceVertices(FaceId)
	local TransformTriangleToWorldResult, TransformTriangleToWorldResult2, TransformTriangleToWorldResult3, TransformTriangleToWorldResult4 = TransparencyUtilModule.transformTriangleToWorld(Editable:GetPosition(FaceVertices[1]), Editable:GetPosition(FaceVertices[2]), Editable:GetPosition(FaceVertices[3]), p1, SizeRatio)
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

local config = {
	[Enum.AssetType.LeftArm] = true,
	[Enum.AssetType.RightArm] = true,
	[Enum.AssetType.LeftLeg] = true,
	[Enum.AssetType.RightLeg] = true
}

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), ErrorSourceStringsModule (copy), AssetCalculatorModule (copy), config (copy), addTransformedTriangle (copy), updateMinMaxBounds (copy), TryYieldModule (copy), getViews (copy), ConstantsTransparencyValidationModule (copy), getScaleFactor (copy), RasterUtilModule (copy), getOpacity (copy)
		local RootInstance = p2.rootInstance
		local AssetType = p2.uploadEnum.assetType
		local RenderMeshesData = p2.renderMeshesData
		local config1 = {
			shouldYield = p2.consumerConfig.validationEnv ~= ValidationEnumsModule.ValidationEnv.Backend,
			lastTickSeconds = tick()
		}
		local List = {}
		
		if RootInstance:IsA("MeshPart") and AssetType == Enum.AssetType.DynamicHead then
			table.insert(List, RootInstance)
		else
			for _, Part in RootInstance:GetChildren() do
				if Part:IsA("MeshPart") then
					table.insert(List, Part)
				end
			end
		end
		local List1 = {}
		
		for _, value in List do
			if value.Transparency ~= 0 then
				table.insert(List1, value.Name)
			end
		end
		if #List1 > 0 then
			for _, PartName in List1 do
				p1:fail(ErrorSourceStringsModule.Keys.AssetOpacity_NonZeroTransparency, { PartName = PartName })
			end
			return
		else
			local AllTransformsForAsset = AssetCalculatorModule.calculateAllTransformsForAsset(AssetType, RootInstance)
			
			if config[AssetType] then
				for i, value1 in AssetCalculatorModule.calculateStraightenedLimb(AssetType, AllTransformsForAsset, function(ChildName)
					-- upvalues: RootInstance (copy)
					return (RootInstance:FindFirstChild(ChildName))
				end) do
					AllTransformsForAsset[i] = value1
				end
			end
			local t = {}
			local config2 = {
				min = vector.create(1e999, 1e999, 1e999),
				max = vector.create(-1e999, -1e999, -1e999)
			}
			
			for _, value2 in List do
				local RenderMeshes = RenderMeshesData[value2.Name]
				
				if not RenderMeshes then
					p1:fail(ErrorSourceStringsModule.Keys.AssetOpacity_MeshLoadFailed, { PartName = value2.Name })
					
					return
				end
				local Editable = RenderMeshes.editable
				Editable:Triangulate()
				local SizeRatio = value2.Size / value2.MeshSize
				local AllTransformsForAssetEntry = AllTransformsForAsset[value2.Name] or CFrame.new()
				for _, face in Editable:GetFaces() do
					updateMinMaxBounds(config2, (addTransformedTriangle(Editable, t, face, AllTransformsForAssetEntry, SizeRatio)))
					TryYieldModule(config1)
				end
			end
			if (config2.max - config2.min).Magnitude == 0 then
				p1:fail(ErrorSourceStringsModule.Keys.AssetOpacity_ZeroSize, { AssetName = AssetType.Name })
				
				return
			end
			for _, value3 in getViews() do
				if #t == 0 then
					p1:fail(ErrorSourceStringsModule.Keys.AssetOpacity_NoTriangles, { AssetName = AssetType.Name })
				else
					local MaxDelta = config2.max - config2.min
					local RasterMeshResult = RasterUtilModule.rasterMesh(t, Vector2.new(ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE, ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_RASTER_SIZE) * getScaleFactor(MaxDelta, value3.viewId), value3, config2.min + MaxDelta / 2, MaxDelta, config1)
					local ASSETTRANSPARENCYTHRESHOLDEntry = ConstantsTransparencyValidationModule.ASSET_TRANSPARENCY_THRESHOLDS[AssetType][value3.viewId]
					local Opacity, Opacity2 = getOpacity(RasterMeshResult)
					
					if Opacity then
						if Opacity2 < ASSETTRANSPARENCYTHRESHOLDEntry then
							p1:fail(ErrorSourceStringsModule.Keys.AssetOpacity_BelowThreshold, {
								AssetName = AssetType.Name,
								ViewName = value3.viewId,
								Opacity = string.format("%.2f", Opacity2),
								Threshold = string.format("%.2f", ASSETTRANSPARENCYTHRESHOLDEntry)
							})
						end
						RasterMeshResult:Destroy()
					else
						p1:fail(ErrorSourceStringsModule.Keys.AssetOpacity_Invisible, { AssetName = AssetType.Name })
						RasterMeshResult:Destroy()
					end
				end
			end
		end
	end
}