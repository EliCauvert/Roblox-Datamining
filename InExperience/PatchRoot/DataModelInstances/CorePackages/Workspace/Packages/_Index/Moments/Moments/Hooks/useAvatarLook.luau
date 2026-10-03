local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local momentsGetOutfitLookStoreModule = require(parent.DataHydration.MomentsGetOutfitLookStore)
local useSignalState = require(parent.SignalsReact).useSignalState
local createComputed = signalsModule.createComputed
local t = {
	data = createComputed(function()
		return nil
	end),
	status = createComputed(function()
		return "NotReady"
	end)
}

return function(p1)
	-- upvalues: momentsGetOutfitLookStoreModule (ref), t (ref), useSignalState (ref)
	local var1 = p1 ~= nil and p1 > 0
	local var2 = if var1 then momentsGetOutfitLookStoreModule(false).getAndFetchLookByOutfit(p1) else t
	local var3 = useSignalState(var2.data)
	local var4 = useSignalState(var2.status)
	local var5 = if var3 ~= nil then nil else var3.look
	local _ = nil
	local var6 = if var1 and var4 ~= "Failed" and (var4 ~= "Ready" or var5 ~= nil) then if var5 ~= nil then "Loading" else "Ready" else "Unavailable"
	
	return {
		status = var6,
		look = if var6 == "Ready" then var5 else nil
	}
end