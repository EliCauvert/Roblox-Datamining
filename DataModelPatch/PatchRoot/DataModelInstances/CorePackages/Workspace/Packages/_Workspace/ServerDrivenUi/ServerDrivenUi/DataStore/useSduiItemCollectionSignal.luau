local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local _ = require(Parent.RobloxAppEnums)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ReactModule = require(Parent.React)
local GetSduiFeedStoreModule = require(ServerDrivenUi.DataStore.getSduiFeedStore)
local GetItemCollectionKeyModule = require(ServerDrivenUi.DataStore.getItemCollectionKey)
local _ = require(ServerDrivenUi.DataStore.SduiFeedStoreTypes)
local FFlagLuaAppFixInlineSignalsReactPattern = require(Parent.SharedFlags).FFlagLuaAppFixInlineSignalsReactPattern

return function(p1, p2, p3, p4)
	-- upvalues: GetItemCollectionKeyModule (copy), FFlagLuaAppFixInlineSignalsReactPattern (copy), ReactModule (copy), GetSduiFeedStoreModule (copy), SignalsReactModule (copy)
	local ItemCollectionKeyModule = GetItemCollectionKeyModule(p2, p3)
	local P3 = p4 or p1
	
	return if FFlagLuaAppFixInlineSignalsReactPattern then SignalsReactModule.useSignalState((ReactModule.useCallback(function(p5)
		-- upvalues: GetSduiFeedStoreModule (upval), P3 (copy), ItemCollectionKeyModule (copy)
		return GetSduiFeedStoreModule(P3).getItemCollection(ItemCollectionKeyModule, true)(p5)
	end, { ItemCollectionKeyModule, P3 }))) else SignalsReactModule.useSignalState(function(p5)
		-- upvalues: GetSduiFeedStoreModule (upval), P3 (copy), ItemCollectionKeyModule (copy)
		return GetSduiFeedStoreModule(P3).getItemCollection(ItemCollectionKeyModule, true)(p5)
	end)
end