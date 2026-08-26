local t = {}
local corePackagesService = game:GetService("CorePackages")
local getRbxthumbWithTypeSizeAndOptions = require(corePackagesService.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local constants = require(corePackagesService.Workspace.Packages.UserLib).Utils.Constants
local size100x100 = Enum.ThumbnailSize.Size100x100
local avatarThumbnail = Enum.ThumbnailType.AvatarThumbnail

function t.GetPlayerImage(p1, p2, p3, _)
	-- upvalues: size100x100 (ref), avatarThumbnail (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
	if not p2 then
		p2 = size100x100
	end
	if not p3 then
		p3 = avatarThumbnail
	end
	local var1 = 0
	
	if p3 == Enum.ThumbnailType.HeadShot or p3 == Enum.ThumbnailType.AvatarBust then
		var1 = if p2 == Enum.ThumbnailSize.Size48x48 then 48 elseif p2 == Enum.ThumbnailSize.Size60x60 then 60 else 150
		
		return getRbxthumbWithTypeSizeAndOptions(p1, constants.RbxthumbTypes.AvatarHeadShot, var1)
	elseif p3 ~= Enum.ThumbnailType.AvatarThumbnail then
		return "ThumbnailErrorForSocialUtil.GetPlayerImage"
	elseif p2 == Enum.ThumbnailSize.Size48x48 or p2 == Enum.ThumbnailSize.Size60x60 or p2 == Enum.ThumbnailSize.Size100x100 then
		var1 = 100
	elseif p2 == Enum.ThumbnailSize.Size150x150 or p2 == Enum.ThumbnailSize.Size180x180 or p2 == Enum.ThumbnailSize.Size352x352 then
		var1 = 352
	elseif p2 == Enum.ThumbnailSize.Size420x420 then
		var1 = 720
	end
	return getRbxthumbWithTypeSizeAndOptions(p1, constants.RbxthumbTypes.Avatar, var1)
end

return t