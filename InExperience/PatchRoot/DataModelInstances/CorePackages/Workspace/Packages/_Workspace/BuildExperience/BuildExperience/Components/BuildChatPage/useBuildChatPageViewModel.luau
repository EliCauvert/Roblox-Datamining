local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local guiService = game:GetService("GuiService")
local messageBusService = game:GetService("MessageBusService")
local userInputService = game:GetService("UserInputService")
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(buildExperience.Chat.chatTypes)
local useChatPlaytestFooterModule = require(buildExperience.Chat.useChatPlaytestFooter)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local fFlagBuildExperienceDeveloperProductContextModule = require(buildExperience.Flags.FFlagBuildExperienceDeveloperProductContext)
local useBuildPromptDraftModule = require(buildExperience.Chat.useBuildPromptDraft)
local useChatSessionCoreModule = require(buildExperience.Chat.useChatSessionCore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local getBuildOverflowMenuStoreModule = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local _ = require(script.Parent.BuildChatPageView)
local useCreatorCreditChatUpsellViewModelModule = require(script.Parent.useCreatorCreditChatUpsellViewModel)
local fFlagBuildExperienceLibrary = require(parent.SharedFlags).FFlagBuildExperienceLibrary
local fFlagBuildExperienceAnalytics = require(parent.SharedFlags).FFlagBuildExperienceAnalytics
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local var1 = if fFlagBuildAgentAdCampaignCardModule then require(script.Parent.useAgentAdCampaignChatViewModel) else nil
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)
local var2 = if fFlagBuildAdUpsellModule then require(buildExperience.Stores.GetAdUpsellEventStore) else nil
local var3 = if fFlagBuildAdUpsellModule or fFlagEnableBuildAdPromotionModule then require(buildExperience.utils.GameConfigurationLabels) else nil
local var4 = if fFlagBuildAdUpsellModule then require(script.Parent.useAdUpsellChatViewModel) else nil
local fFlagBuildExperienceFocusNewGameComposerModule = require(buildExperience.Flags.FFlagBuildExperienceFocusNewGameComposer)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local fFlagBuildExperiencePlaytestCardPublishCtaModule = require(buildExperience.Flags.FFlagBuildExperiencePlaytestCardPublishCta)
local fFlagBuildExperienceDontAskAgainPushUpsellModule = require(buildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var5 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local useTokens = foundationModule.Hooks.useTokens
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local t = { allComplete = false, groups = {} }
local t_1 = {
	adUpsellFreePromotionsRemaining = 0,
	isAdUpsellCreatePending = false,
	isAdCampaignSheetOpen = false,
	hasAdCampaignCreateError = false,
	adCampaignCreateErrorKind = nil,
	adCampaignDurationDays = nil,
	adCampaignEstimatedPriceRobux = nil,
	adCampaignOffers = nil,
	adCampaignRunStartTimeMs = nil,
	adCampaignRunEndTimeMs = nil,
	isAdCampaignCreatedToastVisible = false,
	adUpsellCards = {},
	onAdCampaignCreatedToastDismiss = function() end,
	onAdUpsellCreate = function() end,
	onAdUpsellDismiss = function() end,
	onAdUpsellImpression = function() end,
	onAdCampaignSheetClose = function() end,
	onAdCampaignSheetCreate = function() end
}
local t_2 = {
	isSheetOpen = false,
	isCreatePending = false,
	hasCreateError = false,
	createErrorKind = nil,
	campaignOffers = nil,
	runStartTimeMs = nil,
	onOfferSelected = function() end,
	isCreateDisabled = function()
		return true
	end,
	getCardState = function()
		return nil
	end,
	onSheetClose = function() end,
	onSheetCreate = function() end
}

local function _()
	-- upvalues: userInputService (ref), guiService (ref)
	return if userInputService.OnScreenKeyboardVisible then math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y) else 0
end

local function useUniverseSummary(p1)
	-- upvalues: universeConfigurationModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref), universeConfigurationStore (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy), universeConfigurationStore (copy)
			return if p1 == nil or p1 == 0 then nil else universeConfigurationStore.getAndFetchSummary(p1).data(p2)
		end)
	end, { universeConfigurationStore, p1 }))
end

local _ = function(p1)
	-- upvalues: universeConfigurationModule (ref)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	
	if universeConfigurationStore.getSummary(p1).data(false) ~= nil then
		universeConfigurationStore.fetchSummary(p1)
	end
end

local function getResolvedSessionId(p1, p2, p3)
	if p2 ~= nil and p2 ~= "" then
		return p2
	end
	for i = #p1, 1, -1 do
		local var6 = p1[i]
		
		if var6.kind ~= "assistant_turn" or var6.sessionId == nil or p3 ~= nil and var6.universeId ~= p3 then
			continue
		end
		return var6.sessionId
	end
	return nil
end

local _ = function(p4, p5)
	local var7 = if p5 ~= nil then nil else p5.name
	
	return if typeof(var7) == "string" and var7 ~= "" then var7 else p4
end

return function(_)
	-- upvalues: useTokens (ref), useUniverseSummary (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref), buildAppStorageKeyEngineFeature (ref), var5 (ref), userInputService (ref), guiService (ref), permissionsProtocol (ref), messageBusService (ref), realtimeMessageId (ref), default (ref), creatorAgentChatModule (ref), fFlagBuildAdUpsellModule (ref), var2 (ref), useChatSessionCoreModule (ref), fFlagBuildExperienceFocusNewGameComposerModule (ref), fFlagBuildExperienceAnalytics (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), useBuildPromptDraftModule (ref), fFlagBuildExperienceDeveloperProductContextModule (ref), fFlagBuildExperienceManageDevProductModule (ref), useChatPlaytestFooterModule (ref), universeConfigurationModule (ref), fFlagEnableBuildAdPromotionModule (ref), useCreatorCreditChatUpsellViewModelModule (ref), var3 (ref), fFlagBuildExperienceLibrary (ref), getResolvedSessionId (ref), var4 (ref), t_1 (ref), fFlagBuildAgentAdCampaignCardModule (ref), var1 (ref), t_2 (ref), fFlagBuildExperiencePlaytestCardPublishCtaModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), t (ref)
-- FATAL: Failed to generate AST for `useBuildChatPageViewModel` function:
runtime : [KeyError] :11990: 285
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end