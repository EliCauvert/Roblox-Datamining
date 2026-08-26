local parent = script:FindFirstAncestor("FriendsMenu").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local localizationHelper = require(parent.NotificationsCommon).LocalizationHelper
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local useStyle = UIBloxModule.Core.Style.useStyle
local getLocalizedStrings = localizationHelper.getLocalizedStrings

return function(p1)
	-- upvalues: useStyle (ref), fFlagConnectionsToFriendsRename (ref), getLocalizedStrings (ref), reactModule (ref)
	local var1 = useStyle()
	local theme = var1.Theme
	local font = var1.Font
	local var2 = font.BaseSize * font.Body.RelativeSize
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Name = p1.msgType
	}, {
		subtitle = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = getLocalizedStrings({
				noResultFriendsList = "Feature.SettingsHub.Label.InviteSearchNoResults",
				errorFriendsList = if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Label.FriendsListLoadErrorMessage" else "Feature.SettingsHub.Label.ConnectionsListLoadErrorMessage"
			})[p1.msgType],
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextSize = var2,
			Font = font.Body.Font,
			Size = UDim2.new(1, 0, 0, var2),
			Position = UDim2.new(0, 0, 0.4, 0),
			TextYAlignment = Enum.TextYAlignment.Top
		})
	})
end