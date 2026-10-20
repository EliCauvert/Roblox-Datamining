local Parent = script:FindFirstAncestor("FriendsActivityFeed").Parent
local BadgesGetBadgeInfoStoreModule = require(Parent.DataHydration.BadgesGetBadgeInfoStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local Computed = require(Parent.Signals).createComputed(function()
	return nil
end)

return function(p1)
	-- upvalues: BadgesGetBadgeInfoStoreModule (copy), Computed (copy), UseSignalStateFunction (copy)
	local Text = if p1 == nil or p1 == 0 then nil else tostring(p1)
	local UseSignalStateResult = UseSignalStateFunction(if Text == nil then Computed else BadgesGetBadgeInfoStoreModule(false).getBadgeInfo(Text).data)
	
	return if UseSignalStateResult == nil then nil else UseSignalStateResult.displayName
end