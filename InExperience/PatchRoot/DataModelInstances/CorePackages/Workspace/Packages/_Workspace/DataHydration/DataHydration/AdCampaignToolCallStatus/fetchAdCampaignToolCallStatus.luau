local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.AdCampaignToolCallStatusStoreTypes)

return function(ToolCallId, _)
	-- upvalues: CreatorAgentChatModule (copy), HttpClientModule (copy)
	return HttpClientModule.asPromise(CreatorAgentChatModule.getCreatorAgentChatStore(false).adCampaignToolCallStatus({ toolCallId = ToolCallId }))
end