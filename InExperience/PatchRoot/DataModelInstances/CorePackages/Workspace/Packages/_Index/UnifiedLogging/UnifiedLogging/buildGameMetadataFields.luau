local unifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local gameEntryUtilsModule = require(unifiedLogging.gameEntryUtils)
local flaggedMutedError = require(unifiedLogging.Parent.Loggers).flaggedMutedError

return function(p0, p1, p2) --[[ line: 8 ]]
	-- upvalues: gameEntryUtilsModule (ref), flaggedMutedError (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p0 do
		local var4 = p1[v]
		
		if var4 == nil then
			flaggedMutedError("BuildGameMetadataFields", `Entry at index {v} was nil when building game metadata fields for collection {p2}`)
		else
			local var5 = gameEntryUtilsModule.extractFieldsFromGameEntry(var4)
			table.insert(t, var5.universeId or "")
			table.insert(t_1, var5.placeId or "")
		end
	end
	return {
		universeId_arr = table.concat(t, ","),
		placeId_arr = table.concat(t_1, ",")
	}
end