local getProfileInsightsByUserIdFromDataModule = require(script.Parent.getProfileInsightsByUserIdFromData)

return function(p1, p2)
	-- upvalues: getProfileInsightsByUserIdFromDataModule (ref)
	local var1 = getProfileInsightsByUserIdFromDataModule(p1, p2)
	
	return if var1 then var1.isOfflineFrequents or false else false
end