local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local createSearchQueryStoreModule = require(buildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)

return function(p1)
	-- upvalues: reactModule (ref), createSearchQueryStoreModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), createSearchQueryStoreModule (copy)
		return p1 or createSearchQueryStoreModule()
	end, { p1 })
	local var2 = var1.useDraftQuery()
	local var3 = var1.useDebouncedQuery()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		return function()
			-- upvalues: p1 (copy), var1 (copy)
			if p1 == nil then
				var1.destroy()
			end
		end
	end, { var1, p1 })
	
	return {
		clear = var1.clear,
		debouncedQuery = var3,
		query = var2,
		setQuery = var1.setQuery
	}
end