local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local _ = require(parent.RobloxAppEnums)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local reactModule = require(parent.React)
local getSduiFeedStoreModule = require(serverDrivenUi.DataStore.getSduiFeedStore)
local getItemCollectionKeyModule = require(serverDrivenUi.DataStore.getItemCollectionKey)
local _ = require(serverDrivenUi.DataStore.SduiFeedStoreTypes)
local fFlagLuaAppFixInlineSignalsReactPattern = require(parent.SharedFlags).FFlagLuaAppFixInlineSignalsReactPattern

return function(value, p1, p2, p3)
	-- upvalues: getItemCollectionKeyModule (ref), fFlagLuaAppFixInlineSignalsReactPattern (ref), reactModule (ref), getSduiFeedStoreModule (ref), signalsReactModule (ref)
	local var1 = getItemCollectionKeyModule(p1, p2)
	p3 = p3 or value
	local _ = nil
	
	return if fFlagLuaAppFixInlineSignalsReactPattern then signalsReactModule.useSignalState(reactModule.useCallback(function(p4)
		-- upvalues: getSduiFeedStoreModule (copy), p3 (ref), var1 (ref)
		return getSduiFeedStoreModule(p3).getItemCollection(var1, true)(p4)
	end, { var1, p3 })) else signalsReactModule.useSignalState(function(p4)
		-- upvalues: getSduiFeedStoreModule (copy), p3 (ref), var1 (ref)
		return getSduiFeedStoreModule(p3).getItemCollection(var1, true)(p4)
	end)
end