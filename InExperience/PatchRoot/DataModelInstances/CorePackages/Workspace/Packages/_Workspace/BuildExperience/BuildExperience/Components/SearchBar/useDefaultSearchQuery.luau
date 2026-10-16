local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local CreateSearchQueryStoreModule = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)

return function(p1) --[[ Line: 17 | Named "useDefaultSearchQuery" ]]
	-- upvalues: ReactModule (copy), CreateSearchQueryStoreModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 18 ]]
		-- upvalues: p1 (copy), CreateSearchQueryStoreModule (upval)
		return p1 or CreateSearchQueryStoreModule()
	end, { p1 })
	local UseDraftQueryResult = UseMemoResult.useDraftQuery()
	local UseDebouncedQueryResult = UseMemoResult.useDebouncedQuery()
	ReactModule.useEffect(function() --[[ Line: 24 ]]
		-- upvalues: p1 (copy), UseMemoResult (copy)
		return function() --[[ Line: 25 ]]
			-- upvalues: p1 (upval), UseMemoResult (upval)
			if p1 == nil then
				UseMemoResult.destroy()
			end
		end
	end, { UseMemoResult, p1 })
	
	return {
		clear = UseMemoResult.clear,
		debouncedQuery = UseDebouncedQueryResult,
		query = UseDraftQueryResult,
		setQuery = UseMemoResult.setQuery
	}
end