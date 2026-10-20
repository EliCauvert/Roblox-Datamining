local CorePackages = game:GetService("CorePackages")
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = require(CorePackages.Workspace.Packages.UserLib).Utils.Constants
local Size100x100 = Enum.ThumbnailSize.Size100x100
local AvatarThumbnail = Enum.ThumbnailType.AvatarThumbnail

return {
	GetPlayerImage = function(p1, ThumbnailSize, ThumbnailType, _)
		-- upvalues: Size100x100 (copy), AvatarThumbnail (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
		if not ThumbnailSize then
			ThumbnailSize = Size100x100
		end
		if not ThumbnailType then
			ThumbnailType = AvatarThumbnail
		end
		local v1 = 0
		
		if ThumbnailType == Enum.ThumbnailType.HeadShot or ThumbnailType == Enum.ThumbnailType.AvatarBust then
			v1 = if ThumbnailSize == Enum.ThumbnailSize.Size48x48 then 48 elseif ThumbnailSize == Enum.ThumbnailSize.Size60x60 then 60 else 150
			
			return GetRbxthumbWithTypeSizeAndOptionsFunction(p1, Constants.RbxthumbTypes.AvatarHeadShot, v1)
		end
		if ThumbnailType ~= Enum.ThumbnailType.AvatarThumbnail then
			return "ThumbnailErrorForSocialUtil.GetPlayerImage"
		end
		if ThumbnailSize == Enum.ThumbnailSize.Size48x48 or ThumbnailSize == Enum.ThumbnailSize.Size60x60 or ThumbnailSize == Enum.ThumbnailSize.Size100x100 then
			v1 = 100
		elseif ThumbnailSize == Enum.ThumbnailSize.Size150x150 or ThumbnailSize == Enum.ThumbnailSize.Size180x180 or ThumbnailSize == Enum.ThumbnailSize.Size352x352 then
			v1 = 352
		elseif ThumbnailSize == Enum.ThumbnailSize.Size420x420 then
			v1 = 720
		end
		return GetRbxthumbWithTypeSizeAndOptionsFunction(p1, Constants.RbxthumbTypes.Avatar, v1)
	end
}