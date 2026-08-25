local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local localizationService = game:GetService("LocalizationService")
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local formatNumberModule = require(parent.Utility.formatNumber)
local _ = require(parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local _ = require(parent.Enums.BadgeType)
local _ = require(parent.Enums.VirtualItemBadgeType)

return function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref)
	local var4 = useLocalization({
		MoreRobux = "IAPExperience.RobuxUpsell.Text.MoreRobux",
		Bonus = "IAPExperience.RobuxUpsell.Text.Bonus"
	})
	
	return reactModule.createElement(view, {
		tag = "flex-x-between\tflex-y-fill size-full-1700 radius-medium padding-x-large padding-y-medium row bg-surface-300 stroke-emphasis stroke-standard",
		LayoutOrder = p0.layoutOrder
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "auto-xy col align-y-top align-x-left gap-small"
		}, {
			BonusLabel = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-small content-default",
				Text = var4.MoreRobux
			}),
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-large content-emphasis text-align-x-left",
				Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p0.robuxAmount) .. " + " .. formatNumberModule(localizationService.RobloxLocaleId, p0.bonusAmount) .. " " .. var4.Bonus
			})
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "auto-xy row align-y-center align-x-right"
		}, {
			RobuxPrice = reactModule.createElement(text, {
				tag = "auto-xy text-title-large content-emphasis text-align-x-right",
				Text = p0.priceString or ""
			})
		})
	})
end