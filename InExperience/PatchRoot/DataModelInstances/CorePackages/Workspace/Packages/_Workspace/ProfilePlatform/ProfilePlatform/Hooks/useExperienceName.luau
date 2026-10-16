local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local GameGetGameInfoStoreModule = require(Parent.DataHydration.GameGetGameInfoStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local Computed = require(Parent.Signals).createComputed(function() --[[ Line: 21 ]]
	return nil
end)

return function(p1) --[[ Line: 25 | Named "useExperienceName" ]]
	-- upvalues: GameGetGameInfoStoreModule (copy), Computed (copy), UseSignalStateFunction (copy)
	local Text = if p1 == nil or p1 == 0 then nil else tostring(p1)
	local UseSignalStateResult = UseSignalStateFunction(if Text == nil then Computed else GameGetGameInfoStoreModule(false).getAndFetchGameInfo(Text).data)
	
	return if UseSignalStateResult == nil then nil else UseSignalStateResult.name
end