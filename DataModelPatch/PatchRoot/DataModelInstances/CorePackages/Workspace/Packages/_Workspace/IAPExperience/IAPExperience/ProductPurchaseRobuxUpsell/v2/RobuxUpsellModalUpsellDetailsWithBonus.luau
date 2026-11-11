local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local FormatNumberModule = require(Parent.Utility.formatNumber)
local _ = require(Parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local _ = require(Parent.Enums.BadgeType)
local _ = require(Parent.Enums.VirtualItemBadgeType)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy), FormatNumberModule (copy), LocalizationService (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		MoreRobux = "IAPExperience.RobuxUpsell.Text.MoreRobux",
		Bonus = "IAPExperience.RobuxUpsell.Text.Bonus"
	})
	
	return ReactModule.createElement(View, {
		tag = "flex-x-between\tflex-y-fill size-full-1700 radius-medium padding-x-large padding-y-medium row bg-surface-300 stroke-emphasis stroke-standard",
		LayoutOrder = p1.layoutOrder
	}, {
		LeftSide = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "auto-xy col align-y-top align-x-left gap-small"
		}, {
			BonusLabel = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-small content-default",
				Text = UseLocalizationResult.MoreRobux
			}),
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-large content-emphasis text-align-x-left",
				Text = utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.robuxAmount) .. " + " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.bonusAmount) .. " " .. UseLocalizationResult.Bonus
			})
		}),
		RightSide = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "auto-xy row align-y-center align-x-right"
		}, {
			RobuxPrice = ReactModule.createElement(Text, {
				tag = "auto-xy text-title-large content-emphasis text-align-x-right",
				Text = p1.priceString or ""
			})
		})
	})
end