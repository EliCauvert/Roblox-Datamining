local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local COLORS = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Constants.COLORS
local constantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants)
local constants = require(corePackagesService.Workspace.Packages.UserLib).Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = require(corePackagesService.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local inviteAvatarThumbnailSize = constantsModule.InviteAvatarThumbnailSize

return function(p0)
	-- upvalues: constants (ref), inviteAvatarThumbnailSize (ref), getRbxthumbWithTypeSizeAndOptions (ref), constantsModule (ref), reactModule (ref), COLORS (ref)
	local user = p0.user
	
	return reactModule.createElement("ImageLabel", {
		BorderSizePixel = 0,
		Size = p0.size,
		Position = p0.position,
		AnchorPoint = p0.anchorPoint,
		Image = (if user then getRbxthumbWithTypeSizeAndOptions(user.id, constantsModule.InviteAvatarRbxthumbType, constants.RbxThumbnailSizeToNumberSize[inviteAvatarThumbnailSize]) else nil) or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png",
		BackgroundColor3 = COLORS.FLINT,
		BackgroundTransparency = p0.backgroundTransparency
	}, {
		Corner = if p0.square then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
	})
end