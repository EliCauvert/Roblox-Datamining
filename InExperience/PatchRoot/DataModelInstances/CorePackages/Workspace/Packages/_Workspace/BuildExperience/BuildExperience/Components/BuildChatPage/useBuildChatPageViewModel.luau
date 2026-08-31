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
local useBuildPromptDraftModule = require(buildExperience.Chat.useBuildPromptDraft)
local useChatSessionCoreModule = require(buildExperience.Chat.useChatSessionCore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local getBuildOverflowMenuStoreModule = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local _ = require(script.Parent.BuildChatPageView)
local useCreatorCreditChatUpsellViewModelModule = require(script.Parent.useCreatorCreditChatUpsellViewModel)
local fFlagBuildExperienceAnalytics = require(parent.SharedFlags).FFlagBuildExperienceAnalytics
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)
local var1 = if fFlagBuildAdUpsellModule then require(buildExperience.Stores.GetAdUpsellEventStore) else nil
local var2 = if fFlagBuildAdUpsellModule or fFlagEnableBuildAdPromotionModule then require(buildExperience.utils.GameConfigurationLabels) else nil
local var3 = if fFlagBuildAdUpsellModule then require(script.Parent.useAdUpsellChatViewModel) else nil
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local fFlagBuildExperienceFocusNewGameComposerModule = require(buildExperience.Flags.FFlagBuildExperienceFocusNewGameComposer)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local fFlagBuildExperienceDontAskAgainPushUpsellModule = require(buildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var4 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
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
	adCampaignDurationDays = nil,
	adCampaignEstimatedPriceRobux = nil,
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
		local var5 = p1[i]
		
		if var5.kind ~= "assistant_turn" or var5.sessionId == nil or p3 ~= nil and var5.universeId ~= p3 then
			continue
		end
		return var5.sessionId
	end
	return nil
end

local _ = function(p4, p5)
	local var6 = if p5 ~= nil then nil else p5.name
	
	return if typeof(var6) == "string" and var6 ~= "" then var6 else p4
end

return function(_)
	-- upvalues: useTokens (ref), useUniverseSummary (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref), buildAppStorageKeyEngineFeature (ref), var4 (ref), userInputService (ref), guiService (ref), permissionsProtocol (ref), messageBusService (ref), realtimeMessageId (ref), default (ref), creatorAgentChatModule (ref), fFlagBuildAdUpsellModule (ref), var1 (ref), useChatSessionCoreModule (ref), fFlagBuildExperienceFocusNewGameComposerModule (ref), fFlagBuildExperienceAnalytics (ref), fFlagBuildExperienceManageDevProductModule (ref), useBuildPromptDraftModule (ref), useChatPlaytestFooterModule (ref), universeConfigurationModule (ref), fFlagEnableBuildAdPromotionModule (ref), useCreatorCreditChatUpsellViewModelModule (ref), var2 (ref), getResolvedSessionId (ref), var3 (ref), t_1 (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), t (ref), fFlagBuildExperienceAssetLibraryModule (ref)
-- FATAL: Failed to generate AST for `useBuildChatPageViewModel` function:
runtime : [KeyError] :11990: 277
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end