local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(collectionViews.CollectionViewTypes)
local collectionLayoutStoreContextModule = require(script.Parent.CollectionLayoutStoreContext)
local createCollectionLayoutStoreModule = require(script.Parent.createCollectionLayoutStore)
local getMainCollectionLayoutStoreModule = require(script.Parent.getMainCollectionLayoutStore)

return function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), createCollectionLayoutStoreModule (ref), getMainCollectionLayoutStoreModule (ref), collectionLayoutStoreContextModule (ref)
	local var1, var2 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(0)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		local container = p1.container
		
		if container then
			var2(container.AbsoluteSize.X)
			local var3 = container:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var2 (copy), container (ref)
				var2(container.AbsoluteSize.X)
			end)
			
			return function()
				-- upvalues: var3 (ref)
				var3:Disconnect()
			end
		end
	end, { p1.container })
	
	return reactModule.createElement(collectionLayoutStoreContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: createCollectionLayoutStoreModule (copy), var1 (ref), getMainCollectionLayoutStoreModule (copy)
			return createCollectionLayoutStoreModule(var1, getMainCollectionLayoutStoreModule(false))
		end, { var1 })
	}, p1.children)
end