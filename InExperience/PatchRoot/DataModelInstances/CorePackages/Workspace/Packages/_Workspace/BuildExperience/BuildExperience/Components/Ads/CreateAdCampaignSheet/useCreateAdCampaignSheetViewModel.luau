local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local CreatorCreditModule = require(Parent.DataHydration.CreatorCredit)
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local DataHydrationModule = require(Parent.DataHydration)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local NumberLocalization = require(Parent.Localization).NumberLocalization
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local FFlagEnablePaidAdsModule = require(BuildExperience.Flags.FFlagEnablePaidAds)
local FFlagBuildAdsManagerUniverseUrlModule = require(BuildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
local FFlagBuildAdsFundedNotCreatedError = require(Parent.SharedFlags).FFlagBuildAdsFundedNotCreatedError
local FFlagBuildExperienceAdsAndRobuxTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceAdsAndRobuxTelemetry)
local GetAdsManagerUrlModule = require(script.Parent.Parent.getAdsManagerUrl)
local AdCampaignEligibilityUtilsModule = require(script.Parent.Parent.adCampaignEligibilityUtils)
local CreateAdCampaignSheetConfigModule = require(script.Parent.CreateAdCampaignSheetConfig)
local _ = require(script.Parent.CreateAdCampaignSheetView)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseOpenBuyRobuxWebViewModule = require(BuildExperience.Components.CreatorCreditSheet.useOpenBuyRobuxWebView)
local UseOpenWebViewWithResumeRefreshModule = require(BuildExperience.utils.useOpenWebViewWithResumeRefresh)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local DataStatus = DataHydrationModule.DataStatus
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local IconName = FoundationModule.Enums.IconName
local CampaignEndMsFunction = require(script.Parent.Parent.adCampaignScheduleUtils).campaignEndMs
local UseDefaultFocusBehaviorFunction = ReactFocusNavigationModule.useDefaultFocusBehavior
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local Signal = SignalsModule.createSignal({ status = "succeeded" })
local config = {
	isDismissed = false,
	isRetryPending = false,
	isSheetHiddenAfterRetry = false,
	markRetrying = function() end,
	markDismissed = function() end
}
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

local function useTwoOptionsControls(IsOpen, Callback1, Callback, CampaignOffers, IsIsCreatePending, IsHasCreateError, Callback2, AttemptedOption, AdsManager, UniverseId, NoIsDismissed, IsRetryPending, IsSheetHiddenAfterRetry, p3, UniverseId1)
	-- upvalues: ResponsiveModule (copy), CreatorAgentChatModule (copy), AdCampaignEligibilityUtilsModule (copy), ReactModule (copy), SignalsReactModule (copy), Signal (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FFlagBuildAdsFundedNotCreatedError (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseDefaultFocusBehaviorFunction (copy), UseOpenBuyRobuxWebViewModule (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), GetAdsManagerUrlModule (copy), UseOpenWebViewWithResumeRefreshModule (copy), FFlagBuildExperienceAdsAndRobuxTelemetryModule (copy), SendBuildExperienceEventModule (copy)
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local AdCampaignCheckFundsFunction = CreatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignCheckFunds
	local DefaultOffer = AdCampaignEligibilityUtilsModule.getDefaultOffer(CampaignOffers)
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
		-- upvalues: IsOpen (copy), IsHasCreateError (copy), UseStateResult2 (copy), CampaignOption (copy), UseStateResult2_1 (copy), IsIsCreatePending (copy), CampaignOffers (copy)
		if IsOpen then
			UseStateResult2(function(p4)
				-- upvalues: IsIsCreatePending (upval), IsHasCreateError (upval), CampaignOffers (upval), CampaignOption (upval)
				if (IsIsCreatePending or IsHasCreateError) and (if p4 == "feedback" then CampaignOffers.feedback elseif p4 == "plays" then CampaignOffers.plays else nil) ~= nil then
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
		IsOpen,
		IsIsCreatePending,
		IsHasCreateError,
		CampaignOption,
		CampaignOffers
	})
	local Feedback = if UseStateResult == "feedback" then CampaignOffers.feedback elseif UseStateResult == "plays" then CampaignOffers.plays else nil
	local NoCurrent: boolean = IsHasCreateError and (UseRefResult.current == nil or UseRefResult.current == UseStateResult)
	ReactModule.useEffect(function()
		-- upvalues: IsOpen (copy), NoCurrent (copy), IsIsCreatePending (copy), UseResult (copy), Feedback (copy)
		if IsOpen and not NoCurrent and not IsIsCreatePending then
			UseResult(Feedback)
		end
	end, {
		IsOpen,
		IsIsCreatePending,
		NoCurrent,
		Feedback,
		UseResult
	})
	local NoCurrent1 = FFlagBuildAdsFundedNotCreatedError and (IsOpen and (NoIsDismissed and NoCurrent or IsRetryPending))
	local NoCurrent1_1 = FFlagBuildAdsFundedNotCreatedError and (NoCurrent1 or IsSheetHiddenAfterRetry)
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = IsOpen and not NoCurrent1_1,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback1 (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p4)
						-- upvalues: Callback1 (upval)
						Callback1()
						p4:cancel()
					end)
				}
			}
		end, { Callback1 })
	})))
	local UseResult1 = ReactModule.useCallback(function(p4)
		-- upvalues: FFlagBuildAdsFundedNotCreatedError (upval), p3 (copy), UseStateResult2 (copy)
		if not FFlagBuildAdsFundedNotCreatedError or not p3 then
			UseStateResult2(p4)
			
			return
		end
	end, { p3 })
	local Result = UseSignalStateResult.result
	local IsPaid: boolean = Feedback ~= nil and Feedback.fundingType == "paid"
	local NoUseStateResult: boolean = not IsIsCreatePending and (not NoCurrent and (IsPaid and (UseStateResult1 == nil or UseSignalStateResult.status == "pending")))
	local IsFailed: boolean = not IsIsCreatePending and (not NoCurrent and (IsPaid and UseSignalStateResult.status == "failed"))
	local CanFund = IsPaid and (UseSignalStateResult.status == "succeeded" and (Result ~= nil and Result.canFund))
	local NoCanFund: boolean = not IsIsCreatePending and (not NoCurrent and (IsPaid and (UseSignalStateResult.status == "succeeded" and (Result ~= nil and not Result.canFund))))
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Callback2 (copy), IsOpen (copy), IsPaid (copy), UseResult (copy), Feedback (copy)
		Callback2()
		
		if IsOpen and IsPaid then
			UseResult(Feedback)
		end
	end, {
		IsOpen,
		IsPaid,
		Feedback,
		UseResult,
		Callback2
	})
	local UseOpenBuyRobuxWebViewModuleResult = UseOpenBuyRobuxWebViewModule(UseResult2)
	local UseOpenWebViewWithResumeRefreshModuleResult = nil
	UseOpenWebViewWithResumeRefreshModuleResult = if FFlagBuildAdsManagerUniverseUrlModule then UseOpenWebViewWithResumeRefreshModule(GetAdsManagerUrlModule.getAdsManagerUrl(UniverseId), AdsManager, UseResult2) else UseOpenWebViewWithResumeRefreshModule(GetAdsManagerUrlModule.getDefaultAdsManagerUrl(), AdsManager, UseResult2)
	local UseResult3 = if FFlagBuildExperienceAdsAndRobuxTelemetryModule then ReactModule.useCallback(function(p4, Context)
		-- upvalues: UseStateResult (copy), SendBuildExperienceEventModule (upval), UniverseId1 (copy)
		local config = { context = Context }
		
		if UseStateResult ~= nil then
			config.campaignOption = UseStateResult
		end
		SendBuildExperienceEventModule(p4, { universeId = UniverseId1 }, config)
	end, { UseStateResult, UniverseId1 }) else nil
	local UseResult4 = if FFlagBuildExperienceAdsAndRobuxTelemetryModule then ReactModule.useCallback(function()
		-- upvalues: UseResult3 (copy), UseOpenBuyRobuxWebViewModuleResult (copy)
		if UseResult3 ~= nil then
			UseResult3("BUY_ROBUX_CLICK", "ad_campaign_balance")
		end
		UseOpenBuyRobuxWebViewModuleResult()
	end, { UseResult3, UseOpenBuyRobuxWebViewModuleResult }) else nil
	local UseResult5 = if FFlagBuildExperienceAdsAndRobuxTelemetryModule then ReactModule.useCallback(function()
		-- upvalues: UseResult3 (copy), UseOpenWebViewWithResumeRefreshModuleResult (ref)
		if UseResult3 ~= nil then
			UseResult3("ADS_MANAGER_OPEN_CLICK", "ad_credits_callout")
		end
		UseOpenWebViewWithResumeRefreshModuleResult()
	end, { UseResult3, UseOpenWebViewWithResumeRefreshModuleResult }) else nil
	
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
		isFundedErrorDialogOpen = NoCurrent1,
		isSheetHidden = NoCurrent1_1,
		onOptionChanged = UseResult1,
		onOpenBuyRobux = if FFlagBuildExperienceAdsAndRobuxTelemetryModule and UseResult4 ~= nil then UseResult4 else UseOpenBuyRobuxWebViewModuleResult,
		onOpenAdsManager = if FFlagBuildExperienceAdsAndRobuxTelemetryModule and UseResult5 ~= nil then UseResult5 else UseOpenWebViewWithResumeRefreshModuleResult,
		onCreate = ReactModule.useCallback(function()
			-- upvalues: NoCanFund (copy), FFlagBuildExperienceAdsAndRobuxTelemetryModule (upval), UseResult3 (copy), UseOpenBuyRobuxWebViewModuleResult (copy), IsFailed (copy), UseResult (copy), Feedback (copy), IsPaid (copy), NoCurrent (copy), CanFund (copy), UseRefResult (copy), Callback (copy)
			if NoCanFund then
				if FFlagBuildExperienceAdsAndRobuxTelemetryModule and UseResult3 ~= nil then
					UseResult3("BUY_ROBUX_CLICK", "ad_campaign_primary")
				end
				UseOpenBuyRobuxWebViewModuleResult()
				
				return
			elseif IsFailed then
				UseResult(Feedback)
				
				return
			else
				if IsPaid and not NoCurrent and not CanFund then return end
				if Feedback ~= nil then
					UseRefResult.current = Feedback.campaignOption
					Callback({
						paymentType = Feedback.fundingType,
						campaignOption = Feedback.campaignOption
					})
					
					return
				end
			end
		end, {
			Callback, Feedback, NoCanFund, UseOpenBuyRobuxWebViewModuleResult, IsPaid,
			NoCurrent, CanFund, IsFailed, UseResult,
			if FFlagBuildExperienceAdsAndRobuxTelemetryModule then UseResult3 else nil
		})
	}
end

local function useFundedErrorDialogFlow(WasOpen, WasCreatePending, IsHasCreateError)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		isDismissed = false,
		isRetrying = false,
		isHiddenAfterRetry = false,
		wasCreatePending = WasCreatePending,
		wasOpen = WasOpen
	})
	local Tbl = UseStateResult
	
	if UseStateResult.wasCreatePending ~= WasCreatePending or UseStateResult.wasOpen ~= WasOpen then
		local NoWasCreatePending: boolean = UseStateResult.wasCreatePending and not WasCreatePending
		Tbl = {
			wasCreatePending = WasCreatePending,
			wasOpen = WasOpen,
			isDismissed = UseStateResult.isDismissed and not NoWasCreatePending,
			isRetrying = UseStateResult.isRetrying and not NoWasCreatePending,
			isHiddenAfterRetry = WasOpen and (UseStateResult.isHiddenAfterRetry or NoWasCreatePending and (UseStateResult.isRetrying and not IsHasCreateError))
		}
		UseStateResult2(Tbl)
	end
	return {
		isDismissed = Tbl.isDismissed,
		isRetryPending = WasCreatePending and Tbl.isRetrying,
		isSheetHiddenAfterRetry = Tbl.isHiddenAfterRetry and (not WasCreatePending and not IsHasCreateError),
		markRetrying = function()
			-- upvalues: Tbl (ref), UseStateResult2 (copy)
			local Copy = table.clone(Tbl)
			Copy.isRetrying = true
			UseStateResult2(Copy)
		end,
		markDismissed = function()
			-- upvalues: Tbl (ref), UseStateResult2 (copy)
			local Copy = table.clone(Tbl)
			Copy.isDismissed = true
			Copy.isRetrying = false
			UseStateResult2(Copy)
		end
	}
end

local function useCloseWhileSheetShown(Current, Callback)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	
	return ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Callback (copy)
		if not UseRefResult.current then
			Callback()
			
			return
		end
	end, { Callback })
end

return function(p3)
	-- upvalues: CreatorCreditModule (copy), ReactModule (copy), SignalsReactModule (copy), UseOpenWebViewFunction (copy), FFlagEnablePaidAdsModule (copy), CreateAdCampaignSheetConfigModule (copy), CampaignEndMsFunction (copy), LocalizationStringsModule (copy), FFlagBuildAdsFundedNotCreatedError (copy), UseLocalizationFunction (copy), config (copy), useFundedErrorDialogFlow (copy), useTwoOptionsControls (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), FFlagBuildExperienceAdsAndRobuxTelemetryModule (copy), useCloseWhileSheetShown (copy), NumberLocalization (copy), LocalizationService (copy), DataStatus (copy), toCampaignOption (copy), IconName (copy)
	local CreatorCreditStore = CreatorCreditModule.getCreatorCreditStore(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreatorCreditStore (copy)
		return CreatorCreditStore.getQuotaSummary()
	end, { CreatorCreditStore })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.status)
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local CampaignOffers = nil
	
	if FFlagEnablePaidAdsModule then
		CampaignOffers = p3.campaignOffers
		
		if CampaignOffers == nil or CampaignOffers.feedback == nil and CampaignOffers.plays == nil then
			error("campaignOffers is required for the two-option ad campaign sheet")
		end
	else
		CampaignOffers = nil
	end
	local Feedback = if CampaignOffers == nil then nil else CampaignOffers.feedback
	local Plays = if CampaignOffers == nil then nil else CampaignOffers.plays
	local DurationDays = if FFlagEnablePaidAdsModule and Feedback ~= nil then Feedback.durationDays else p3.campaignDurationDays or CreateAdCampaignSheetConfigModule.DEFAULT_CAMPAIGN_DURATION_DAYS
	local PriceRobux = if FFlagEnablePaidAdsModule and Feedback ~= nil then Feedback.priceRobux else p3.estimatedPriceRobux or CreateAdCampaignSheetConfigModule.DEFAULT_ESTIMATED_PRICE_ROBUX
	local RunStartTimeMs = nil
	
	if FFlagEnablePaidAdsModule then
		RunStartTimeMs = p3.runStartTimeMs
		
		if RunStartTimeMs == nil then
			error("runStartTimeMs is required for the two-option ad campaign sheet")
		end
	else
		RunStartTimeMs = p3.runStartTimeMs or CreateAdCampaignSheetConfigModule.DEFAULT_RUN_START_TIME_MS
	end
	local FormatAdCampaignSheetLocalDate = if p3.useLocalRunDates == true then LocalizationStringsModule.formatAdCampaignSheetLocalDate else LocalizationStringsModule.formatAdCampaignSheetDate
	local FormatAdCampaignSheetLocalDateResult = FormatAdCampaignSheetLocalDate(RunStartTimeMs)
	local config1 = {
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
			endDate = FormatAdCampaignSheetLocalDate(if FFlagEnablePaidAdsModule then CampaignEndMsFunction(RunStartTimeMs, DurationDays) elseif p3.runEndTimeMs == nil then CreateAdCampaignSheetConfigModule.DEFAULT_RUN_END_TIME_MS else p3.runEndTimeMs)
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
		config1.forbiddenError = LocalizationStringsModule.AD_CAMPAIGN_SHEET_FORBIDDEN_ERROR
		config1.insufficientFundsError = LocalizationStringsModule.AD_CAMPAIGN_SHEET_INSUFFICIENT_FUNDS_ERROR
		config1.internalError = LocalizationStringsModule.AD_CAMPAIGN_SHEET_INTERNAL_ERROR
		config1.missingThumbnailError = LocalizationStringsModule.AD_CAMPAIGN_SHEET_MISSING_THUMBNAIL_ERROR
		config1.introduction = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_INTRODUCTION
		config1.startCampaignTitle = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_CAMPAIGN_PICKER_TITLE
		
		if Feedback ~= nil then
			config1.feedbackOptionTitle = {
				LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_OPTION_TITLE,
				durationDays = Feedback.durationDays
			}
			config1.feedbackRunDates = {
				LocalizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
				startDate = FormatAdCampaignSheetLocalDateResult,
				endDate = FormatAdCampaignSheetLocalDate(CampaignEndMsFunction(RunStartTimeMs, Feedback.durationDays))
			}
			config1.feedbackDescription = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_SHORT_DESCRIPTION
		end
		if Plays ~= nil then
			config1.playsOptionTitle = {
				LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_OPTION_TITLE,
				durationDays = Plays.durationDays
			}
			config1.playsRunDates = {
				LocalizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
				startDate = FormatAdCampaignSheetLocalDateResult,
				endDate = FormatAdCampaignSheetLocalDate(CampaignEndMsFunction(RunStartTimeMs, Plays.durationDays))
			}
			config1.playsDescription = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_LONG_DESCRIPTION
		end
		config1.buyRobux = LocalizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_BUTTON
		config1.adCreditsTitle = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_AD_CREDITS_TITLE
		config1.adCreditsAction = LocalizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_AD_CREDITS_ACTION
		config1.adsManager = LocalizationStringsModule.ADS_STATS_ADS_MANAGER
		
		if FFlagBuildAdsFundedNotCreatedError then
			config1.fundedNotCreatedTitle = LocalizationStringsModule.AD_CAMPAIGN_SHEET_FUNDED_NOT_CREATED_TITLE
			config1.fundedNotCreatedDescription = LocalizationStringsModule.AD_CAMPAIGN_SHEET_FUNDED_NOT_CREATED_DESCRIPTION
			config1.retry = LocalizationStringsModule.AD_CAMPAIGN_SHEET_RETRY
		end
	end
	local UseLocalizationResult = UseLocalizationFunction(config1)
	local IsWaitForCreateResult = p3.waitForCreateResult == true
	local IsIsCreatePending: boolean = IsWaitForCreateResult and p3.isCreatePending == true
	local IsHasCreateError: boolean = IsWaitForCreateResult and p3.hasCreateError == true
	local IsFundedNotCreated: boolean = FFlagBuildAdsFundedNotCreatedError and (FFlagEnablePaidAdsModule and p3.createErrorKind == "funded_not_created")
	local UseFundedErrorDialogFlowResult = if FFlagBuildAdsFundedNotCreatedError then useFundedErrorDialogFlow(p3.isOpen, IsIsCreatePending, IsHasCreateError) else config
	local CreateError = UseLocalizationResult.createError
	
	if FFlagEnablePaidAdsModule and IsHasCreateError then
		local CreateErrorKind = p3.createErrorKind
		CreateError = if CreateErrorKind == "payment_required" then UseLocalizationResult.insufficientFundsError elseif CreateErrorKind == "ineligible" then UseLocalizationResult.forbiddenError elseif CreateErrorKind == "missing_thumbnail" then UseLocalizationResult.missingThumbnailError else UseLocalizationResult.internalError
	end
	if IsFundedNotCreated then
		CreateError = UseLocalizationResult.fundedNotCreatedDescription
	end
	local NoIsDismissed: boolean = IsFundedNotCreated and not UseFundedErrorDialogFlowResult.isDismissed
	local IsHasCreateError1: boolean = IsFundedNotCreated and IsHasCreateError
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
	local UseTwoOptionsControlsResult = if FFlagEnablePaidAdsModule then useTwoOptionsControls(p3.isOpen, UseResult, UseResult1, CampaignOffers, IsIsCreatePending, IsHasCreateError, ReactModule.useCallback(function()
		-- upvalues: CreatorCreditStore (copy)
		CreatorCreditStore.refreshQuotaSummary():catch(function() end)
	end, { CreatorCreditStore }), p3.attemptedOption, UseLocalizationResult.adsManager, if FFlagBuildAdsManagerUniverseUrlModule then p3.universeId else nil, NoIsDismissed, UseFundedErrorDialogFlowResult.isRetryPending, UseFundedErrorDialogFlowResult.isSheetHiddenAfterRetry, IsHasCreateError1, if FFlagBuildExperienceAdsAndRobuxTelemetryModule then p3.universeId else nil) else nil
	local UseCloseWhileSheetShownResult = if FFlagBuildAdsFundedNotCreatedError then useCloseWhileSheetShown(UseTwoOptionsControlsResult ~= nil and UseTwoOptionsControlsResult.isSheetHidden, UseResult) else UseResult
	local BALANCELOADING = nil
	local BalanceState = nil
	
	if UseSignalStateResult == nil then
		if UseSignalStateResult1 == DataStatus.Failed then
			BalanceState = "failed"
			BALANCELOADING = CreateAdCampaignSheetConfigModule.BALANCE_UNAVAILABLE
		else
			BalanceState = "loading"
			BALANCELOADING = CreateAdCampaignSheetConfigModule.BALANCE_LOADING
		end
	else
		BalanceState = "ready"
		BALANCELOADING = NumberLocalization.localize(string.format("%.0f", (math.floor(UseSignalStateResult.robuxBalance))), LocalizationService.RobloxLocaleId)
	end
	return if FFlagEnablePaidAdsModule then {
		variant = "twoOptions",
		isOpen = p3.isOpen and not UseTwoOptionsControlsResult.isSheetHidden,
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
		hasCreateError = UseTwoOptionsControlsResult.isErrorForSelectedOption and not NoIsDismissed,
		createErrorText = CreateError,
		fundedErrorDialog = if UseTwoOptionsControlsResult.isFundedErrorDialogOpen then {
			title = UseLocalizationResult.fundedNotCreatedTitle,
			description = UseLocalizationResult.fundedNotCreatedDescription,
			retryText = UseLocalizationResult.retry,
			isRetryPending = IsIsCreatePending,
			onRetry = function()
				-- upvalues: UseFundedErrorDialogFlowResult (ref), UseTwoOptionsControlsResult (copy)
				UseFundedErrorDialogFlowResult.markRetrying()
				UseTwoOptionsControlsResult.onCreate()
			end,
			onDismiss = function()
				-- upvalues: IsIsCreatePending (copy), UseFundedErrorDialogFlowResult (ref), UseResult (copy)
				if not IsIsCreatePending then
					UseFundedErrorDialogFlowResult.markDismissed()
					UseResult()
					
					return
				end
			end
		} else nil,
		isOptionLocked = if FFlagBuildAdsFundedNotCreatedError then IsHasCreateError1 else nil,
		balanceState = BalanceState,
		balanceText = BALANCELOADING,
		showCloseButton = UseTwoOptionsControlsResult.showCloseButton,
		onOptionChanged = UseTwoOptionsControlsResult.onOptionChanged,
		onOpenBuyRobux = UseTwoOptionsControlsResult.onOpenBuyRobux,
		onOpenAdsManager = UseTwoOptionsControlsResult.onOpenAdsManager,
		onClose = UseCloseWhileSheetShownResult,
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
		balanceText = BALANCELOADING,
		isCreatePending = IsIsCreatePending,
		hasCreateError = IsHasCreateError,
		createErrorText = CreateError,
		onClose = UseResult,
		onCreate = UseResult1,
		onAdvertisingTerms = UseResult2,
		onAdvertisingStandards = UseResult3
	}
end