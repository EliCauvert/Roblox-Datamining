local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local gameGetGameInfoStoreModule = require(parent.DataHydration.GameGetGameInfoStore)
local dataStatus = require(parent.DataHydration).DataStatus
local fFlagAppChatMomentShareCardLoadingSkeletonsModule = require(appChat.Flags.FFlagAppChatMomentShareCardLoadingSkeletons)
local var1 = signalsModule.createComputed(function()
	return nil
end)

return function(p1, p2)
	-- upvalues: gameGetGameInfoStoreModule (ref), signalsReactModule (ref), var1 (ref), fFlagAppChatMomentShareCardLoadingSkeletonsModule (ref), dataStatus (ref)
	local var2 = if p1 and p1 ~= 0 then tostring(p1) else nil
	local var3 = if p2 and var2 then gameGetGameInfoStoreModule(false).getAndFetchGameInfo(var2) else nil
	local var4 = signalsReactModule.useSignalState(if var3 then var3.data else var1)
	
	return {
		name = if var4 then var4.name else nil,
		isLoading = (if fFlagAppChatMomentShareCardLoadingSkeletonsModule then signalsReactModule.useSignalState(if var3 then var3.status else var1) else nil) == dataStatus.NotReady
	}
end