local Parent = script:FindFirstAncestor("FriendsMenu").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local GetLocalizedStringsFunction = require(Parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings

return function(p1)
	-- upvalues: UseStyleFunction (copy), GetLocalizedStringsFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
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
				errorFriendsList = "Feature.SettingsHub.Label.FriendsListLoadErrorMessage",
				noResultFriendsList = "Feature.SettingsHub.Label.InviteSearchNoResults"
			})[p1.msgType],
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextSize = ScaledBaseSize,
			Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize),
			Position = UDim2.new(0, 0, 0.4, 0),
			TextYAlignment = Enum.TextYAlignment.Top
		})
	})
end