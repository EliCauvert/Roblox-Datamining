local CreateGamePassVoteStoreModule = require(script.Parent.createGamePassVoteStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateGamePassVoteStoreModule (copy)
	return CreateGamePassVoteStoreModule()
end)