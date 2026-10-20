local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local CreatorCreditModule = require(Parent.DataHydration.CreatorCredit)
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local NumberLocalization = require(Parent.Localization).NumberLocalization
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local FFlagEnablePaidAdsModule = require(BuildExperience.Flags.FFlagEnablePaidAds)
local FFlagBuildAdsManagerUniverseUrlModule = require(BuildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
local GetAdsManagerUrlModule = require(script.Parent.Parent.getAdsManagerUrl)
local AdCampaignEligibilityUtilsModule = require(script.Parent.Parent.adCampaignEligibilityUtils)
local CreateAdCampaignSheetConfigModule = require(script.Parent.CreateAdCampaignSheetConfig)
local _ = require(script.Parent.CreateAdCampaignSheetView)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseOpenBuyRobuxWebViewModule = require(BuildExperience.Components.CreatorCreditSheet.useOpenBuyRobuxWebView)
local UseOpenWebViewWithResumeRefreshModule = require(BuildExperience.utils.useOpenWebViewWithResumeRefresh)
local DataStatus = require(Parent.DataHydration).DataStatus
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local IconName = require(Parent.Foundation).Enums.IconName
local CampaignEndMsFunction = require(script.Parent.Parent.adCampaignScheduleUtils).campaignEndMs
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local Signal = require(Parent.Signals).createSignal({ status = "succeeded" })
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function _(Value: number)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	return NumberLocalization.localize(string.format("%.0f", (math.floor(Value))), LocalizationService.RobloxLocaleId)
end

local _ = function(p1, p2)
	if p1 == nil then
		error(`{p2} is required for the two-option ad campaign sheet`)
	end
	return p1
end

local _ = function(p3)
	if p3 == nil or p3.feedback == nil and p3.plays == nil then
		error("campaignOffers is required for the two-option ad campaign sheet")
	end
	return p3
end

local _ = function(p3, p4)
	return if p4 == "feedback" then p3.feedback elseif p4 == "plays" then p3.plays else nil
end

local function toCampaignOption(Feedback, Title, RunDates, Description, Free)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	local IsFree = Feedback.fundingType == "free"
	
	return {
		value = Feedback.campaignOption,
		title = Title,
		runDates = RunDates,
		description = Description,
		priceText = if IsFree then Free else NumberLocalization.localize(string.format("%.0f", (math.floor(Feedback.priceRobux))), LocalizationService.RobloxLocaleId),
		originalPriceText = if IsFree then NumberLocalization.localize(string.format("%.0f", (math.floor(Feedback.priceRobux))), LocalizationService.RobloxLocaleId) else nil
	}
end

local function useTwoOptionsControls(IsFocusable, Callback, Callback2, p3, IsIsCreatePending, IsHasCreateError, Callback1, AttemptedOption, AdsManager, UniverseId)
	-- upvalues: ResponsiveModule (copy), CreatorAgentChatModule (copy), AdCampaignEligibilityUtilsModule (copy), ReactModule (copy), SignalsReactModule (copy), Signal (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseDefaultFocusBehaviorFunction (copy), UseOpenBuyRobuxWebViewModule (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), GetAdsManagerUrlModule (copy), UseOpenWebViewWithResumeRefreshModule (copy)
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local AdCampaignCheckFundsFunction = CreatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignCheckFunds
	local DefaultOffer = AdCampaignEligibilityUtilsModule.getDefaultOffer(p3)
	local CampaignOption = if AttemptedOption == nil then DefaultOffer.campaignOption else AttemptedOption.campaignOption
	local UseStateResult, UseStateResult2 = ReactModule.useState(CampaignOption)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UseStateResult1 == nil then Signal else UseStateResult1.state)
	local UseResult = ReactModule.useCallback(function(p4)
		-- upvalues: UseStateResult2_1 (copy), AdCampaignCheckFundsFunction (copy)
		if p4 == nil or p4.fundingType ~= "paid" then
			UseStateResult2_1(nil)
			
			return
		else
			UseStateResult2_1(AdCampaignCheckFundsFunction({ campaignOption = p4.campaignOption }))
		end
	end, { AdCampaignCheckFundsFunction })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy)
		if UseStateResult1 == nil then return end
		return function()
			-- upvalues: UseStateResult1 (upval)
			UseStateResult1.dispose()
		end
	end, { UseStateResult1 or false })
	ReactModule.useEffect(function()
		-- upvalues: IsFocusable (copy), IsHasCreateError (copy), UseStateResult2 (copy), CampaignOption (copy), UseStateResult2_1 (copy), IsIsCreatePending (copy), p3 (copy)
		if IsFocusable then
			UseStateResult2(function(p4)
				-- upvalues: IsIsCreatePending (upval), IsHasCreateError (upval), p3 (upval), CampaignOption (upval)
				if (IsIsCreatePending or IsHasCreateError) and (if p4 == "feedback" then p3.feedback elseif p4 == "plays" then p3.plays else nil) ~= nil then
					return p4
				else
					return CampaignOption
				end
			end)
			
			return
		end
		if not IsHasCreateError then
			UseStateResult2(CampaignOption)
		end
		UseStateResult2_1(nil)
	end, {
		IsFocusable,
		IsIsCreatePending,
		IsHasCreateError,
		CampaignOption,
		p3
	})
	local Feedback = if UseStateResult == "feedback" then p3.feedback elseif UseStateResult == "plays" then p3.plays else nil
	local NoCurrent: boolean = IsHasCreateError and (UseRefResult.current == nil or UseRefResult.current == UseStateResult)
	ReactModule.useEffect(function()
		-- upvalues: IsFocusable (copy), NoCurrent (copy), IsIsCreatePending (copy), UseResult (copy), Feedback (copy)
		if IsFocusable and not NoCurrent and not IsIsCreatePending then
			UseResult(Feedback)
		end
	end, {
		IsFocusable,
		IsIsCreatePending,
		NoCurrent,
		Feedback,
		UseResult
	})
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = IsFocusable,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p4)
						-- upvalues: Callback (upval)
						Callback()
						p4:cancel()
					end)
				}
			}
		end, { Callback })
	})))
	local UseResult1 = ReactModule.useCallback(function(p4)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p4)
	end, {})
	local Result = UseSignalStateResult.result
	local IsPaid: boolean = Feedback ~= nil and Feedback.fundingType == "paid"
	local NoUseStateResult: boolean = not IsIsCreatePending and (not NoCurrent and (IsPaid and (UseStateResult1 == nil or UseSignalStateResult.status == "pending")))
	local IsFailed: boolean = not IsIsCreatePending and (not NoCurrent and (IsPaid and UseSignalStateResult.status == "failed"))
	local CanFund = IsPaid and (UseSignalStateResult.status == "succeeded" and (Result ~= nil and Result.canFund))
	local NoCanFund: boolean = not IsIsCreatePending and (not NoCurrent and (IsPaid and (UseSignalStateResult.status == "succeeded" and (Result ~= nil and not Result.canFund))))
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Callback1 (copy), IsFocusable (copy), IsPaid (copy), UseResult (copy), Feedback (copy)
		Callback1()
		
		if IsFocusable and IsPaid then
			UseResult(Feedback)
		end
	end, {
		IsFocusable,
		IsPaid,
		Feedback,
		UseResult,
		Callback1
	})
	local UseOpenBuyRobuxWebViewModuleResult = UseOpenBuyRobuxWebViewModule(UseResult2)
	
	return {
		sheetRootRef = UseDefaultFocusBehaviorResult2,
		defaultOptionRef = UseDefaultFocusBehaviorResult,
		selectedOption = UseStateResult,
		showCloseButton = UsePreferredInputResult ~= ResponsiveModule.Input.Directional,
		isFundingCheckPending = NoUseStateResult,
		isPrimaryActionDisabled = Feedback == nil or not NoCurrent and (IsPaid and (not CanFund and (not NoCanFund and not IsFailed))),
		shouldBuyRobux = NoCanFund,
		showAdCreditsCallout = not IsIsCreatePending and (CanFund and Result.fundingSource == "ad_credit"),
		isErrorForSelectedOption = NoCurrent,
		onOptionChanged = UseResult1,
		onOpenBuyRobux = UseOpenBuyRobuxWebViewModuleResult,
		onOpenAdsManager = if FFlagBuildAdsManagerUniverseUrlModule then UseOpenWebViewWithResumeRefreshModule(GetAdsManagerUrlModule.getAdsManagerUrl(UniverseId), AdsManager, UseResult2) else UseOpenWebViewWithResumeRefreshModule(GetAdsManagerUrlModule.getDefaultAdsManagerUrl(), AdsManager, UseResult2),
		onCreate = ReactModule.useCallback(function()
			-- upvalues: NoCanFund (copy), UseOpenBuyRobuxWebViewModuleResult (copy), IsFailed (copy), UseResult (copy), Feedback (copy), IsPaid (copy), NoCurrent (copy), CanFund (copy), UseRefResult (copy), Callback2 (copy)
			if NoCanFund then
				UseOpenBuyRobuxWebViewModuleResult()
				
				return
			end
			if IsFailed then
				UseResult(Feedback)
				
				return
			end
			if IsPaid and not NoCurrent and not CanFund then return end
			if Feedback ~= nil then
				UseRefResult.current = Feedback.campaignOption
				Callback2({
					paymentType = Feedback.fundingType,
					campaignOption = Feedback.campaignOption
				})
				
				return
			end
		end, {
			Callback2, Feedback, NoCanFund, UseOpenBuyRobuxWebViewModuleResult, IsPaid,
			NoCurrent, CanFund, IsFailed, UseResult
		})
	}
end

return function(p3)
	-- upvalues: CreatorCreditModule (copy), ReactModule (copy), SignalsReactModule (copy), UseOpenWebViewFunction (copy), FFlagEnablePaidAdsModule (copy), CreateAdCampaignSheetConfigModule (copy), CampaignEndMsFunction (copy), LocalizationStringsModule (copy), UseLocalizationFunction (copy), useTwoOptionsControls (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), NumberLocalization (copy), LocalizationService (copy), DataStatus (copy), toCampaignOption (copy), IconName (copy)
	local CreatorCreditStore = CreatorCreditModule.getCreatorCreditStore(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreatorCreditStore (copy)
		return CreatorCreditStore.getQuotaSummary()
	end, { CreatorCreditStore })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.status)
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local v1 = nil
	
	if FFlagEnablePaidAdsModule then
		local CampaignOffers = p3.campaignOffers
		
		if CampaignOffers == nil or CampaignOffers.feedback == nil and CampaignOffers.plays == nil then
			error("campaignOffers is required for the two-option ad campaign sheet")
		end
		v1 = CampaignOffers
	else
		v1 = nil
	end
	local Feedback = if v1 == nil then nil else v1.feedback
	local Plays = if v1 == nil then nil else v1.plays
	local DurationDays = if FFlagEnablePaidAdsModule and Feedback ~= nil then Feedback.durationDays else p3.campaignDurationDays or CreateAdCampaignSheetConfigModule.DEFAULT_CAMPAIGN_DURATION_DAYS
	local PriceRobux = if FFlagEnablePaidAdsModule and Feedback ~= nil then Feedback.priceRobux else p3.estimatedPriceRobux or CreateAdCampaignSheetConfigModule.DEFAULT_ESTIMATED_PRICE_ROBUX
	local RunStartTimeMs1 = nil
	
	if FFlagEnablePaidAdsModule then
		local RunStartTimeMs = p3.runStartTimeMs
		
		if RunStartTimeMs == nil then
			error("runStartTimeMs is required for the two-option ad campaign sheet")
		end
		RunStartTimeMs1 = RunStartTimeMs
	else
		RunStartTimeMs1 = p3.runStartTimeMs or CreateAdCampaignSheetConfigModule.DEFAULT_RUN_START_TIME_MS
	end
	local FormatAdCampaignSheetLocalDate = if p3.useLocalRunDates == true then LocalizationStringsModule.formatAdCampaignSheetLocalDate else LocalizationStringsModule.formatAdCampaignSheetDate
	local FormatAdCampaignSheetLocalDateResult = FormatAdCampaignSheetLocalDate(RunStartTimeMs1)
	local config = {
		title = if FFlagEnablePaidAdsModule then LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_TITLE else LocalizationStringsModule.AD_CAMPAIGN_SHEET_TITLE,
		description = {
			LocalizationStringsModule.AD_CAMPAIGN_SHEET_DESCRIPTION,
			durationDays = DurationDays
		},
		campaignTitle = {
			LocalizationStringsModule.AD_CAMPAIGN_SHEET_CAMPAIGN_TITLE,
			durationDays = DurationDays
		},
		runDates = {
			LocalizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
			startDate = FormatAdCampaignSheetLocalDateResult,
			endDate = FormatAdCampaignSheetLocalDate(if FFlagEnablePaidAdsModule then CampaignEndMsFunction(RunStartTimeMs1, DurationDays) elseif p3.runEndTimeMs == nil then CreateAdCampaignSheetConfigModule.DEFAULT_RUN_END_TIME_MS else p3.runEndTimeMs)
		},
		free = LocalizationStringsModule.AD_CAMPAIGN_SHEET_FREE,
		earnedRobuxDisclaimer = LocalizationStringsModule.AD_CAMPAIGN_SHEET_EARNED_ROBUX_DISCLAIMER,
		includedTitle = LocalizationStringsModule.AD_CAMPAIGN_SHEET_INCLUDED_TITLE,
		maximizePlays = LocalizationStringsModule.AD_CAMPAIGN_SHEET_MAXIMIZE_PLAYS,
		targetPlayers = LocalizationStringsModule.AD_CAMPAIGN_SHEET_TARGET_PLAYERS,
		performanceReport = LocalizationStringsModule.AD_CAMPAIGN_SHEET_PERFORMANCE_REPORT,
		legal = {
			LocalizationStringsModule.AD_CAMPAIGN_SHEET_LEGAL,
			advertisingTermsStart = CreateAdCampaignSheetConfigModule.ADVERTISING_TERMS_START_MARKER,
			advertisingTermsEnd = CreateAdCampaignSheetConfigModule.ADVERTISING_TERMS_END_MARKER,
			advertisingStandardsStart = CreateAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_START_MARKER,
			advertisingStandardsEnd = CreateAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_END_MARKER
		},
		create = LocalizationStringsModule.AD_CAMPAIGN_SHEET_CREATE,
		moderationNotice = if FFlagEnablePaidAdsModule then LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_MODERATION_NOTICE else LocalizationStringsModule.AD_CAMPAIGN_SHEET_MODERATION_NOTICE,
		createError = LocalizationStringsModule.AD_CAMPAIGN_SHEET_CREATE_ERROR
	}
	
	if FFlagEnablePaidAdsModule then
		config.forbiddenError = LocalizationStringsModule.AD_CAMPAIGN_SHEET_FORBIDDEN_ERROR
		config.insufficientFundsError = LocalizationStringsModule.AD_CAMPAIGN_SHEET_INSUFFICIENT_FUNDS_ERROR
		config.internalError = LocalizationStringsModule.AD_CAMPAIGN_SHEET_INTERNAL_ERROR
		config.missingThumbnailError = LocalizationStringsModule.AD_CAMPAIGN_SHEET_MISSING_THUMBNAIL_ERROR
		config.introduction = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_INTRODUCTION
		config.startCampaignTitle = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_CAMPAIGN_PICKER_TITLE
		
		if Feedback ~= nil then
			config.feedbackOptionTitle = {
				LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_OPTION_TITLE,
				durationDays = Feedback.durationDays
			}
			config.feedbackRunDates = {
				LocalizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
				startDate = FormatAdCampaignSheetLocalDateResult,
				endDate = FormatAdCampaignSheetLocalDate(CampaignEndMsFunction(RunStartTimeMs1, Feedback.durationDays))
			}
			config.feedbackDescription = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_SHORT_DESCRIPTION
		end
		if Plays ~= nil then
			config.playsOptionTitle = {
				LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_OPTION_TITLE,
				durationDays = Plays.durationDays
			}
			config.playsRunDates = {
				LocalizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
				startDate = FormatAdCampaignSheetLocalDateResult,
				endDate = FormatAdCampaignSheetLocalDate(CampaignEndMsFunction(RunStartTimeMs1, Plays.durationDays))
			}
			config.playsDescription = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_LONG_DESCRIPTION
		end
		config.buyRobux = LocalizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_BUTTON
		config.adCreditsTitle = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_AD_CREDITS_TITLE
		config.adCreditsAction = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_AD_CREDITS_ACTION
		config.adsManager = LocalizationStringsModule.ADS_STATS_ADS_MANAGER
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local IsWaitForCreateResult = p3.waitForCreateResult == true
	local IsIsCreatePending: boolean = IsWaitForCreateResult and p3.isCreatePending == true
	local IsHasCreateError: boolean = IsWaitForCreateResult and p3.hasCreateError == true
	local CreateError = UseLocalizationResult.createError
	
	if FFlagEnablePaidAdsModule and IsHasCreateError then
		local CreateErrorKind = p3.createErrorKind
		CreateError = if CreateErrorKind == "payment_required" then UseLocalizationResult.insufficientFundsError elseif CreateErrorKind == "ineligible" then UseLocalizationResult.forbiddenError elseif CreateErrorKind == "missing_thumbnail" then UseLocalizationResult.missingThumbnailError else UseLocalizationResult.internalError
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsIsCreatePending (copy), p3 (copy)
		if not IsIsCreatePending then
			p3.onClose()
			
			return
		end
	end, { p3.onClose, IsIsCreatePending })
	local UseResult1 = ReactModule.useCallback(function(p4)
		-- upvalues: p3 (copy), IsWaitForCreateResult (copy), UseResult (copy)
		p3.onCreate(p4)
		
		if not IsWaitForCreateResult then
			UseResult()
		end
	end, { p3.onCreate, UseResult, IsWaitForCreateResult })
	local UseResult2 = ReactModule.useCallback(function(p4)
		-- upvalues: UseOpenWebViewResult (copy), CreateAdCampaignSheetConfigModule (upval)
		UseOpenWebViewResult(CreateAdCampaignSheetConfigModule.ADVERTISING_TERMS_URL, p4)
	end, { UseOpenWebViewResult })
	local UseResult3 = ReactModule.useCallback(function(p4)
		-- upvalues: UseOpenWebViewResult (copy), CreateAdCampaignSheetConfigModule (upval)
		UseOpenWebViewResult(CreateAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_URL, p4)
	end, { UseOpenWebViewResult })
	local UseTwoOptionsControlsResult = if FFlagEnablePaidAdsModule then useTwoOptionsControls(p3.isOpen, UseResult, UseResult1, v1, IsIsCreatePending, IsHasCreateError, ReactModule.useCallback(function()
		-- upvalues: CreatorCreditStore (copy)
		CreatorCreditStore.refreshQuotaSummary():catch(function() end)
	end, { CreatorCreditStore }), p3.attemptedOption, UseLocalizationResult.adsManager, if FFlagBuildAdsManagerUniverseUrlModule then p3.universeId else nil) else nil
	local LocalizeResult = nil
	local BalanceState = nil
	
	if UseSignalStateResult == nil then
		if UseSignalStateResult1 == DataStatus.Failed then
			BalanceState = "failed"
			LocalizeResult = CreateAdCampaignSheetConfigModule.BALANCE_UNAVAILABLE
		else
			BalanceState = "loading"
			LocalizeResult = CreateAdCampaignSheetConfigModule.BALANCE_LOADING
		end
	else
		BalanceState = "ready"
		LocalizeResult = NumberLocalization.localize(string.format("%.0f", (math.floor(UseSignalStateResult.robuxBalance))), LocalizationService.RobloxLocaleId)
	end
	return if FFlagEnablePaidAdsModule then {
		variant = "twoOptions",
		isOpen = p3.isOpen,
		sheetRootRef = UseTwoOptionsControlsResult.sheetRootRef,
		title = UseLocalizationResult.title,
		description = UseLocalizationResult.introduction,
		startCampaignTitle = UseLocalizationResult.startCampaignTitle,
		selectedOption = UseTwoOptionsControlsResult.selectedOption,
		defaultOptionRef = UseTwoOptionsControlsResult.defaultOptionRef,
		feedbackOption = if Feedback == nil then nil else toCampaignOption(Feedback, UseLocalizationResult.feedbackOptionTitle, UseLocalizationResult.feedbackRunDates, UseLocalizationResult.feedbackDescription, UseLocalizationResult.free),
		playsOption = if Plays == nil then nil else toCampaignOption(Plays, UseLocalizationResult.playsOptionTitle, UseLocalizationResult.playsRunDates, UseLocalizationResult.playsDescription, UseLocalizationResult.free),
		legalText = UseLocalizationResult.legal,
		createText = if UseTwoOptionsControlsResult.shouldBuyRobux then UseLocalizationResult.buyRobux else UseLocalizationResult.create,
		moderationNotice = UseLocalizationResult.moderationNotice,
		isCreatePending = IsIsCreatePending,
		isFundingCheckPending = UseTwoOptionsControlsResult.isFundingCheckPending,
		isCreateDisabled = UseTwoOptionsControlsResult.isPrimaryActionDisabled,
		showAdCreditsCallout = UseTwoOptionsControlsResult.showAdCreditsCallout,
		adCreditsTitle = UseLocalizationResult.adCreditsTitle,
		adCreditsAction = UseLocalizationResult.adCreditsAction,
		hasCreateError = UseTwoOptionsControlsResult.isErrorForSelectedOption,
		createErrorText = CreateError,
		balanceState = BalanceState,
		balanceText = LocalizeResult,
		showCloseButton = UseTwoOptionsControlsResult.showCloseButton,
		onOptionChanged = UseTwoOptionsControlsResult.onOptionChanged,
		onOpenBuyRobux = UseTwoOptionsControlsResult.onOpenBuyRobux,
		onOpenAdsManager = UseTwoOptionsControlsResult.onOpenAdsManager,
		onClose = UseResult,
		onCreate = UseTwoOptionsControlsResult.onCreate,
		onAdvertisingTerms = UseResult2,
		onAdvertisingStandards = UseResult3
	} else {
		variant = "freeOptionOnly",
		isOpen = p3.isOpen,
		title = UseLocalizationResult.title,
		description = UseLocalizationResult.description,
		campaignTitle = UseLocalizationResult.campaignTitle,
		estimatedPriceText = NumberLocalization.localize(string.format("%.0f", (math.floor(PriceRobux))), LocalizationService.RobloxLocaleId),
		freeText = UseLocalizationResult.free,
		earnedRobuxDisclaimer = UseLocalizationResult.earnedRobuxDisclaimer,
		includedTitle = UseLocalizationResult.includedTitle,
		benefits = {
			{
				icon = IconName.Calendar,
				text = UseLocalizationResult.runDates
			},
			{
				icon = IconName.CirclePlay,
				text = UseLocalizationResult.maximizePlays
			},
			{
				icon = IconName.ThreePeople,
				text = UseLocalizationResult.targetPlayers
			},
			{
				icon = IconName.ChartScatterPlot,
				text = UseLocalizationResult.performanceReport
			}
		},
		legalText = UseLocalizationResult.legal,
		createText = UseLocalizationResult.create,
		moderationNotice = UseLocalizationResult.moderationNotice,
		balanceState = BalanceState,
		balanceText = LocalizeResult,
		isCreatePending = IsIsCreatePending,
		hasCreateError = IsHasCreateError,
		createErrorText = CreateError,
		onClose = UseResult,
		onCreate = UseResult1,
		onAdvertisingTerms = UseResult2,
		onAdvertisingStandards = UseResult3
	}
end