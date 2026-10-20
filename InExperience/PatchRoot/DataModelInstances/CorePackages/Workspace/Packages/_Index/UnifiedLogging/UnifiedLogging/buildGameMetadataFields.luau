local UnifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local GameEntryUtilsModule = require(UnifiedLogging.gameEntryUtils)
local FlaggedMutedErrorFunction = require(UnifiedLogging.Parent.Loggers).flaggedMutedError

return function(List, p1, p2)
	-- upvalues: GameEntryUtilsModule (copy), FlaggedMutedErrorFunction (copy)
	local List1 = {}
	local List2 = {}
	
	for _, value in List do
		local v1 = p1[value]
		
		if v1 == nil then
			FlaggedMutedErrorFunction("BuildGameMetadataFields", `Entry at index {value} was nil when building game metadata fields for collection {p2}`)
		else
			local ExtractFieldsFromGameEntryResult = GameEntryUtilsModule.extractFieldsFromGameEntry(v1)
			table.insert(List1, ExtractFieldsFromGameEntryResult.universeId or "")
			table.insert(List2, ExtractFieldsFromGameEntryResult.placeId or "")
		end
	end
	return {
		universeId_arr = table.concat(List1, ","),
		placeId_arr = table.concat(List2, ",")
	}
end