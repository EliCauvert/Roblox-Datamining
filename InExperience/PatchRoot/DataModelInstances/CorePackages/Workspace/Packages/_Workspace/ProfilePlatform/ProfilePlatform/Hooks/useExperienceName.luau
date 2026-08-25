local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local signalsModule = require(parent.Signals)
local gameGetGameInfoStoreModule = require(parent.DataHydration.GameGetGameInfoStore)
local useSignalState = require(parent.SignalsReact).useSignalState
local var2 = signalsModule.createComputed(function()
	return nil
end)

return function(p0)
	-- upvalues: gameGetGameInfoStoreModule (ref), var2 (ref), useSignalState (ref)
	local var3 = if p0 == nil or p0 == 0 then nil else tostring(p0)
	local var4 = useSignalState(if var3 ~= nil then var2 else gameGetGameInfoStoreModule(false).getAndFetchGameInfo(var3).data)
	
	return if var4 == nil then nil else var4.name
end