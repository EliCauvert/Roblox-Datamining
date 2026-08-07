local t = {}
local corePackagesService = game:GetService("CorePackages")
local getRbxthumbWithTypeSizeAndOptions = require(corePackagesService.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local constants = require(corePackagesService.Workspace.Packages.UserLib).Utils.Constants
local size100x100 = Enum.ThumbnailSize.Size100x100
local avatarThumbnail = Enum.ThumbnailType.AvatarThumbnail

function t.GetPlayerImage(p0, p1, p2, _) --[[ line: 23 ]]
	-- upvalues: size100x100 (ref), avatarThumbnail (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
	if not p1 then
		p1 = size100x100
	end
	if not p2 then
		p2 = avatarThumbnail
	end
	local var2 = 0
	
	if p2 == Enum.ThumbnailType.HeadShot or p2 == Enum.ThumbnailType.AvatarBust then
		var2 = if p1 == Enum.ThumbnailSize.Size48x48 then 48 elseif p1 == Enum.ThumbnailSize.Size60x60 then 60 else 150
		
		return getRbxthumbWithTypeSizeAndOptions(p0, constants.RbxthumbTypes.AvatarHeadShot, var2)
	elseif p2 ~= Enum.ThumbnailType.AvatarThumbnail then
		return "ThumbnailErrorForSocialUtil.GetPlayerImage"
	elseif p1 == Enum.ThumbnailSize.Size48x48 or p1 == Enum.ThumbnailSize.Size60x60 or p1 == Enum.ThumbnailSize.Size100x100 then
		var2 = 100
	elseif p1 == Enum.ThumbnailSize.Size150x150 or p1 == Enum.ThumbnailSize.Size180x180 or p1 == Enum.ThumbnailSize.Size352x352 then
		var2 = 352
	elseif p1 == Enum.ThumbnailSize.Size420x420 then
		var2 = 720
	end
	return getRbxthumbWithTypeSizeAndOptions(p0, constants.RbxthumbTypes.Avatar, var2)
end

return t