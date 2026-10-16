local CollectionViews = script:FindFirstAncestor("CollectionViews")
local ReactModule = require(CollectionViews.Parent.React)
local CollectionItemSize = require(CollectionViews.CollectionViewTypes).CollectionItemSize
local UseCollectionLayoutParamsComputedModule = require(CollectionViews.useCollectionLayoutParamsComputed)

return function(p1, p2) --[[ Line: 15 | Named "useCollectionLayoutConfig" ]]
	-- upvalues: UseCollectionLayoutParamsComputedModule (copy), ReactModule (copy), CollectionItemSize (copy)
	local UseCollectionLayoutParamsComputedModuleResult = UseCollectionLayoutParamsComputedModule(p1, p2)
	
	return (ReactModule.useMemo(function() --[[ Line: 21 ]]
		-- upvalues: CollectionItemSize (upval), UseCollectionLayoutParamsComputedModuleResult (copy)
		local t = {}
		
		for _, value in CollectionItemSize do
			t[value] = UseCollectionLayoutParamsComputedModuleResult(value)
		end
		return t
	end, { UseCollectionLayoutParamsComputedModuleResult }))
end