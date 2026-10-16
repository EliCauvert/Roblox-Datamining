local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local COLORS = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Constants.COLORS
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants)
local Constants = require(CorePackages.Workspace.Packages.UserLib).Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local InviteAvatarThumbnailSize = ConstantsModule.InviteAvatarThumbnailSize

return function(p1) --[[ Line: 27 ]]
	-- upvalues: Constants (copy), InviteAvatarThumbnailSize (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ConstantsModule (copy), ReactModule (copy), COLORS (copy)
	local User = p1.user
	
	return ReactModule.createElement("ImageLabel", {
		BorderSizePixel = 0,
		Size = p1.size,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		Image = (if User then GetRbxthumbWithTypeSizeAndOptionsFunction(User.id, ConstantsModule.InviteAvatarRbxthumbType, Constants.RbxThumbnailSizeToNumberSize[InviteAvatarThumbnailSize]) else nil) or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png",
		BackgroundColor3 = COLORS.FLINT,
		BackgroundTransparency = p1.backgroundTransparency
	}, {
		Corner = if p1.square then nil else ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
	})
end