local HomeSortDetailConstantsModule = require(script:FindFirstAncestor("Home").HomeSortDetailPage.HomeSortDetailConstants)

return function(p1, p2): string --[[ Line: 5 | Named "getHomeSortDetailPageKey" ]]
	-- upvalues: HomeSortDetailConstantsModule (copy)
	local Unknown = if p1 == nil or p1 == "" then "Unknown" else p1
	
	return if p2 == nil then `{HomeSortDetailConstantsModule.ConfigKeyPrefix}-{Unknown}` else `{HomeSortDetailConstantsModule.ConfigKeyPrefix}-{Unknown}-{p2}`
end