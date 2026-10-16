local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local SignalsModule = require(Parent.Signals)
local CollectionViewsModule = require(Parent.CollectionViews)
local DisplayModule = require(Parent.Display)
local MeasureHomeCollectionLayoutModule = require(Home.measureHomeCollectionLayout)
local WriteHomePageSduiCollectionLayoutModule = require(Home.writeHomePageSduiCollectionLayout)

return function() --[[ Line: 16 | Named "startHomeCollectionLayoutSync" ]]
	-- upvalues: CollectionViewsModule (copy), DisplayModule (copy), SignalsModule (copy), MeasureHomeCollectionLayoutModule (copy), WriteHomePageSduiCollectionLayoutModule (copy)
	local MainCollectionLayoutStore = CollectionViewsModule.getMainCollectionLayoutStore(false)
	local DisplayStore = DisplayModule.GetDisplayStore(false)
	local Computed = SignalsModule.createComputed(function(p1) --[[ Line: 22 ]]
		-- upvalues: MainCollectionLayoutStore (copy), DisplayStore (copy), MeasureHomeCollectionLayoutModule (upval)
		MainCollectionLayoutStore.getContainerWidth(p1)
		MainCollectionLayoutStore.getIsContainerMeasured(p1)
		DisplayStore.getViewportSize(p1)
		DisplayStore.getTopBarHeight(p1)
		local MeasureHomeCollectionLayoutModuleResult = MeasureHomeCollectionLayoutModule()
		
		return if MeasureHomeCollectionLayoutModuleResult then MeasureHomeCollectionLayoutModuleResult.rows_above_fold else nil
	end)
	local Flag = false
	
	return SignalsModule.createEffect(function(p1) --[[ Line: 32 ]]
		-- upvalues: Computed (copy), MainCollectionLayoutStore (copy), Flag (ref), MeasureHomeCollectionLayoutModule (upval), WriteHomePageSduiCollectionLayoutModule (upval)
		local ComputedResult = Computed(p1)
		MainCollectionLayoutStore.getNumItemsForAllCategories(p1)
		
		if ComputedResult ~= nil and not Flag then
			Flag = true
			task.delay(1, function() --[[ Line: 41 ]]
				-- upvalues: Flag (upval), MeasureHomeCollectionLayoutModule (upval), WriteHomePageSduiCollectionLayoutModule (upval)
				Flag = false
				local MeasureHomeCollectionLayoutModuleResult = MeasureHomeCollectionLayoutModule()
				
				if MeasureHomeCollectionLayoutModuleResult then
					WriteHomePageSduiCollectionLayoutModule(MeasureHomeCollectionLayoutModuleResult)
				end
			end)
			
			return
		end
	end)
end