local parent = script:FindFirstAncestor("AppChat").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local gameGetGameInfoStoreModule = require(parent.DataHydration.GameGetGameInfoStore)
local var3 = signalsModule.createComputed(function()
	return nil
end)

return function(p0, p1)
	-- upvalues: gameGetGameInfoStoreModule (ref), var3 (ref), signalsReactModule (ref)
	local var4 = if p0 and p0 ~= 0 then tostring(p0) else nil
	local var5 = signalsReactModule.useSignalState(if p1 and var4 then gameGetGameInfoStoreModule(false).getAndFetchGameInfo(var4).data else var3)
	
	return if var5 then var5.name else nil
end