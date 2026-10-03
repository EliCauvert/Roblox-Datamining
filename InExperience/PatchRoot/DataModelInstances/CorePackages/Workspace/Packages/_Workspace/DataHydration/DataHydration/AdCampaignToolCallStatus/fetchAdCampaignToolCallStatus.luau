local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.AdCampaignToolCallStatusStoreTypes)

return function(p1, _)
	-- upvalues: creatorAgentChatModule (ref), httpClientModule (ref)
	return httpClientModule.asPromise(creatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignToolCallStatus({ toolCallId = p1 }))
end