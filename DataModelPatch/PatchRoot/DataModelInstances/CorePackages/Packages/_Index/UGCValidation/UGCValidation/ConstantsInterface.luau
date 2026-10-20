local Parent = script.Parent
local ConstantsModule = require(Parent.Constants)
local ValidationRulesUtilModule = require(Parent.util.ValidationRulesUtil)
local GetEngineUGCValidateAssetTextureLimitsModule = require(Parent.flags.getEngineUGCValidateAssetTextureLimits)

return {
	isBodyPart = function(p1)
		-- upvalues: ConstantsModule (copy)
		return ConstantsModule.ASSET_TYPE_INFO[p1] and ConstantsModule.ASSET_TYPE_INFO[p1].isBodyPart
	end,
	isMakeupAsset = function(AssetType): boolean
		return AssetType == Enum.AssetType.LipMakeup or (AssetType == Enum.AssetType.EyeMakeup or AssetType == Enum.AssetType.FaceMakeup)
	end,
	getBodyPartAssets = function()
		-- upvalues: ConstantsModule (copy)
		local List = {}
		
		for i, value in ConstantsModule.ASSET_TYPE_INFO do
			if value.isBodyPart then
				table.insert(List, i)
			end
		end
		return List
	end,
	getRigAttachmentToParent = function(p1, p2)
		-- upvalues: ConstantsModule (copy)
		if not p1 then
			p1 = ConstantsModule.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[p2]
		end
		if p1 then
			local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[p1]
			
			return if ASSETTYPE.isBodyPart then ASSETTYPE.subParts[p2].rigAttachmentToParent.name else ""
		else
			return ""
		end
	end,
	getAttachments = function(p1, p2)
		-- upvalues: ConstantsModule (copy)
		if not p1 then
			p1 = ConstantsModule.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[p2]
		end
		local SubPart = nil
		
		if p1 then
			local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[p1]
			
			if not ASSETTYPE.isBodyPart then
				return {}
			end
			SubPart = ASSETTYPE.subParts[p2]
		end
		local List = {}
		
		if SubPart then
			table.insert(List, SubPart.rigAttachmentToParent.name)
			
			for otherAttachment in SubPart.otherAttachments do
				table.insert(List, otherAttachment)
			end
		end
		return List
	end,
	getTextureLimit = function(p3, Object, p4)
		-- upvalues: GetEngineUGCValidateAssetTextureLimitsModule (copy), ConstantsModule (copy), ValidationRulesUtilModule (copy)
		if not GetEngineUGCValidateAssetTextureLimitsModule() then
			return ConstantsModule.MAX_TEXTURE_SIZE
		end
		if not p3 then
			return ConstantsModule.MAX_TEXTURE_SIZE
		end
		local AssetTextureLimit = ValidationRulesUtilModule:getRules().TextureRules.AssetTextureLimits[p3]
		
		if not AssetTextureLimit then
			return ConstantsModule.MAX_TEXTURE_SIZE
		end
		if Object:IsA("SpecialMesh") and p4 == "TextureId" then
			return AssetTextureLimit.ColorMapSize
		end
		if Object:IsA("MeshPart") and p4 == "TextureID" then
			return AssetTextureLimit.ColorMapSize
		end
		local IsDecal = Object:IsA("Decal")
		
		if Object:IsA("SurfaceAppearance") or IsDecal then
			if p4 == "ColorMap" then
				return AssetTextureLimit.ColorMapSize
			elseif p4 == "MetalnessMap" then
				return AssetTextureLimit.MetalnessMapSize
			elseif p4 == "NormalMap" then
				return AssetTextureLimit.NormalMapSize
			elseif p4 == "RoughnessMap" then
				return AssetTextureLimit.RoughnessMapSize
			end
		end
		return ConstantsModule.MAX_TEXTURE_SIZE
	end
}