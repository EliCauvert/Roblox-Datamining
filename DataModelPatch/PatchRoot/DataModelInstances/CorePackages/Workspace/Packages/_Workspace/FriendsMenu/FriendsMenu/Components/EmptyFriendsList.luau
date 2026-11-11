local Parent = script:FindFirstAncestor("FriendsMenu").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetLocalizedStringsFunction = require(Parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings
local IconsMenuFriendsLarge = UIBloxModule.App.ImageSet.Images["icons/menu/friends_large"]

return function()
	-- upvalues: UseStyleFunction (copy), FFlagConnectionsToFriendsRename (copy), GetLocalizedStringsFunction (copy), ReactModule (copy), ImageSetLabel (copy), IconsMenuFriendsLarge (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Name = "EmptyFriendsList",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, -20)
	}, {
		listLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		friendsIcon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = IconsMenuFriendsLarge,
			Size = UDim2.new(0, 48, 0, 48)
		}),
		subtitle = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Text = GetLocalizedStringsFunction({
				noFriendsText = if FFlagConnectionsToFriendsRename then "Feature.SettingsHub.Label.NoFriendsPageMessage" else "Feature.SettingsHub.Label.NoConnectionsPageMessage"
			}).noFriendsText,
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextSize = ScaledBaseSize,
			Font = UseStyleResultFont.Body.Font,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize),
			TextYAlignment = Enum.TextYAlignment.Top
		})
	})
end