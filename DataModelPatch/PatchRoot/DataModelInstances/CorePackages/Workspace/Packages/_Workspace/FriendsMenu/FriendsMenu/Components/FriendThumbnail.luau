local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local Parent = FriendsMenu.Parent
local ReactModule = require(Parent.React)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(Parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local UserModel = require(Parent.UserLib).Models.UserModel
local _ = require(FriendsMenu.friendsMenuModalType)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Constants = require(Parent.UserLib).Utils.Constants
local Size150x150 = Constants.RbxThumbnailSizes.Size150x150
local AvatarHeadShot = Constants.RbxthumbTypes.AvatarHeadShot
local config = {
	[UserModel.PresenceType.ONLINE] = {
		Image = "component_assets/circle_16",
		Color = Color3.fromRGB(0, 180, 109),
		Size = UDim2.new(0, 12, 0, 12)
	},
	[UserModel.PresenceType.IN_GAME] = { Image = "icons/menu/games_small" },
	[UserModel.PresenceType.IN_STUDIO] = { Image = "icons/logo/studiologo_small" }
}

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), Constants (copy), Size150x150 (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy), UserModel (copy), config (copy), Skeleton (copy), Radius (copy), ImageSetLabel (copy), Images (copy), IconSize (copy)
	local Friend = p1.friend
	assert(Friend, "friend should be non-nil. Silence type checker.")
	local UseStyleResult = UseStyleFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Friend (copy), Constants (upval), Size150x150 (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), AvatarHeadShot (upval)
		return (if Friend then GetRbxthumbWithTypeSizeAndOptionsFunction(Friend.id, AvatarHeadShot, Constants.RbxThumbnailSizeToNumberSize[Size150x150]) else nil) or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png"
	end, { Friend })
	local PlayerBackgroundDefault = UseStyleResult.Theme.PlayerBackgroundDefault
	local Entry = if Friend.presence == UserModel.PresenceType.OFFLINE then nil else config[UserModel.PresenceType.ONLINE]
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.size,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint
	}, {
		Background = PlayerBackgroundDefault and ReactModule.createElement("Frame", {
			Size = p1.size,
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			BackgroundColor3 = UseStyleResult.Theme.UIDefault.Color,
			BackgroundTransparency = UseStyleResult.Theme.UIDefault.Transparency
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}),
		Thumbnail = p1.isFetchingFriends and ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 1, 0), radius = Radius.Circle }) or ReactModule.createElement(ImageSetLabel, {
			BorderSizePixel = 0,
			Size = p1.size,
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			Image = UseMemoResult,
			BackgroundColor3 = UseStyleResult and UseStyleResult.Theme.UIDefault.Color,
			BackgroundTransparency = if PlayerBackgroundDefault then 1 else UseStyleResult.Theme.UIDefault.Transparency
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}),
		PresenceIcon = Entry and not p1.isFetchingFriends and ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 0,
			ZIndex = 2,
			Image = Images[Entry.Image],
			BackgroundColor3 = p1.isHoverRow and UseStyleResult.Theme.BackgroundOnHover.Color or UseStyleResult.Theme.BackgroundDefault.Color,
			ImageColor3 = Entry.Color,
			Position = UDim2.new(1, -1, 1, -1),
			AnchorPoint = Vector2.new(1, 1),
			Size = Entry.Size or UDim2.new(0, IconSize.Small, 0, IconSize.Small)
		}, {
			Border = ReactModule.createElement("UIStroke", {
				Thickness = 3,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = UseStyleResult.Theme.BackgroundDefault.Color,
				Transparency = UseStyleResult.Theme.BackgroundDefault.Transparency
			}),
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) or nil
	})
end