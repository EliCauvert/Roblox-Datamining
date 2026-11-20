local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local View = FoundationModule.View
local Sheet = FoundationModule.Sheet
local Button = FoundationModule.Button
local Loading = FoundationModule.Loading
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(RobloxSubscriptionPurchaseApp.types)
local FeatureRowModule = require(script.Parent.FeatureRow)
local PlusHeroContentModule = require(script.Parent.PlusHeroContent)
local LegalDisclosureModule = require(script.Parent.LegalDisclosure)
local UsePlaceholderLocalizationModule = require(RobloxSubscriptionPurchaseApp.Hooks.usePlaceholderLocalization)
local UseCampaignStringsLoadingModule = require(RobloxSubscriptionPurchaseApp.Hooks.useCampaignStringsLoading)
local CampaignLocalizationsModule = require(RobloxSubscriptionPurchaseApp.Store.CampaignLocalizations)
local TransitionToErrorModule = require(RobloxSubscriptionPurchaseApp.Actions.transitionToError)
local ErrorReasonModule = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local LogRobloxSubscriptionUpsellCounterModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local FFlagClaimSheetWaitForCampaignStringsModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagClaimSheetWaitForCampaignStrings)
local FIntClaimSheetCopyWaitSecondsModule = require(RobloxSubscriptionPurchaseApp.Flags.FIntClaimSheetCopyWaitSeconds)
local FFlagTTOnboardingSheetModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagTTOnboardingSheet)
local FFlagOnboardingSheetLayout = require(Parent.SharedFlags).FFlagOnboardingSheetLayout

if FFlagTTOnboardingSheetModule then
	FoundationCloudAssetsModule.preloadAsset("pictograms/gift")
	FoundationCloudAssetsModule.preloadAsset("pictograms/plus")
end
local config = {
	title = "Feature.RobloxSubscription.Heading.TTGrant",
	description = "Feature.RobloxSubscription.Description.TTGrant",
	ctaText = "Feature.RobloxSubscription.Action.TTClaim",
	benefitCustomize = "Feature.RobloxSubscription.Label.TTBenefitCustomize",
	benefitDiscount = "Feature.RobloxSubscription.Label.TTBenefitDiscount",
	benefitPrivateServer = "Feature.RobloxSubscription.Label.TTBenefitPrivateServer",
	benefitRobux = "Feature.RobloxSubscription.Label.TTBenefitRobux"
}

local function getCampaignCopy(UseSignalStateResult, IsLoading)
	-- upvalues: config (copy)
	local t = {}
	
	for i, value in config do
		local UseSignalStateResultEntry = UseSignalStateResult[value]
		t[i] = if IsLoading or type(UseSignalStateResultEntry) ~= "string" then "" else UseSignalStateResultEntry
	end
	return t
end

local function getRequiredCampaignStrings(PurchaseUIOptions)
	-- upvalues: config (copy)
	local config1 = {
		title = PurchaseUIOptions.title,
		description = PurchaseUIOptions.description,
		ctaText = PurchaseUIOptions.ctaText
	}
	local t = {}
	
	for i, value in config do
		if config1[i] == nil then
			t[i] = value
		end
	end
	return t
end

local list = {
	{
		stringName = "benefitCustomize",
		iconName = IconName.PaintBrush
	},
	{ stringName = "benefitDiscount", iconName = IconName.Tag },
	{
		stringName = "benefitPrivateServer",
		iconName = IconName.Controller
	},
	{ stringName = "benefitRobux", iconName = IconName.Robux }
}

return function(p1)
	-- upvalues: FFlagOnboardingSheetLayout (copy), UseTokensFunction (copy), SignalsReactModule (copy), CampaignLocalizationsModule (copy), FFlagClaimSheetWaitForCampaignStringsModule (copy), UseCampaignStringsLoadingModule (copy), getRequiredCampaignStrings (copy), FIntClaimSheetCopyWaitSecondsModule (copy), ReactModule (copy), getCampaignCopy (copy), UsePlaceholderLocalizationModule (copy), config (copy), LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), TransitionToErrorModule (copy), ErrorReasonModule (copy), list (copy), FeatureRowModule (copy), FoundationCloudAssetsModule (copy), View (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy), LegalDisclosureModule (copy), Sheet (copy), PlusHeroContentModule (copy), Loading (copy), IconSize (copy)
	local Padding = nil
	
	if FFlagOnboardingSheetLayout then
		local UseTokensResult = UseTokensFunction()
		local _UDim = UDim.new(0, UseTokensResult.Padding.Medium - UseTokensResult.Margin.Small)
		Padding = {
			top = UDim.new(0, UseTokensResult.Padding.Medium - UseTokensResult.Padding.Small - UseTokensResult.Margin.Small),
			bottom = _UDim,
			left = _UDim,
			right = _UDim
		}
	end
	local UseSignalStateResult = SignalsReactModule.useSignalState(CampaignLocalizationsModule.getCampaignLocalizations)
	local PurchaseUIOptions = p1.purchaseUIOptions
	local IsLoading = false
	local IsMissing = false
	local v1 = false
	local UseResult = nil
	
	if FFlagClaimSheetWaitForCampaignStringsModule then
		local UseCampaignStringsLoadingModuleResult = UseCampaignStringsLoadingModule(UseSignalStateResult, getRequiredCampaignStrings(PurchaseUIOptions), FIntClaimSheetCopyWaitSecondsModule)
		IsLoading = UseCampaignStringsLoadingModuleResult.isLoading
		IsMissing = UseCampaignStringsLoadingModuleResult.isMissing
		local UseStateResult2 = nil
		v1, UseStateResult2 = ReactModule.useState(false)
		local OnButtonMountedFunction = p1.onButtonMounted
		UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (ref), OnButtonMountedFunction (copy)
			UseStateResult2(p2 ~= nil)
			OnButtonMountedFunction(p2)
		end, { OnButtonMountedFunction })
	end
	local CampaignCopy = if FFlagClaimSheetWaitForCampaignStringsModule then getCampaignCopy(UseSignalStateResult, IsLoading) else UsePlaceholderLocalizationModule(config)
	local FeatureRobloxSubscriptionDisclosureTTClaimTerms = UseSignalStateResult["Feature.RobloxSubscription.Disclosure.TTClaimTerms"]
	local Title = PurchaseUIOptions.title or CampaignCopy.title
	local Description = PurchaseUIOptions.description or CampaignCopy.description
	local CtaText = PurchaseUIOptions.ctaText or CampaignCopy.ctaText
	local IsCtaTextMatch: boolean = FFlagClaimSheetWaitForCampaignStringsModule and CtaText == ""
	
	if FFlagClaimSheetWaitForCampaignStringsModule then
		ReactModule.useEffect(function()
			-- upvalues: IsMissing (ref), v1 (ref), LogRobloxSubscriptionUpsellCounterModule (upval), RobloxSubscriptionUpsellTelemetryModule (upval), IsCtaTextMatch (copy), TransitionToErrorModule (upval), ErrorReasonModule (upval)
			if IsMissing and v1 then
				LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionTTSheetCopyMissingCounter)
				
				if IsCtaTextMatch then
					TransitionToErrorModule(ErrorReasonModule.GenericError, "useTTSheetSlots")
				end
			end
		end, { IsMissing, v1, IsCtaTextMatch })
	end
	local Elements = {}
	
	for LayoutOrder, value in list do
		if not FFlagClaimSheetWaitForCampaignStringsModule or CampaignCopy[value.stringName] ~= "" then
			Elements[`Benefit{LayoutOrder}`] = ReactModule.createElement(FeatureRowModule, {
				layoutOrder = LayoutOrder,
				iconName = value.iconName,
				text = CampaignCopy[value.stringName]
			})
		end
	end
	local PictogramsGift = FoundationCloudAssetsModule.Assets["pictograms/gift"]
	local PictogramsPlus = FoundationCloudAssetsModule.Assets["pictograms/plus"]
	local Element = ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = {
			["row wrap align-x-center gap-small size-full-0 auto-xy"] = FFlagOnboardingSheetLayout,
			["row wrap align-x-center gap-medium size-full-0 auto-xy"] = not FFlagOnboardingSheetLayout
		}
	}, {
		Claim = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			testId = "BlackbirdSheet--tt-claim",
			ref = if FFlagClaimSheetWaitForCampaignStringsModule then UseResult else p1.onButtonMounted,
			text = CtaText,
			onActivated = p1.onActivated,
			isLoading = p1.isLoading or FFlagClaimSheetWaitForCampaignStringsModule and IsLoading,
			isDisabled = FFlagClaimSheetWaitForCampaignStringsModule and IsCtaTextMatch and not IsLoading or nil,
			fillBehavior = FillBehavior.Fill,
			variant = ButtonVariant.Emphasis
		}),
		LegalDisclosure = if FeatureRobloxSubscriptionDisclosureTTClaimTerms and FeatureRobloxSubscriptionDisclosureTTClaimTerms ~= "" and (not FFlagClaimSheetWaitForCampaignStringsModule or not IsCtaTextMatch) then ReactModule.createElement(LegalDisclosureModule, {
			layoutOrder = 2,
			ctaText = CtaText,
			textTemplate = FeatureRobloxSubscriptionDisclosureTTClaimTerms
		}) else nil
	})
	
	return {
		Header = if FFlagOnboardingSheetLayout then nil else ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }),
		FullBleed = if FFlagOnboardingSheetLayout then ReactModule.createElement(Sheet.FullBleed, { media = "", aspectRatio = 1.7777777777777777 }, {
			Hero = ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center size-full radius-top-large bg-shift-100",
				testId = "BlackbirdSheet--tt-hero"
			}, {
				Pictogram = ReactModule.createElement(PlusHeroContentModule, {
					layoutOrder = 1,
					pictogram = PictogramsGift,
					accentPictogram = PictogramsPlus,
					twoCardPictogramSize = Vector2.new(320, 180)
				})
			})
		}) else nil,
		Content = ReactModule.createElement(Sheet.Content, {
			isContentFullBleed = if FFlagOnboardingSheetLayout then true else nil
		}, {
			Body = ReactModule.createElement(View, {
				tag = {
					["col gap-medium size-full-0 auto-y padding-x-medium"] = FFlagOnboardingSheetLayout,
					["col gap-large size-full-0 auto-y"] = not FFlagOnboardingSheetLayout
				}
			}, {
				Hero = ReactModule.createElement(PlusHeroContentModule, {
					layoutOrder = 1,
					pictogram = if FFlagOnboardingSheetLayout then nil else PictogramsGift,
					accentPictogram = if FFlagOnboardingSheetLayout then nil else PictogramsPlus,
					title = if FFlagClaimSheetWaitForCampaignStringsModule and Title == "" then nil else Title,
					subtitle = if FFlagClaimSheetWaitForCampaignStringsModule and Description == "" then nil else Description,
					omitsMissingTitle = if FFlagClaimSheetWaitForCampaignStringsModule then true else nil
				}),
				CopyLoading = if FFlagClaimSheetWaitForCampaignStringsModule and IsLoading then ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "align-x-center size-full-0 auto-y",
					testId = "BlackbirdSheet--tt-copy-loading"
				}, {
					Spinner = ReactModule.createElement(Loading, { size = IconSize.Large })
				}) else nil,
				Benefits = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = {
						["col align-x-left gap-xsmall size-full-0 auto-y"] = FFlagOnboardingSheetLayout,
						["col align-x-left gap-small size-full-0 auto-y"] = not FFlagOnboardingSheetLayout
					}
				}, Elements)
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			ActionsContainer = if FFlagOnboardingSheetLayout then ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y",
				padding = Padding
			}, { ActionsContainer = Element }) else Element
		})
	}
end