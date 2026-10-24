local Parent = script:FindFirstAncestor("BuildExperience").Parent
local DataHydrationUtils = require(Parent.DataHydration).DataHydrationUtils
local CreateBuildModelSelectionStoreModule = require(script.createBuildModelSelectionStore)

return require(Parent.Signals).createComputed(function()
	-- upvalues: CreateBuildModelSelectionStoreModule (copy), DataHydrationUtils (copy)
	return CreateBuildModelSelectionStoreModule(if game.GameId > 0 then DataHydrationUtils.getLocalPlayerUserId() else nil)
end)