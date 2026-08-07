local collectionViews = script:FindFirstAncestor("CollectionViews")
local reactModule = require(collectionViews.Parent.React)
local collectionItemSize = require(collectionViews.CollectionViewTypes).CollectionItemSize
local useCollectionLayoutParamsComputedModule = require(collectionViews.useCollectionLayoutParamsComputed)

return function(p0, p1) --[[ line: 15 | named "useCollectionLayoutConfig" ]]
	-- upvalues: useCollectionLayoutParamsComputedModule (ref), reactModule (ref), collectionItemSize (ref)
	local var3 = useCollectionLayoutParamsComputedModule(p0, p1)
	
	return reactModule.useMemo(function() --[[ line: 21 ]]
		-- upvalues: collectionItemSize (copy), var3 (ref)
		local t = {}
		
		for i, v in collectionItemSize do
			t[v] = var3(v)
		end
		return t
	end, { var3 })
end