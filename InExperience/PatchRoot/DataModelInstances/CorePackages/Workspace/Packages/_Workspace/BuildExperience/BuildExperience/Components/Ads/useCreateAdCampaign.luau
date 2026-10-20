local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local _ = require(Parent.DataHydration.AdCampaignEligibility)
local _ = require(Parent.DataHydration.AdCampaigns)
local _ = require(Parent.DataHydration.CampaignStats)
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local FFlagBuildAgentAdCampaignToolCallStatusFallbackModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignToolCallStatusFallback)
local UseRefreshAdsDataModule = require(script.Parent.useRefreshAdsData)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagEnablePaidAdsModule = require(BuildExperience.Flags.FFlagEnablePaidAds)
local AsPromiseFunction = require(Parent.HttpClient).asPromise
local ClassifyAdCampaignFailureFunction = CreatorAgentChatModule.classifyAdCampaignFailure

return function(UniverseId, ConversationId, p1)
	-- upvalues: SendBuildExperienceEventModule (copy), ReactModule (copy), FFlagEnablePaidAdsModule (copy), UseRefreshAdsDataModule (copy), FFlagBuildAgentAdCampaignCardModule (copy), HttpService (copy), FFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), AsPromiseFunction (copy), CreatorAgentChatModule (copy), ClassifyAdCampaignFailureFunction (copy)
	local P2 = p1 or {}
	local SendEvent = P2.sendEvent or SendBuildExperienceEventModule
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local v1 = nil
	local Callback = nil
	local UseRefResult1 = nil
	local UseRefResult2 = nil
	
	if FFlagEnablePaidAdsModule then
		v1, Callback = ReactModule.useState(nil)
		UseRefResult1 = ReactModule.useRef(nil)
		UseRefResult2 = ReactModule.useRef(false)
	end
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy)
		UseRefResult4.current = true
		
		return function()
			-- upvalues: UseRefResult4 (upval)
			UseRefResult4.current = false
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), FFlagEnablePaidAdsModule (upval), Callback (copy)
		UseStateResult2_1(false)
		
		if FFlagEnablePaidAdsModule then
			Callback(nil)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), FFlagEnablePaidAdsModule (upval), UseRefResult1 (copy), UseRefResult2 (copy), UseResult (copy)
		UseRefResult.current = nil
		
		if FFlagEnablePaidAdsModule then
			UseRefResult1.current = nil
			UseRefResult2.current = false
		end
		UseResult()
	end, { UniverseId, UseResult })
	local UseRefreshAdsDataModuleResult = UseRefreshAdsDataModule(UniverseId, {
		includeEligibility = true,
		adCampaignsStore = P2.adCampaignsStore,
		campaignStatsStore = P2.campaignStatsStore,
		adCampaignEligibilityStore = P2.adCampaignEligibilityStore
	})
	
	return {
		createCampaign = ReactModule.useCallback(function(Current, p2, ToolCallId, p3)
			-- upvalues: UniverseId (copy), UseRefResult3 (copy), FFlagEnablePaidAdsModule (upval), FFlagBuildAgentAdCampaignCardModule (upval), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), P2 (copy), HttpService (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), FFlagBuildAgentAdCampaignToolCallStatusFallbackModule (upval), AsPromiseFunction (upval), CreatorAgentChatModule (upval), SendEvent (copy), ConversationId (copy), UseRefreshAdsDataModuleResult (copy), UseRefResult4 (copy), ClassifyAdCampaignFailureFunction (upval), Callback (copy)
			if UniverseId == nil or UniverseId == 0 or UseRefResult3.current then return end
			if FFlagEnablePaidAdsModule and Current == nil then return end
			if FFlagBuildAgentAdCampaignCardModule and p3 ~= nil then
				UseRefResult.current = p3.idempotencyKey
				UseRefResult1.current = Current
			end
			local Current1 = if FFlagEnablePaidAdsModule then UseRefResult1.current else nil
			local Current2 = FFlagEnablePaidAdsModule and UseRefResult2.current
			
			if Current1 ~= nil and (Current1.paymentType ~= Current.paymentType or Current1.campaignOption ~= Current.campaignOption) and not Current2 then
				UseRefResult.current = nil
			end
			if UseRefResult.current == nil then
				local GenerateIdempotencyKeyFunction = P2.generateIdempotencyKey
				UseRefResult.current = if GenerateIdempotencyKeyFunction == nil then HttpService:GenerateGUID(false) else GenerateIdempotencyKeyFunction()
			end
			if FFlagEnablePaidAdsModule then
				UseRefResult1.current = Current
			end
			UseRefResult3.current = true
			UseStateResult2(true)
			UseStateResult2_1(false)
			local config = {
				universeId = UniverseId,
				idempotencyKey = UseRefResult.current
			}
			
			if FFlagEnablePaidAdsModule and Current ~= nil then
				config.selectedOption = Current
			end
			if FFlagBuildAgentAdCampaignToolCallStatusFallbackModule and ToolCallId ~= nil and ToolCallId ~= "" then
				config.toolCallId = ToolCallId
			end
			local IdempotencyKey = config.idempotencyKey
			local Copy = if FFlagBuildAgentAdCampaignCardModule and config.selectedOption ~= nil then table.clone(config.selectedOption) else nil;
			(P2.createCampaignAsync or function(p4)
				-- upvalues: AsPromiseFunction (upval), CreatorAgentChatModule (upval)
				return AsPromiseFunction(CreatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignCreate(p4))
			end)(config):andThen(function(Result)
				-- upvalues: SendEvent (upval), UniverseId (upval), ConversationId (upval), UseRefResult (upval), FFlagEnablePaidAdsModule (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefreshAdsDataModuleResult (upval), UseRefResult3 (upval), UseRefResult4 (upval), UseStateResult2 (upval), FFlagBuildAgentAdCampaignCardModule (upval), p2 (copy), IdempotencyKey (copy), Copy (copy)
				SendEvent("AD_CAMPAIGN_CREATE_SUCCESS", { universeId = UniverseId, conversationId = ConversationId }, { campaignId = Result.campaignId })
				UseRefResult.current = nil
				
				if FFlagEnablePaidAdsModule then
					UseRefResult1.current = nil
					UseRefResult2.current = false
				end
				UseRefreshAdsDataModuleResult()
				UseRefResult3.current = false
				
				if UseRefResult4.current then
					UseStateResult2(false)
				end
				if FFlagBuildAgentAdCampaignCardModule and p2 ~= nil then
					pcall(p2, Result.campaignId, IdempotencyKey, Copy)
				end
			end):catch(function(Err)
				-- upvalues: SendEvent (upval), UniverseId (upval), ConversationId (upval), UseRefResult3 (upval), FFlagEnablePaidAdsModule (upval), ClassifyAdCampaignFailureFunction (upval), UseRefResult2 (upval), UseRefResult4 (upval), UseStateResult2_1 (upval), Callback (upval), UseStateResult2 (upval), FFlagBuildAgentAdCampaignCardModule (upval), p3 (copy)
				SendEvent("AD_CAMPAIGN_CREATE_FAILURE", { universeId = UniverseId, conversationId = ConversationId }, { error = tostring(Err) })
				UseRefResult3.current = false
				local Kind = if FFlagEnablePaidAdsModule then ClassifyAdCampaignFailureFunction(Err).kind else nil
				
				if FFlagEnablePaidAdsModule and Kind == "unknown" then
					UseRefResult2.current = true
				end
				if UseRefResult4.current then
					UseStateResult2_1(true)
					
					if FFlagEnablePaidAdsModule then
						Callback(Kind)
					end
					UseStateResult2(false)
				end
				if FFlagBuildAgentAdCampaignCardModule and p3 ~= nil then
					pcall(p3.onFailed, Kind)
				end
			end)
		end, {
			UniverseId, ConversationId, UseRefreshAdsDataModuleResult, SendEvent,
			P2.createCampaignAsync, P2.generateIdempotencyKey
		}),
		clearCreateError = UseResult,
		refresh = UseRefreshAdsDataModuleResult,
		isCreatePending = UseStateResult,
		hasCreateError = UseStateResult1,
		createErrorKind = if FFlagEnablePaidAdsModule then v1 else nil
	}
end