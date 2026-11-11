local Parent = script:FindFirstAncestor("FriendsMenu").Parent
local ReactModule = require(Parent.React)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local GetLocalizedStringsFunction = require(Parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings

return function(p1)
	-- upvalues: UseStyleFunction (copy), FFlagConnectionsToFriendsRename (copy), GetLocalizedStringsFunction (copy), ReactModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Name = p1.msgType
	}, {
		subtitle = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = GetLocalizedStringsFunction({
				noResultFriendsList = "Feature.SettingsHub.Label.InviteSearchNoResults",
				errorFriendsList = if FFlagConnectionsToFriendsRename then "Feature.SettingsHub.Label.FriendsListLoadErrorMessage" else "Feature.SettingsHub.Label.ConnectionsListLoadErrorMessage"
			})[p1.msgType],
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextSize = ScaledBaseSize,
			Font = UseStyleResultFont.Body.Font,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize),
			Position = UDim2.new(0, 0, 0.4, 0),
			TextYAlignment = Enum.TextYAlignment.Top
		})
	})
end