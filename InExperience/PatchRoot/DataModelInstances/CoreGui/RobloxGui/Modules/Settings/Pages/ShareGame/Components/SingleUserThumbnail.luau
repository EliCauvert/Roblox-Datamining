local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local COLORS = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Constants.COLORS
local constantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants)
local constants = require(corePackagesService.Workspace.Packages.UserLib).Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = require(corePackagesService.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local inviteAvatarThumbnailSize = constantsModule.InviteAvatarThumbnailSize

return function(p1)
	-- upvalues: constants (ref), inviteAvatarThumbnailSize (ref), getRbxthumbWithTypeSizeAndOptions (ref), constantsModule (ref), reactModule (ref), COLORS (ref)
	local user = p1.user
	
	return reactModule.createElement("ImageLabel", {
		BorderSizePixel = 0,
		Size = p1.size,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		Image = (if user then getRbxthumbWithTypeSizeAndOptions(user.id, constantsModule.InviteAvatarRbxthumbType, constants.RbxThumbnailSizeToNumberSize[inviteAvatarThumbnailSize]) else nil) or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png",
		BackgroundColor3 = COLORS.FLINT,
		BackgroundTransparency = p1.backgroundTransparency
	}, {
		Corner = if p1.square then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
	})
end