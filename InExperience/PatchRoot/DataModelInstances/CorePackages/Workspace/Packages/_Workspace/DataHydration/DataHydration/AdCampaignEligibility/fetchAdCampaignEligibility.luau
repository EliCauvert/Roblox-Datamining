local dataHydration = script:FindFirstAncestor("DataHydration")
local httpClientModule = require(dataHydration.Parent.HttpClient)
local creatorAgentChatModule = require(dataHydration.CreatorAgentChat)
local _ = require(script.Parent.AdCampaignEligibilityStoreTypes)

return function(p1)
	-- upvalues: creatorAgentChatModule (ref), httpClientModule (ref)
	return httpClientModule.asPromise(creatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignEligibility({ universeId = p1 }))
end