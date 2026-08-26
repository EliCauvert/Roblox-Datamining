local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local signalsModule = require(parent.Signals)
local gameGetGameInfoStoreModule = require(parent.DataHydration.GameGetGameInfoStore)
local useSignalState = require(parent.SignalsReact).useSignalState
local var1 = signalsModule.createComputed(function()
	return nil
end)

return function(p1)
	-- upvalues: gameGetGameInfoStoreModule (ref), var1 (ref), useSignalState (ref)
	local var2 = if p1 == nil or p1 == 0 then nil else tostring(p1)
	local var3 = useSignalState(if var2 ~= nil then var1 else gameGetGameInfoStoreModule(false).getAndFetchGameInfo(var2).data)
	
	return if var3 == nil then nil else var3.name
end