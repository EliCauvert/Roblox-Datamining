local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local button = foundationModule.Button
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p1)
	-- upvalues: foundationModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref), button (ref), buttonVariant (ref)
	local var1 = if fFlagBuildLocalization then useLocalization({
		title = localizationStringsModule.AD_UPSELL_CARD_TITLE,
		description = localizationStringsModule.AD_UPSELL_CARD_DESC,
		create = localizationStringsModule.AD_UPSELL_CARD_CREATE
	}) else nil
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-default radius-large",
		testId = "AdUpsellCard",
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			testId = "AdUpsellCard.Icon",
			name = iconName.Megaphone,
			style = foundationModule.Hooks.useTokens().Color.Content.Emphasis
		}),
		Content = reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill auto-y" }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = if fFlagBuildLocalization then var1.title else localizationStringsModule.AD_UPSELL_CARD_TITLE
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis",
				Text = if fFlagBuildLocalization then var1.description else localizationStringsModule.AD_UPSELL_CARD_DESC
			})
		}),
		Action = reactModule.createElement(button, {
			LayoutOrder = 3,
			testId = "AdUpsellCard.Create",
			text = if fFlagBuildLocalization then var1.create else localizationStringsModule.AD_UPSELL_CARD_CREATE,
			variant = buttonVariant.SoftEmphasis,
			isLoading = p1.isCreatePending == true,
			onActivated = p1.onCreate
		})
	})
end