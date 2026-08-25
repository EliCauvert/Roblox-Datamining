local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local gameGetGameInfoStoreModule = require(parent.DataHydration.GameGetGameInfoStore)
local dataStatus = require(parent.DataHydration).DataStatus
local fFlagAppChatMomentShareCardLoadingSkeletonsModule = require(appChat.Flags.FFlagAppChatMomentShareCardLoadingSkeletons)
local var5 = signalsModule.createComputed(function()
	return nil
end)

return function(p0, p1)
	-- upvalues: gameGetGameInfoStoreModule (ref), signalsReactModule (ref), var5 (ref), fFlagAppChatMomentShareCardLoadingSkeletonsModule (ref), dataStatus (ref)
	local var6 = if p0 and p0 ~= 0 then tostring(p0) else nil
	local var7 = if p1 and var6 then gameGetGameInfoStoreModule(false).getAndFetchGameInfo(var6) else nil
	local var8 = signalsReactModule.useSignalState(if var7 then var7.data else var5)
	
	return {
		name = if var8 then var8.name else nil,
		isLoading = (if fFlagAppChatMomentShareCardLoadingSkeletonsModule then signalsReactModule.useSignalState(if var7 then var7.status else var5) else nil) == dataStatus.NotReady
	}
end