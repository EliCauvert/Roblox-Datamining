local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local AdCampaignEligibilityUtilsModule = require(BuildExperience.Components.Ads.adCampaignEligibilityUtils)
local AdUpsellVisibilityUtilsModule = require(BuildExperience.Components.Ads.AdUpsellMilestone.adUpsellVisibilityUtils)
local GetAgentAdCampaignStoreModule = require(BuildExperience.Stores.GetAgentAdCampaignStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildAgentAdCampaignToolCallStatusFallbackModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignToolCallStatusFallback)
local UseAgentAdCampaignToolCallStatusFallbackModule = require(script.Parent.useAgentAdCampaignToolCallStatusFallback)
local FFlagBuildAgentAdCampaignRefreshEligibilityModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignRefreshEligibility)

return function(p1, p2)
	-- upvalues: ReactModule (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), FFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), UseAgentAdCampaignToolCallStatusFallbackModule (copy), AdCampaignEligibilityUtilsModule (copy), SendBuildExperienceEventModule (copy), GetAgentAdCampaignStoreModule (copy), AdUpsellVisibilityUtilsModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (upval)
		local States = {}
		local Missing = {}
		
		for _, segment in p1.segments do
			if segment.kind == "agent_ad_campaign_card" then
				local CardState = if p1.getCardState == nil then nil else p1.getCardState(segment.toolCallId)
				
				if CardState ~= nil then
					States[segment.toolCallId] = CardState
				end
				if (if FFlagBuildAgentAdCampaignRefreshEligibilityModule then CardState == nil or CardState.campaignId == nil else CardState == nil) and segment.shouldCheckCampaignStatus then
					table.insert(Missing, segment.toolCallId)
				end
			end
		end
		return { states = States, missing = Missing }
	end, { p1.segments, p1.getCardState })
	local States = UseMemoResult.states
	local Missing = UseMemoResult.missing
	local v1 = nil
	
	if FFlagBuildAgentAdCampaignToolCallStatusFallbackModule then
		table.sort(Missing)
		v1 = UseAgentAdCampaignToolCallStatusFallbackModule(Missing, p2)
	end
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), States (copy), v1 (ref), FFlagBuildAgentAdCampaignRefreshEligibilityModule (upval), AdCampaignEligibilityUtilsModule (upval), UseRefResult (copy), ReactModule (upval), SendBuildExperienceEventModule (upval)
		local t = {}
		
		for _, segment in p1.segments do
			if segment.kind == "agent_ad_campaign_card" then
				local ToolCallId = segment.toolCallId
				local State = States[ToolCallId] or (if v1 == nil then nil else v1.cardStates[ToolCallId])
				
				if FFlagBuildAgentAdCampaignRefreshEligibilityModule and State ~= nil and State.campaignId == nil and v1 ~= nil then
					State = v1.cardStates[ToolCallId] or State
				end
				local IsPendingToolCallId: boolean = v1 ~= nil and v1.pendingToolCallIds[ToolCallId] == true
				local DefaultOffer = if segment.offers == nil then nil else AdCampaignEligibilityUtilsModule.getDefaultOffer(segment.offers)
				local Paid = if DefaultOffer == nil then "paid" else DefaultOffer.fundingType
				local NoOnOfferSelected = p1.onOfferSelected == nil or (p1.isPageVisible == false or (IsPendingToolCallId or p1.isCreateDisabled ~= nil and p1.isCreateDisabled(ToolCallId)))
				UseRefResult.current[ToolCallId] = UseRefResult.current[ToolCallId] or ReactModule.createRef()
				t[ToolCallId] = {
					state = State,
					isPending = IsPendingToolCallId,
					fundingType = Paid,
					isCreateDisabled = NoOnOfferSelected,
					cardRef = UseRefResult.current[ToolCallId],
					onCreate = function()
						-- upvalues: FFlagBuildAgentAdCampaignRefreshEligibilityModule (upval), State (ref), NoOnOfferSelected (copy), segment (copy), p1 (upval), SendBuildExperienceEventModule (upval), ToolCallId (copy), Paid (copy)
						local HasCampaignId: boolean = if FFlagBuildAgentAdCampaignRefreshEligibilityModule then State ~= nil and State.campaignId ~= nil else State ~= nil
						
						if not NoOnOfferSelected and not HasCampaignId and segment.offers ~= nil and p1.onOfferSelected ~= nil then
							SendBuildExperienceEventModule("AD_UPSELL_CREATE_CLICK", {
								universeId = p1.universeId,
								conversationId = p1.sessionId
							}, {
								context = "agent_card",
								toolCallId = ToolCallId,
								fundingType = Paid
							})
							p1.onOfferSelected(ToolCallId, segment.offers)
							
							return
						end
					end
				}
			end
		end
		return t
	end, {
		p1.segments, p1.onOfferSelected, p1.isPageVisible, p1.isCreateDisabled,
		p1.universeId, p1.sessionId, States, v1
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), GetAgentAdCampaignStoreModule (upval), UseMemoResult1 (copy), AdUpsellVisibilityUtilsModule (upval), SendBuildExperienceEventModule (upval)
		local Current = if p1.scrollingFrameRef == nil then nil else p1.scrollingFrameRef.current
		
		if p1.isPageVisible ~= true or p1.sessionId == nil or Current == nil then return end
		local List = {}
		local AgentAdCampaignStoreModule = GetAgentAdCampaignStoreModule(false)
		
		for _, segment in p1.segments do
			if segment.kind == "agent_ad_campaign_card" and segment.offers ~= nil then
				local UseMemoResultEntry = UseMemoResult1[segment.toolCallId]
				local Current1 = UseMemoResultEntry.cardRef.current
				
				if UseMemoResultEntry.state == nil and not UseMemoResultEntry.isPending and Current1 ~= nil then
					local function reportIfVisible()
						-- upvalues: Current1 (copy), Current (copy), AdUpsellVisibilityUtilsModule (upval), AgentAdCampaignStoreModule (copy), p1 (upval), segment (copy), SendBuildExperienceEventModule (upval), UseMemoResultEntry (copy)
						if Current1:IsDescendantOf(Current) and AdUpsellVisibilityUtilsModule.isCardVisibleInScrollViewport(Current, Current1) and AgentAdCampaignStoreModule.markImpressed(p1.sessionId, segment.toolCallId) then
							SendBuildExperienceEventModule("AD_UPSELL_IMPRESSION", {
								universeId = p1.universeId,
								conversationId = p1.sessionId
							}, {
								context = "agent_card",
								toolCallId = segment.toolCallId,
								fundingType = UseMemoResultEntry.fundingType
							})
						end
					end
					
					for _, PropertyName in {
						"CanvasPosition",
						"AbsolutePosition",
						"AbsoluteWindowSize"
					} do
						table.insert(List, Current:GetPropertyChangedSignal(PropertyName):Connect(reportIfVisible))
					end
					for _, PropertyName1 in { "AbsolutePosition", "AbsoluteSize" } do
						table.insert(List, Current1:GetPropertyChangedSignal(PropertyName1):Connect(reportIfVisible))
					end
					reportIfVisible()
				end
			end
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef, p1.isPageVisible, p1.sessionId, p1.universeId,
		p1.segments, UseMemoResult1
	})
	
	return UseMemoResult1
end