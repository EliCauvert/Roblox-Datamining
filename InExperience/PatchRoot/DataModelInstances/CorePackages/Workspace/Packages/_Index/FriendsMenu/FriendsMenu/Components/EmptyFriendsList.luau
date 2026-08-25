local parent = script:FindFirstAncestor("FriendsMenu").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local localizationHelper = require(parent.NotificationsCommon).LocalizationHelper
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getLocalizedStrings = localizationHelper.getLocalizedStrings
local friendsLarge = UIBloxModule.App.ImageSet.Images["icons/menu/friends_large"]

return function()
	-- upvalues: useStyle (ref), fFlagConnectionsToFriendsRename (ref), getLocalizedStrings (ref), reactModule (ref), imageSetLabel (ref), friendsLarge (ref)
	local var2 = useStyle()
	local theme = var2.Theme
	local font = var2.Font
	local var3 = font.BaseSize * font.Body.RelativeSize
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Name = "EmptyFriendsList",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, -20)
	}, {
		listLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		friendsIcon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = friendsLarge,
			Size = UDim2.new(0, 48, 0, 48)
		}),
		subtitle = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Text = getLocalizedStrings({
				noFriendsText = if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Label.NoFriendsPageMessage" else "Feature.SettingsHub.Label.NoConnectionsPageMessage"
			}).noFriendsText,
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextSize = var3,
			Font = font.Body.Font,
			Size = UDim2.new(1, 0, 0, var3),
			TextYAlignment = Enum.TextYAlignment.Top
		})
	})
end