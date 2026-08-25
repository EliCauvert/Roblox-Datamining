local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local reactModule = require(parent.React)
local getRbxthumbWithTypeSizeAndOptions = require(parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local userLibModule = require(parent.UserLib)
local fFlagFriendsMenuUseProfileFrameThumbnailModule = require(friendsMenu.Flags.FFlagFriendsMenuUseProfileFrameThumbnail)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local userModel = require(parent.UserLib).Models.UserModel
local _ = require(friendsMenu.friendsMenuModalType)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local iconSize = UIBloxModule.App.Constant.IconSize
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local constants = userLibModule.Utils.Constants
local size150x150 = constants.RbxThumbnailSizes.Size150x150
local avatarHeadShot = constants.RbxthumbTypes.AvatarHeadShot
local t = {
	[userModel.PresenceType.ONLINE] = {
		Image = "component_assets/circle_16",
		Color = Color3.fromRGB(0, 180, 109),
		Size = UDim2.new(0, 12, 0, 12)
	},
	[userModel.PresenceType.IN_GAME] = { Image = "icons/menu/games_small" },
	[userModel.PresenceType.IN_STUDIO] = { Image = "icons/logo/studiologo_small" }
}

return function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), constants (ref), size150x150 (ref), getRbxthumbWithTypeSizeAndOptions (ref), avatarHeadShot (ref), fFlagFriendsMenuUseProfileFrameThumbnailModule (ref), userModel (ref), t (ref), skeleton (ref), radius (ref), imageSetLabel (ref), images (ref), iconSize (ref)
	local var13
	local friend = p0.friend
	assert(friend, "friend should be non-nil. Silence type checker.")
	local var7 = useStyle()
	local var8 = reactModule.useMemo(function()
		-- upvalues: friend (ref), constants (copy), size150x150 (copy), getRbxthumbWithTypeSizeAndOptions (copy), avatarHeadShot (copy), fFlagFriendsMenuUseProfileFrameThumbnailModule (copy)
		return (if friend then getRbxthumbWithTypeSizeAndOptions(friend.id, avatarHeadShot, constants.RbxThumbnailSizeToNumberSize[size150x150], nil, nil, fFlagFriendsMenuUseProfileFrameThumbnailModule) else nil) or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png"
	end, { friend })
	local playerBackgroundDefault = var7.Theme.PlayerBackgroundDefault
	local var9 = if friend.presence ~= userModel.PresenceType.OFFLINE then nil else t[userModel.PresenceType.ONLINE]
	local createElement = reactModule.createElement
	local var10 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		Size = p0.size,
		Position = p0.position,
		AnchorPoint = p0.anchorPoint
	}
	local t_2 = {
		Background = playerBackgroundDefault and reactModule.createElement("Frame", {
			Size = p0.size,
			Position = p0.position,
			AnchorPoint = p0.anchorPoint,
			BackgroundColor3 = var7.Theme.UIDefault.Color,
			BackgroundTransparency = var7.Theme.UIDefault.Transparency
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}),
		Thumbnail = p0.isFetchingFriends and reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 1, 0), radius = radius.Circle }) or reactModule.createElement(imageSetLabel, {
			BorderSizePixel = 0,
			Size = p0.size,
			Position = p0.position,
			AnchorPoint = p0.anchorPoint,
			Image = var8,
			BackgroundColor3 = var7 and var7.Theme.UIDefault.Color,
			BackgroundTransparency = if playerBackgroundDefault then 1 else var7.Theme.UIDefault.Transparency
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		})
	}
	
	if var9 and not p0.isFetchingFriends then
		var13 = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 0,
			ZIndex = 2,
			Image = images[var9.Image],
			BackgroundColor3 = if p0.isHoverRow then var7.Theme.BackgroundOnHover.Color else var7.Theme.BackgroundDefault.Color,
			ImageColor3 = var9.Color,
			Position = UDim2.new(1, -1, 1, -1),
			AnchorPoint = Vector2.new(1, 1),
			Size = var9.Size or UDim2.new(0, iconSize.Small, 0, iconSize.Small)
		}, {
			Border = reactModule.createElement("UIStroke", {
				Thickness = 3,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = var7.Theme.BackgroundDefault.Color,
				Transparency = var7.Theme.BackgroundDefault.Transparency
			}),
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) or nil
	end
	t_2.PresenceIcon = var13
	
	return createElement(var10, t_1, t_2)
end