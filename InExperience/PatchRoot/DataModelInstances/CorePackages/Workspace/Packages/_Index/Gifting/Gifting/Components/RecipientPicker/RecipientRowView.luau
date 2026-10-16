local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AvatarSize = FoundationModule.Enums.AvatarSize

return ReactModule.memo(function(Frame) --[[ Line: 20 | Named "RecipientRowView" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), AvatarSize (copy)
	local Number: number? = tonumber(Frame.userId)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = Frame.LayoutOrder
	}, {
		HoverSurface = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y padding-x-small radius-medium",
			onActivated = if Frame.isAvailable then Frame.onActivated else nil
		}, {
			Row = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-large size-full-0 auto-y padding-y-small",
				testId = `recipient-row-{Frame.userId}`
			}, {
				Avatar = if Number then ReactModule.createElement(FoundationModule.Avatar, {
					LayoutOrder = 1,
					userId = Number,
					backgroundStyle = Frame.avatarBackgroundStyle,
					size = AvatarSize.Large
				}) else nil,
				Names = ReactModule.createElement(FoundationModule.View, {
					tag = "col fill auto-y padding-y-xsmall",
					LayoutOrder = 2
				}, {
					DisplayName = ReactModule.createElement(FoundationModule.Text, {
						tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
						LayoutOrder = 1,
						Text = Frame.displayName
					}),
					Username = if Frame.username == "" then nil else ReactModule.createElement(FoundationModule.Text, {
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 2,
						Text = `@{Frame.username}`
					})
				}),
				Unavailable = if Frame.isAvailable then nil else ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-body-small content-default",
					LayoutOrder = 3,
					Text = Frame.unavailableLabel,
					testId = `recipient-row-unavailable-{Frame.userId}`
				})
			})
		})
	})
end)