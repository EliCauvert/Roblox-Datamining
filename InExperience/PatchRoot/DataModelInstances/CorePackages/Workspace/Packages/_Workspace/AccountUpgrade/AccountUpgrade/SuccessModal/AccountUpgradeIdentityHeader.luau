local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatar = foundationModule.Avatar
local text = foundationModule.Text
local view = foundationModule.View
local avatarSize = foundationModule.Enums.AvatarSize

return function(p1)
	-- upvalues: reactModule (ref), view (ref), avatar (ref), avatarSize (ref), text (ref)
	local displayName = p1.displayName
	
	if displayName == nil or displayName == "" then
		displayName = p1.username
	end
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-medium size-full-0 auto-y",
		testId = "account-upgrade-identity-header",
		LayoutOrder = p1.LayoutOrder
	}, {
		Avatar = reactModule.createElement(avatar, {
			LayoutOrder = 1,
			testId = "account-upgrade-identity-avatar",
			userId = p1.userId,
			size = avatarSize.Pictogram
		}),
		Credentials = reactModule.createElement(view, {
			tag = "col align-x-center gap-xsmall size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			DisplayName = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-default",
				LayoutOrder = 1,
				testId = "account-upgrade-display-name",
				Text = displayName
			}),
			Username = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-label-medium text-wrap text-align-x-center content-muted",
				LayoutOrder = 2,
				testId = "account-upgrade-username",
				Text = `@{p1.username}`
			})
		})
	})
end