local parent = script.Parent
local constantsModule = require(parent.Constants)
local validationRulesUtilModule = require(parent.util.ValidationRulesUtil)
local getEngineUGCValidateAssetTextureLimitsModule = require(parent.flags.getEngineUGCValidateAssetTextureLimits)

return {
	isBodyPart = function(p1)
		-- upvalues: constantsModule (ref)
		return constantsModule.ASSET_TYPE_INFO[p1] and constantsModule.ASSET_TYPE_INFO[p1].isBodyPart
	end,
	isMakeupAsset = function(value)
		return if value ~= Enum.AssetType.LipMakeup then if value ~= Enum.AssetType.EyeMakeup then value == Enum.AssetType.FaceMakeup else true else true
	end,
	getBodyPartAssets = function()
		-- upvalues: constantsModule (ref)
		local t = {}
		
		for i, v in constantsModule.ASSET_TYPE_INFO do
			if v.isBodyPart then
				table.insert(t, i)
			end
		end
		return t
	end,
	getRigAttachmentToParent = function(p1, p2)
		-- upvalues: constantsModule (ref)
		if not p1 then
			p1 = constantsModule.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[p2]
		end
		if not p1 then
			return ""
		end
		local var1 = constantsModule.ASSET_TYPE_INFO[p1]
		
		return if var1.isBodyPart then var1.subParts[p2].rigAttachmentToParent.name else ""
	end,
	getAttachments = function(p1, p2)
		-- upvalues: constantsModule (ref)
		if not p1 then
			p1 = constantsModule.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[p2]
		end
		local var1 = nil
		
		if p1 then
			local var2 = constantsModule.ASSET_TYPE_INFO[p1]
			
			if not var2.isBodyPart then
				return {}
			end
			var1 = var2.subParts[p2]
		end
		local t = {}
		
		if var1 then
			table.insert(t, var1.rigAttachmentToParent.name)
			
			for i in var1.otherAttachments do
				table.insert(t, i)
			end
		end
		return t
	end,
	getTextureLimit = function(p3, p4, p5)
		-- upvalues: getEngineUGCValidateAssetTextureLimitsModule (ref), constantsModule (ref), validationRulesUtilModule (ref)
		if not getEngineUGCValidateAssetTextureLimitsModule() then
			return constantsModule.MAX_TEXTURE_SIZE
		elseif not p3 then
			return constantsModule.MAX_TEXTURE_SIZE
		end
		local var3 = validationRulesUtilModule:getRules().TextureRules.AssetTextureLimits[p3]
		
		if not var3 then
			return constantsModule.MAX_TEXTURE_SIZE
		elseif p4:IsA("SpecialMesh") and p5 == "TextureId" then
			return var3.ColorMapSize
		elseif p4:IsA("MeshPart") and p5 == "TextureID" then
			return var3.ColorMapSize
		elseif p4:IsA("SurfaceAppearance") or p4:IsA("Decal") then
			return if p5 == "ColorMap" then var3.ColorMapSize elseif p5 == "MetalnessMap" then var3.MetalnessMapSize elseif p5 == "NormalMap" then var3.NormalMapSize elseif p5 == "RoughnessMap" then var3.RoughnessMapSize else constantsModule.MAX_TEXTURE_SIZE
		end
	end
}