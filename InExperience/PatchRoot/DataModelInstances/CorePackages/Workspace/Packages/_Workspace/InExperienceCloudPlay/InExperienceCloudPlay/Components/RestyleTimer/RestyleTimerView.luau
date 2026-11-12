local Parent = script:FindFirstAncestor("InExperienceCloudPlay").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local InputSize = FoundationModule.Enums.InputSize
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local Text = FoundationModule.Text
local Toggle = FoundationModule.Toggle
local View = FoundationModule.View
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseScaledValueFunction (copy), ReactModule (copy), Popover (copy), View (copy), Text (copy), PopoverSide (copy), PopoverAlign (copy), Toggle (copy), InputSize (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Popover.Root, {
		testId = "restyle-timer-popover",
		isOpen = p1.isPopoverOpen
	}, {
		Anchor = ReactModule.createElement(Popover.Anchor, { LayoutOrder = p1.layoutOrder }, {
			Chip = ReactModule.createElement(View, {
				tag = "row align-y-center gap-xsmall auto-x padding-x-medium radius-circle bg-over-media-0",
				testId = "restyle-timer",
				Size = UDim2.fromOffset(0, p1.buttonSize),
				onActivated = p1.onChipActivated,
				onAbsoluteSizeChanged = p1.onAreaChanged,
				onAbsolutePositionChanged = p1.onAreaChanged
			}, {
				Label = ReactModule.createElement(Text, {
					tag = "auto-xy text-label-small content-emphasis",
					Text = "Restyle",
					LayoutOrder = 1
				}),
				TimeLeft = if p1.timeLeft then ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, {
					Sizer = ReactModule.createElement(Text, {
						tag = "auto-xy text-label-small",
						testId = "restyle-timer--time-sizer",
						Text = string.gsub(p1.timeLeft, "%d", "0"),
						textStyle = {
							Transparency = 1,
							Color3 = UseTokensResult.Color.Content.Muted.Color3
						}
					}),
					Value = ReactModule.createElement(Text, {
						tag = "size-full text-label-small text-align-x-right content-muted",
						testId = "restyle-timer--time",
						Text = p1.timeLeft
					})
				}) else nil
			})
		}),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = false,
			side = {
				position = PopoverSide.Bottom,
				offset = UseTokensResult.Size.Size_300
			},
			align = PopoverAlign.Start,
			backgroundStyle = UseTokensResult.Color.Surface.Surface_200,
			onPressedOutside = p1.onPopoverClosed
		}, {
			Body = ReactModule.createElement(View, {
				tag = "col gap-small auto-y padding-medium stroke-standard stroke-default radius-medium",
				Size = UDim2.fromOffset(UseScaledValueFunction(233), 0)
			}, {
				Description = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-muted",
					Text = "Restyle is an early preview. Things may look different from the original game.",
					LayoutOrder = 1
				}),
				TimeLeft = if p1.timeLeft then ReactModule.createElement(View, {
					tag = "row flex-x-between align-y-center size-full-0 auto-y padding-medium radius-medium bg-shift-100",
					LayoutOrder = 2
				}, {
					Label = ReactModule.createElement(Text, {
						tag = "auto-xy text-label-small content-default",
						Text = "Time left",
						LayoutOrder = 1
					}),
					Value = ReactModule.createElement(Text, {
						tag = "auto-xy text-label-medium content-default",
						LayoutOrder = 2,
						Text = p1.timeLeft
					})
				}) else nil,
				Restyle = ReactModule.createElement(View, {
					tag = "row flex-x-between align-y-center size-full-0 auto-y padding-medium radius-medium bg-shift-100",
					LayoutOrder = 3
				}, {
					Label = ReactModule.createElement(Text, {
						tag = "auto-xy text-label-small content-default",
						Text = "Restyle",
						LayoutOrder = 1
					}),
					Toggle = ReactModule.createElement(Toggle, {
						label = "",
						LayoutOrder = 2,
						testId = "restyle-timer-toggle",
						size = InputSize.XSmall,
						isChecked = p1.isRestyleEnabled,
						onActivated = p1.onRestyleToggled
					})
				})
			})
		})
	})
end