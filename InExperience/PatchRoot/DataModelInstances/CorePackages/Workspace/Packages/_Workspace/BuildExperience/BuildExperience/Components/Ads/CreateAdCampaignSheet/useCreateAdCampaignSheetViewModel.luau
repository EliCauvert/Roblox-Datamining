local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local creatorCreditModule = require(parent.DataHydration.CreatorCredit)
local dataHydrationModule = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local createAdCampaignSheetConfigModule = require(script.Parent.CreateAdCampaignSheetConfig)
local _ = require(script.Parent.CreateAdCampaignSheetView)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dataStatus = dataHydrationModule.DataStatus
local iconName = foundationModule.Enums.IconName

local function _(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p1)), localizationService.RobloxLocaleId)
end

return function(p1)
	-- upvalues: creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), useOpenWebView (ref), createAdCampaignSheetConfigModule (ref), localizationStringsModule (ref), useLocalization (ref), numberLocalization (ref), localizationService (ref), dataStatus (ref), iconName (ref)
	local var1, var2
	local creatorCreditStore = creatorCreditModule.getCreatorCreditStore(false)
	local var3 = reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore })
	local var4 = signalsReactModule.useSignalState(var3.data)
	local var5 = signalsReactModule.useSignalState(var3.status)
	local var6 = reactModule.useRef(nil)
	local var7 = useOpenWebView()
	local var8 = if p1.campaignDurationDays ~= nil then createAdCampaignSheetConfigModule.DEFAULT_CAMPAIGN_DURATION_DAYS else p1.campaignDurationDays
	local var9 = if p1.estimatedPriceRobux ~= nil then createAdCampaignSheetConfigModule.DEFAULT_ESTIMATED_PRICE_ROBUX else p1.estimatedPriceRobux
	local var10 = if p1.useLocalRunDates == true then localizationStringsModule.formatAdCampaignSheetLocalDate else localizationStringsModule.formatAdCampaignSheetDate
	local var11 = useLocalization({
		title = localizationStringsModule.AD_CAMPAIGN_SHEET_TITLE,
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
			startDate = var10(if p1.runStartTimeMs ~= nil then createAdCampaignSheetConfigModule.DEFAULT_RUN_START_TIME_MS else p1.runStartTimeMs),
			endDate = var10(if p1.runEndTimeMs ~= nil then createAdCampaignSheetConfigModule.DEFAULT_RUN_END_TIME_MS else p1.runEndTimeMs)
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
		moderationNotice = localizationStringsModule.AD_CAMPAIGN_SHEET_MODERATION_NOTICE,
		createError = localizationStringsModule.AD_CAMPAIGN_SHEET_CREATE_ERROR
	})
	local var12 = p1.waitForCreateResult == true
	local var13 = var12 and p1.isCreatePending == true
	local var14 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var6 (ref), p1 (ref)
		if var13 then return end
		local current = var6.current
		
		if current == nil then
			p1.onClose()
			
			return
		end
		current.close()
	end, { p1.onClose, var13 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), p1 (ref)
		if var13 then
			return
		end
		p1.onClose()
	end, { p1.onClose, var13 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var12 (ref), var14 (ref)
		p1.onCreate()
		
		if not var12 then
			var14()
		end
	end, { p1.onCreate, var14, var12 })
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), createAdCampaignSheetConfigModule (copy)
		var7(createAdCampaignSheetConfigModule.ADVERTISING_TERMS_URL, p2)
	end, { var7 })
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), createAdCampaignSheetConfigModule (copy)
		var7(createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_URL, p2)
	end, { var7 })
	local _ = nil
	local _ = nil
	
	if var4 ~= nil then
		var1 = "ready"
		var2 = numberLocalization.localize(string.format("%.0f", math.floor(var4.robuxBalance)), localizationService.RobloxLocaleId)
	elseif var5 == dataStatus.Failed then
		var1 = "failed"
		var2 = createAdCampaignSheetConfigModule.BALANCE_UNAVAILABLE
	else
		var1 = "loading"
		var2 = createAdCampaignSheetConfigModule.BALANCE_LOADING
	end
	return {
		isOpen = p1.isOpen,
		sheetRef = var6,
		title = var11.title,
		description = var11.description,
		campaignTitle = var11.campaignTitle,
		estimatedPriceText = numberLocalization.localize(string.format("%.0f", math.floor(var9)), localizationService.RobloxLocaleId),
		freeText = var11.free,
		earnedRobuxDisclaimer = var11.earnedRobuxDisclaimer,
		includedTitle = var11.includedTitle,
		benefits = {
			{ icon = iconName.Calendar, text = var11.runDates },
			{ icon = iconName.CirclePlay, text = var11.maximizePlays },
			{ icon = iconName.ThreePeople, text = var11.targetPlayers },
			{
				icon = iconName.ChartScatterPlot,
				text = var11.performanceReport
			}
		},
		legalText = var11.legal,
		createText = var11.create,
		moderationNotice = var11.moderationNotice,
		balanceState = var1,
		balanceText = var2,
		isCreatePending = var13,
		hasCreateError = var12 and p1.hasCreateError == true,
		createErrorText = var11.createError,
		onClose = var15,
		onRequestClose = var14,
		onCreate = var16,
		onAdvertisingTerms = var17,
		onAdvertisingStandards = var18
	}
end