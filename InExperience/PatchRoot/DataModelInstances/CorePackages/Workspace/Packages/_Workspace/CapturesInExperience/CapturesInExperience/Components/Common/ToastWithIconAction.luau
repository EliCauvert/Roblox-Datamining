local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Image (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy)
	local IsNotTextMatch: boolean = p1.text ~= nil and p1.text ~= ""
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium auto-y padding-medium radius-medium bg-over-media-0",
		testId = "--captures-toast-with-icon-action",
		Size = UDim2.new(p1.width, UDim.new())
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			Media = ReactModule.createElement(Image, { LayoutOrder = 1, tag = "size-1200-1200", Image = p1.icon }),
			Content = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col fill self-center gap-xxsmall auto-y"
			}, {
				Header = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-small text-align-x-left text-truncate-end content-emphasis",
					Text = p1.title
				}),
				Body = if IsNotTextMatch then ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
					Text = p1.text
				}) else nil
			})
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y",
			testId = "--captures-toast-with-icon-action--actions"
		}, {
			PrimaryAction = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				testId = "--captures-toast-with-icon-action--primary",
				text = p1.actionText,
				onActivated = p1.onAction,
				variant = ButtonVariant.Emphasis,
				size = InputSize.Medium,
				fillBehavior = FillBehavior.Fill
			}),
			IconAction = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				testId = "--captures-toast-with-icon-action--icon",
				icon = p1.iconActionIcon,
				onActivated = p1.onIconAction,
				variant = ButtonVariant.Standard,
				size = InputSize.Medium
			})
		})
	})
end