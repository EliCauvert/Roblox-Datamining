local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(CollectionViews.CollectionViewTypes)
local CollectionLayoutStoreContextModule = require(script.Parent.CollectionLayoutStoreContext)
local CreateCollectionLayoutStoreModule = require(script.Parent.createCollectionLayoutStore)
local GetMainCollectionLayoutStoreModule = require(script.Parent.getMainCollectionLayoutStore)

return function(p1) --[[ Line: 22 | Named "CollectionLayoutStoreProvider" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), CreateCollectionLayoutStoreModule (copy), GetMainCollectionLayoutStoreModule (copy), CollectionLayoutStoreContextModule (copy)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 23 ]]
		-- upvalues: SignalsModule (upval)
		return SignalsModule.createSignal(0)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 27 ]]
		-- upvalues: p1 (copy), UseMemoResult2 (copy)
		local Container = p1.container
		
		if not Container then return end
		UseMemoResult2(Container.AbsoluteSize.X)
		local Connection = Container:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 33 ]]
			-- upvalues: UseMemoResult2 (upval), Container (copy)
			UseMemoResult2(Container.AbsoluteSize.X)
		end)
		
		return function() --[[ Line: 36 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { p1.container })
	
	return ReactModule.createElement(CollectionLayoutStoreContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 41 ]]
			-- upvalues: CreateCollectionLayoutStoreModule (upval), UseMemoResult (copy), GetMainCollectionLayoutStoreModule (upval)
			return CreateCollectionLayoutStoreModule(UseMemoResult, GetMainCollectionLayoutStoreModule(false))
		end, { UseMemoResult })
	}, p1.children)
end