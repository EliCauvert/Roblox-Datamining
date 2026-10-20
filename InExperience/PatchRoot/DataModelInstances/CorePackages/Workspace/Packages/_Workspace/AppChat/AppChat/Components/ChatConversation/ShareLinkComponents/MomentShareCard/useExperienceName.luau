local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SignalsReactModule = require(Parent.SignalsReact)
local GameGetGameInfoStoreModule = require(Parent.DataHydration.GameGetGameInfoStore)
local DataStatus = require(Parent.DataHydration).DataStatus
local FFlagAppChatMomentShareCardLoadingSkeletonsModule = require(AppChat.Flags.FFlagAppChatMomentShareCardLoadingSkeletons)
local Computed = require(Parent.Signals).createComputed(function()
	return nil
end)

return function(p1, p2)
	-- upvalues: GameGetGameInfoStoreModule (copy), SignalsReactModule (copy), Computed (copy), FFlagAppChatMomentShareCardLoadingSkeletonsModule (copy), DataStatus (copy)
	local Text = if p1 and p1 ~= 0 then tostring(p1) else nil
	local AndFetchGameInfo = if p2 and Text then GameGetGameInfoStoreModule(false).getAndFetchGameInfo(Text) else nil
	local UseSignalStateResult = SignalsReactModule.useSignalState(if AndFetchGameInfo then AndFetchGameInfo.data else Computed)
	
	return {
		name = if UseSignalStateResult then UseSignalStateResult.name else nil,
		isLoading = (if FFlagAppChatMomentShareCardLoadingSkeletonsModule then SignalsReactModule.useSignalState(if AndFetchGameInfo then AndFetchGameInfo.status else Computed) else nil) == DataStatus.NotReady
	}
end