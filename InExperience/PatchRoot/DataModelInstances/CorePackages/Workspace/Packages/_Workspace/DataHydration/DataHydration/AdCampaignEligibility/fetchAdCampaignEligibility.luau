local DataHydration = script:FindFirstAncestor("DataHydration")
local HttpClientModule = require(DataHydration.Parent.HttpClient)
local CreatorAgentChatModule = require(DataHydration.CreatorAgentChat)
local _ = require(script.Parent.AdCampaignEligibilityStoreTypes)

return function(UniverseId)
	-- upvalues: CreatorAgentChatModule (copy), HttpClientModule (copy)
	return HttpClientModule.asPromise(CreatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignEligibility({ universeId = UniverseId }))
end