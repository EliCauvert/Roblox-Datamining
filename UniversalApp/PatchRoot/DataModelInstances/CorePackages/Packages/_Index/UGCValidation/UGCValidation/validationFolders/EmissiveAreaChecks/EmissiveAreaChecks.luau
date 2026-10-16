local Parent = script.Parent.Parent.Parent
local AssetService = game:GetService("AssetService")
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUGCValidateMaxEmissivePercentageBodyModule = require(Parent.flags.getFIntUGCValidateMaxEmissivePercentageBody)
local GetFIntUGCValidateMaxEmissivePercentageDynamicHeadModule = require(Parent.flags.getFIntUGCValidateMaxEmissivePercentageDynamicHead)
local GetFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule = require(Parent.flags.getFIntUGCValidateMaxEmissiveAreaRigidAccessory)
local GetFIntUGCValidateMaxEmissiveAreaLayeredClothingModule = require(Parent.flags.getFIntUGCValidateMaxEmissiveAreaLayeredClothing)
local GetFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule = require(Parent.flags.getFIntUGCValidateEmissiveR15BlockyBoundingBoxVolume)
local GetFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule = require(Parent.flags.getFIntUGCValidationMaxEmissiveStrengthForAreaChecks)
local GetFFlagUGCValidateEmissiveFixAreaChecksModule = require(Parent.flags.getFFlagUGCValidateEmissiveFixAreaChecks)
local GetFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule = require(Parent.flags.getFFlagUGCValidateEmissiveAreaChecksFixedAlgo)

local function _(p1, ChildName) --[[ Line: 44 | Named "getEmissiveStrength" ]]
	local RootInstance = p1.rootInstance
	
	if RootInstance.Name ~= ChildName then
		RootInstance = p1.rootInstance:FindFirstChild(ChildName, true)
	end
	if RootInstance then
		local SurfaceAppearance = RootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
		
		return if SurfaceAppearance then SurfaceAppearance.EmissiveStrength else 0
	else
		return 0
	end
end

local function getWeightedAreaForTextures(p1, Editable, Editable1) --[[ Line: 56 ]]
	local Editable2 = p1.editable
	local Size = Editable.Size
	local PixelsBuffer = Editable:ReadPixelsBuffer(Vector2.zero, Size)
	local PixelsBuffer1 = if Editable1 then Editable1:ReadPixelsBuffer(Vector2.zero, Editable1.Size) else nil
	local Total = 0
	local Total1 = 0
	
	for _, face in Editable2:GetFaces() do
		local FaceVertices = Editable2:GetFaceVertices(face)
		local Position = Editable2:GetPosition(FaceVertices[1])
		local ScaledMagnitude = ((Editable2:GetPosition(FaceVertices[2]) - Position) * p1.scale):Cross((Editable2:GetPosition(FaceVertices[3]) - Position) * p1.scale).Magnitude * 0.5
		
		if ScaledMagnitude ~= 0 then
			Total1 += ScaledMagnitude
			local FaceUVs = Editable2:GetFaceUVs(face)
			local UV = Editable2:GetUV(FaceUVs[1])
			local UV1 = Editable2:GetUV(FaceUVs[2])
			local UV2 = Editable2:GetUV(FaceUVs[3])
			
			if UV and UV1 and UV2 then
				local UVRatio = (UV + UV1 + UV2) / 3
				local ByteValue = buffer.readu8(PixelsBuffer, (math.floor(UVRatio.Y % 1 * Size.Y) * Size.X + math.floor(UVRatio.X % 1 * Size.X)) * 4)
				local ByteValueRatio = 1
				
				if Editable1 then
					local Size1 = Editable1.Size
					local ScaledFloored = (math.floor(UVRatio.Y % 1 * Size1.Y) * Size1.X + math.floor(UVRatio.X % 1 * Size1.X)) * 4
					ByteValueRatio = (buffer.readu8(PixelsBuffer1, ScaledFloored) + buffer.readu8(PixelsBuffer1, ScaledFloored + 1) + buffer.readu8(PixelsBuffer1, ScaledFloored + 2)) / 765
				end
				Total += ScaledMagnitude * ByteValue * ByteValueRatio
			end
		end
	end
	return Total / 255, Total1
end

local function getTotalEmissiveSurfaceArea(p2, Editable) --[[ Line: 115 ]]
	local Editable1 = p2.editable
	local Size = Editable.Size
	local PixelsBuffer = Editable:ReadPixelsBuffer(Vector2.zero, Size)
	local Total = 0
	local NewByteValue = 0
	
	for _, face in Editable1:GetFaces() do
		local FaceVertices = Editable1:GetFaceVertices(face)
		local Position = Editable1:GetPosition(FaceVertices[1])
		local ScaledMagnitude = ((Editable1:GetPosition(FaceVertices[2]) - Position) * p2.scale):Cross((Editable1:GetPosition(FaceVertices[3]) - Position) * p2.scale).Magnitude * 0.5
		
		if ScaledMagnitude ~= 0 then
			local FaceUVs = Editable1:GetFaceUVs(face)
			local UV = Editable1:GetUV(FaceUVs[1])
			local UV1 = Editable1:GetUV(FaceUVs[2])
			local UV2 = Editable1:GetUV(FaceUVs[3])
			
			if UV and UV1 and UV2 then
				local UVRatio = (UV + UV1 + UV2) / 3
				Total += ScaledMagnitude
				NewByteValue += ScaledMagnitude * buffer.readu8(PixelsBuffer, (math.floor(UVRatio.Y % 1 * Size.Y) * Size.X + math.floor(UVRatio.X % 1 * Size.X)) * 4)
			end
		end
	end
	return NewByteValue / 255, Total
end

local _ = function(p3, p4, p5, ChildName) --[[ Line: 152 | Named "getEmissiveFraction" ]]
	-- upvalues: getTotalEmissiveSurfaceArea (copy), GetFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule (copy)
	local TotalEmissiveSurfaceArea, TotalEmissiveSurfaceArea2 = getTotalEmissiveSurfaceArea(p3, p4)
	
	if TotalEmissiveSurfaceArea2 <= 0 then
		return 0
	end
	local TotalEmissiveSurfaceAreaRatio = TotalEmissiveSurfaceArea / TotalEmissiveSurfaceArea2
	local RootInstance = p5.rootInstance
	
	if RootInstance.Name ~= ChildName then
		RootInstance = p5.rootInstance:FindFirstChild(ChildName, true)
	end
	local EmissiveStrength = nil
	if RootInstance then
		local SurfaceAppearance = RootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
		EmissiveStrength = if SurfaceAppearance then SurfaceAppearance.EmissiveStrength else 0
	else
		EmissiveStrength = 0
	end
	return TotalEmissiveSurfaceAreaRatio * EmissiveStrength / GetFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
end

local _ = function(p3, p4, p5, p6) --[[ Line: 168 | Named "getTotalEmissiveArea" ]]
	-- upvalues: getWeightedAreaForTextures (copy)
	local ColorMap = p5.meshTextures[p6].ColorMap
	
	return getWeightedAreaForTextures(p3, p4.editable, if ColorMap then ColorMap.editable else nil)
end

local function runEmissiveAreaChecks(p3, p4) --[[ Line: 184 ]]
	-- upvalues: getWeightedAreaForTextures (copy), GetFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule (copy), ValidationEnumsModule (copy), GetFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule (copy), ErrorSourceStringsModule (copy), GetFIntUGCValidateMaxEmissivePercentageBodyModule (copy), GetFIntUGCValidateMaxEmissivePercentageDynamicHeadModule (copy), AssetService (copy), GetFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule (copy), GetFIntUGCValidateMaxEmissiveAreaLayeredClothingModule (copy)
	for MeshName, value in p4.renderMeshesData do
		local MeshTexture = p4.meshTextures[MeshName]
		local EmissiveMask = if MeshTexture then MeshTexture.EmissiveMask else nil
		
		if EmissiveMask then
			local Name = p4.uploadEnum.assetType.Name
			local ColorMap = p4.meshTextures[MeshName].ColorMap
			local WeightedAreaForTextures, WeightedAreaForTextures2 = getWeightedAreaForTextures(value, EmissiveMask.editable, if ColorMap then ColorMap.editable else nil)
			local EmissiveTint = MeshTexture.EmissiveTint
			local ScaledWeightedAreaForTextures = WeightedAreaForTextures * ((EmissiveTint.R + EmissiveTint.G + EmissiveTint.B) / 3) * (MeshTexture.EmissiveStrength / GetFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule())
			
			if p4.uploadCategory == ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY then
				if GetFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule() < ScaledWeightedAreaForTextures then
					p3:fail(ErrorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceededNew, {
						assetTypeName = Name,
						emissiveArea = string.format("%.2f", ScaledWeightedAreaForTextures),
						maxEmissiveArea = tostring(GetFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule())
					})
				end
			elseif p4.uploadCategory == ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS or p4.uploadCategory == ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD then
				local ScaledWeightedAreaForTexturesRatio = ScaledWeightedAreaForTextures / WeightedAreaForTextures2
				local FIntUGCValidateMaxEmissivePercentageDynamicHeadModule = if p4.uploadCategory == ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD then GetFIntUGCValidateMaxEmissivePercentageDynamicHeadModule() else GetFIntUGCValidateMaxEmissivePercentageBodyModule()
				
				if FIntUGCValidateMaxEmissivePercentageDynamicHeadModule / 100 < ScaledWeightedAreaForTexturesRatio then
					p3:fail(ErrorSourceStringsModule.Keys.EmissiveArea_AboveThresholdNew, {
						meshName = MeshName,
						emissivePercentage = string.format("%.2f", ScaledWeightedAreaForTexturesRatio * 100),
						maxEmissivePercentage = tostring(FIntUGCValidateMaxEmissivePercentageDynamicHeadModule)
					})
				end
			else
				local Model = Instance.new("Model")
				AssetService:CreateMeshPartAsync(Content.fromObject(p4.innerCagesData[MeshName].editable)).Parent = Model
				local _, BoundingSize = Model:GetBoundingBox()
				local ScaledScaledWeightedAreaForTextures = ScaledWeightedAreaForTextures * (GetFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule() / (BoundingSize.X * BoundingSize.Y * BoundingSize.Z)) ^ 0.6666666666666666
				
				if GetFIntUGCValidateMaxEmissiveAreaLayeredClothingModule() < ScaledScaledWeightedAreaForTextures then
					p3:fail(ErrorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceededNew, {
						assetTypeName = Name,
						emissiveArea = string.format("%.2f", ScaledScaledWeightedAreaForTextures),
						maxEmissiveArea = tostring(GetFIntUGCValidateMaxEmissiveAreaLayeredClothingModule())
					})
				end
			end
		end
	end
end

return {
	fflag = require(Parent.flags.getFFlagUGCValidateEmissiveAreaChecks),
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.renderMeshesData,
		ValidationEnumsModule.SharedDataMember.innerCagesData,
		ValidationEnumsModule.SharedDataMember.meshTextures,
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadCategory
	},
	expectedFailures = {},
	run = function(p5, p6) --[[ Line: 248 ]]
		-- upvalues: GetFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule (copy), runEmissiveAreaChecks (copy), ValidationEnumsModule (copy), getTotalEmissiveSurfaceArea (copy), GetFFlagUGCValidateEmissiveFixAreaChecksModule (copy), GetFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule (copy), GetFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule (copy), ErrorSourceStringsModule (copy), GetFIntUGCValidateMaxEmissivePercentageBodyModule (copy), GetFIntUGCValidateMaxEmissivePercentageDynamicHeadModule (copy), AssetService (copy), GetFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule (copy), GetFIntUGCValidateMaxEmissiveAreaLayeredClothingModule (copy)
		if GetFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule() then
			runEmissiveAreaChecks(p5, p6)
			
			return
		end
		for ChildName, value in p6.renderMeshesData do
			local MeshTexture = p6.meshTextures[ChildName]
			local EmissiveMask = if MeshTexture then MeshTexture.EmissiveMask else nil
			
			if EmissiveMask then
				if p6.uploadCategory == ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY then
					local TotalEmissiveSurfaceArea = getTotalEmissiveSurfaceArea(value, EmissiveMask.editable)
					
					if GetFFlagUGCValidateEmissiveFixAreaChecksModule() then
						local RootInstance = p6.rootInstance
						
						if RootInstance.Name ~= ChildName then
							RootInstance = p6.rootInstance:FindFirstChild(ChildName, true)
						end
						local EmissiveStrength = nil
						if RootInstance then
							local SurfaceAppearance = RootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
							EmissiveStrength = if SurfaceAppearance then SurfaceAppearance.EmissiveStrength else 0
						else
							EmissiveStrength = 0
						end
						TotalEmissiveSurfaceArea = TotalEmissiveSurfaceArea * EmissiveStrength / GetFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
					end
					if GetFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule() < TotalEmissiveSurfaceArea then
						p5:fail(ErrorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceeded, {
							meshName = ChildName,
							emissiveArea = string.format("%.2f", TotalEmissiveSurfaceArea),
							maxEmissiveArea = tostring(GetFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule())
						})
					end
				elseif p6.uploadCategory == ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS or p6.uploadCategory == ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD then
					local TotalEmissiveSurfaceArea, TotalEmissiveSurfaceArea2 = getTotalEmissiveSurfaceArea(value, EmissiveMask.editable)
					local v1 = nil
					
					if TotalEmissiveSurfaceArea2 > 0 then
						local TotalEmissiveSurfaceAreaRatio = TotalEmissiveSurfaceArea / TotalEmissiveSurfaceArea2
						local RootInstance = p6.rootInstance
						
						if RootInstance.Name ~= ChildName then
							RootInstance = p6.rootInstance:FindFirstChild(ChildName, true)
						end
						local EmissiveStrength = nil
						if RootInstance then
							local SurfaceAppearance = RootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
							EmissiveStrength = if SurfaceAppearance then SurfaceAppearance.EmissiveStrength else 0
						else
							EmissiveStrength = 0
						end
						v1 = TotalEmissiveSurfaceAreaRatio * EmissiveStrength / GetFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
					else
						v1 = 0
					end
					local FIntUGCValidateMaxEmissivePercentageDynamicHeadModule = if p6.uploadCategory == ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD then GetFIntUGCValidateMaxEmissivePercentageDynamicHeadModule() else GetFIntUGCValidateMaxEmissivePercentageBodyModule()
					
					if FIntUGCValidateMaxEmissivePercentageDynamicHeadModule / 100 < v1 then
						p5:fail(ErrorSourceStringsModule.Keys.EmissiveArea_AboveThreshold, {
							meshName = ChildName,
							emissivePercentage = string.format("%.2f", v1 * 100),
							maxEmissivePercentage = tostring(FIntUGCValidateMaxEmissivePercentageDynamicHeadModule)
						})
					end
				else
					local Model = Instance.new("Model")
					AssetService:CreateMeshPartAsync(Content.fromObject(p6.innerCagesData[ChildName].editable)).Parent = Model
					local _, BoundingSize = Model:GetBoundingBox()
					local FIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModulePower = ((GetFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule() / (BoundingSize.X * BoundingSize.Y * BoundingSize.Z)) ^ 0.3333333333333333) ^ 2
					local TotalEmissiveSurfaceArea1 = getTotalEmissiveSurfaceArea(value, EmissiveMask.editable)
					
					if GetFFlagUGCValidateEmissiveFixAreaChecksModule() then
						local RootInstance = p6.rootInstance
						
						if RootInstance.Name ~= ChildName then
							RootInstance = p6.rootInstance:FindFirstChild(ChildName, true)
						end
						local EmissiveStrength = nil
						if RootInstance then
							local SurfaceAppearance = RootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
							EmissiveStrength = if SurfaceAppearance then SurfaceAppearance.EmissiveStrength else 0
						else
							EmissiveStrength = 0
						end
						TotalEmissiveSurfaceArea1 = TotalEmissiveSurfaceArea1 * EmissiveStrength / GetFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
					end
					local ScaledTotalEmissiveSurfaceArea = TotalEmissiveSurfaceArea1 * FIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModulePower
					
					if GetFIntUGCValidateMaxEmissiveAreaLayeredClothingModule() < ScaledTotalEmissiveSurfaceArea then
						p5:fail(ErrorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceeded, {
							meshName = ChildName,
							emissiveArea = string.format("%.2f", ScaledTotalEmissiveSurfaceArea),
							maxEmissiveArea = tostring(GetFIntUGCValidateMaxEmissiveAreaLayeredClothingModule())
						})
					end
				end
			end
		end
	end
}