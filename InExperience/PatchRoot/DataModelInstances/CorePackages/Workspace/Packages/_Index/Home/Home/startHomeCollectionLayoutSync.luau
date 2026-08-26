local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local signalsModule = require(parent.Signals)
local collectionViewsModule = require(parent.CollectionViews)
local displayModule = require(parent.Display)
local measureHomeCollectionLayoutModule = require(home.measureHomeCollectionLayout)
local writeHomePageSduiCollectionLayoutModule = require(home.writeHomePageSduiCollectionLayout)

return function()
	-- upvalues: collectionViewsModule (ref), displayModule (ref), signalsModule (ref), measureHomeCollectionLayoutModule (ref), writeHomePageSduiCollectionLayoutModule (ref)
	local mainCollectionLayoutStore = collectionViewsModule.getMainCollectionLayoutStore(false)
	local displayStore = displayModule.GetDisplayStore(false)
	local var1 = signalsModule.createComputed(function(p1)
		-- upvalues: mainCollectionLayoutStore (ref), displayStore (ref), measureHomeCollectionLayoutModule (copy)
		mainCollectionLayoutStore.getContainerWidth(p1)
		mainCollectionLayoutStore.getIsContainerMeasured(p1)
		displayStore.getViewportSize(p1)
		displayStore.getTopBarHeight(p1)
		local var2 = measureHomeCollectionLayoutModule()
		
		return if var2 then var2.rows_above_fold else nil
	end)
	local var2 = false
	
	return signalsModule.createEffect(function(p1)
		-- upvalues: var1 (ref), mainCollectionLayoutStore (ref), var2 (write), measureHomeCollectionLayoutModule (copy), writeHomePageSduiCollectionLayoutModule (copy)
		local var3 = var1(p1)
		mainCollectionLayoutStore.getNumItemsForAllCategories(p1)
		
		if var3 == nil or var2 then
			return
		end
		var2 = true
		task.delay(1, function()
			-- upvalues: var2 (copy), measureHomeCollectionLayoutModule (copy), writeHomePageSduiCollectionLayoutModule (copy)
			var2 = false
			local var4 = measureHomeCollectionLayoutModule()
			
			if var4 then
				writeHomePageSduiCollectionLayoutModule(var4)
			end
		end)
	end)
end