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

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), constants (ref), size150x150 (ref), getRbxthumbWithTypeSizeAndOptions (ref), avatarHeadShot (ref), fFlagFriendsMenuUseProfileFrameThumbnailModule (ref), userModel (ref), t (ref), skeleton (ref), radius (ref), imageSetLabel (ref), images (ref), iconSize (ref)
	local var1
	local friend = p1.friend
	assert(friend, "friend should be non-nil. Silence type checker.")
	local var2 = useStyle()
	local var3 = reactModule.useMemo(function()
		-- upvalues: friend (ref), constants (copy), size150x150 (copy), getRbxthumbWithTypeSizeAndOptions (copy), avatarHeadShot (copy), fFlagFriendsMenuUseProfileFrameThumbnailModule (copy)
		return (if friend then getRbxthumbWithTypeSizeAndOptions(friend.id, avatarHeadShot, constants.RbxThumbnailSizeToNumberSize[size150x150], nil, nil, fFlagFriendsMenuUseProfileFrameThumbnailModule) else nil) or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png"
	end, { friend })
	local playerBackgroundDefault = var2.Theme.PlayerBackgroundDefault
	local var4 = if friend.presence ~= userModel.PresenceType.OFFLINE then nil else t[userModel.PresenceType.ONLINE]
	local createElement = reactModule.createElement
	local var5 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		Size = p1.size,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint
	}
	local t_2 = {
		Background = playerBackgroundDefault and reactModule.createElement("Frame", {
			Size = p1.size,
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			BackgroundColor3 = var2.Theme.UIDefault.Color,
			BackgroundTransparency = var2.Theme.UIDefault.Transparency
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}),
		Thumbnail = p1.isFetchingFriends and reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 1, 0), radius = radius.Circle }) or reactModule.createElement(imageSetLabel, {
			BorderSizePixel = 0,
			Size = p1.size,
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			Image = var3,
			BackgroundColor3 = var2 and var2.Theme.UIDefault.Color,
			BackgroundTransparency = if playerBackgroundDefault then 1 else var2.Theme.UIDefault.Transparency
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		})
	}
	
	if var4 and not p1.isFetchingFriends then
		var1 = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 0,
			ZIndex = 2,
			Image = images[var4.Image],
			BackgroundColor3 = if p1.isHoverRow then var2.Theme.BackgroundOnHover.Color else var2.Theme.BackgroundDefault.Color,
			ImageColor3 = var4.Color,
			Position = UDim2.new(1, -1, 1, -1),
			AnchorPoint = Vector2.new(1, 1),
			Size = var4.Size or UDim2.new(0, iconSize.Small, 0, iconSize.Small)
		}, {
			Border = reactModule.createElement("UIStroke", {
				Thickness = 3,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = var2.Theme.BackgroundDefault.Color,
				Transparency = var2.Theme.BackgroundDefault.Transparency
			}),
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) or nil
	end
	t_2.PresenceIcon = var1
	
	return createElement(var5, t_1, t_2)
end