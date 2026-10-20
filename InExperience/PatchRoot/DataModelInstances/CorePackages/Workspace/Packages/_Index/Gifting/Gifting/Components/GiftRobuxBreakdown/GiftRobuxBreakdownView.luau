local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Divider = FoundationModule.Divider
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance

local function PriceLine(Frame)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy)
	local Line = Frame.line
	local AutoXyTextTitleSmallContentEmphasis: string = if Frame.isTotal then "auto-xy text-title-small content-emphasis" else "auto-xy text-body-small content-emphasis"
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = if Frame.isTotal then "fill auto-y text-title-small text-align-x-left content-emphasis" else "fill auto-y text-body-small text-align-x-left content-emphasis",
			Text = Line.label
		}),
		Amount = ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2
		}, {
			Prefix = if Line.amountPrefix then ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = AutoXyTextTitleSmallContentEmphasis,
				Text = Line.amountPrefix
			}) else nil,
			RobuxIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = IconName.Robux,
				size = IconSize.XSmall
			}),
			Value = ReactModule.createElement(Text, {
				LayoutOrder = 3,
				tag = AutoXyTextTitleSmallContentEmphasis,
				Text = Line.amountText
			})
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), PriceLine (copy), View (copy), StateLayerAffordance (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy), Divider (copy)
	local Elements = {}
	
	for i, discount in p1.discounts do
		Elements[`Discount-{i}`] = ReactModule.createElement(PriceLine, { line = discount, LayoutOrder = i + 1 })
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y stroke-default radius-medium clip",
		testId = "GiftRobuxBreakdownView"
	}, {
		Header = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-small radius-medium",
			testId = "gift-robux-breakdown-toggle",
			LayoutOrder = 1,
			onActivated = p1.onToggle,
			stateLayer = { affordance = StateLayerAffordance.Background }
		}, {
			PlusIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = IconName.RobloxPlus,
				size = IconSize.Medium
			}),
			Summary = ReactModule.createElement(View, {
				tag = "row align-y-center fill gap-xxsmall auto-y",
				LayoutOrder = 2
			}, {
				Leading = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-align-x-left content-emphasis",
					testId = "gift-robux-breakdown-summary-leading",
					LayoutOrder = 1,
					Text = p1.summaryLeadingText
				}),
				Amount = ReactModule.createElement(View, {
					tag = "row align-y-center gap-xxsmall auto-xy",
					LayoutOrder = 2
				}, {
					RobuxIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = IconName.Robux,
						size = IconSize.Small
					}),
					Value = ReactModule.createElement(Text, {
						tag = "auto-xy text-title-medium text-no-wrap content-emphasis",
						testId = "gift-robux-breakdown-summary-amount",
						LayoutOrder = 2,
						Text = p1.summaryAmountText
					})
				}),
				Trailing = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-align-x-left content-emphasis",
					testId = "gift-robux-breakdown-summary-trailing",
					LayoutOrder = 3,
					Text = p1.summaryTrailingText
				})
			}),
			Chevron = ReactModule.createElement(Icon, {
				testId = "gift-robux-breakdown-chevron",
				LayoutOrder = 3,
				name = IconName.ChevronLargeDown,
				size = IconSize.Medium,
				Rotation = if p1.isExpanded then 180 else 0
			})
		}),
		Content = if p1.isExpanded then ReactModule.createElement(View, {
			tag = "col gap-small size-full-0 auto-y padding-x-medium padding-bottom-medium padding-top-xsmall",
			testId = "gift-robux-breakdown-content",
			LayoutOrder = 2
		}, {
			Rows = ReactModule.createElement(View, {
				tag = "col gap-xxsmall size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Subtotal = ReactModule.createElement(PriceLine, { LayoutOrder = 1, line = p1.subtotal }),
				Discounts = ReactModule.createElement(View, {
					tag = "col gap-xxsmall size-full-0 auto-y",
					LayoutOrder = 2
				}, Elements)
			}),
			Divider = ReactModule.createElement(Divider, { LayoutOrder = 2 }),
			Total = ReactModule.createElement(PriceLine, { isTotal = true, LayoutOrder = 3, line = p1.total })
		}) else nil
	})
end)