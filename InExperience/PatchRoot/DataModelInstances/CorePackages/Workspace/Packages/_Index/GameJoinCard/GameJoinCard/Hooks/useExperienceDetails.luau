local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local SignalsModule = require(Parent.Signals)
local DataHydrationModule = require(Parent.DataHydration)
local GameGetGameInfoStoreModule = require(Parent.DataHydration.GameGetGameInfoStore)
local GameGetPlayabilityStoreModule = require(Parent.DataHydration.GameGetPlayabilityStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateComputedFunction = SignalsModule.createComputed
local DataStatus = DataHydrationModule.DataStatus
local Computed = CreateComputedFunction(function()
	return nil
end)

return function(p1, Enabled)
	-- upvalues: GameGetGameInfoStoreModule (copy), GameGetPlayabilityStoreModule (copy), UseSignalStateFunction (copy), Computed (copy), DataStatus (copy)
	local v1 = if p1 == "" then nil else p1
	local AndFetchGameInfo = if v1 then GameGetGameInfoStoreModule(false).getAndFetchGameInfo(v1) else nil
	local AndFetchPlayability = if v1 and Enabled == true then GameGetPlayabilityStoreModule(false).getAndFetchPlayability(v1) else nil
	local UseSignalStateResult = UseSignalStateFunction(if AndFetchGameInfo then AndFetchGameInfo.data else Computed)
	local UseSignalStateResult1 = UseSignalStateFunction(if AndFetchGameInfo then AndFetchGameInfo.status else Computed)
	local UseSignalStateResult2 = UseSignalStateFunction(if AndFetchPlayability then AndFetchPlayability.data else Computed)
	local UseSignalStateResult3 = if UseSignalStateResult and UseSignalStateResult.isUnavailable ~= true then UseSignalStateResult else nil
	
	return {
		name = if UseSignalStateResult3 then UseSignalStateResult3.name else nil,
		isLoading = UseSignalStateResult1 == DataStatus.NotReady,
		rootPlaceId = if UseSignalStateResult3 then UseSignalStateResult3.rootPlaceId else nil,
		playabilityStatus = if UseSignalStateResult2 then UseSignalStateResult2.playabilityStatus else nil
	}
end