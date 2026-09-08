local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName

return function(p1)
	-- upvalues: foundationModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref)
	local var1 = useLocalization({
		title = if p1.freePromotionsRemaining == 1 then localizationStringsModule.PROMOTION_BANNER_TITLE_SINGULAR else {
			localizationStringsModule.PROMOTION_BANNER_TITLE,
			promotionCount = p1.freePromotionsRemaining
		},
		subtitle = localizationStringsModule.PROMOTION_BANNER_SUBTITLE
	})
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "PromotionCard",
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			testId = "PromotionCard.Icon",
			name = iconName.Megaphone,
			style = foundationModule.Hooks.useTokens().Color.Content.Emphasis
		}),
		Content = reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill auto-y" }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = var1.title
			}),
			Subtitle = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = var1.subtitle
			})
		})
	})
end