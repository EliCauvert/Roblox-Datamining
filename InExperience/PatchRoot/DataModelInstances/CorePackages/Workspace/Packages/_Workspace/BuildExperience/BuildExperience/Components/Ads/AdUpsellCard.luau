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
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p1)
	-- upvalues: foundationModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = if fFlagBuildLocalization then useLocalization({
		title = localizationStringsModule.AD_UPSELL_CARD_TITLE,
		description = localizationStringsModule.AD_UPSELL_CARD_DESC,
		create = localizationStringsModule.AD_UPSELL_CARD_CREATE,
		dontShowAgain = localizationStringsModule.AD_UPSELL_CARD_DONT_SHOW_AGAIN
	}) else nil
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "AdUpsellCard",
		LayoutOrder = p1.LayoutOrder,
		ref = p1.containerRef
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-small size-full-0 auto-y"
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					testId = "AdUpsellCard.Icon",
					name = iconName.Megaphone,
					style = foundationModule.Hooks.useTokens().Color.Content.Emphasis
				}),
				Label = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
					Text = if fFlagBuildLocalization then var1.title else localizationStringsModule.AD_UPSELL_CARD_TITLE
				})
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = if fFlagBuildLocalization then var1.description else localizationStringsModule.AD_UPSELL_CARD_DESC
			})
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			Create = reactModule.createElement(button, {
				LayoutOrder = 1,
				testId = "AdUpsellCard.Create",
				text = if fFlagBuildLocalization then var1.create else localizationStringsModule.AD_UPSELL_CARD_CREATE,
				size = inputSize.Small,
				variant = buttonVariant.SoftEmphasis,
				fillBehavior = fillBehavior.Fill,
				width = UDim.new(1, 0),
				isLoading = p1.isCreatePending == true,
				onActivated = p1.onCreate
			}),
			DontShowAgain = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "AdUpsellCard.DontShowAgain",
				text = if fFlagBuildLocalization then var1.dontShowAgain else localizationStringsModule.AD_UPSELL_CARD_DONT_SHOW_AGAIN,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = p1.onDismiss
			})
		})
	})
end