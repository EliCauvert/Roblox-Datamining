local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local reactModule = require(parent.React)
local _ = require(parent.DataHydration.AdCampaignEligibility)
local _ = require(parent.DataHydration.AdCampaigns)
local _ = require(parent.DataHydration.CampaignStats)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local useRefreshAdsDataModule = require(script.Parent.useRefreshAdsData)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
local asPromise = httpClientModule.asPromise

return function(p1, p2, p3)
	-- upvalues: sendBuildExperienceEventModule (ref), reactModule (ref), fFlagEnablePaidAdsModule (ref), useRefreshAdsDataModule (ref), httpService (ref), asPromise (ref), creatorAgentChatModule (ref)
	p3 = p3 or {}
	local sendEvent = p3.sendEvent or sendBuildExperienceEventModule
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(nil)
	local var6 = if fFlagEnablePaidAdsModule then reactModule.useRef(nil) else nil
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		var8.current = true
		
		return function()
			-- upvalues: var8 (copy)
			var8.current = false
		end
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(false)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), fFlagEnablePaidAdsModule (copy), var6 (ref), var9 (ref)
		var5.current = nil
		
		if fFlagEnablePaidAdsModule then
			var6.current = nil
		end
		var9()
	end, { p1, var9 })
	local var10 = useRefreshAdsDataModule(p1, {
		includeEligibility = true,
		adCampaignsStore = p3.adCampaignsStore,
		campaignStatsStore = p3.campaignStatsStore,
		adCampaignEligibilityStore = p3.adCampaignEligibilityStore
	})
	
	return {
		createCampaign = reactModule.useCallback(function(p4)
			-- upvalues: p1 (ref), var7 (ref), fFlagEnablePaidAdsModule (copy), var6 (ref), var4 (ref), var5 (ref), p3 (ref), httpService (copy), var2 (ref), asPromise (copy), creatorAgentChatModule (copy), sendEvent (ref), p2 (ref), var10 (ref), var8 (ref)
			if p1 == nil or p1 == 0 or var7.current then return end
			if fFlagEnablePaidAdsModule and p4 == nil then return end
			local var11 = if fFlagEnablePaidAdsModule then var6.current else nil
			
			if var11 ~= nil and (if var11.paymentType == p4.paymentType then var11.campaignOption ~= p4.campaignOption else true) then
				var4(true)
				
				return
			elseif var5.current == nil then
				local generateIdempotencyKey = p3.generateIdempotencyKey
				var5.current = if generateIdempotencyKey ~= nil then httpService:GenerateGUID(false) else generateIdempotencyKey()
			end
			if fFlagEnablePaidAdsModule then
				var6.current = p4
			end
			var7.current = true
			var2(true)
			var4(false)
			local t = { universeId = p1, idempotencyKey = var5.current }
			
			if fFlagEnablePaidAdsModule then
				t.selectedOption = p4
			end;
			(p3.createCampaignAsync or function(p5)
				-- upvalues: asPromise (copy), creatorAgentChatModule (copy)
				return asPromise(creatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignCreate(p5))
			end)(t):andThen(function(p5)
				-- upvalues: sendEvent (copy), p1 (copy), p2 (copy), var5 (copy), fFlagEnablePaidAdsModule (copy), var6 (copy), var10 (copy), var7 (copy), var8 (copy), var2 (copy)
				sendEvent("AD_CAMPAIGN_CREATE_SUCCESS", { universeId = p1, conversationId = p2 }, { campaignId = p5.campaignId })
				var5.current = nil
				
				if fFlagEnablePaidAdsModule then
					var6.current = nil
				end
				var10()
				var7.current = false
				
				if var8.current then
					var2(false)
				end
			end):catch(function(p5)
				-- upvalues: sendEvent (copy), p1 (copy), p2 (copy), var7 (copy), var8 (copy), var4 (copy), var2 (copy)
				sendEvent("AD_CAMPAIGN_CREATE_FAILURE", { universeId = p1, conversationId = p2 }, { error = tostring(p5) })
				var7.current = false
				
				if var8.current then
					var4(true)
					var2(false)
				end
			end)
		end, {
			p1, p2, var10, sendEvent, p3.createCampaignAsync, p3.generateIdempotencyKey
		}),
		clearCreateError = var9,
		refresh = var10,
		isCreatePending = var1,
		hasCreateError = var3
	}
end