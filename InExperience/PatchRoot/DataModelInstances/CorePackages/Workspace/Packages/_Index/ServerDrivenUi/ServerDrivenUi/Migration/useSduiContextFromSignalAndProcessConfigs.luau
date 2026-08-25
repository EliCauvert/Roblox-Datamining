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

return function(value, p0, p1)
	-- upvalues: reactModule (ref), getSduiFeedStoreModule (ref), fFlagSduiGetItemCollectionKeys (ref), signalsReactModule (ref), useSduiContextModule (ref), getItemCollectionKeyModule (ref), processCollectionConfigModule (ref)
	local var7 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p1 (ref), getSduiFeedStoreModule (copy), value (ref), fFlagSduiGetItemCollectionKeys (copy)
		return function(p2)
			-- upvalues: p1 (copy), getSduiFeedStoreModule (copy), value (copy), fFlagSduiGetItemCollectionKeys (copy)
			if not p1 then
				return {}
			end
			local var9 = getSduiFeedStoreModule(value)
			local templates = var9.getTemplates(p2)
			local dataUpdatedTimestamp = var9.getDataUpdatedTimestamp(p2)
			local t = {}
			
			for i, v in if fFlagSduiGetItemCollectionKeys and var9.getItemCollectionKeys then var9.getItemCollectionKeys(p2) else {} do
				local itemCollection = var9.getItemCollection(v)
				
				if itemCollection then
					t[v] = itemCollection(p2)
				end
			end
			return {
				templates = templates,
				dataUpdatedTimestamp = dataUpdatedTimestamp,
				unprocessedItemCollections = t
			}
		end
	end, { value, p1 }))
	local var8 = useSduiContextModule({
		appPage = p0,
		templates = var7.templates,
		dataUpdatedTimestamp = var7.dataUpdatedTimestamp
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), getSduiFeedStoreModule (copy), p0 (ref), var7 (ref), getItemCollectionKeyModule (copy), processCollectionConfigModule (copy), var8 (ref)
		if not p1 then return end
		local var14 = getSduiFeedStoreModule(p0)
		local t = {}
		
		if var7.unprocessedItemCollections then
			for i, v in var7.unprocessedItemCollections do
				t[getItemCollectionKeyModule(v.topicId, v.sortIndex)] = {
					sduiConfig = processCollectionConfigModule(v.componentConfig, v.topicId, var8),
					dataUpdatedTimestamp = var7.dataUpdatedTimestamp
				}
			end
			var14.updateData({
				templates = var7.templates,
				itemCollections = t,
				dataUpdatedTimestamp = var7.dataUpdatedTimestamp
			})
		end
	end, {
		var8, var7.unprocessedItemCollections, var7.templates,
		var7.dataUpdatedTimestamp, p0, p1
	})
	
	return var8
end