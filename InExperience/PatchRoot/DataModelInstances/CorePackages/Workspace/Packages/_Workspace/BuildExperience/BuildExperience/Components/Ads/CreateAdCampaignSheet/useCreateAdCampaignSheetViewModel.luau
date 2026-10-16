local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local creatorCreditModule = require(parent.DataHydration.CreatorCredit)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local dataHydrationModule = require(parent.DataHydration)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
local adCampaignEligibilityUtilsModule = require(script.Parent.Parent.adCampaignEligibilityUtils)
local adCampaignScheduleUtilsModule = require(script.Parent.Parent.adCampaignScheduleUtils)
local createAdCampaignSheetConfigModule = require(script.Parent.CreateAdCampaignSheetConfig)
local _ = require(script.Parent.CreateAdCampaignSheetView)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useOpenBuyRobuxWebViewModule = require(buildExperience.Components.CreatorCreditSheet.useOpenBuyRobuxWebView)
local useOpenWebViewWithResumeRefreshModule = require(buildExperience.utils.useOpenWebViewWithResumeRefresh)
local dataStatus = dataHydrationModule.DataStatus
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local iconName = foundationModule.Enums.IconName
local campaignEndMs = adCampaignScheduleUtilsModule.campaignEndMs
local useDefaultFocusBehavior = reactFocusNavigationModule.useDefaultFocusBehavior
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local _ = {
	Pending = "pending",
	Succeeded = "succeeded",
	Failed = "failed"
}
local var1 = signalsModule.createSignal({ status = "succeeded" })
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}
local var2 = urlBuilder.fromString("create:advertise")

local function _(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p1)), localizationService.RobloxLocaleId)
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

local function toCampaignOption(p3, p4, p5, p6, p7)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	local isFree = p3.fundingType == "free"
	
	return {
		value = p3.campaignOption,
		title = p4,
		runDates = p5,
		description = p6,
		priceText = if isFree then p7 else numberLocalization.localize(string.format("%.0f", math.floor(p3.priceRobux)), localizationService.RobloxLocaleId),
		originalPriceText = if isFree then numberLocalization.localize(string.format("%.0f", math.floor(p3.priceRobux)), localizationService.RobloxLocaleId) else nil
	}
end

local function useTwoOptionsControls(value, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: responsiveModule (ref), creatorAgentChatModule (ref), adCampaignEligibilityUtilsModule (ref), reactModule (ref), signalsReactModule (ref), var1 (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), useDefaultFocusBehavior (ref), useOpenBuyRobuxWebViewModule (ref), useOpenWebViewWithResumeRefreshModule (ref), var2 (ref)
	local var3 = responsiveModule.usePreferredInput()
	local adCampaignCheckFunds = creatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignCheckFunds
	local var4 = if p9 ~= nil then adCampaignEligibilityUtilsModule.getDefaultOffer(p5).campaignOption else p9.campaignOption
	local var5, var6 = reactModule.useState(var4)
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactModule.useState(nil)
	local var10 = signalsReactModule.useSignalState(if var8 ~= nil then var1 else var8.state)
	local var11 = reactModule.useCallback(function(p11)
		-- upvalues: var9 (ref), adCampaignCheckFunds (ref)
		if p11 == nil or p11.fundingType ~= "paid" then
			var9(nil)
			
			return
		end
		var9(adCampaignCheckFunds({ campaignOption = p11.campaignOption }))
	end, { adCampaignCheckFunds })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		if var8 == nil then
			return
		end
		return function()
			-- upvalues: var8 (copy)
			var8.dispose()
		end
	end, { var8 or false })
	reactModule.useEffect(function()
		-- upvalues: value (ref), p7 (ref), var6 (ref), var4 (ref), var9 (ref), p6 (ref), p5 (ref)
		if value then
			var6(function(p11)
				-- upvalues: p6 (copy), p7 (copy), p5 (copy), var4 (copy)
				if p6 or p7 then
					local var12 = p5
					
					return if (if p11 == "feedback" then var12.feedback elseif p11 == "plays" then var12.plays else nil) == nil then var4 else p11
				end
			end)
			
			return
		elseif not p7 then
			var6(var4)
		end
		var9(nil)
	end, {
		value,
		p6,
		p7,
		var4,
		p5
	})
	local var12 = if var5 == "feedback" then p5.feedback elseif var5 == "plays" then p5.plays else nil
	local var13 = p7 and (if var7.current ~= nil then var7.current == var5 else true)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var13 (ref), p6 (ref), var11 (ref), var12 (ref)
		if value and not var13 and not p6 then
			var11(var12)
		end
	end, {
		value,
		p6,
		var13,
		var12,
		var11
	})
	local var14, var15 = useDefaultFocusBehavior(useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = value,
		eventMap = t,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p3 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p11)
						-- upvalues: p3 (copy)
						p3()
						p11:cancel()
					end)
				}
			}
		end, { p3 })
	}))
	local var16 = reactModule.useCallback(function(p11)
		-- upvalues: var6 (ref)
		var6(p11)
	end, {})
	local result = var10.result
	local var17 = var12 ~= nil and var12.fundingType == "paid"
	local var18 = not p6 and (not var13 and (var17 and (if var8 ~= nil then var10.status == "pending" else true)))
	local var19 = not p6 and (not var13 and (var17 and var10.status == "failed"))
	local var20 = var17 and (var10.status == "succeeded" and (result ~= nil and result.canFund))
	local var21 = not p6 and (not var13 and (var17 and (var10.status == "succeeded" and (result ~= nil and not result.canFund))))
	local var22 = reactModule.useCallback(function()
		-- upvalues: p8 (ref), value (ref), var17 (ref), var11 (ref), var12 (ref)
		p8()
		
		if value and var17 then
			var11(var12)
		end
	end, {
		value,
		var17,
		var12,
		var11,
		p8
	})
	local var23 = useOpenBuyRobuxWebViewModule(var22)
	
	return {
		sheetRootRef = var15,
		defaultOptionRef = var14,
		selectedOption = var5,
		showCloseButton = var3 ~= responsiveModule.Input.Directional,
		isFundingCheckPending = var18,
		isPrimaryActionDisabled = if var12 ~= nil then not var13 and (var17 and (not var20 and (not var21 and not var19))) else true,
		shouldBuyRobux = var21,
		showAdCreditsCallout = not p6 and (var20 and result.fundingSource == "ad_credit"),
		isErrorForSelectedOption = var13,
		onOptionChanged = var16,
		onOpenBuyRobux = var23,
		onOpenAdsManager = useOpenWebViewWithResumeRefreshModule(var2(), p10, var22),
		onCreate = reactModule.useCallback(function()
			-- upvalues: var21 (ref), var23 (ref), var19 (ref), var11 (ref), var12 (ref), var17 (ref), var13 (ref), var20 (ref), var7 (ref), p4 (ref)
			if var21 then
				var23()
				
				return
			elseif var19 then
				var11(var12)
				
				return
			elseif var17 and not var13 and not var20 then return end
			if var12 == nil then
				return
			end
			var7.current = var12.campaignOption
			p4({
				paymentType = var12.fundingType,
				campaignOption = var12.campaignOption
			})
		end, {
			p4, var12, var21, var23, var17, var13, var20, var19, var11
		})
	}
end

return function(p3)
	-- upvalues: creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), useOpenWebView (ref), fFlagEnablePaidAdsModule (ref), createAdCampaignSheetConfigModule (ref), campaignEndMs (ref), localizationStringsModule (ref), useLocalization (ref), useTwoOptionsControls (ref), numberLocalization (ref), localizationService (ref), dataStatus (ref), toCampaignOption (ref), iconName (ref)
	local campaignOffers, var3
	local creatorCreditStore = creatorCreditModule.getCreatorCreditStore(false)
	local var4 = reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore })
	local var5 = signalsReactModule.useSignalState(var4.data)
	local var6 = signalsReactModule.useSignalState(var4.status)
	local var7 = useOpenWebView()
	
	if fFlagEnablePaidAdsModule then
		campaignOffers = p3.campaignOffers
		
		if campaignOffers == nil or campaignOffers.feedback == nil and campaignOffers.plays == nil then
			error("campaignOffers is required for the two-option ad campaign sheet")
		end
		var3 = campaignOffers
	else
		var3 = nil
	end
	local runStartTimeMs
	campaignOffers = if var3 ~= nil then nil else var3.feedback
	local var8 = if var3 ~= nil then nil else var3.plays
	local var9 = if fFlagEnablePaidAdsModule and campaignOffers ~= nil then campaignOffers.durationDays else p3.campaignDurationDays or createAdCampaignSheetConfigModule.DEFAULT_CAMPAIGN_DURATION_DAYS
	local var10 = if fFlagEnablePaidAdsModule and campaignOffers ~= nil then campaignOffers.priceRobux else p3.estimatedPriceRobux or createAdCampaignSheetConfigModule.DEFAULT_ESTIMATED_PRICE_ROBUX
	
	if fFlagEnablePaidAdsModule then
		local runStartTimeMs_1 = p3.runStartTimeMs
		
		if runStartTimeMs_1 == nil then
			error("runStartTimeMs is required for the two-option ad campaign sheet")
		end
		runStartTimeMs = runStartTimeMs_1
	else
		runStartTimeMs = p3.runStartTimeMs or createAdCampaignSheetConfigModule.DEFAULT_RUN_START_TIME_MS
	end
	local var11 = if fFlagEnablePaidAdsModule then campaignEndMs(runStartTimeMs, var9) elseif p3.runEndTimeMs ~= nil then createAdCampaignSheetConfigModule.DEFAULT_RUN_END_TIME_MS else p3.runEndTimeMs
	local var12 = if p3.useLocalRunDates == true then localizationStringsModule.formatAdCampaignSheetLocalDate else localizationStringsModule.formatAdCampaignSheetDate
	local var13 = var12(runStartTimeMs)
	local t = {
		title = if fFlagEnablePaidAdsModule then localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_TITLE else localizationStringsModule.AD_CAMPAIGN_SHEET_TITLE,
		description = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_DESCRIPTION,
			durationDays = var9
		},
		campaignTitle = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_CAMPAIGN_TITLE,
			durationDays = var9
		},
		runDates = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
			startDate = var13,
			endDate = var12(var11)
		},
		free = localizationStringsModule.AD_CAMPAIGN_SHEET_FREE,
		earnedRobuxDisclaimer = localizationStringsModule.AD_CAMPAIGN_SHEET_EARNED_ROBUX_DISCLAIMER,
		includedTitle = localizationStringsModule.AD_CAMPAIGN_SHEET_INCLUDED_TITLE,
		maximizePlays = localizationStringsModule.AD_CAMPAIGN_SHEET_MAXIMIZE_PLAYS,
		targetPlayers = localizationStringsModule.AD_CAMPAIGN_SHEET_TARGET_PLAYERS,
		performanceReport = localizationStringsModule.AD_CAMPAIGN_SHEET_PERFORMANCE_REPORT,
		legal = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_LEGAL,
			advertisingTermsStart = createAdCampaignSheetConfigModule.ADVERTISING_TERMS_START_MARKER,
			advertisingTermsEnd = createAdCampaignSheetConfigModule.ADVERTISING_TERMS_END_MARKER,
			advertisingStandardsStart = createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_START_MARKER,
			advertisingStandardsEnd = createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_END_MARKER
		},
		create = localizationStringsModule.AD_CAMPAIGN_SHEET_CREATE,
		moderationNotice = if fFlagEnablePaidAdsModule then localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_MODERATION_NOTICE else localizationStringsModule.AD_CAMPAIGN_SHEET_MODERATION_NOTICE,
		createError = localizationStringsModule.AD_CAMPAIGN_SHEET_CREATE_ERROR
	}
	
	if fFlagEnablePaidAdsModule then
		t.forbiddenError = localizationStringsModule.AD_CAMPAIGN_SHEET_FORBIDDEN_ERROR
		t.insufficientFundsError = localizationStringsModule.AD_CAMPAIGN_SHEET_INSUFFICIENT_FUNDS_ERROR
		t.internalError = localizationStringsModule.AD_CAMPAIGN_SHEET_INTERNAL_ERROR
		t.missingThumbnailError = localizationStringsModule.AD_CAMPAIGN_SHEET_MISSING_THUMBNAIL_ERROR
		t.introduction = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_INTRODUCTION
		t.startCampaignTitle = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_CAMPAIGN_PICKER_TITLE
		
		if campaignOffers ~= nil then
			t.feedbackOptionTitle = {
				localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_OPTION_TITLE,
				durationDays = campaignOffers.durationDays
			}
			t.feedbackRunDates = {
				localizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
				startDate = var13,
				endDate = var12(campaignEndMs(runStartTimeMs, campaignOffers.durationDays))
			}
			t.feedbackDescription = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_SHORT_DESCRIPTION
		end
		if var8 ~= nil then
			t.playsOptionTitle = {
				localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_OPTION_TITLE,
				durationDays = var8.durationDays
			}
			t.playsRunDates = {
				localizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
				startDate = var13,
				endDate = var12(campaignEndMs(runStartTimeMs, var8.durationDays))
			}
			t.playsDescription = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_LONG_DESCRIPTION
		end
		t.buyRobux = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_BUTTON
		t.adCreditsTitle = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_AD_CREDITS_TITLE
		t.adCreditsAction = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_AD_CREDITS_ACTION
		t.adsManager = localizationStringsModule.ADS_STATS_ADS_MANAGER
	end
	local var14 = useLocalization(t)
	local var15 = p3.waitForCreateResult == true
	local var16 = var15 and p3.isCreatePending == true
	local var17 = var15 and p3.hasCreateError == true
	local createError = var14.createError
	
	if fFlagEnablePaidAdsModule and var17 then
		local createErrorKind = p3.createErrorKind
		createError = if createErrorKind == "payment_required" then var14.insufficientFundsError elseif createErrorKind == "ineligible" then var14.forbiddenError elseif createErrorKind == "missing_thumbnail" then var14.missingThumbnailError else var14.internalError
	end
	local var18, var19
	local var20 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), p3 (ref)
		if var16 then
			return
		end
		p3.onClose()
	end, { p3.onClose, var16 })
	local var21 = reactModule.useCallback(function(p4)
		-- upvalues: p3 (ref), var15 (ref), var20 (ref)
		p3.onCreate(p4)
		
		if not var15 then
			var20()
		end
	end, { p3.onCreate, var20, var15 })
	local var22 = reactModule.useCallback(function(p4)
		-- upvalues: var7 (ref), createAdCampaignSheetConfigModule (copy)
		var7(createAdCampaignSheetConfigModule.ADVERTISING_TERMS_URL, p4)
	end, { var7 })
	local var23 = reactModule.useCallback(function(p4)
		-- upvalues: var7 (ref), createAdCampaignSheetConfigModule (copy)
		var7(createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_URL, p4)
	end, { var7 })
	local var24 = if fFlagEnablePaidAdsModule then useTwoOptionsControls(p3.isOpen, var20, var21, var3, var16, var17, reactModule.useCallback(function()
		-- upvalues: creatorCreditStore (ref)
		creatorCreditStore.refreshQuotaSummary():catch(function() end)
	end, { creatorCreditStore }), p3.attemptedOption, var14.adsManager) else nil
	local _ = nil
	local _ = nil
	
	if var5 ~= nil then
		var18 = "ready"
		var19 = numberLocalization.localize(string.format("%.0f", math.floor(var5.robuxBalance)), localizationService.RobloxLocaleId)
	elseif var6 == dataStatus.Failed then
		var18 = "failed"
		var19 = createAdCampaignSheetConfigModule.BALANCE_UNAVAILABLE
	else
		var18 = "loading"
		var19 = createAdCampaignSheetConfigModule.BALANCE_LOADING
	end
	if fFlagEnablePaidAdsModule then
		local var25 = var24
		
		return {
			variant = "twoOptions",
			isOpen = p3.isOpen,
			sheetRootRef = var25.sheetRootRef,
			title = var14.title,
			description = var14.introduction,
			startCampaignTitle = var14.startCampaignTitle,
			selectedOption = var25.selectedOption,
			defaultOptionRef = var25.defaultOptionRef,
			feedbackOption = if campaignOffers ~= nil then nil else toCampaignOption(campaignOffers, var14.feedbackOptionTitle, var14.feedbackRunDates, var14.feedbackDescription, var14.free),
			playsOption = if var8 ~= nil then nil else toCampaignOption(var8, var14.playsOptionTitle, var14.playsRunDates, var14.playsDescription, var14.free),
			legalText = var14.legal,
			createText = if var25.shouldBuyRobux then var14.buyRobux else var14.create,
			moderationNotice = var14.moderationNotice,
			isCreatePending = var16,
			isFundingCheckPending = var25.isFundingCheckPending,
			isCreateDisabled = var25.isPrimaryActionDisabled,
			showAdCreditsCallout = var25.showAdCreditsCallout,
			adCreditsTitle = var14.adCreditsTitle,
			adCreditsAction = var14.adCreditsAction,
			hasCreateError = var25.isErrorForSelectedOption,
			createErrorText = createError,
			balanceState = var18,
			balanceText = var19,
			showCloseButton = var25.showCloseButton,
			onOptionChanged = var25.onOptionChanged,
			onOpenBuyRobux = var25.onOpenBuyRobux,
			onOpenAdsManager = var25.onOpenAdsManager,
			onClose = var20,
			onCreate = var25.onCreate,
			onAdvertisingTerms = var22,
			onAdvertisingStandards = var23
		}
	end
	return {
		variant = "freeOptionOnly",
		isOpen = p3.isOpen,
		title = var14.title,
		description = var14.description,
		campaignTitle = var14.campaignTitle,
		estimatedPriceText = numberLocalization.localize(string.format("%.0f", math.floor(var10)), localizationService.RobloxLocaleId),
		freeText = var14.free,
		earnedRobuxDisclaimer = var14.earnedRobuxDisclaimer,
		includedTitle = var14.includedTitle,
		benefits = {
			{ icon = iconName.Calendar, text = var14.runDates },
			{ icon = iconName.CirclePlay, text = var14.maximizePlays },
			{ icon = iconName.ThreePeople, text = var14.targetPlayers },
			{
				icon = iconName.ChartScatterPlot,
				text = var14.performanceReport
			}
		},
		legalText = var14.legal,
		createText = var14.create,
		moderationNotice = var14.moderationNotice,
		balanceState = var18,
		balanceText = var19,
		isCreatePending = var16,
		hasCreateError = var17,
		createErrorText = createError,
		onClose = var20,
		onCreate = var21,
		onAdvertisingTerms = var22,
		onAdvertisingStandards = var23
	}
end