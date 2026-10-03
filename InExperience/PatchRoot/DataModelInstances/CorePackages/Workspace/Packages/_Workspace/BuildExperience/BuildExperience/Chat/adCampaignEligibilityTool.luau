local buildExperience = script:FindFirstAncestor("BuildExperience")
local httpService = game:GetService("HttpService")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local adCampaignEligibilityUtilsModule = require(buildExperience.Components.Ads.adCampaignEligibilityUtils)

return {
	isCompletedEligibilityToolCall = function(p1)
		return p1 ~= nil and (p1.title == "check_ad_campaign_eligibility" and (p1.status == "completed" and (type(p1.toolCallId) == "string" and p1.toolCallId ~= "")))
	end,
	decodeCompletedEligibility = function(p1)
		-- upvalues: httpService (ref), creatorAgentChatModule (ref)
		if not (p1 ~= nil and (p1.title == "check_ad_campaign_eligibility" and (p1.status == "completed" and (type(p1.toolCallId) == "string" and p1.toolCallId ~= "")))) or p1.content == nil then
			return nil
		end
		for i, v in p1.content do
			local content = v.content
			
			if v.type == "content" and content ~= nil and (content.type == "text" and type(content.text) == "string") then
				local ok, status = pcall(httpService.JSONDecode, httpService, content.text)
				
				if ok then
					local var1 = creatorAgentChatModule.decodeAdCampaignEligibilityResult(status)
					
					if var1 ~= nil then
						return var1
					end
				end
			end
		end
		return nil
	end,
	getCardOffers = function(p2)
		-- upvalues: adCampaignEligibilityUtilsModule (ref)
		return if p2 == nil or not p2.userEligible or (not p2.universeEligible or p2.cardType == "none") then nil else adCampaignEligibilityUtilsModule.getSelectableOffers(p2)
	end
}