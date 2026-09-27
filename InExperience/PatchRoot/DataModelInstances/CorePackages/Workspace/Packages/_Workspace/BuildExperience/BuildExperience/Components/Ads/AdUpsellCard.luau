local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local button = foundationModule.Button
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: foundationModule (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildAgentAdCampaignCardModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = useLocalization({
		title = localizationStringsModule.AD_UPSELL_CARD_TITLE,
		description = localizationStringsModule.AD_UPSELL_CARD_DESC,
		freeTitle = if fFlagBuildAgentAdCampaignCardModule then localizationStringsModule.AD_UPSELL_FREE_TITLE else nil,
		freeTitlePlural = if fFlagBuildAgentAdCampaignCardModule then {
			localizationStringsModule.AD_UPSELL_FREE_TITLE_PLURAL,
			promotionCount = p1.freePromotionsRemaining
		} else nil,
		freeDescription = if fFlagBuildAgentAdCampaignCardModule then localizationStringsModule.AD_UPSELL_FREE_DESC else nil,
		noFreeTitle = if fFlagBuildAgentAdCampaignCardModule then localizationStringsModule.AD_UPSELL_NO_FREE_TITLE else nil,
		noFreeDescription = if fFlagBuildAgentAdCampaignCardModule then localizationStringsModule.AD_UPSELL_NO_FREE_DESC else nil,
		create = localizationStringsModule.AD_UPSELL_CARD_CREATE,
		dontShowAgain = localizationStringsModule.AD_UPSELL_CARD_DONT_SHOW_AGAIN
	})
	local title = var2.title
	local description = var2.description
	
	if fFlagBuildAgentAdCampaignCardModule then
		if p1.freePromotionsRemaining == 1 then
			title = var2.freeTitle
			description = var2.freeDescription
		elseif p1.freePromotionsRemaining > 0 then
			title = var2.freeTitlePlural
			description = var2.freeDescription
		else
			title = var2.noFreeTitle
			description = var2.noFreeDescription
		end
	end
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
					style = var1.Color.Content.Emphasis
				}),
				Label = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
					Text = title
				})
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = description
			})
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			Create = reactModule.createElement(button, {
				LayoutOrder = 1,
				testId = "AdUpsellCard.Create",
				text = var2.create,
				size = inputSize.Small,
				variant = buttonVariant.SoftEmphasis,
				fillBehavior = fillBehavior.Fill,
				width = UDim.new(1, 0),
				isLoading = p1.isCreatePending == true,
				isDisabled = fFlagBuildAgentAdCampaignCardModule and p1.isCreateDisabled == true,
				onActivated = p1.onCreate
			}),
			DontShowAgain = if fFlagBuildAgentAdCampaignCardModule and p1.onDismiss == nil then nil else reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "AdUpsellCard.DontShowAgain",
				text = var2.dontShowAgain,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = p1.onDismiss
			})
		})
	})
end