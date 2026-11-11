local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local TutilsModule = require(Parent.tutils)
local _ = require(Parent.CollectionViews)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SduiConfigReducerModule = require(ServerDrivenUi.Rodux.SduiConfigReducer)
local UseSduiContextModule = require(ServerDrivenUi.System.useSduiContext)
local GetSduiFeedStoreModule = require(ServerDrivenUi.DataStore.getSduiFeedStore)
local ProcessCollectionConfigModule = require(ServerDrivenUi.System.processCollectionConfig)
local GetItemCollectionKeyModule = require(ServerDrivenUi.DataStore.getItemCollectionKey)
local _ = require(Parent.SduiCoreSystem)
local FFlagLuaAppLayoutParamsInContext = require(Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppUseEffectInSignalPreprocessing = require(Parent.SharedFlags).FFlagLuaAppUseEffectInSignalPreprocessing

return function(AppPage, p1, p2)
	-- upvalues: UseSelectorFunction (copy), SduiConfigReducerModule (copy), TutilsModule (copy), UseSduiContextModule (copy), FFlagLuaAppLayoutParamsInContext (copy), FFlagLuaAppUseEffectInSignalPreprocessing (copy), ReactModule (copy), GetSduiFeedStoreModule (copy), GetItemCollectionKeyModule (copy), ProcessCollectionConfigModule (copy)
	local P2 = p2 or AppPage
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: SduiConfigReducerModule (upval), P2 (copy)
		local t = {}
		local PersonalizationEntry = p3.Personalization[SduiConfigReducerModule.key][P2]
		
		if PersonalizationEntry then
			t.templates = PersonalizationEntry.rootConfig and PersonalizationEntry.rootConfig.templates or nil
			t.dataUpdatedTimestamp = PersonalizationEntry.dataUpdatedTimestamp
			t.itemCollections = PersonalizationEntry.itemCollections
		end
		return t
	end, TutilsModule.shallowEqual)
	local UseSduiContextModuleResult = UseSduiContextModule({
		appPage = AppPage,
		templates = UseSelectorResult.templates,
		dataUpdatedTimestamp = UseSelectorResult.dataUpdatedTimestamp,
		pageLayoutConfig = if FFlagLuaAppLayoutParamsInContext then p1 else nil
	});
	(if FFlagLuaAppUseEffectInSignalPreprocessing then ReactModule.useEffect else ReactModule.useLayoutEffect)(function()
		-- upvalues: GetSduiFeedStoreModule (upval), P2 (copy), UseSelectorResult (copy), GetItemCollectionKeyModule (upval), ProcessCollectionConfigModule (upval), UseSduiContextModuleResult (copy)
		local SduiFeedStoreModule = GetSduiFeedStoreModule(P2)
		local ItemCollections = {}
		
		if UseSelectorResult.itemCollections then
			for _, itemCollection in UseSelectorResult.itemCollections do
				ItemCollections[GetItemCollectionKeyModule(itemCollection.topicId, itemCollection.sortIndex)] = {
					sduiConfig = ProcessCollectionConfigModule(itemCollection.sduiConfig, itemCollection.topicId, UseSduiContextModuleResult),
					dataUpdatedTimestamp = itemCollection.dataUpdatedTimestamp
				}
			end
			SduiFeedStoreModule.updateData({
				templates = UseSelectorResult.templates,
				itemCollections = ItemCollections,
				dataUpdatedTimestamp = UseSelectorResult.dataUpdatedTimestamp
			})
		end
		return function() end
	end, {
		UseSduiContextModuleResult,
		UseSelectorResult.itemCollections,
		UseSelectorResult.templates,
		UseSelectorResult.dataUpdatedTimestamp,
		P2
	})
	
	return UseSduiContextModuleResult
end