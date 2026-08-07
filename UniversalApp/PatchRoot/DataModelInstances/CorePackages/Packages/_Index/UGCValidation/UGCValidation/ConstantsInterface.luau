local parent = script.Parent
local constantsModule = require(parent.Constants)
local validationRulesUtilModule = require(parent.util.ValidationRulesUtil)
local getEngineUGCValidateAssetTextureLimitsModule = require(parent.flags.getEngineUGCValidateAssetTextureLimits)

return {
	isBodyPart = function(p0) --[[ line: 10 ]]
		-- upvalues: constantsModule (ref)
		return constantsModule.ASSET_TYPE_INFO[p0] and constantsModule.ASSET_TYPE_INFO[p0].isBodyPart
	end,
	isMakeupAsset = function(value) --[[ line: 14 ]]
		return if value ~= Enum.AssetType.LipMakeup then if value ~= Enum.AssetType.EyeMakeup then value == Enum.AssetType.FaceMakeup else true else true
	end,
	getBodyPartAssets = function() --[[ line: 20 ]]
		-- upvalues: constantsModule (ref)
		local t = {}
		
		for i, v in constantsModule.ASSET_TYPE_INFO do
			if v.isBodyPart then
				table.insert(t, i)
			end
		end
		return t
	end,
	getRigAttachmentToParent = function(p1, p2) --[[ line: 31 ]]
		-- upvalues: constantsModule (ref)
		if not p1 then
			p1 = constantsModule.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[p2]
		end
		if not p1 then
			return ""
		end
		local var4 = constantsModule.ASSET_TYPE_INFO[p1]
		
		return if var4.isBodyPart then var4.subParts[p2].rigAttachmentToParent.name else ""
	end,
	getAttachments = function(p3, p4) --[[ line: 46 ]]
		-- upvalues: constantsModule (ref)
		if not p3 then
			p3 = constantsModule.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[p4]
		end
		local var5 = nil
		
		if p3 then
			local var6 = constantsModule.ASSET_TYPE_INFO[p3]
			
			if not var6.isBodyPart then
				return {}
			end
			var5 = var6.subParts[p4]
		end
		local t = {}
		
		if var5 then
			table.insert(t, var5.rigAttachmentToParent.name)
			
			for i in var5.otherAttachments do
				table.insert(t, i)
			end
		end
		return t
	end,
	getTextureLimit = function(p5, p6, p7) --[[ line: 70 ]]
		-- upvalues: getEngineUGCValidateAssetTextureLimitsModule (ref), constantsModule (ref), validationRulesUtilModule (ref)
		if not getEngineUGCValidateAssetTextureLimitsModule() then
			return constantsModule.MAX_TEXTURE_SIZE
		elseif not p5 then
			return constantsModule.MAX_TEXTURE_SIZE
		end
		local var8 = validationRulesUtilModule:getRules().TextureRules.AssetTextureLimits[p5]
		
		if not var8 then
			return constantsModule.MAX_TEXTURE_SIZE
		elseif p6:IsA("SpecialMesh") and p7 == "TextureId" then
			return var8.ColorMapSize
		elseif p6:IsA("MeshPart") and p7 == "TextureID" then
			return var8.ColorMapSize
		elseif p6:IsA("SurfaceAppearance") or p6:IsA("Decal") then
			return if p7 == "ColorMap" then var8.ColorMapSize elseif p7 == "MetalnessMap" then var8.MetalnessMapSize elseif p7 == "NormalMap" then var8.NormalMapSize elseif p7 == "RoughnessMap" then var8.RoughnessMapSize else constantsModule.MAX_TEXTURE_SIZE
		end
	end
}