local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local FFlagBuildAgentAdCampaignRefreshEligibilityModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignRefreshEligibility)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local ChatCardPriorityModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.ChatCardPriority)
local UseChatCardEmphasisModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.useChatCardEmphasis)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(Frame) --[[ Line: 41 | Named "AdUpsellCard" ]]
	-- upvalues: FoundationModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildAgentAdCampaignCardModule (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), UseChatCardEmphasisModule (copy), ChatCardPriorityModule (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseLocalizationResult = UseLocalizationFunction({
		title = LocalizationStringsModule.AD_UPSELL_CARD_TITLE,
		description = LocalizationStringsModule.AD_UPSELL_CARD_DESC,
		freeTitle = if FFlagBuildAgentAdCampaignCardModule then LocalizationStringsModule.AD_UPSELL_FREE_TITLE else nil,
		freeTitlePlural = if FFlagBuildAgentAdCampaignCardModule then {
			LocalizationStringsModule.AD_UPSELL_FREE_TITLE_PLURAL,
			promotionCount = Frame.freePromotionsRemaining
		} else nil,
		freeDescription = if FFlagBuildAgentAdCampaignCardModule then LocalizationStringsModule.AD_UPSELL_FREE_DESC else nil,
		noFreeTitle = if FFlagBuildAgentAdCampaignCardModule then LocalizationStringsModule.AD_UPSELL_NO_FREE_TITLE else nil,
		noFreeDescription = if FFlagBuildAgentAdCampaignCardModule then LocalizationStringsModule.AD_UPSELL_NO_FREE_DESC else nil,
		create = LocalizationStringsModule.AD_UPSELL_CARD_CREATE,
		dontShowAgain = LocalizationStringsModule.AD_UPSELL_CARD_DONT_SHOW_AGAIN,
		eligibilityError = if FFlagBuildAgentAdCampaignRefreshEligibilityModule then if Frame.eligibilityError == "unavailable" then LocalizationStringsModule.AD_CAMPAIGN_SHEET_FORBIDDEN_ERROR else LocalizationStringsModule.AD_CAMPAIGN_SHEET_INTERNAL_ERROR else nil
	})
	local Title = UseLocalizationResult.title
	local Description = UseLocalizationResult.description
	
	if FFlagBuildAgentAdCampaignCardModule then
		if Frame.fundingType == "paid" then
			Title = UseLocalizationResult.noFreeTitle
			Description = UseLocalizationResult.noFreeDescription
		elseif Frame.freePromotionsRemaining == 1 then
			Title = UseLocalizationResult.freeTitle
			Description = UseLocalizationResult.freeDescription
		elseif Frame.freePromotionsRemaining > 0 then
			Title = UseLocalizationResult.freeTitlePlural
			Description = UseLocalizationResult.freeDescription
		else
			Title = UseLocalizationResult.noFreeTitle
			Description = UseLocalizationResult.noFreeDescription
		end
	end
	local DontShowAgain = UseLocalizationResult.dontShowAgain
	local UseChatCardEmphasisModuleResult = if FFlagBuildExperienceChatCardEmphasisModule then UseChatCardEmphasisModule(ChatCardPriorityModule.AdUpsell, Frame.emphasisOrder) else nil
	
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "AdUpsellCard",
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.containerRef
	}, {
		Content = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-small size-full-0 auto-y"
			}, {
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					testId = "AdUpsellCard.Icon",
					name = IconName.Megaphone,
					style = UseTokensResult.Color.Content.Emphasis
				}),
				Label = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
					Text = Title
				})
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = Description
			}),
			EligibilityError = if FFlagBuildAgentAdCampaignRefreshEligibilityModule and Frame.eligibilityError ~= nil then ReactModule.createElement(Text, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-alert",
				testId = "AdUpsellCard.EligibilityError",
				Text = UseLocalizationResult.eligibilityError
			}) else nil
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			Create = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				testId = "AdUpsellCard.Create",
				text = UseLocalizationResult.create,
				size = InputSize.Small,
				variant = if UseChatCardEmphasisModuleResult == true then ButtonVariant.Emphasis else ButtonVariant.SoftEmphasis,
				fillBehavior = FillBehavior.Fill,
				width = UDim.new(1, 0),
				isLoading = Frame.isCreatePending == true,
				isDisabled = FFlagBuildAgentAdCampaignCardModule and Frame.isCreateDisabled == true,
				onActivated = Frame.onCreate
			}),
			DontShowAgain = if FFlagBuildAgentAdCampaignCardModule and Frame.onDismiss == nil then nil else ReactModule.createElement(Button, {
				LayoutOrder = 2,
				testId = "AdUpsellCard.DontShowAgain",
				text = DontShowAgain,
				size = InputSize.Small,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = Frame.onDismiss
			})
		})
	})
end