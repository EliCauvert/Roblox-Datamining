local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useSduiContextModule = require(serverDrivenUi.System.useSduiContext)
local getSduiFeedStoreModule = require(serverDrivenUi.DataStore.getSduiFeedStore)
local processCollectionConfigModule = require(serverDrivenUi.System.processCollectionConfig)
local getItemCollectionKeyModule = require(serverDrivenUi.DataStore.getItemCollectionKey)
local _ = require(parent.SduiCoreSystem)
local fFlagSduiGetItemCollectionKeys = require(serverDrivenUi.Flags).FFlagSduiGetItemCollectionKeys

return function(value, p1, p2)
	-- upvalues: reactModule (ref), getSduiFeedStoreModule (ref), fFlagSduiGetItemCollectionKeys (ref), signalsReactModule (ref), useSduiContextModule (ref), getItemCollectionKeyModule (ref), processCollectionConfigModule (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p2 (ref), getSduiFeedStoreModule (copy), value (ref), fFlagSduiGetItemCollectionKeys (copy)
		return function(p3)
			-- upvalues: p2 (copy), getSduiFeedStoreModule (copy), value (copy), fFlagSduiGetItemCollectionKeys (copy)
			if not p2 then
				return {}
			end
			local var2 = getSduiFeedStoreModule(value)
			local templates = var2.getTemplates(p3)
			local dataUpdatedTimestamp = var2.getDataUpdatedTimestamp(p3)
			local t = {}
			
			for i, v in if fFlagSduiGetItemCollectionKeys and var2.getItemCollectionKeys then var2.getItemCollectionKeys(p3) else {} do
				local itemCollection = var2.getItemCollection(v)
				
				if itemCollection then
					t[v] = itemCollection(p3)
				end
			end
			return {
				templates = templates,
				dataUpdatedTimestamp = dataUpdatedTimestamp,
				unprocessedItemCollections = t
			}
		end
	end, { value, p2 }))
	local var3 = useSduiContextModule({
		appPage = p1,
		templates = var1.templates,
		dataUpdatedTimestamp = var1.dataUpdatedTimestamp
	})
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), getSduiFeedStoreModule (copy), p1 (ref), var1 (ref), getItemCollectionKeyModule (copy), processCollectionConfigModule (copy), var3 (ref)
		if not p2 then return end
		local var4 = getSduiFeedStoreModule(p1)
		local t = {}
		
		if var1.unprocessedItemCollections then
			for i, v in var1.unprocessedItemCollections do
				t[getItemCollectionKeyModule(v.topicId, v.sortIndex)] = {
					sduiConfig = processCollectionConfigModule(v.componentConfig, v.topicId, var3),
					dataUpdatedTimestamp = var1.dataUpdatedTimestamp
				}
			end
			var4.updateData({
				templates = var1.templates,
				itemCollections = t,
				dataUpdatedTimestamp = var1.dataUpdatedTimestamp
			})
		end
	end, {
		var3, var1.unprocessedItemCollections, var1.templates,
		var1.dataUpdatedTimestamp, p1, p2
	})
	
	return var3
end