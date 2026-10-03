local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local adCampaignEligibilityUtilsModule = require(buildExperience.Components.Ads.adCampaignEligibilityUtils)
local adUpsellVisibilityUtilsModule = require(buildExperience.Components.Ads.AdUpsellMilestone.adUpsellVisibilityUtils)
local getAgentAdCampaignStoreModule = require(buildExperience.Stores.GetAgentAdCampaignStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildAgentAdCampaignToolCallStatusFallbackModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignToolCallStatusFallback)
local useAgentAdCampaignToolCallStatusFallbackModule = require(script.Parent.useAgentAdCampaignToolCallStatusFallback)

return function(p1, p2)
	-- upvalues: reactModule (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (ref), useAgentAdCampaignToolCallStatusFallbackModule (ref), adCampaignEligibilityUtilsModule (ref), sendBuildExperienceEventModule (ref), getAgentAdCampaignStoreModule (ref), adUpsellVisibilityUtilsModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in p1.segments do
			if v.kind == "agent_ad_campaign_card" then
				local var3 = if p1.getCardState ~= nil then nil else p1.getCardState(v.toolCallId)
				
				if var3 ~= nil then
					t[v.toolCallId] = var3
				elseif v.shouldCheckCampaignStatus then
					table.insert(t_1, v.toolCallId)
				end
			end
		end
		return { states = t, missing = t_1 }
	end, { p1.segments, p1.getCardState })
	local states = var2.states
	local missing = var2.missing
	local var4 = nil
	
	if fFlagBuildAgentAdCampaignToolCallStatusFallbackModule then
		table.sort(missing)
		var4 = useAgentAdCampaignToolCallStatusFallbackModule(missing, p2)
	end
	local var5 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), states (ref), var4 (write), adCampaignEligibilityUtilsModule (copy), var1 (ref), reactModule (copy), sendBuildExperienceEventModule (copy)
		local t = {}
		
		for i, v in p1.segments do
			if v.kind == "agent_ad_campaign_card" then
				local toolCallId = v.toolCallId
				local var6 = states[toolCallId] or (if var4 ~= nil then nil else var4.cardStates[toolCallId])
				local var7 = var4 ~= nil and var4.pendingToolCallIds[toolCallId] == true
				local var8 = if v.offers ~= nil then nil else adCampaignEligibilityUtilsModule.getDefaultOffer(v.offers)
				local var9 = if var8 ~= nil then "paid" else var8.fundingType
				local var10 = if p1.onOfferSelected ~= nil then if p1.isPageVisible ~= false then var7 or (p1.isCreateDisabled ~= nil and p1.isCreateDisabled(toolCallId)) else true else true
				var1.current[toolCallId] = var1.current[toolCallId] or reactModule.createRef()
				t[toolCallId] = {
					state = var6,
					isPending = var7,
					fundingType = var9,
					isCreateDisabled = var10,
					cardRef = var1.current[toolCallId],
					onCreate = function()
						-- upvalues: var10 (ref), var6 (ref), v (ref), p1 (copy), sendBuildExperienceEventModule (copy), toolCallId (ref), var9 (ref)
						if var10 or var6 ~= nil or (v.offers == nil or p1.onOfferSelected == nil) then
							return
						end
						sendBuildExperienceEventModule("AD_UPSELL_CREATE_CLICK", {
							universeId = p1.universeId,
							conversationId = p1.sessionId
						}, {
							context = "agent_card",
							toolCallId = toolCallId,
							fundingType = var9
						})
						p1.onOfferSelected(toolCallId, v.offers)
					end
				}
			end
		end
		return t
	end, {
		p1.segments, p1.onOfferSelected, p1.isPageVisible, p1.isCreateDisabled,
		p1.universeId, p1.sessionId, states, var4
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), getAgentAdCampaignStoreModule (copy), var5 (ref), adUpsellVisibilityUtilsModule (copy), sendBuildExperienceEventModule (copy)
		local var11 = if p1.scrollingFrameRef ~= nil then nil else p1.scrollingFrameRef.current
		
		if p1.isPageVisible ~= true or p1.sessionId == nil or var11 == nil then return end
		local t = {}
		local var12 = getAgentAdCampaignStoreModule(false)
		
		for i, v in p1.segments do
			if v.kind == "agent_ad_campaign_card" and v.offers ~= nil then
				local toolCallId = var5[v.toolCallId]
				local current = toolCallId.cardRef.current
				
				if toolCallId.state == nil and not toolCallId.isPending and current ~= nil then
					local function reportIfVisible()
						-- upvalues: current (ref), var11 (ref), adUpsellVisibilityUtilsModule (copy), var12 (ref), p1 (copy), v (ref), sendBuildExperienceEventModule (copy), toolCallId (ref)
						if current:IsDescendantOf(var11) and adUpsellVisibilityUtilsModule.isCardVisibleInScrollViewport(var11, current) and var12.markImpressed(p1.sessionId, v.toolCallId) then
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
						table.insert(t, var11:GetPropertyChangedSignal(v_1):Connect(reportIfVisible))
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
		p1.segments, var5
	})
	
	return var5
end