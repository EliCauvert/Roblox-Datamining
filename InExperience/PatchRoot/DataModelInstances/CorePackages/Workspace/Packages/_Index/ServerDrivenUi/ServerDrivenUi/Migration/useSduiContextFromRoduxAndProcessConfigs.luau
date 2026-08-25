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

return function(p0, p1, p2)
	-- upvalues: useSelector (ref), sduiConfigReducerModule (ref), tutilsModule (ref), useSduiContextModule (ref), fFlagLuaAppLayoutParamsInContext (ref), fFlagLuaAppUseEffectInSignalPreprocessing (ref), reactModule (ref), getSduiFeedStoreModule (ref), getItemCollectionKeyModule (ref), processCollectionConfigModule (ref)
	p2 = p2 or p0
	local var9 = useSelector(function(p3)
		-- upvalues: sduiConfigReducerModule (copy), p2 (ref)
		local t = {}
		local var12 = p3.Personalization[sduiConfigReducerModule.key][p2]
		
		if var12 then
			t.templates = if var12.rootConfig then var12.rootConfig.templates else nil
			t.dataUpdatedTimestamp = var12.dataUpdatedTimestamp
			t.itemCollections = var12.itemCollections
		end
		return t
	end, tutilsModule.shallowEqual)
	local var10 = useSduiContextModule({
		appPage = p0,
		templates = var9.templates,
		dataUpdatedTimestamp = var9.dataUpdatedTimestamp,
		pageLayoutConfig = if fFlagLuaAppLayoutParamsInContext then p1 else nil
	});
	(if fFlagLuaAppUseEffectInSignalPreprocessing then reactModule.useEffect else reactModule.useLayoutEffect)(function()
		-- upvalues: getSduiFeedStoreModule (copy), p2 (ref), var9 (ref), getItemCollectionKeyModule (copy), processCollectionConfigModule (copy), var10 (ref)
		local var13 = getSduiFeedStoreModule(p2)
		local t = {}
		
		if var9.itemCollections then
			for i, v in var9.itemCollections do
				t[getItemCollectionKeyModule(v.topicId, v.sortIndex)] = {
					sduiConfig = processCollectionConfigModule(v.sduiConfig, v.topicId, var10),
					dataUpdatedTimestamp = v.dataUpdatedTimestamp
				}
			end
			var13.updateData({
				templates = var9.templates,
				itemCollections = t,
				dataUpdatedTimestamp = var9.dataUpdatedTimestamp
			})
		end
		return function() end
	end, {
		var10,
		var9.itemCollections,
		var9.templates,
		var9.dataUpdatedTimestamp,
		p2
	})
	
	return var10
end