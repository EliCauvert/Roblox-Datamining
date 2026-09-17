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
local t = {
	fflag = getFFlagUGCValidateEmissiveAreaChecksModule,
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
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

local function getTotalEmissiveSurfaceArea(p1, p2)
	local editable = p1.editable
	local size = p2.Size
	local zero = p2:ReadPixelsBuffer(Vector2.zero, size)
	local var1 = 0
	local var2 = 0
	
	for i, v in editable:GetFaces() do
		local var3 = editable:GetFaceVertices(v)
		local var4 = editable:GetPosition(var3[1])
		local var5 = ((editable:GetPosition(var3[2]) - var4) * p1.scale):Cross((editable:GetPosition(var3[3]) - var4) * p1.scale).Magnitude * 0.5
		
		if var5 ~= 0 then
			local var6 = editable:GetFaceUVs(v)
			local var7 = editable:GetUV(var6[1])
			local var8 = editable:GetUV(var6[2])
			local var9 = editable:GetUV(var6[3])
			
			if var7 and var8 and var9 then
				local var10 = (var7 + var8 + var9) / 3
				var1 += var5
				var2 += var5 * buffer.readu8(zero, (math.floor(var10.Y % 1 * size.Y) * size.X + math.floor(var10.X % 1 * size.X)) * 4)
			end
		end
	end
	return var2 / 255, var1
end

local _ = function(p3, p4, p5, p6)
	-- upvalues: getTotalEmissiveSurfaceArea (ref), getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule (ref)
	local var11, var12 = getTotalEmissiveSurfaceArea(p3, p4)
	
	if var12 <= 0 then
		return 0
	end
	local var13
	local var14 = var11 / var12
	local rootInstance = p5.rootInstance
	
	if rootInstance.Name ~= p6 then
		rootInstance = p5.rootInstance:FindFirstChild(p6, true)
	end
	if rootInstance then
		local surfaceAppearance = rootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
		var13 = if surfaceAppearance then surfaceAppearance.EmissiveStrength else 0
	else
		var13 = 0
	end
	return var14 * var13 / getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
end

function t.run(p3, p4)
	-- upvalues: validationEnumsModule (ref), getTotalEmissiveSurfaceArea (ref), getFFlagUGCValidateEmissiveFixAreaChecksModule (ref), getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule (ref), getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule (ref), errorSourceStringsModule (ref), getFIntUGCValidateMaxEmissivePercentageBodyModule (ref), getFIntUGCValidateMaxEmissivePercentageDynamicHeadModule (ref), assetService (ref), getFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule (ref), getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule (ref)
	for i, v in p4.renderMeshesData do
		local var11 = p4.meshTextures[i]
		local var12 = if var11 then var11.EmissiveMask else nil
		
		if var12 then
			if p4.uploadCategory == validationEnumsModule.UploadCategory.RIGID_ACCESSORY then
				local var13 = getTotalEmissiveSurfaceArea(v, var12.editable)
				
				if getFFlagUGCValidateEmissiveFixAreaChecksModule() then
					local var14
					local rootInstance = p4.rootInstance
					
					if rootInstance.Name ~= i then
						rootInstance = p4.rootInstance:FindFirstChild(i, true)
					end
					if rootInstance then
						local surfaceAppearance = rootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
						var14 = if surfaceAppearance then surfaceAppearance.EmissiveStrength else 0
					else
						var14 = 0
					end
					var13 = var13 * var14 / getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
				end
				if getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule() < var13 then
					p3:fail(errorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceeded, {
						meshName = i,
						emissiveArea = string.format("%.2f", var13),
						maxEmissiveArea = tostring(getFIntUGCValidateMaxEmissiveAreaRigidAccessoryModule())
					})
				end
			elseif p4.uploadCategory == validationEnumsModule.UploadCategory.TORSO_AND_LIMBS or p4.uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD then
				local var15
				local var16, var17 = getTotalEmissiveSurfaceArea(v, var12.editable)
				
				if var17 > 0 then
					local var18
					local var19 = var16 / var17
					local rootInstance = p4.rootInstance
					
					if rootInstance.Name ~= i then
						rootInstance = p4.rootInstance:FindFirstChild(i, true)
					end
					if rootInstance then
						local surfaceAppearance = rootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
						var18 = if surfaceAppearance then surfaceAppearance.EmissiveStrength else 0
					else
						var18 = 0
					end
					var15 = var19 * var18 / getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
				else
					var15 = 0
				end
				local var20 = if p4.uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD then getFIntUGCValidateMaxEmissivePercentageDynamicHeadModule() else getFIntUGCValidateMaxEmissivePercentageBodyModule()
				
				if var20 / 100 < var15 then
					p3:fail(errorSourceStringsModule.Keys.EmissiveArea_AboveThreshold, {
						meshName = i,
						emissivePercentage = string.format("%.2f", var15 * 100),
						maxEmissivePercentage = tostring(var20)
					})
				end
			else
				local model = Instance.new("Model")
				assetService:CreateMeshPartAsync(Content.fromObject(p4.innerCagesData[i].editable)).Parent = model
				local _, boundingBox = model:GetBoundingBox()
				local var21 = ((getFIntUGCValidateEmissiveR15BlockyBoundingBoxVolumeModule() / (boundingBox.X * boundingBox.Y * boundingBox.Z)) ^ 0.333333333333) ^ 2
				local var22 = getTotalEmissiveSurfaceArea(v, var12.editable)
				
				if getFFlagUGCValidateEmissiveFixAreaChecksModule() then
					local var23
					local rootInstance = p4.rootInstance
					
					if rootInstance.Name ~= i then
						rootInstance = p4.rootInstance:FindFirstChild(i, true)
					end
					if rootInstance then
						local surfaceAppearance = rootInstance:FindFirstChildWhichIsA("SurfaceAppearance", true)
						var23 = if surfaceAppearance then surfaceAppearance.EmissiveStrength else 0
					else
						var23 = 0
					end
					var22 = var22 * var23 / getFIntUGCValidationMaxEmissiveStrengthForAreaChecksModule()
				end
				var22 *= var21
				
				if getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule() < var22 then
					p3:fail(errorSourceStringsModule.Keys.EmissiveArea_SurfaceAreaExceeded, {
						meshName = i,
						emissiveArea = string.format("%.2f", var22),
						maxEmissiveArea = tostring(getFIntUGCValidateMaxEmissiveAreaLayeredClothingModule())
					})
				end
			end
		end
	end
end

return t