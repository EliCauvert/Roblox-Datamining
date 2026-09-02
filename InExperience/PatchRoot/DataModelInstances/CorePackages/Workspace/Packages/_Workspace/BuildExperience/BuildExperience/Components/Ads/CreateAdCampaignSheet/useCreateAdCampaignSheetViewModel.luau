local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local creatorCreditModule = require(parent.DataHydration.CreatorCredit)
local dataHydrationModule = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local createAdCampaignSheetConfigModule = require(script.Parent.CreateAdCampaignSheetConfig)
local _ = require(script.Parent.CreateAdCampaignSheetView)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dataStatus = dataHydrationModule.DataStatus
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local iconName = foundationModule.Enums.IconName

local function _(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p1)), localizationService.RobloxLocaleId)
end

return function(p1)
	-- upvalues: creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), useOpenWebView (ref), createAdCampaignSheetConfigModule (ref), localizationStringsModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), numberLocalization (ref), localizationService (ref), dataStatus (ref), iconName (ref)
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
	local var10 = if p1.runStartTimeMs ~= nil then createAdCampaignSheetConfigModule.DEFAULT_RUN_START_TIME_MS else p1.runStartTimeMs
	local var11 = if p1.runEndTimeMs ~= nil then createAdCampaignSheetConfigModule.DEFAULT_RUN_END_TIME_MS else p1.runEndTimeMs
	local var12 = if p1.useLocalRunDates == true then localizationStringsModule.formatAdCampaignSheetLocalDate else localizationStringsModule.formatAdCampaignSheetDate
	local var13 = if fFlagBuildLocalization then useLocalization({
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
			startDate = var12(var10),
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
		moderationNotice = localizationStringsModule.AD_CAMPAIGN_SHEET_MODERATION_NOTICE,
		createError = localizationStringsModule.AD_CAMPAIGN_SHEET_CREATE_ERROR
	}) else {
		title = localizationStringsModule.AD_CAMPAIGN_SHEET_TITLE,
		description = localizationStringsModule.formatAdCampaignSheetDescription(var8),
		campaignTitle = localizationStringsModule.formatAdCampaignSheetTitle(var8),
		runDates = if p1.useLocalRunDates == true then localizationStringsModule.formatAdCampaignSheetLocalRunDates(var10, var11) else localizationStringsModule.formatAdCampaignSheetRunDates(var10, var11),
		free = localizationStringsModule.AD_CAMPAIGN_SHEET_FREE,
		earnedRobuxDisclaimer = localizationStringsModule.AD_CAMPAIGN_SHEET_EARNED_ROBUX_DISCLAIMER,
		includedTitle = localizationStringsModule.AD_CAMPAIGN_SHEET_INCLUDED_TITLE,
		maximizePlays = localizationStringsModule.AD_CAMPAIGN_SHEET_MAXIMIZE_PLAYS,
		targetPlayers = localizationStringsModule.AD_CAMPAIGN_SHEET_TARGET_PLAYERS,
		performanceReport = localizationStringsModule.AD_CAMPAIGN_SHEET_PERFORMANCE_REPORT,
		legal = localizationStringsModule.formatAdCampaignSheetLegalText(createAdCampaignSheetConfigModule.ADVERTISING_TERMS_START_MARKER, createAdCampaignSheetConfigModule.ADVERTISING_TERMS_END_MARKER, createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_START_MARKER, createAdCampaignSheetConfigModule.ADVERTISING_STANDARDS_END_MARKER),
		create = localizationStringsModule.AD_CAMPAIGN_SHEET_CREATE,
		moderationNotice = localizationStringsModule.AD_CAMPAIGN_SHEET_MODERATION_NOTICE,
		createError = localizationStringsModule.AD_CAMPAIGN_SHEET_CREATE_ERROR
	}
	local var14 = p1.waitForCreateResult == true
	local var15 = var14 and p1.isCreatePending == true
	local var16 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var6 (ref), p1 (ref)
		if var15 then return end
		local current = var6.current
		
		if current == nil then
			p1.onClose()
			
			return
		end
		current.close()
	end, { p1.onClose, var15 })
	local var17 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), p1 (ref)
		if var15 then
			return
		end
		p1.onClose()
	end, { p1.onClose, var15 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var14 (ref), var16 (ref)
		p1.onCreate()
		
		if not var14 then
			var16()
		end
	end, { p1.onCreate, var16, var14 })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), createAdCampaignSheetConfigModule (copy)
		var7(createAdCampaignSheetConfigModule.ADVERTISING_TERMS_URL, p2)
	end, { var7 })
	local var20 = reactModule.useCallback(function(p2)
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
		balanceState = var1,
		balanceText = var2,
		isCreatePending = var15,
		hasCreateError = var14 and p1.hasCreateError == true,
		createErrorText = var13.createError,
		onClose = var17,
		onRequestClose = var16,
		onCreate = var18,
		onAdvertisingTerms = var19,
		onAdvertisingStandards = var20
	}
end