local BuildExperience = script:FindFirstAncestor("BuildExperience")
local HttpService = game:GetService("HttpService")
local CreatorAgentChatModule = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local AdCampaignEligibilityUtilsModule = require(BuildExperience.Components.Ads.adCampaignEligibilityUtils)

return {
	isCompletedEligibilityToolCall = function(p1): boolean
		return p1 ~= nil and (p1.title == "check_ad_campaign_eligibility" and (p1.status == "completed" and type(p1.toolCallId) == "string") and p1.toolCallId ~= "")
	end,
	decodeCompletedEligibility = function(p1)
		-- upvalues: HttpService (copy), CreatorAgentChatModule (copy)
		if p1 == nil or (p1.title ~= "check_ad_campaign_eligibility" or (p1.status ~= "completed" or (type(p1.toolCallId) ~= "string" or p1.toolCallId == ""))) or p1.content == nil then
			return nil
		end
		local DecodeAdCampaignEligibilityResultResult = nil
		for _, value in p1.content do
			local Content = value.content
			
			if value.type == "content" and Content ~= nil and Content.type == "text" and type(Content.text) == "string" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, Content.text)
				
				if Success then
					DecodeAdCampaignEligibilityResultResult = CreatorAgentChatModule.decodeAdCampaignEligibilityResult(Result)
					
					if DecodeAdCampaignEligibilityResultResult ~= nil then
						return DecodeAdCampaignEligibilityResultResult
					end
				end
			end
		end
		return nil
	end,
	getCardOffers = function(p2)
		-- upvalues: AdCampaignEligibilityUtilsModule (copy)
		return if p2 == nil or not p2.userEligible or not p2.universeEligible or p2.cardType == "none" then nil else AdCampaignEligibilityUtilsModule.getSelectableOffers(p2)
	end
}