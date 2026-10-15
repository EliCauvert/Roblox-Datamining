local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarSize = foundationModule.Enums.AvatarSize

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), avatarSize (ref)
	local var1 = tonumber(p1.userId)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = p1.LayoutOrder
	}, {
		HoverSurface = reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y padding-x-small radius-medium",
			onActivated = if p1.isAvailable then p1.onActivated else nil
		}, {
			Row = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-large size-full-0 auto-y padding-y-small",
				testId = `recipient-row-{p1.userId}`
			}, {
				Avatar = if var1 then reactModule.createElement(foundationModule.Avatar, {
					LayoutOrder = 1,
					userId = var1,
					backgroundStyle = p1.avatarBackgroundStyle,
					size = avatarSize.Large
				}) else nil,
				Names = reactModule.createElement(foundationModule.View, {
					tag = "col fill auto-y padding-y-xsmall",
					LayoutOrder = 2
				}, {
					DisplayName = reactModule.createElement(foundationModule.Text, {
						tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
						LayoutOrder = 1,
						Text = p1.displayName
					}),
					Username = if p1.username ~= "" then nil else reactModule.createElement(foundationModule.Text, {
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 2,
						Text = `@{p1.username}`
					})
				}),
				Unavailable = if not p1.isAvailable then reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-small content-default",
					LayoutOrder = 3,
					Text = p1.unavailableLabel,
					testId = `recipient-row-unavailable-{p1.userId}`
				}) else nil
			})
		})
	})
end)