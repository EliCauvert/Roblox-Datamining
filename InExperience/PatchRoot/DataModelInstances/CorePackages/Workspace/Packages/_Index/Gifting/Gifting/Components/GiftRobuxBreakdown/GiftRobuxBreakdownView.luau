local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local divider = foundationModule.Divider
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance

local function PriceLine(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	local line = p1.line
	local var1 = if p1.isTotal then "auto-xy text-title-small content-emphasis" else "auto-xy text-body-small content-emphasis"
	
	return reactModule.createElement(view, {
		tag = "row align-y-center size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Label = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = if p1.isTotal then "fill auto-y text-title-small text-align-x-left content-emphasis" else "fill auto-y text-body-small text-align-x-left content-emphasis",
			Text = line.label
		}),
		Amount = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2
		}, {
			Prefix = if line.amountPrefix then reactModule.createElement(text, { LayoutOrder = 1, tag = var1, Text = line.amountPrefix }) else nil,
			RobuxIcon = reactModule.createElement(icon, {
				LayoutOrder = 2,
				name = iconName.Robux,
				size = iconSize.XSmall
			}),
			Value = reactModule.createElement(text, { LayoutOrder = 3, tag = var1, Text = line.amountText })
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), PriceLine (ref), view (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), divider (ref)
	local t = {}
	
	for i, v in p1.discounts do
		t[`Discount-{i}`] = reactModule.createElement(PriceLine, { line = v, LayoutOrder = i + 1 })
	end
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y stroke-default radius-medium clip",
		testId = "GiftRobuxBreakdownView"
	}, {
		Header = reactModule.createElement(view, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-small radius-medium",
			testId = "gift-robux-breakdown-toggle",
			LayoutOrder = 1,
			onActivated = p1.onToggle,
			stateLayer = { affordance = stateLayerAffordance.Background }
		}, {
			PlusIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = iconName.RobloxPlus,
				size = iconSize.Medium
			}),
			Summary = reactModule.createElement(view, {
				tag = "row align-y-center fill gap-xxsmall auto-y",
				LayoutOrder = 2
			}, {
				Leading = reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left content-emphasis",
					testId = "gift-robux-breakdown-summary-leading",
					LayoutOrder = 1,
					Text = p1.summaryLeadingText
				}),
				Amount = reactModule.createElement(view, {
					tag = "row align-y-center gap-xxsmall auto-xy",
					LayoutOrder = 2
				}, {
					RobuxIcon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = iconName.Robux,
						size = iconSize.Small
					}),
					Value = reactModule.createElement(text, {
						tag = "auto-xy text-title-medium text-no-wrap content-emphasis",
						testId = "gift-robux-breakdown-summary-amount",
						LayoutOrder = 2,
						Text = p1.summaryAmountText
					})
				}),
				Trailing = reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left content-emphasis",
					testId = "gift-robux-breakdown-summary-trailing",
					LayoutOrder = 3,
					Text = p1.summaryTrailingText
				})
			}),
			Chevron = reactModule.createElement(icon, {
				testId = "gift-robux-breakdown-chevron",
				LayoutOrder = 3,
				name = iconName.ChevronLargeDown,
				size = iconSize.Medium,
				Rotation = if p1.isExpanded then 180 else 0
			})
		}),
		Content = if p1.isExpanded then reactModule.createElement(view, {
			tag = "col gap-small size-full-0 auto-y padding-x-medium padding-bottom-medium padding-top-xsmall",
			testId = "gift-robux-breakdown-content",
			LayoutOrder = 2
		}, {
			Rows = reactModule.createElement(view, {
				tag = "col gap-xxsmall size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Subtotal = reactModule.createElement(PriceLine, { LayoutOrder = 1, line = p1.subtotal }),
				Discounts = reactModule.createElement(view, {
					tag = "col gap-xxsmall size-full-0 auto-y",
					LayoutOrder = 2
				}, t)
			}),
			Divider = reactModule.createElement(divider, { LayoutOrder = 2 }),
			Total = reactModule.createElement(PriceLine, { isTotal = true, LayoutOrder = 3, line = p1.total })
		}) else nil
	})
end)