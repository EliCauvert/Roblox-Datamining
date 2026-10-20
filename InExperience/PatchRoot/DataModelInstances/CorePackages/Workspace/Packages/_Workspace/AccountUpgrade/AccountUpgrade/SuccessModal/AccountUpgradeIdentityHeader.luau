local Parent = script:FindFirstAncestor("AccountUpgrade").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Avatar = FoundationModule.Avatar
local Text = FoundationModule.Text
local View = FoundationModule.View
local AvatarSize = FoundationModule.Enums.AvatarSize

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), Avatar (copy), AvatarSize (copy), Text (copy)
	local DisplayName = Frame.displayName
	
	if DisplayName == nil or DisplayName == "" then
		DisplayName = Frame.username
	end
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-medium size-full-0 auto-y",
		testId = "account-upgrade-identity-header",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Avatar = ReactModule.createElement(Avatar, {
			LayoutOrder = 1,
			testId = "account-upgrade-identity-avatar",
			userId = Frame.userId,
			size = AvatarSize.Pictogram
		}),
		Credentials = ReactModule.createElement(View, {
			tag = "col align-x-center gap-xsmall size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			DisplayName = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-default",
				LayoutOrder = 1,
				testId = "account-upgrade-display-name",
				Text = DisplayName
			}),
			Username = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-label-medium text-wrap text-align-x-center content-muted",
				LayoutOrder = 2,
				testId = "account-upgrade-username",
				Text = `@{Frame.username}`
			})
		})
	})
end