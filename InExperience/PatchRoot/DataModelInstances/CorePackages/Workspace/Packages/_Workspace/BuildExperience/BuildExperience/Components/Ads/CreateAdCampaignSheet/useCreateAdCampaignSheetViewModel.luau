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
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
local adCampaignScheduleUtilsModule = require(script.Parent.Parent.adCampaignScheduleUtils)
local createAdCampaignSheetConfigModule = require(script.Parent.CreateAdCampaignSheetConfig)
local _ = require(script.Parent.CreateAdCampaignSheetView)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useOpenBuyRobuxWebViewModule = require(buildExperience.Components.CreatorCreditSheet.useOpenBuyRobuxWebView)
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

local _ = function(p3)
	return if not (p3.feedback ~= nil and p3.feedback.fundingType == "free") then if p3.plays == nil or p3.plays.fundingType ~= "free" then p3.feedback or p3.plays else p3.plays else p3.feedback
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

local function useTwoOptionsControls(value, p3, p4, p5, p6, p7, p8)
	-- upvalues: responsiveModule (ref), creatorAgentChatModule (ref), reactModule (ref), signalsReactModule (ref), var1 (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), useDefaultFocusBehavior (ref), useOpenBuyRobuxWebViewModule (ref)
	local var2 = responsiveModule.usePreferredInput()
	local adCampaignCheckFunds = creatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignCheckFunds
	local campaignOption = (if p5.feedback ~= nil and p5.feedback.fundingType == "free" then if p5.plays == nil or p5.plays.fundingType ~= "free" then p5.feedback or p5.plays else p5.plays else p5.feedback).campaignOption
	local var3, var4 = reactModule.useState(campaignOption)
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useState(nil)
	local var8 = signalsReactModule.useSignalState(if var6 ~= nil then var1 else var6.state)
	local var9 = reactModule.useCallback(function(p9)
		-- upvalues: var7 (ref), adCampaignCheckFunds (ref)
		if p9 == nil or p9.fundingType ~= "paid" then
			var7(nil)
			
			return
		end
		var7(adCampaignCheckFunds({ campaignOption = p9.campaignOption }))
	end, { adCampaignCheckFunds })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		if var6 == nil then
			return
		end
		return function()
			-- upvalues: var6 (copy)
			var6.dispose()
		end
	end, { var6 or false })
	reactModule.useEffect(function()
		-- upvalues: value (ref), p7 (ref), var4 (ref), campaignOption (ref), var7 (ref), p6 (ref), p5 (ref)
		if value then
			var4(function(p9)
				-- upvalues: p6 (copy), p7 (copy), p5 (copy), campaignOption (copy)
				if p6 or p7 then
					local var10 = p5
					
					return if (if p9 == "feedback" then var10.feedback elseif p9 == "plays" then var10.plays else nil) == nil then campaignOption else p9
				end
			end)
			
			return
		elseif not p7 then
			var4(campaignOption)
		end
		var7(nil)
	end, {
		value,
		p6,
		p7,
		campaignOption,
		p5
	})
	local var10 = if var3 == "feedback" then p5.feedback elseif var3 == "plays" then p5.plays else nil
	local var11 = p7 and (if var5.current ~= nil then var5.current == var3 else true)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var11 (ref), p6 (ref), var9 (ref), var10 (ref)
		if value and not var11 and not p6 then
			var9(var10)
		end
	end, {
		value,
		p6,
		var11,
		var10,
		var9
	})
	local var12, var13 = useDefaultFocusBehavior(useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = value,
		eventMap = t,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p3 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p9)
						-- upvalues: p3 (copy)
						p3()
						p9:cancel()
					end)
				}
			}
		end, { p3 })
	}))
	local var14 = reactModule.useCallback(function(p9)
		-- upvalues: var4 (ref)
		var4(p9)
	end, {})
	local result = var8.result
	local var15 = var10 ~= nil and var10.fundingType == "paid"
	local var16 = not p6 and (not var11 and (var15 and (if var6 ~= nil then var8.status == "pending" else true)))
	local var17 = not p6 and (not var11 and (var15 and var8.status == "failed"))
	local var18 = var15 and (var8.status == "succeeded" and (result ~= nil and result.canFund))
	local var19 = not p6 and (not var11 and (var15 and (var8.status == "succeeded" and (result ~= nil and not result.canFund))))
	local var20 = useOpenBuyRobuxWebViewModule(reactModule.useCallback(function()
		-- upvalues: p8 (ref), value (ref), var15 (ref), var9 (ref), var10 (ref)
		p8()
		
		if value and var15 then
			var9(var10)
		end
	end, {
		value,
		var15,
		var10,
		var9,
		p8
	}))
	
	return {
		sheetRootRef = var13,
		defaultOptionRef = var12,
		selectedOption = var3,
		showCloseButton = var2 ~= responsiveModule.Input.Directional,
		isFundingCheckPending = var16,
		isPrimaryActionDisabled = if var10 ~= nil then not var11 and (var15 and (not var18 and (not var19 and not var17))) else true,
		shouldBuyRobux = var19,
		isErrorForSelectedOption = var11,
		onOptionChanged = var14,
		onCreate = reactModule.useCallback(function()
			-- upvalues: var19 (ref), var20 (ref), var17 (ref), var9 (ref), var10 (ref), var15 (ref), var11 (ref), var18 (ref), var5 (ref), p4 (ref)
			if var19 then
				var20()
				
				return
			elseif var17 then
				var9(var10)
				
				return
			elseif var15 and not var11 and not var18 then return end
			if var10 == nil then
				return
			end
			var5.current = var10.campaignOption
			p4({
				paymentType = var10.fundingType,
				campaignOption = var10.campaignOption
			})
		end, {
			p4, var10, var19, var20, var15, var11, var18, var17, var9
		})
	}
end

return function(p3)
	-- upvalues: creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), useOpenWebView (ref), fFlagEnablePaidAdsModule (ref), createAdCampaignSheetConfigModule (ref), campaignEndMs (ref), localizationStringsModule (ref), useLocalization (ref), useTwoOptionsControls (ref), numberLocalization (ref), localizationService (ref), dataStatus (ref), toCampaignOption (ref), iconName (ref)
	local campaignOffers, var2
	local creatorCreditStore = creatorCreditModule.getCreatorCreditStore(false)
	local var3 = reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore })
	local var4 = signalsReactModule.useSignalState(var3.data)
	local var5 = signalsReactModule.useSignalState(var3.status)
	local var6 = useOpenWebView()
	
	if fFlagEnablePaidAdsModule then
		campaignOffers = p3.campaignOffers
		
		if campaignOffers == nil or campaignOffers.feedback == nil and campaignOffers.plays == nil then
			error("campaignOffers is required for the two-option ad campaign sheet")
		end
		var2 = campaignOffers
	else
		var2 = nil
	end
	local runStartTimeMs
	campaignOffers = if var2 ~= nil then nil else var2.feedback
	local var7 = if var2 ~= nil then nil else var2.plays
	local var8 = if fFlagEnablePaidAdsModule and campaignOffers ~= nil then campaignOffers.durationDays else p3.campaignDurationDays or createAdCampaignSheetConfigModule.DEFAULT_CAMPAIGN_DURATION_DAYS
	local var9 = if fFlagEnablePaidAdsModule and campaignOffers ~= nil then campaignOffers.priceRobux else p3.estimatedPriceRobux or createAdCampaignSheetConfigModule.DEFAULT_ESTIMATED_PRICE_ROBUX
	
	if fFlagEnablePaidAdsModule then
		local runStartTimeMs_1 = p3.runStartTimeMs
		
		if runStartTimeMs_1 == nil then
			error("runStartTimeMs is required for the two-option ad campaign sheet")
		end
		runStartTimeMs = runStartTimeMs_1
	else
		runStartTimeMs = p3.runStartTimeMs or createAdCampaignSheetConfigModule.DEFAULT_RUN_START_TIME_MS
	end
	local var10 = if fFlagEnablePaidAdsModule then campaignEndMs(runStartTimeMs, var8) elseif p3.runEndTimeMs ~= nil then createAdCampaignSheetConfigModule.DEFAULT_RUN_END_TIME_MS else p3.runEndTimeMs
	local var11 = if p3.useLocalRunDates == true then localizationStringsModule.formatAdCampaignSheetLocalDate else localizationStringsModule.formatAdCampaignSheetDate
	local var12 = var11(runStartTimeMs)
	local t = {
		title = if fFlagEnablePaidAdsModule then localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_TITLE else localizationStringsModule.AD_CAMPAIGN_SHEET_TITLE,
		description = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_DESCRIPTION,
			durationDays = var8
		},
		campaignTitle = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_CAMPAIGN_TITLE,
			durationDays = var8
		},
		runDates = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
			startDate = var12,
			endDate = var11(var10)
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
				startDate = var12,
				endDate = var11(campaignEndMs(runStartTimeMs, campaignOffers.durationDays))
			}
			t.feedbackDescription = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_SHORT_DESCRIPTION
		end
		if var7 ~= nil then
			t.playsOptionTitle = {
				localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_OPTION_TITLE,
				durationDays = var7.durationDays
			}
			t.playsRunDates = {
				localizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
				startDate = var12,
				endDate = var11(campaignEndMs(runStartTimeMs, var7.durationDays))
			}
			t.playsDescription = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_LONG_DESCRIPTION
		end
		t.buyRobux = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_BUTTON
	end
	local var13 = useLocalization(t)
	local var14 = p3.waitForCreateResult == true
	local var15 = var14 and p3.isCreatePending == true
	local var16 = var14 and p3.hasCreateError == true
	local createError = var13.createError
	
	if fFlagEnablePaidAdsModule and var16 then
		local createErrorKind = p3.createErrorKind
		createError = if createErrorKind == "payment_required" then var13.insufficientFundsError elseif createErrorKind == "ineligible" then var13.forbiddenError elseif createErrorKind == "missing_thumbnail" then var13.missingThumbnailError else var13.internalError
	end
	local var17, var18
	local var19 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), p3 (ref)
		if var15 then
			return
		end
		p3.onClose()
	end, { p3.onClose, var15 })
	local var20 = reactModule.useCallback(function(p4)
		-- upvalues: p3 (ref), var14 (ref), var19 (ref)
		p3.onCreate(p4)
		
		if not var14 then
			var19()
		end
	end, { p3.onCreate, var19, var14 })
	local var21 = reactModule.useCallback(function(p4)
		-- upvalues: var6 (ref), createAdCampaignSheetConfigModule (copy)
		var6(createAdCampaignSheetConfigModule.ADVERTISING_TERMS_URL, p4)
	end, { var6 })
	local var22 = reactModule.useCallback(function(p4)
		-- upvalues: var6 (ref), createAdCampaignSheetConfigModule (copy)
		var6(createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_URL, p4)
	end, { var6 })
	local var23 = if fFlagEnablePaidAdsModule then useTwoOptionsControls(p3.isOpen, var19, var20, var2, var15, var16, reactModule.useCallback(function()
		-- upvalues: creatorCreditStore (ref)
		creatorCreditStore.refreshQuotaSummary():catch(function() end)
	end, { creatorCreditStore })) else nil
	local _ = nil
	local _ = nil
	
	if var4 ~= nil then
		var17 = "ready"
		var18 = numberLocalization.localize(string.format("%.0f", math.floor(var4.robuxBalance)), localizationService.RobloxLocaleId)
	elseif var5 == dataStatus.Failed then
		var17 = "failed"
		var18 = createAdCampaignSheetConfigModule.BALANCE_UNAVAILABLE
	else
		var17 = "loading"
		var18 = createAdCampaignSheetConfigModule.BALANCE_LOADING
	end
	if fFlagEnablePaidAdsModule then
		local var24 = var23
		
		return {
			variant = "twoOptions",
			isOpen = p3.isOpen,
			sheetRootRef = var24.sheetRootRef,
			title = var13.title,
			description = var13.introduction,
			startCampaignTitle = var13.startCampaignTitle,
			selectedOption = var24.selectedOption,
			defaultOptionRef = var24.defaultOptionRef,
			feedbackOption = if campaignOffers ~= nil then nil else toCampaignOption(campaignOffers, var13.feedbackOptionTitle, var13.feedbackRunDates, var13.feedbackDescription, var13.free),
			playsOption = if var7 ~= nil then nil else toCampaignOption(var7, var13.playsOptionTitle, var13.playsRunDates, var13.playsDescription, var13.free),
			legalText = var13.legal,
			createText = if var24.shouldBuyRobux then var13.buyRobux else var13.create,
			moderationNotice = var13.moderationNotice,
			isCreatePending = var15,
			isFundingCheckPending = var24.isFundingCheckPending,
			isCreateDisabled = var24.isPrimaryActionDisabled,
			hasCreateError = var24.isErrorForSelectedOption,
			createErrorText = createError,
			balanceState = var17,
			balanceText = var18,
			showCloseButton = var24.showCloseButton,
			onOptionChanged = var24.onOptionChanged,
			onClose = var19,
			onCreate = var24.onCreate,
			onAdvertisingTerms = var21,
			onAdvertisingStandards = var22
		}
	end
	return {
		variant = "freeOptionOnly",
		isOpen = p3.isOpen,
		title = var13.title,
		description = var13.description,
		campaignTitle = var13.campaignTitle,
		estimatedPriceText = numberLocalization.localize(string.format("%.0f", math.floor(var9)), localizationService.RobloxLocaleId),
		freeText = var13.free,
		earnedRobuxDisclaimer = var13.earnedRobuxDisclaimer,
		includedTitle = var13.includedTitle,
		benefits = {
			{ icon = iconName.Calendar, text = var13.runDates },
			{ icon = iconName.CirclePlay, text = var13.maximizePlays },
			{ icon = iconName.ThreePeople, text = var13.targetPlayers },
			{
				icon = iconName.ChartScatterPlot,
				text = var13.performanceReport
			}
		},
		legalText = var13.legal,
		createText = var13.create,
		moderationNotice = var13.moderationNotice,
		balanceState = var17,
		balanceText = var18,
		isCreatePending = var15,
		hasCreateError = var16,
		createErrorText = createError,
		onClose = var19,
		onCreate = var20,
		onAdvertisingTerms = var21,
		onAdvertisingStandards = var22
	}
end