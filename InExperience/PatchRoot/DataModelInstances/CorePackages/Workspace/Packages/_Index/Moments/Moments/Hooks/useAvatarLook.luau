local Parent = script:FindFirstAncestor("Moments").Parent
local MomentsGetOutfitLookStoreModule = require(Parent.DataHydration.MomentsGetOutfitLookStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateComputedFunction = require(Parent.Signals).createComputed
local config = {
	data = CreateComputedFunction(function()
		return nil
	end),
	status = CreateComputedFunction(function(): string
		return "NotReady"
	end)
}

return function(p1: number)
	-- upvalues: MomentsGetOutfitLookStoreModule (copy), config (copy), UseSignalStateFunction (copy)
	local v1: boolean = p1 ~= nil and p1 > 0
	local AndFetchLookByOutfit = if v1 then MomentsGetOutfitLookStoreModule(false).getAndFetchLookByOutfit(p1) else config
	local UseSignalStateResult = UseSignalStateFunction(AndFetchLookByOutfit.data)
	local UseSignalStateResult1 = UseSignalStateFunction(AndFetchLookByOutfit.status)
	local Look = if UseSignalStateResult == nil then nil else UseSignalStateResult.look
	local Loading: string = if v1 and UseSignalStateResult1 ~= "Failed" and (UseSignalStateResult1 ~= "Ready" or Look ~= nil) then if Look == nil then "Loading" else "Ready" else "Unavailable"
	
	return {
		status = Loading,
		look = if Loading == "Ready" then Look else nil
	}
end