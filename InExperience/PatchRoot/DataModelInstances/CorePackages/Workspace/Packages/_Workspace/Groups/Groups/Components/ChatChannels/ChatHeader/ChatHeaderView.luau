local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), Image (copy), Text (copy), Button (copy), InputSize (copy), Menu (copy), FoundationModule (copy), IconButton (copy), ButtonVariant (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		HeaderSlot = ReactModule.createElement(View, { tag = "row fill size-0-0 auto-y", LayoutOrder = 1 }, {
			Header = ReactModule.createElement(View, {
				tag = "row align-y-center shrink gap-medium size-0-0 auto-xy padding-small radius-medium",
				onActivated = Frame.onClick,
				testId = `{Frame.testId}--header`
			}, {
				Icon = ReactModule.createElement(Image, {
					LayoutOrder = 1,
					Image = Frame.icon,
					ScaleType = Enum.ScaleType.Crop,
					tag = {
						["size-1000-1000"] = true,
						["radius-circle"] = Frame.isUserIcon,
						["radius-medium"] = not Frame.isUserIcon
					},
					testId = `{Frame.testId}--icon`
				}),
				Details = ReactModule.createElement(View, {
					tag = "col flex-x-fill shrink size-0-0 auto-xy",
					LayoutOrder = 2
				}, {
					Title = ReactModule.createElement(Text, {
						tag = "auto-xy text-title-medium text-no-wrap text-align-x-left text-truncate-end content-default",
						LayoutOrder = 1,
						Text = Frame.title
					}),
					Subtitle = ReactModule.createElement(Text, {
						tag = "auto-xy text-body-medium text-no-wrap text-align-x-left text-truncate-end content-muted",
						LayoutOrder = 2,
						Text = Frame.subtitle
					})
				})
			})
		}),
		CTA = if Frame.ctaButton then ReactModule.createElement(Button, {
			LayoutOrder = 2,
			text = Frame.ctaButton.title,
			onActivated = Frame.ctaButton.action,
			variant = Frame.ctaButton.type,
			size = InputSize.Small,
			testId = `{Frame.testId}--cta`
		}) else nil,
		Overflow = if #Frame.menuItems > 0 then ReactModule.createElement(Menu, {
			LayoutOrder = 3,
			items = Frame.menuItems,
			isOpen = Frame.isMenuOpen,
			onPressedOutside = Frame.onCloseMenu,
			side = FoundationModule.Enums.PopoverSide.Bottom,
			align = FoundationModule.Enums.PopoverAlign.End,
			selectionGroup = {
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			},
			ref = Frame.menuRef,
			testId = `{Frame.testId}--menu`
		}, {
			Trigger = ReactModule.createElement(IconButton, {
				icon = FoundationModule.Enums.IconName.ThreeDotsHorizontal,
				variant = ButtonVariant.Utility,
				size = InputSize.Small,
				onActivated = Frame.onToggleMenu,
				testId = `{Frame.testId}--overflow`
			})
		}) else nil
	})
end