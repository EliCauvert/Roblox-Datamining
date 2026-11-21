local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local SignalsModule = require(Parent.Signals)
local DataHydrationModule = require(Parent.DataHydration)
local GameGetGameInfoStoreModule = require(Parent.DataHydration.GameGetGameInfoStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateComputedFunction = SignalsModule.createComputed
local DataStatus = DataHydrationModule.DataStatus
local Computed = CreateComputedFunction(function()
	return nil
end)

return function(p1)
	-- upvalues: GameGetGameInfoStoreModule (copy), UseSignalStateFunction (copy), Computed (copy), DataStatus (copy)
	local AndFetchGameInfo = if p1 == nil or p1 == "" then nil else GameGetGameInfoStoreModule(false).getAndFetchGameInfo(p1)
	local UseSignalStateResult = UseSignalStateFunction(if AndFetchGameInfo then AndFetchGameInfo.data else Computed)
	local UseSignalStateResult1 = UseSignalStateFunction(if AndFetchGameInfo then AndFetchGameInfo.status else Computed)
	local UseSignalStateResult2 = if UseSignalStateResult and UseSignalStateResult.isUnavailable ~= true then UseSignalStateResult else nil
	
	return {
		name = if UseSignalStateResult2 then UseSignalStateResult2.name else nil,
		isLoading = UseSignalStateResult1 == DataStatus.NotReady,
		rootPlaceId = if UseSignalStateResult2 then UseSignalStateResult2.rootPlaceId else nil
	}
end