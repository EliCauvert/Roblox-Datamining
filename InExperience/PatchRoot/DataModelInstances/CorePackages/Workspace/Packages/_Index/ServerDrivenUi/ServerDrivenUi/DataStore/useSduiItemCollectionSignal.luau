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

return function(value, p0, p1, p2)
	-- upvalues: getItemCollectionKeyModule (ref), fFlagLuaAppFixInlineSignalsReactPattern (ref), reactModule (ref), getSduiFeedStoreModule (ref), signalsReactModule (ref)
	local var5 = getItemCollectionKeyModule(p0, p1)
	p2 = p2 or value
	local _ = nil
	
	return if fFlagLuaAppFixInlineSignalsReactPattern then signalsReactModule.useSignalState(reactModule.useCallback(function(p4)
		-- upvalues: getSduiFeedStoreModule (copy), p2 (ref), var5 (ref)
		return getSduiFeedStoreModule(p2).getItemCollection(var5, true)(p4)
	end, { var5, p2 })) else signalsReactModule.useSignalState(function(p3)
		-- upvalues: getSduiFeedStoreModule (copy), p2 (ref), var5 (ref)
		return getSduiFeedStoreModule(p2).getItemCollection(var5, true)(p3)
	end)
end