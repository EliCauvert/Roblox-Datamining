local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
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

return function(p1)
	-- upvalues: foundationModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = useLocalization({
		title = localizationStringsModule.AD_UPSELL_CARD_TITLE,
		description = localizationStringsModule.AD_UPSELL_CARD_DESC,
		create = localizationStringsModule.AD_UPSELL_CARD_CREATE,
		dontShowAgain = localizationStringsModule.AD_UPSELL_CARD_DONT_SHOW_AGAIN
	})
	
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
					Text = var1.title
				})
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = var1.description
			})
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			Create = reactModule.createElement(button, {
				LayoutOrder = 1,
				testId = "AdUpsellCard.Create",
				text = var1.create,
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
				text = var1.dontShowAgain,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = p1.onDismiss
			})
		})
	})
end