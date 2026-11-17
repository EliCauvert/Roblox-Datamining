local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(script.Parent.Parent.ChatOverflowMenuView)
local ChatOverflowMenuContainerModule = require(script.Parent.Parent.ChatOverflowMenuContainer)

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), ChatOverflowMenuContainerModule (copy)
	local Icon = Frame.icon
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-small padding-y-medium",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		Icon = if Icon.iconType == "user" then ReactModule.createElement(FoundationModule.Avatar, {
			LayoutOrder = 1,
			userId = Icon.iconTargetId,
			size = FoundationModule.Enums.AvatarSize.Medium,
			testId = `{Frame.testId}--icon`
		}) else ReactModule.createElement(FoundationModule.Text, {
			tag = "size-1000-1000 text-label-medium text-no-wrap text-align-x-center text-align-y-center text-truncate-end radius-medium bg-shift-200 content-default",
			LayoutOrder = 1,
			Text = Icon.iconText,
			testId = `{Frame.testId}--icon`
		}),
		Details = ReactModule.createElement(FoundationModule.View, { tag = "col fill size-0-0 auto-y", LayoutOrder = 2 }, {
			TitleRow = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-small size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Title = ReactModule.createElement(FoundationModule.Text, {
					tag = "shrink auto-xy text-title-medium text-no-wrap text-align-x-left text-truncate-split content-default",
					LayoutOrder = 1,
					Text = Frame.title,
					testId = `{Frame.testId}--title`
				}),
				TitlePill = if Frame.titlePill then ReactModule.createElement(FoundationModule.Badge, {
					LayoutOrder = 2,
					text = Frame.titlePill.label,
					variant = Frame.titlePill.variant or FoundationModule.Enums.BadgeVariant.Standard,
					shape = FoundationModule.Enums.BadgeShape.Pill,
					size = FoundationModule.Enums.BadgeSize.XSmall,
					testId = `{Frame.testId}--pill`
				}) else nil
			}),
			Description = if Frame.description == "" then nil else ReactModule.createElement(FoundationModule.Text, {
				tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-split content-muted",
				LayoutOrder = 2,
				Text = Frame.description,
				testId = `{Frame.testId}--description`
			})
		}),
		CTA = if Frame.ctaButton then ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 3,
			text = Frame.ctaButton.title,
			onActivated = Frame.ctaButton.action,
			variant = Frame.ctaButton.type,
			size = FoundationModule.Enums.InputSize.Small,
			testId = `{Frame.testId}--cta`
		}) else nil,
		Overflow = if #Frame.menu.menuItems > 0 then ReactModule.createElement(ChatOverflowMenuContainerModule, {
			LayoutOrder = 4,
			menuItems = Frame.menu.menuItems,
			isMenuOpen = Frame.menu.isMenuOpen,
			onToggleMenu = Frame.menu.onToggleMenu,
			onCloseMenu = Frame.menu.onCloseMenu,
			testId = Frame.testId
		}) else nil
	})
end