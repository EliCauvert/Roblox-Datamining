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
local asPromise = httpClientModule.asPromise

return function(p1, p2, p3)
	-- upvalues: sendBuildExperienceEventModule (ref), reactModule (ref), useRefreshAdsDataModule (ref), httpService (ref), asPromise (ref), creatorAgentChatModule (ref)
	p3 = p3 or {}
	local sendEvent = p3.sendEvent or sendBuildExperienceEventModule
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		var7.current = true
		
		return function()
			-- upvalues: var7 (copy)
			var7.current = false
		end
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(false)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var8 (ref)
		var5.current = nil
		var8()
	end, { p1, var8 })
	local var9 = useRefreshAdsDataModule(p1, {
		includeEligibility = true,
		adCampaignsStore = p3.adCampaignsStore,
		campaignStatsStore = p3.campaignStatsStore,
		adCampaignEligibilityStore = p3.adCampaignEligibilityStore
	})
	
	return {
		createCampaign = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var6 (ref), var5 (ref), p3 (ref), httpService (copy), var2 (ref), var4 (ref), asPromise (copy), creatorAgentChatModule (copy), sendEvent (ref), p2 (ref), var9 (ref), var7 (ref)
			if p1 == nil or p1 == 0 or var6.current then return end
			if var5.current == nil then
				local generateIdempotencyKey = p3.generateIdempotencyKey
				var5.current = if generateIdempotencyKey ~= nil then httpService:GenerateGUID(false) else generateIdempotencyKey()
			end
			var6.current = true
			var2(true)
			var4(false);
			(p3.createCampaignAsync or function(p4)
				-- upvalues: asPromise (copy), creatorAgentChatModule (copy)
				return asPromise(creatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignCreate(p4))
			end)({ universeId = p1, idempotencyKey = var5.current }):andThen(function(p4)
				-- upvalues: sendEvent (copy), p1 (copy), p2 (copy), var5 (copy), var9 (copy), var6 (copy), var7 (copy), var2 (copy)
				sendEvent("AD_CAMPAIGN_CREATE_SUCCESS", { universeId = p1, conversationId = p2 }, { campaignId = p4.campaignId })
				var5.current = nil
				var9()
				var6.current = false
				
				if var7.current then
					var2(false)
				end
			end):catch(function(p4)
				-- upvalues: sendEvent (copy), p1 (copy), p2 (copy), var6 (copy), var7 (copy), var4 (copy), var2 (copy)
				sendEvent("AD_CAMPAIGN_CREATE_FAILURE", { universeId = p1, conversationId = p2 }, { error = tostring(p4) })
				var6.current = false
				
				if var7.current then
					var4(true)
					var2(false)
				end
			end)
		end, {
			p1, p2, var9, sendEvent, p3.createCampaignAsync, p3.generateIdempotencyKey
		}),
		clearCreateError = var8,
		refresh = var9,
		isCreatePending = var1,
		hasCreateError = var3
	}
end