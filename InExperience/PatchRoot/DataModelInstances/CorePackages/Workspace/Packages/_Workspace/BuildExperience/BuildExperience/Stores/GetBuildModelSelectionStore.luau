local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsModule = require(Parent.Signals)
local DataHydrationUtils = require(Parent.DataHydration).DataHydrationUtils
local CreateBuildModelSelectionStoreModule = require(script.createBuildModelSelectionStore)

return SignalsModule.createComputed(function()
	-- upvalues: CreateBuildModelSelectionStoreModule (copy), DataHydrationUtils (copy)
	return CreateBuildModelSelectionStoreModule(if game.GameId > 0 then DataHydrationUtils.getLocalPlayerUserId() else nil)
end)