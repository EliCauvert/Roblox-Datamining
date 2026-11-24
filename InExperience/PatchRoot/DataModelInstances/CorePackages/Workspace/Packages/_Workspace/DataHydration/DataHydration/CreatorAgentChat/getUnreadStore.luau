local CreateUnreadStoreModule = require(script.Parent.createUnreadStore)
local GetCreatorAgentChatStoreModule = require(script.Parent.getCreatorAgentChatStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateUnreadStoreModule (copy), GetCreatorAgentChatStoreModule (copy)
	return CreateUnreadStoreModule(GetCreatorAgentChatStoreModule(false))
end)