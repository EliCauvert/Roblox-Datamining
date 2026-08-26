local collectionViews = script:FindFirstAncestor("CollectionViews")
local reactModule = require(collectionViews.Parent.React)
local collectionItemSize = require(collectionViews.CollectionViewTypes).CollectionItemSize
local useCollectionLayoutParamsComputedModule = require(collectionViews.useCollectionLayoutParamsComputed)

return function(p1, p2)
	-- upvalues: useCollectionLayoutParamsComputedModule (ref), reactModule (ref), collectionItemSize (ref)
	local var1 = useCollectionLayoutParamsComputedModule(p1, p2)
	
	return reactModule.useMemo(function()
		-- upvalues: collectionItemSize (copy), var1 (ref)
		local t = {}
		
		for i, v in collectionItemSize do
			t[v] = var1(v)
		end
		return t
	end, { var1 })
end