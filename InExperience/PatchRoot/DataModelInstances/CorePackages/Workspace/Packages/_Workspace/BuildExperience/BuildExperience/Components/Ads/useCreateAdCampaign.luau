local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local reactModule = require(parent.React)
local _ = require(parent.DataHydration.AdCampaignEligibility)
local _ = require(parent.DataHydration.AdCampaigns)
local _ = require(parent.DataHydration.CampaignStats)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local fFlagBuildAgentAdCampaignToolCallStatusFallbackModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignToolCallStatusFallback)
local useRefreshAdsDataModule = require(script.Parent.useRefreshAdsData)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
local asPromise = httpClientModule.asPromise
local classifyAdCampaignFailure = creatorAgentChatModule.classifyAdCampaignFailure

return function(p1, p2, p3)
	-- upvalues: sendBuildExperienceEventModule (ref), reactModule (ref), fFlagEnablePaidAdsModule (ref), useRefreshAdsDataModule (ref), fFlagBuildAgentAdCampaignCardModule (ref), httpService (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (ref), asPromise (ref), creatorAgentChatModule (ref), classifyAdCampaignFailure (ref)
	p3 = p3 or {}
	local sendEvent = p3.sendEvent or sendBuildExperienceEventModule
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(nil)
	local var6 = nil
	local var7 = nil
	local var8 = nil
	local var9 = nil
	
	if fFlagEnablePaidAdsModule then
		local var10, var11 = reactModule.useState(nil)
		var6 = var10
		var7 = var11
		var8 = reactModule.useRef(nil)
		var9 = reactModule.useRef(false)
	end
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref)
		var13.current = true
		
		return function()
			-- upvalues: var13 (copy)
			var13.current = false
		end
	end, {})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), fFlagEnablePaidAdsModule (copy), var7 (ref)
		var4(false)
		
		if fFlagEnablePaidAdsModule then
			var7(nil)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), fFlagEnablePaidAdsModule (copy), var8 (ref), var9 (ref), var14 (ref)
		var5.current = nil
		
		if fFlagEnablePaidAdsModule then
			var8.current = nil
			var9.current = false
		end
		var14()
	end, { p1, var14 })
	local var15 = useRefreshAdsDataModule(p1, {
		includeEligibility = true,
		adCampaignsStore = p3.adCampaignsStore,
		campaignStatsStore = p3.campaignStatsStore,
		adCampaignEligibilityStore = p3.adCampaignEligibilityStore
	})
	
	return {
		createCampaign = reactModule.useCallback(function(p4, p5, p6, p7)
			-- upvalues: p1 (ref), var12 (ref), fFlagEnablePaidAdsModule (copy), fFlagBuildAgentAdCampaignCardModule (copy), var5 (ref), var8 (ref), var9 (ref), p3 (ref), httpService (copy), var2 (ref), var4 (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), asPromise (copy), creatorAgentChatModule (copy), sendEvent (ref), p2 (ref), var15 (ref), var13 (ref), classifyAdCampaignFailure (copy), var7 (ref)
			if p1 == nil or p1 == 0 or var12.current then return end
			if fFlagEnablePaidAdsModule and p4 == nil then return end
			if fFlagBuildAgentAdCampaignCardModule and p7 ~= nil then
				var5.current = p7.idempotencyKey
				var8.current = p4
			end
			local var16 = if fFlagEnablePaidAdsModule then var8.current else nil
			
			if (var16 ~= nil and (if var16.paymentType == p4.paymentType then var16.campaignOption ~= p4.campaignOption else true)) and not (fFlagEnablePaidAdsModule and var9.current) then
				var5.current = nil
			end
			if var5.current == nil then
				local generateIdempotencyKey = p3.generateIdempotencyKey
				var5.current = if generateIdempotencyKey ~= nil then httpService:GenerateGUID(false) else generateIdempotencyKey()
			end
			if fFlagEnablePaidAdsModule then
				var8.current = p4
			end
			var12.current = true
			var2(true)
			var4(false)
			local t = { universeId = p1, idempotencyKey = var5.current }
			
			if fFlagEnablePaidAdsModule and p4 ~= nil then
				t.selectedOption = p4
			end
			if fFlagBuildAgentAdCampaignToolCallStatusFallbackModule and p6 ~= nil and p6 ~= "" then
				t.toolCallId = p6
			end
			local createCampaignAsync = p3.createCampaignAsync or function(p8)
				-- upvalues: asPromise (copy), creatorAgentChatModule (copy)
				return asPromise(creatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignCreate(p8))
			end
			local idempotencyKey = t.idempotencyKey
			local var17 = if fFlagBuildAgentAdCampaignCardModule and t.selectedOption ~= nil then table.clone(t.selectedOption) else nil
			createCampaignAsync(t):andThen(function(p8)
				-- upvalues: sendEvent (copy), p1 (copy), p2 (copy), var5 (copy), fFlagEnablePaidAdsModule (copy), var8 (copy), var9 (copy), var15 (copy), var12 (copy), var13 (copy), var2 (copy), fFlagBuildAgentAdCampaignCardModule (copy), p5 (ref), idempotencyKey (ref), var17 (ref)
				sendEvent("AD_CAMPAIGN_CREATE_SUCCESS", { universeId = p1, conversationId = p2 }, { campaignId = p8.campaignId })
				var5.current = nil
				
				if fFlagEnablePaidAdsModule then
					var8.current = nil
					var9.current = false
				end
				var15()
				var12.current = false
				
				if var13.current then
					var2(false)
				end
				if fFlagBuildAgentAdCampaignCardModule and p5 ~= nil then
					pcall(p5, p8.campaignId, idempotencyKey, var17)
				end
			end):catch(function(p8)
				-- upvalues: sendEvent (copy), p1 (copy), p2 (copy), var12 (copy), fFlagEnablePaidAdsModule (copy), classifyAdCampaignFailure (copy), var9 (copy), var13 (copy), var4 (copy), var7 (copy), var2 (copy), fFlagBuildAgentAdCampaignCardModule (copy), p7 (ref)
				sendEvent("AD_CAMPAIGN_CREATE_FAILURE", { universeId = p1, conversationId = p2 }, { error = tostring(p8) })
				var12.current = false
				local var18 = if fFlagEnablePaidAdsModule then classifyAdCampaignFailure(p8).kind else nil
				
				if fFlagEnablePaidAdsModule and var18 == "unknown" then
					var9.current = true
				end
				if var13.current then
					var4(true)
					
					if fFlagEnablePaidAdsModule then
						var7(var18)
					end
					var2(false)
				end
				if fFlagBuildAgentAdCampaignCardModule and p7 ~= nil then
					pcall(p7.onFailed, var18)
				end
			end)
		end, {
			p1, p2, var15, sendEvent, p3.createCampaignAsync, p3.generateIdempotencyKey
		}),
		clearCreateError = var14,
		refresh = var15,
		isCreatePending = var1,
		hasCreateError = var3,
		createErrorKind = if fFlagEnablePaidAdsModule then var6 else nil
	}
end