local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local createSearchQueryStoreModule = require(buildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)

return function(p0)
	-- upvalues: reactModule (ref), createSearchQueryStoreModule (ref)
	local var3 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), createSearchQueryStoreModule (copy)
		return p0 or createSearchQueryStoreModule()
	end, { p0 })
	local var4 = var3.useDraftQuery()
	local var5 = var3.useDebouncedQuery()
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var3 (ref)
		return function()
			-- upvalues: p0 (copy), var3 (copy)
			if p0 == nil then
				var3.destroy()
			end
		end
	end, { var3, p0 })
	
	return {
		clear = var3.clear,
		debouncedQuery = var5,
		query = var4,
		setQuery = var3.setQuery
	}
end