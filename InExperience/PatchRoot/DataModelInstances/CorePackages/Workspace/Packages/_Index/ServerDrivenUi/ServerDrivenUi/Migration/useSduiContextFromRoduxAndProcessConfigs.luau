local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local tutilsModule = require(parent.tutils)
local _ = require(parent.CollectionViews)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local sduiConfigReducerModule = require(serverDrivenUi.Rodux.SduiConfigReducer)
local useSduiContextModule = require(serverDrivenUi.System.useSduiContext)
local getSduiFeedStoreModule = require(serverDrivenUi.DataStore.getSduiFeedStore)
local processCollectionConfigModule = require(serverDrivenUi.System.processCollectionConfig)
local getItemCollectionKeyModule = require(serverDrivenUi.DataStore.getItemCollectionKey)
local _ = require(parent.SduiCoreSystem)
local fFlagLuaAppLayoutParamsInContext = require(parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local fFlagLuaAppUseEffectInSignalPreprocessing = require(parent.SharedFlags).FFlagLuaAppUseEffectInSignalPreprocessing

return function(p1, p2, p3)
	-- upvalues: useSelector (ref), sduiConfigReducerModule (ref), tutilsModule (ref), useSduiContextModule (ref), fFlagLuaAppLayoutParamsInContext (ref), fFlagLuaAppUseEffectInSignalPreprocessing (ref), reactModule (ref), getSduiFeedStoreModule (ref), getItemCollectionKeyModule (ref), processCollectionConfigModule (ref)
	p3 = p3 or p1
	local var1 = useSelector(function(p4)
		-- upvalues: sduiConfigReducerModule (copy), p3 (ref)
		local t = {}
		local var2 = p4.Personalization[sduiConfigReducerModule.key][p3]
		
		if var2 then
			t.templates = if var2.rootConfig then var2.rootConfig.templates else nil
			t.dataUpdatedTimestamp = var2.dataUpdatedTimestamp
			t.itemCollections = var2.itemCollections
		end
		return t
	end, tutilsModule.shallowEqual)
	local var2 = useSduiContextModule({
		appPage = p1,
		templates = var1.templates,
		dataUpdatedTimestamp = var1.dataUpdatedTimestamp,
		pageLayoutConfig = if fFlagLuaAppLayoutParamsInContext then p2 else nil
	});
	(if fFlagLuaAppUseEffectInSignalPreprocessing then reactModule.useEffect else reactModule.useLayoutEffect)(function()
		-- upvalues: getSduiFeedStoreModule (copy), p3 (ref), var1 (ref), getItemCollectionKeyModule (copy), processCollectionConfigModule (copy), var2 (ref)
		local var3 = getSduiFeedStoreModule(p3)
		local t = {}
		
		if var1.itemCollections then
			for i, v in var1.itemCollections do
				t[getItemCollectionKeyModule(v.topicId, v.sortIndex)] = {
					sduiConfig = processCollectionConfigModule(v.sduiConfig, v.topicId, var2),
					dataUpdatedTimestamp = v.dataUpdatedTimestamp
				}
			end
			var3.updateData({
				templates = var1.templates,
				itemCollections = t,
				dataUpdatedTimestamp = var1.dataUpdatedTimestamp
			})
		end
		return function() end
	end, {
		var2,
		var1.itemCollections,
		var1.templates,
		var1.dataUpdatedTimestamp,
		p3
	})
	
	return var2
end