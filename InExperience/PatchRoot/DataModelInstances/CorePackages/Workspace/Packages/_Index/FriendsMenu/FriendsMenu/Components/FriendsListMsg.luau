local parent = script:FindFirstAncestor("FriendsMenu").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local localizationHelper = require(parent.NotificationsCommon).LocalizationHelper
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local useStyle = UIBloxModule.Core.Style.useStyle
local getLocalizedStrings = localizationHelper.getLocalizedStrings

return function(p0)
	-- upvalues: useStyle (ref), fFlagConnectionsToFriendsRename (ref), getLocalizedStrings (ref), reactModule (ref)
	local var2 = useStyle()
	local theme = var2.Theme
	local font = var2.Font
	local var3 = font.BaseSize * font.Body.RelativeSize
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Name = p0.msgType
	}, {
		subtitle = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = getLocalizedStrings({
				noResultFriendsList = "Feature.SettingsHub.Label.InviteSearchNoResults",
				errorFriendsList = if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Label.FriendsListLoadErrorMessage" else "Feature.SettingsHub.Label.ConnectionsListLoadErrorMessage"
			})[p0.msgType],
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextSize = var3,
			Font = font.Body.Font,
			Size = UDim2.new(1, 0, 0, var3),
			Position = UDim2.new(0, 0, 0.4, 0),
			TextYAlignment = Enum.TextYAlignment.Top
		})
	})
end