local unifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local gameEntryUtilsModule = require(unifiedLogging.gameEntryUtils)
local flaggedMutedError = require(unifiedLogging.Parent.Loggers).flaggedMutedError

return function(p1, p2, p3)
	-- upvalues: gameEntryUtilsModule (ref), flaggedMutedError (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		local var1 = p2[v]
		
		if var1 == nil then
			flaggedMutedError("BuildGameMetadataFields", `Entry at index {v} was nil when building game metadata fields for collection {p3}`)
		else
			local var2 = gameEntryUtilsModule.extractFieldsFromGameEntry(var1)
			table.insert(t, var2.universeId or "")
			table.insert(t_1, var2.placeId or "")
		end
	end
	return {
		universeId_arr = table.concat(t, ","),
		placeId_arr = table.concat(t_1, ",")
	}
end