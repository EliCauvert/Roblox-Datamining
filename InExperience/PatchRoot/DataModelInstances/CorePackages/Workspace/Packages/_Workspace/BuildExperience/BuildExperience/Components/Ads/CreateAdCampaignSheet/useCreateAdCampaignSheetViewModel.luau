local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local creatorCreditModule = require(parent.DataHydration.CreatorCredit)
local dataHydrationModule = require(parent.DataHydration)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
local adCampaignScheduleUtilsModule = require(script.Parent.Parent.adCampaignScheduleUtils)
local createAdCampaignSheetConfigModule = require(script.Parent.CreateAdCampaignSheetConfig)
local _ = require(script.Parent.CreateAdCampaignSheetView)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dataStatus = dataHydrationModule.DataStatus
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local iconName = foundationModule.Enums.IconName
local campaignEndMs = adCampaignScheduleUtilsModule.campaignEndMs
local useDefaultFocusBehavior = reactFocusNavigationModule.useDefaultFocusBehavior
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
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

local function useTwoOptionsControls(value, p3, p4)
	-- upvalues: responsiveModule (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), useDefaultFocusBehavior (ref)
	local var1 = responsiveModule.usePreferredInput()
	local free, free_1 = reactModule.useState("free")
	reactModule.useEffect(function()
		-- upvalues: value (ref), free_1 (ref)
		if value then
			free_1("free")
		end
	end, { value })
	local var2, var3 = useDefaultFocusBehavior(useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = value,
		eventMap = t,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p3 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p5)
						-- upvalues: p3 (copy)
						p3()
						p5:cancel()
					end)
				}
			}
		end, { p3 })
	}))
	
	return {
		sheetRootRef = var3,
		freeOptionRef = var2,
		selectedOption = free,
		showCloseButton = var1 ~= responsiveModule.Input.Directional,
		onOptionChanged = reactModule.useCallback(function(p5)
			-- upvalues: free_1 (ref)
			free_1(p5)
		end, {}),
		onCreate = reactModule.useCallback(function()
			-- upvalues: free (ref), p4 (ref)
			if free == "free" then
				p4()
			end
		end, { free, p4 })
	}
end

return function(p3)
	-- upvalues: creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), useOpenWebView (ref), fFlagEnablePaidAdsModule (ref), createAdCampaignSheetConfigModule (ref), campaignEndMs (ref), localizationStringsModule (ref), useLocalization (ref), useTwoOptionsControls (ref), numberLocalization (ref), localizationService (ref), dataStatus (ref), iconName (ref)
	local var1
	local creatorCreditStore = creatorCreditModule.getCreatorCreditStore(false)
	local var2 = reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore })
	local var3 = signalsReactModule.useSignalState(var2.data)
	local var4 = signalsReactModule.useSignalState(var2.status)
	local var5 = useOpenWebView()
	
	if fFlagEnablePaidAdsModule then
		local campaignDurationDays = p3.campaignDurationDays
		
		if campaignDurationDays == nil then
			error("campaignDurationDays is required for the two-option ad campaign sheet")
		end
		var1 = campaignDurationDays
	else
		var1 = p3.campaignDurationDays or createAdCampaignSheetConfigModule.DEFAULT_CAMPAIGN_DURATION_DAYS
	end
	local runStartTimeMs
	local var6 = if fFlagEnablePaidAdsModule then p3.freeOriginalPriceRobux else p3.estimatedPriceRobux or createAdCampaignSheetConfigModule.DEFAULT_ESTIMATED_PRICE_ROBUX
	
	if fFlagEnablePaidAdsModule then
		local runStartTimeMs_1 = p3.runStartTimeMs
		
		if runStartTimeMs_1 == nil then
			error("runStartTimeMs is required for the two-option ad campaign sheet")
		end
		runStartTimeMs = runStartTimeMs_1
	else
		runStartTimeMs = p3.runStartTimeMs or createAdCampaignSheetConfigModule.DEFAULT_RUN_START_TIME_MS
	end
	local var7 = if fFlagEnablePaidAdsModule then campaignEndMs(runStartTimeMs, var1) elseif p3.runEndTimeMs ~= nil then createAdCampaignSheetConfigModule.DEFAULT_RUN_END_TIME_MS else p3.runEndTimeMs
	local var8 = if p3.useLocalRunDates == true then localizationStringsModule.formatAdCampaignSheetLocalDate else localizationStringsModule.formatAdCampaignSheetDate
	local var9 = var8(runStartTimeMs)
	local t = {
		title = if fFlagEnablePaidAdsModule then localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_TITLE else localizationStringsModule.AD_CAMPAIGN_SHEET_TITLE,
		description = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_DESCRIPTION,
			durationDays = var1
		},
		campaignTitle = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_CAMPAIGN_TITLE,
			durationDays = var1
		},
		runDates = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
			startDate = var9,
			endDate = var8(var7)
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
		t.introduction = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_INTRODUCTION
		t.startCampaignTitle = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_CAMPAIGN_PICKER_TITLE
		t.freeOptionTitle = {
			localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_OPTION_TITLE,
			durationDays = var1
		}
		t.paidOptionTitle = {
			localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_OPTION_TITLE,
			durationDays = createAdCampaignSheetConfigModule.DEFAULT_CAMPAIGN_DURATION_DAYS
		}
		t.paidRunDates = {
			localizationStringsModule.AD_CAMPAIGN_SHEET_RUN_DATES,
			startDate = var9,
			endDate = var8(campaignEndMs(runStartTimeMs, createAdCampaignSheetConfigModule.DEFAULT_CAMPAIGN_DURATION_DAYS))
		}
		t.freeDescription = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_SHORT_DESCRIPTION
		t.paidDescription = localizationStringsModule.TWO_OPTIONS_AD_CAMPAIGN_SHEET_LONG_DESCRIPTION
	end
	local var10, var11
	local var12 = useLocalization(t)
	local var13 = p3.waitForCreateResult == true
	local var14 = var13 and p3.isCreatePending == true
	local var15 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), p3 (ref)
		if var14 then
			return
		end
		p3.onClose()
	end, { p3.onClose, var14 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), var13 (ref), var15 (ref)
		p3.onCreate()
		
		if not var13 then
			var15()
		end
	end, { p3.onCreate, var15, var13 })
	local var17 = reactModule.useCallback(function(p4)
		-- upvalues: var5 (ref), createAdCampaignSheetConfigModule (copy)
		var5(createAdCampaignSheetConfigModule.ADVERTISING_TERMS_URL, p4)
	end, { var5 })
	local var18 = reactModule.useCallback(function(p4)
		-- upvalues: var5 (ref), createAdCampaignSheetConfigModule (copy)
		var5(createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_URL, p4)
	end, { var5 })
	local var19 = if fFlagEnablePaidAdsModule then useTwoOptionsControls(p3.isOpen, var15, var16) else nil
	local _ = nil
	local _ = nil
	
	if var3 ~= nil then
		var10 = "ready"
		var11 = numberLocalization.localize(string.format("%.0f", math.floor(var3.robuxBalance)), localizationService.RobloxLocaleId)
	elseif var4 == dataStatus.Failed then
		var10 = "failed"
		var11 = createAdCampaignSheetConfigModule.BALANCE_UNAVAILABLE
	else
		var10 = "loading"
		var11 = createAdCampaignSheetConfigModule.BALANCE_LOADING
	end
	if fFlagEnablePaidAdsModule then
		local var20 = var19
		
		return {
			variant = "twoOptions",
			isOpen = p3.isOpen,
			sheetRootRef = var20.sheetRootRef,
			title = var12.title,
			description = var12.introduction,
			startCampaignTitle = var12.startCampaignTitle,
			selectedOption = var20.selectedOption,
			freeOptionRef = var20.freeOptionRef,
			freeOption = {
				value = "free",
				title = var12.freeOptionTitle,
				runDates = var12.runDates,
				description = var12.freeDescription,
				priceText = var12.free,
				originalPriceText = numberLocalization.localize(string.format("%.0f", math.floor(var6)), localizationService.RobloxLocaleId)
			},
			paidOption = {
				value = "paid",
				originalPriceText = nil,
				title = var12.paidOptionTitle,
				runDates = var12.paidRunDates,
				description = var12.paidDescription,
				priceText = numberLocalization.localize(string.format("%.0f", math.floor(createAdCampaignSheetConfigModule.DEFAULT_ESTIMATED_PRICE_ROBUX)), localizationService.RobloxLocaleId)
			},
			legalText = var12.legal,
			createText = var12.create,
			moderationNotice = var12.moderationNotice,
			isCreatePending = var14,
			isCreateDisabled = var20.selectedOption ~= "free",
			hasCreateError = var13 and p3.hasCreateError == true,
			createErrorText = var12.createError,
			balanceState = var10,
			balanceText = var11,
			showCloseButton = var20.showCloseButton,
			onOptionChanged = var20.onOptionChanged,
			onClose = var15,
			onCreate = var20.onCreate,
			onAdvertisingTerms = var17,
			onAdvertisingStandards = var18
		}
	end
	return {
		variant = "freeOptionOnly",
		isOpen = p3.isOpen,
		title = var12.title,
		description = var12.description,
		campaignTitle = var12.campaignTitle,
		estimatedPriceText = numberLocalization.localize(string.format("%.0f", math.floor(var6)), localizationService.RobloxLocaleId),
		freeText = var12.free,
		earnedRobuxDisclaimer = var12.earnedRobuxDisclaimer,
		includedTitle = var12.includedTitle,
		benefits = {
			{ icon = iconName.Calendar, text = var12.runDates },
			{ icon = iconName.CirclePlay, text = var12.maximizePlays },
			{ icon = iconName.ThreePeople, text = var12.targetPlayers },
			{
				icon = iconName.ChartScatterPlot,
				text = var12.performanceReport
			}
		},
		legalText = var12.legal,
		createText = var12.create,
		moderationNotice = var12.moderationNotice,
		balanceState = var10,
		balanceText = var11,
		isCreatePending = var14,
		hasCreateError = var13 and p3.hasCreateError == true,
		createErrorText = var12.createError,
		onClose = var15,
		onCreate = var16,
		onAdvertisingTerms = var17,
		onAdvertisingStandards = var18
	}
end