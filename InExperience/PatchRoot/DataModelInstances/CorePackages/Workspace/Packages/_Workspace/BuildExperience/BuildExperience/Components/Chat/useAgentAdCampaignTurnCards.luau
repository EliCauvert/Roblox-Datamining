local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local adCampaignEligibilityUtilsModule = require(buildExperience.Components.Ads.adCampaignEligibilityUtils)
local adUpsellVisibilityUtilsModule = require(buildExperience.Components.Ads.AdUpsellMilestone.adUpsellVisibilityUtils)
local getAgentAdCampaignStoreModule = require(buildExperience.Stores.GetAgentAdCampaignStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildAgentAdCampaignToolCallStatusFallbackModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignToolCallStatusFallback)
local useAgentAdCampaignToolCallStatusFallbackModule = require(script.Parent.useAgentAdCampaignToolCallStatusFallback)
local fFlagBuildAgentAdCampaignRefreshEligibilityModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignRefreshEligibility)

return function(p1, p2)
	-- upvalues: reactModule (ref), fFlagBuildAgentAdCampaignRefreshEligibilityModule (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (ref), useAgentAdCampaignToolCallStatusFallbackModule (ref), adCampaignEligibilityUtilsModule (ref), sendBuildExperienceEventModule (ref), getAgentAdCampaignStoreModule (ref), adUpsellVisibilityUtilsModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), fFlagBuildAgentAdCampaignRefreshEligibilityModule (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in p1.segments do
			if v.kind == "agent_ad_campaign_card" then
				local var3
				local var4 = if p1.getCardState ~= nil then nil else p1.getCardState(v.toolCallId)
				
				if var4 ~= nil then
					t[v.toolCallId] = var4
				end
				if fFlagBuildAgentAdCampaignRefreshEligibilityModule then
					var3 = true
					
					if var4 ~= nil then
						local _ = var4.campaignId == nil
					end
				else
					var3 = var4 == nil
				end
				if var3 and v.shouldCheckCampaignStatus then
					table.insert(t_1, v.toolCallId)
				end
			end
		end
		return { states = t, missing = t_1 }
	end, { p1.segments, p1.getCardState })
	local states = var2.states
	local missing = var2.missing
	local var5 = nil
	
	if fFlagBuildAgentAdCampaignToolCallStatusFallbackModule then
		table.sort(missing)
		var5 = useAgentAdCampaignToolCallStatusFallbackModule(missing, p2)
	end
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), states (ref), var5 (write), fFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), adCampaignEligibilityUtilsModule (copy), var1 (ref), reactModule (copy), sendBuildExperienceEventModule (copy)
		local t = {}
		
		for i, v in p1.segments do
			if v.kind == "agent_ad_campaign_card" then
				local toolCallId = v.toolCallId
				local var7 = states[toolCallId] or (if var5 ~= nil then nil else var5.cardStates[toolCallId])
				
				if fFlagBuildAgentAdCampaignRefreshEligibilityModule and var7 ~= nil and (var7.campaignId == nil and var5 ~= nil) then
					var7 = var5.cardStates[toolCallId] or var7
				end
				local var8 = var5 ~= nil and var5.pendingToolCallIds[toolCallId] == true
				local var9 = if v.offers ~= nil then nil else adCampaignEligibilityUtilsModule.getDefaultOffer(v.offers)
				local var10 = if var9 ~= nil then "paid" else var9.fundingType
				local var11 = if p1.onOfferSelected ~= nil then if p1.isPageVisible ~= false then var8 or (p1.isCreateDisabled ~= nil and p1.isCreateDisabled(toolCallId)) else true else true
				var1.current[toolCallId] = var1.current[toolCallId] or reactModule.createRef()
				t[toolCallId] = {
					state = var7,
					isPending = var8,
					fundingType = var10,
					isCreateDisabled = var11,
					cardRef = var1.current[toolCallId],
					onCreate = function()
						-- upvalues: fFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), var7 (write), var11 (ref), v (ref), p1 (copy), sendBuildExperienceEventModule (copy), toolCallId (ref), var10 (ref)
						local var12
						if fFlagBuildAgentAdCampaignRefreshEligibilityModule then
							var12 = false
							
							if var7 ~= nil then
								local _ = var7.campaignId ~= nil
							end
						else
							var12 = var7 ~= nil
						end
						if var11 or var12 or (v.offers == nil or p1.onOfferSelected == nil) then
							return
						end
						sendBuildExperienceEventModule("AD_UPSELL_CREATE_CLICK", {
							universeId = p1.universeId,
							conversationId = p1.sessionId
						}, {
							context = "agent_card",
							toolCallId = toolCallId,
							fundingType = var10
						})
						p1.onOfferSelected(toolCallId, v.offers)
					end
				}
			end
		end
		return t
	end, {
		p1.segments, p1.onOfferSelected, p1.isPageVisible, p1.isCreateDisabled,
		p1.universeId, p1.sessionId, states, var5
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), getAgentAdCampaignStoreModule (copy), var6 (ref), adUpsellVisibilityUtilsModule (copy), sendBuildExperienceEventModule (copy)
		local var12 = if p1.scrollingFrameRef ~= nil then nil else p1.scrollingFrameRef.current
		
		if p1.isPageVisible ~= true or p1.sessionId == nil or var12 == nil then return end
		local t = {}
		local var13 = getAgentAdCampaignStoreModule(false)
		
		for i, v in p1.segments do
			if v.kind == "agent_ad_campaign_card" and v.offers ~= nil then
				local toolCallId = var6[v.toolCallId]
				local current = toolCallId.cardRef.current
				
				if toolCallId.state == nil and not toolCallId.isPending and current ~= nil then
					local function reportIfVisible()
						-- upvalues: current (ref), var12 (ref), adUpsellVisibilityUtilsModule (copy), var13 (ref), p1 (copy), v (ref), sendBuildExperienceEventModule (copy), toolCallId (ref)
						if current:IsDescendantOf(var12) and adUpsellVisibilityUtilsModule.isCardVisibleInScrollViewport(var12, current) and var13.markImpressed(p1.sessionId, v.toolCallId) then
							sendBuildExperienceEventModule("AD_UPSELL_IMPRESSION", {
								universeId = p1.universeId,
								conversationId = p1.sessionId
							}, {
								context = "agent_card",
								toolCallId = v.toolCallId,
								fundingType = toolCallId.fundingType
							})
						end
					end
					
					for i_1, v_1 in {
						"CanvasPosition",
						"AbsolutePosition",
						"AbsoluteWindowSize"
					} do
						table.insert(t, var12:GetPropertyChangedSignal(v_1):Connect(reportIfVisible))
					end
					for i_1, v_1 in { "AbsolutePosition", "AbsoluteSize" } do
						table.insert(t, current:GetPropertyChangedSignal(v_1):Connect(reportIfVisible))
					end
					reportIfVisible()
				end
			end
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef, p1.isPageVisible, p1.sessionId, p1.universeId,
		p1.segments, var6
	})
	
	return var6
end