local GetProfileInsightsByUserIdFromDataModule = require(script.Parent.getProfileInsightsByUserIdFromData)

return function(p1, p2) --[[ Line: 3 ]]
	-- upvalues: GetProfileInsightsByUserIdFromDataModule (copy)
	local ProfileInsightsByUserIdFromDataModule = GetProfileInsightsByUserIdFromDataModule(p1, p2)
	
	return ProfileInsightsByUserIdFromDataModule and ProfileInsightsByUserIdFromDataModule.isOfflineFrequents or false
end