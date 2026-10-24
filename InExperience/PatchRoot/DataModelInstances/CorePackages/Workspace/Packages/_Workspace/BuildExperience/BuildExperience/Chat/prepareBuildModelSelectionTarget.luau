local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Chat.chatTypes)
local GetBuildModelSelectionStoreModule = require(BuildExperience.Stores.GetBuildModelSelectionStore)

return function(Tbl)
	-- upvalues: GetBuildModelSelectionStoreModule (copy)
	if Tbl.isNewGameTarget ~= true or Tbl.universeId ~= nil and Tbl.universeId > 0 then
		return Tbl
	end
	local BuildModelSelectionStoreModule = GetBuildModelSelectionStoreModule(false)
	
	if Tbl.modelSelectionDraftId == nil or BuildModelSelectionStoreModule.getDraft(Tbl.modelSelectionDraftId) == nil then
		local Copy = table.clone(Tbl)
		Copy.modelSelectionDraftId = BuildModelSelectionStoreModule.createDraft()
		
		return Copy
	else
		return Tbl
	end
end