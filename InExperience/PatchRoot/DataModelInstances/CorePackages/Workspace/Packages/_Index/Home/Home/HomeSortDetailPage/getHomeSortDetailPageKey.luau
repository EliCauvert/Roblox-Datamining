local homeSortDetailConstantsModule = require(script:FindFirstAncestor("Home").HomeSortDetailPage.HomeSortDetailConstants)

return function(p1, p2)
	-- upvalues: homeSortDetailConstantsModule (ref)
	local var1 = if p1 == nil or p1 == "" then "Unknown" else p1
	
	return if p2 == nil then `{homeSortDetailConstantsModule.ConfigKeyPrefix}-{var1}` else `{homeSortDetailConstantsModule.ConfigKeyPrefix}-{var1}-{p2}`
end