local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)

return function(p1, p2)
	-- upvalues: ReactModule (copy)
	local UseDebouncedQueryResult = p1.useDebouncedQuery()
	local UseRefResult = ReactModule.useRef("")
	
	if p2 then
		UseRefResult.current = UseDebouncedQueryResult
	end
	return UseRefResult.current
end