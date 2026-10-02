local parent = script.Parent.Parent.Parent
local assetService = game:GetService("AssetService")
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateEmissiveAreaChecksModule = require(parent.flags.getFFlagUGCValidateEmissiveAreaChecks)
local getFIntUGCValidateMaxEmissivePercentageBodyModule = require(parent.flags.getFIntUGCValidateMaxEmissivePercentageBody)
local getFIntUGCValidateMaxEmissivePercentageDynamicHeadModule = require(parent.flags.getFIntUGCValidateMaxEmissivePercentageDynamicHead)
local getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule = require(parent.flags.getFIntUGCValidateMaxEmissiveAreaRigidAccessory)
local getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule = require(parent.flags.getFIntUGCValidateMaxEmissiveAreaLayeredClothing)
local getFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule = require(parent.flags.getFIntUGCValidateEmissiveR15BlockyBoundingBoxVolume)
local getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule = require(parent.flags.getFIntUGCValidationMaxEmissiveStrengthForAreaChecks)
local getFFlagUGCValidateEmissiveFixAreaChecksModule = require(parent.flags.getFFlagUGCValidateEmissiveFixAreaChecks)
local getFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule = require(parent.flags.getFFlagUGCValidateEmissiveAreaChecksFixedAlgo)
local t = {
	fflag = getFFlagUGCValidateEmissiveAreaChecksModule,
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.renderMeshesData,
		validationEnumsModule.SharedDataMember.innerCagesData,
		validationEnumsModule.SharedDataMember.meshTextures,
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadCategory
	},
	expectedFailures = {}
}

local function _(p1, p2)
	local rootInstance = p1.rootInstance
	
	if rootInstance.Name ~= p2 then
		rootInstance = p1.rootInstance:FindFirstChild(p2, true)
	end
	if not rootInstance then
		return 0
	end
	local surfaceAppearance = rootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
	
	return if surfaceAppearance then surfaceAppearance.EmissiveStrength else 0
end

local function getWeightedAreaForTextures(p1, p2, p3)
	local editable = p1.editable
	local size = p2.Size
	local zero = p2:ReadPixelsBuffer(Vector2.zero, size)
	local var1 = if p3 then p3:ReadPixelsBuffer(Vector2.zero, p3.Size) else nil
	local var2 = 0
	local var3 = 0
	
	for i, v in editable:GetFaces() do
		local var4 = editable:GetFaceVertices(v)
		local var5 = editable:GetPosition(var4[1])
		local var6 = ((editable:GetPosition(var4[2]) - var5) * p1.scale):Cross((editable:GetPosition(var4[3]) - var5) * p1.scale).Magnitude * 0.5
		
		if var6 ~= 0 then
			var3 += var6
			local var7 = editable:GetFaceUVs(v)
			local var8 = editable:GetUV(var7[1])
			local var9 = editable:GetUV(var7[2])
			local var10 = editable:GetUV(var7[3])
			
			if var8 and var9 and var10 then
				local var11 = (var8 + var9 + var10) / 3
				local value = buffer.readu8(zero, (math.floor(var11.Y % 1 * size.Y) * size.X + math.floor(var11.X % 1 * size.X)) * 4)
				local var12 = 1
				
				if p3 then
					local size_1 = p3.Size
					local var13 = (math.floor(var11.Y % 1 * size_1.Y) * size_1.X + math.floor(var11.X % 1 * size_1.X)) * 4
					var12 = (buffer.readu8(var1, var13) + buffer.readu8(var1, var13 + 1) + buffer.readu8(var1, var13 + 2)) / 765
				end
				var2 += var6 * value * var12
			end
		end
	end
	return var2 / 255, var3
end

local function getTotalEmissiveSurfaceArea(p4, p5)
	local editable = p4.editable
	local size = p5.Size
	local zero = p5:ReadPixelsBuffer(Vector2.zero, size)
	local var14 = 0
	local var15 = 0
	
	for i, v in editable:GetFaces() do
		local var16 = editable:GetFaceVertices(v)
		local var17 = editable:GetPosition(var16[1])
		local var18 = ((editable:GetPosition(var16[2]) - var17) * p4.scale):Cross((editable:GetPosition(var16[3]) - var17) * p4.scale).Magnitude * 0.5
		
		if var18 ~= 0 then
			local var19 = editable:GetFaceUVs(v)
			local var20 = editable:GetUV(var19[1])
			local var21 = editable:GetUV(var19[2])
			local var22 = editable:GetUV(var19[3])
			
			if var20 and var21 and var22 then
				local var23 = (var20 + var21 + var22) / 3
				var14 += var18
				var15 += var18 * buffer.readu8(zero, (math.floor(var23.Y % 1 * size.Y) * size.X + math.floor(var23.X % 1 * size.X)) * 4)
			end
		end
	end
	return var15 / 255, var14
end

local _ = function(p6, p7, p8, p9)
	-- upvalues: getTotalEmissiveSurfaceArea (ref), getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule (ref)
	local var24, var25 = getTotalEmissiveSurfaceArea(p6, p7)
	
	if var25 <= 0 then
		return 0
	end
	local var26
	local var27 = var24 / var25
	local rootInstance = p8.rootInstance
	
	if rootInstance.Name ~= p9 then
		rootInstance = p8.rootInstance:FindFirstChild(p9, true)
	end
	if rootInstance then
		local surfaceAppearance = rootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
		var26 = if surfaceAppearance then surfaceAppearance.EmissiveStrength else 0
	else
		var26 = 0
	end
	return var27 * var26 / getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
end

local _ = function(p6, p7, p8, p9)
	-- upvalues: getWeightedAreaForTextures (ref)
	local colorMap = p8.meshTextures[p9].ColorMap
	
	return getWeightedAreaForTextures(p6, p7.editable, if colorMap then colorMap.editable else nil)
end

local function runEmissiveAreaChecks(p6, p7)
	-- upvalues: getWeightedAreaForTextures (ref), getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule (ref), validationEnumsModule (ref), getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule (ref), errorSourceStringsModule (ref), getFIntUGCValidateMaxEmissivePercentageBodyModule (ref), getFIntUGCValidateMaxEmissivePercentageDynamicHeadModule (ref), assetService (ref), getFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule (ref), getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule (ref)
	for i, v in p7.renderMeshesData do
		local var24 = p7.meshTextures[i]
		local var25 = if var24 then var24.EmissiveMask else nil
		
		if var25 then
			local name = p7.uploadEnum.assetType.Name
			local colorMap = p7.meshTextures[i].ColorMap
			local var26, var27 = getWeightedAreaForTextures(v, var25.editable, if colorMap then colorMap.editable else nil)
			local var28 = var27
			local emissiveTint = var24.EmissiveTint
			local var29 = var26 * ((emissiveTint.R + emissiveTint.G + emissiveTint.B) / 3) * (var24.EmissiveStrength / getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule())
			
			if p7.uploadCategory == validationEnumsModule.UploadCategory.RIGID_ACCESSORY then
				if getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule() < var29 then
					p6:fail(errorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceededNew, {
						assetTypeName = name,
						emissiveArea = string.format("%.2f", var29),
						maxEmissiveArea = tostring(getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule())
					})
				end
			elseif p7.uploadCategory == validationEnumsModule.UploadCategory.TORSO_AND_LIMBS or p7.uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD then
				local var30 = var29 / var28
				local var31 = if p7.uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD then getFIntUGCValidateMaxEmissivePercentageDynamicHeadModule() else getFIntUGCValidateMaxEmissivePercentageBodyModule()
				
				if var31 / 100 < var30 then
					p6:fail(errorSourceStringsModule.Keys.EmissiveArea_AboveThresholdNew, {
						meshName = i,
						emissivePercentage = string.format("%.2f", var30 * 100),
						maxEmissivePercentage = tostring(var31)
					})
				end
			else
				local model = Instance.new("Model")
				assetService:CreateMeshPartAsync(Content.fromObject(p7.innerCagesData[i].editable)).Parent = model
				local _, boundingBox = model:GetBoundingBox()
				var29 *= (getFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule() / (boundingBox.X * boundingBox.Y * boundingBox.Z)) ^ 0.666666666667
				
				if getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule() < var29 then
					p6:fail(errorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceededNew, {
						assetTypeName = name,
						emissiveArea = string.format("%.2f", var29),
						maxEmissiveArea = tostring(getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule())
					})
				end
			end
		end
	end
end

function t.run(p8, p9)
	-- upvalues: getFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule (ref), runEmissiveAreaChecks (ref), validationEnumsModule (ref), getTotalEmissiveSurfaceArea (ref), getFFlagUGCValidateEmissiveFixAreaChecksModule (ref), getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule (ref), getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule (ref), errorSourceStringsModule (ref), getFIntUGCValidateMaxEmissivePercentageBodyModule (ref), getFIntUGCValidateMaxEmissivePercentageDynamicHeadModule (ref), assetService (ref), getFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule (ref), getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule (ref)
	if getFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule() then
		runEmissiveAreaChecks(p8, p9)
		
		return
	end
	for i, v in p9.renderMeshesData do
		local var32 = p9.meshTextures[i]
		local var33 = if var32 then var32.EmissiveMask else nil
		
		if var33 then
			if p9.uploadCategory == validationEnumsModule.UploadCategory.RIGID_ACCESSORY then
				local var34 = getTotalEmissiveSurfaceArea(v, var33.editable)
				
				if getFFlagUGCValidateEmissiveFixAreaChecksModule() then
					local var35
					local rootInstance = p9.rootInstance
					
					if rootInstance.Name ~= i then
						rootInstance = p9.rootInstance:FindFirstChild(i, true)
					end
					if rootInstance then
						local surfaceAppearance = rootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
						var35 = if surfaceAppearance then surfaceAppearance.EmissiveStrength else 0
					else
						var35 = 0
					end
					var34 = var34 * var35 / getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
				end
				if getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule() < var34 then
					p8:fail(errorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceeded, {
						meshName = i,
						emissiveArea = string.format("%.2f", var34),
						maxEmissiveArea = tostring(getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule())
					})
				end
			elseif p9.uploadCategory == validationEnumsModule.UploadCategory.TORSO_AND_LIMBS or p9.uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD then
				local var36
				local var37, var38 = getTotalEmissiveSurfaceArea(v, var33.editable)
				
				if var38 > 0 then
					local var39
					local var40 = var37 / var38
					local rootInstance = p9.rootInstance
					
					if rootInstance.Name ~= i then
						rootInstance = p9.rootInstance:FindFirstChild(i, true)
					end
					if rootInstance then
						local surfaceAppearance = rootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
						var39 = if surfaceAppearance then surfaceAppearance.EmissiveStrength else 0
					else
						var39 = 0
					end
					var36 = var40 * var39 / getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
				else
					var36 = 0
				end
				local var41 = if p9.uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD then getFIntUGCValidateMaxEmissivePercentageDynamicHeadModule() else getFIntUGCValidateMaxEmissivePercentageBodyModule()
				
				if var41 / 100 < var36 then
					p8:fail(errorSourceStringsModule.Keys.EmissiveArea_AboveThreshold, {
						meshName = i,
						emissivePercentage = string.format("%.2f", var36 * 100),
						maxEmissivePercentage = tostring(var41)
					})
				end
			else
				local model = Instance.new("Model")
				assetService:CreateMeshPartAsync(Content.fromObject(p9.innerCagesData[i].editable)).Parent = model
				local _, boundingBox = model:GetBoundingBox()
				local var42 = ((getFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule() / (boundingBox.X * boundingBox.Y * boundingBox.Z)) ^ 0.333333333333) ^ 2
				local var43 = getTotalEmissiveSurfaceArea(v, var33.editable)
				
				if getFFlagUGCValidateEmissiveFixAreaChecksModule() then
					local var44
					local rootInstance = p9.rootInstance
					
					if rootInstance.Name ~= i then
						rootInstance = p9.rootInstance:FindFirstChild(i, true)
					end
					if rootInstance then
						local surfaceAppearance = rootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
						var44 = if surfaceAppearance then surfaceAppearance.EmissiveStrength else 0
					else
						var44 = 0
					end
					var43 = var43 * var44 / getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
				end
				var43 *= var42
				
				if getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule() < var43 then
					p8:fail(errorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceeded, {
						meshName = i,
						emissiveArea = string.format("%.2f", var43),
						maxEmissiveArea = tostring(getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule())
					})
				end
			end
		end
	end
end

return t