local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local localizationService = game:GetService("LocalizationService")
local formatNumberModule = require(parent.Utility.formatNumber)
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local useRobuxTextModule = require(parent.Generic.Hooks.useRobuxText)

return function(p0)
	-- upvalues: reactModule (ref), formatNumberModule (ref), localizationService (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), useRobuxTextModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, { tag = "auto-xy align-y-center align-x-start row" }, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-default text-align-x-left",
				Text = p0.titleText
			})
		}),
		RightSide = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p0.hideUserRobuxBalance then nil else reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-medium content-emphasis text-align-x-right",
				Text = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then useRobuxTextModule(p0.robuxBalanceAmount or 0) else reactModule.useMemo(function()
					-- upvalues: formatNumberModule (copy), localizationService (copy), p0 (ref)
					return utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p0.robuxBalanceAmount or 0)
				end, {
					p0.robuxBalanceAmount,
					localizationService.RobloxLocaleId
				}),
				RichText = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then true else nil
			})
		})
	})
end