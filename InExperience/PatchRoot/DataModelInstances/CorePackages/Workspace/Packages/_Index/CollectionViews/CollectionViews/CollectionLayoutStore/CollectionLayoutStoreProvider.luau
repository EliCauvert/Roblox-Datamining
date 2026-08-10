local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(collectionViews.CollectionViewTypes)
local collectionLayoutStoreContextModule = require(script.Parent.CollectionLayoutStoreContext)
local createCollectionLayoutStoreModule = require(script.Parent.createCollectionLayoutStore)
local getMainCollectionLayoutStoreModule = require(script.Parent.getMainCollectionLayoutStore)

return function(p0) --[[ line: 22 | named "CollectionLayoutStoreProvider" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), createCollectionLayoutStoreModule (ref), getMainCollectionLayoutStoreModule (ref), collectionLayoutStoreContextModule (ref)
	local var6, var7 = reactModule.useMemo(function() --[[ line: 23 ]]
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(0)
	end, {})
	reactModule.useEffect(function() --[[ line: 27 ]]
		-- upvalues: p0 (ref), var7 (ref)
		local container = p0.container
		
		if container then
			var7(container.AbsoluteSize.X)
			local var8 = container:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 33 ]]
				-- upvalues: var7 (copy), container (ref)
				var7(container.AbsoluteSize.X)
			end)
			
			return function() --[[ line: 36 ]]
				-- upvalues: var8 (ref)
				var8:Disconnect()
			end
		end
	end, { p0.container })
	
	return reactModule.createElement(collectionLayoutStoreContextModule.Provider, {
		value = reactModule.useMemo(function() --[[ line: 41 ]]
			-- upvalues: createCollectionLayoutStoreModule (copy), var6 (ref), getMainCollectionLayoutStoreModule (copy)
			return createCollectionLayoutStoreModule(var6, getMainCollectionLayoutStoreModule(false))
		end, { var6 })
	}, p0.children)
end