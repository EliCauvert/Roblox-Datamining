local getProfileInsightsByUserIdFromDataModule = require(script.Parent.getProfileInsightsByUserIdFromData)

return function(p0, p1) --[[ line: 3 ]]
	-- upvalues: getProfileInsightsByUserIdFromDataModule (ref)
	local var1 = getProfileInsightsByUserIdFromDataModule(p0, p1)
	
	return if var1 then var1.isOfflineFrequents or false else false
end