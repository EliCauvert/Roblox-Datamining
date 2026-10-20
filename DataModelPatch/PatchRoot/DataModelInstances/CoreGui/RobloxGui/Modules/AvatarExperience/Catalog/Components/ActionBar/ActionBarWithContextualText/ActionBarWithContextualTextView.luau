local Packages = game:GetService("CorePackages").Packages
local ReactModule = require(Packages.React)
local FoundationModule = require(Packages.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), ButtonVariant (copy), ButtonSize (copy), FillBehavior (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = {
			["data-testid=ActionBarWithContextualTextView"] = true,
			["size-full-0 auto-y"] = true
		},
		LayoutOrder = Frame.LayoutOrder
	}, {
		TopBorder = ReactModule.createElement(FoundationModule.View, {
			ZIndex = 2,
			backgroundStyle = UseTokensFunction().Color.Stroke.Default,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0, -1)
		}),
		Content = ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-large size-full-0 auto-y padding-medium bg-surface-0"
		}, {
			Title = ReactModule.createElement(FoundationModule.View, {
				tag = "row wrap items-center gap-xsmall size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				TitleText = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-title-medium text-align-x-left content-emphasis",
					LayoutOrder = 1,
					Text = Frame.titleText
				})
			}),
			Buttons = ReactModule.createElement(FoundationModule.View, {
				tag = "row gap-small size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				ActionButton = ReactModule.createElement(FoundationModule.Button, {
					LayoutOrder = 1,
					text = Frame.actionButtonText,
					onActivated = Frame.onActionActivated,
					variant = ButtonVariant.Emphasis,
					size = ButtonSize.Medium,
					fillBehavior = FillBehavior.Fill,
					isDisabled = Frame.isActionDisabled,
					isLoading = Frame.isActionLoading
				}),
				MoreButton = ReactModule.createElement(FoundationModule.Button, {
					icon = "circle-three-dots-horizontal",
					LayoutOrder = 2,
					onActivated = Frame.onMoreActivated,
					variant = ButtonVariant.Standard,
					size = ButtonSize.Medium
				})
			})
		})
	})
end