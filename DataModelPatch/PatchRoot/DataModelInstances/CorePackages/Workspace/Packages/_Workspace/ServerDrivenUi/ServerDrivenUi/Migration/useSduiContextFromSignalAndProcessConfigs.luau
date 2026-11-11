local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseSduiContextModule = require(ServerDrivenUi.System.useSduiContext)
local GetSduiFeedStoreModule = require(ServerDrivenUi.DataStore.getSduiFeedStore)
local ProcessCollectionConfigModule = require(ServerDrivenUi.System.processCollectionConfig)
local GetItemCollectionKeyModule = require(ServerDrivenUi.DataStore.getItemCollectionKey)
local _ = require(Parent.SduiCoreSystem)
local FFlagSduiGetItemCollectionKeys = require(ServerDrivenUi.Flags).FFlagSduiGetItemCollectionKeys

return function(p1, AppPage, p2)
	-- upvalues: ReactModule (copy), GetSduiFeedStoreModule (copy), FFlagSduiGetItemCollectionKeys (copy), SignalsReactModule (copy), UseSduiContextModule (copy), GetItemCollectionKeyModule (copy), ProcessCollectionConfigModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: p2 (copy), GetSduiFeedStoreModule (upval), p1 (copy), FFlagSduiGetItemCollectionKeys (upval)
		return function(p3)
			-- upvalues: p2 (upval), GetSduiFeedStoreModule (upval), p1 (upval), FFlagSduiGetItemCollectionKeys (upval)
			if not p2 then
				return {}
			end
			local SduiFeedStoreModule = GetSduiFeedStoreModule(p1)
			local Templates = SduiFeedStoreModule.getTemplates(p3)
			local DataUpdatedTimestamp = SduiFeedStoreModule.getDataUpdatedTimestamp(p3)
			local UnprocessedItemCollections = {}
			
			for _, value in if FFlagSduiGetItemCollectionKeys and SduiFeedStoreModule.getItemCollectionKeys then SduiFeedStoreModule.getItemCollectionKeys(p3) else {} do
				local ItemCollection = SduiFeedStoreModule.getItemCollection(value)
				
				if ItemCollection then
					UnprocessedItemCollections[value] = ItemCollection(p3)
				end
			end
			return {
				templates = Templates,
				dataUpdatedTimestamp = DataUpdatedTimestamp,
				unprocessedItemCollections = UnprocessedItemCollections
			}
		end
	end, { p1, p2 })))
	local UseSduiContextModuleResult = UseSduiContextModule({
		appPage = AppPage,
		templates = UseSignalStateResult.templates,
		dataUpdatedTimestamp = UseSignalStateResult.dataUpdatedTimestamp
	})
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), GetSduiFeedStoreModule (upval), AppPage (copy), UseSignalStateResult (copy), GetItemCollectionKeyModule (upval), ProcessCollectionConfigModule (upval), UseSduiContextModuleResult (copy)
		if not p2 then return end
		local SduiFeedStoreModule = GetSduiFeedStoreModule(AppPage)
		local ItemCollections = {}
		
		if UseSignalStateResult.unprocessedItemCollections then
			for _, unprocessedItemCollection in UseSignalStateResult.unprocessedItemCollections do
				ItemCollections[GetItemCollectionKeyModule(unprocessedItemCollection.topicId, unprocessedItemCollection.sortIndex)] = {
					sduiConfig = ProcessCollectionConfigModule(unprocessedItemCollection.componentConfig, unprocessedItemCollection.topicId, UseSduiContextModuleResult),
					dataUpdatedTimestamp = UseSignalStateResult.dataUpdatedTimestamp
				}
			end
			SduiFeedStoreModule.updateData({
				templates = UseSignalStateResult.templates,
				itemCollections = ItemCollections,
				dataUpdatedTimestamp = UseSignalStateResult.dataUpdatedTimestamp
			})
		end
	end, {
		UseSduiContextModuleResult, UseSignalStateResult.unprocessedItemCollections,
		UseSignalStateResult.templates, UseSignalStateResult.dataUpdatedTimestamp,
		AppPage, p2
	})
	
	return UseSduiContextModuleResult
end