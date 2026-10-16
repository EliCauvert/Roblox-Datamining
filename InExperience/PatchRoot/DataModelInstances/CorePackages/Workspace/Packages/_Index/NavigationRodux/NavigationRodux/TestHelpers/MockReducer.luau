local CryoModule = require(script:FindFirstAncestor("NavigationRodux").Parent.Cryo)

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: CryoModule (copy)
	local P0 = p1 or { Navigation = { lockNavigationActions = nil } }
	
	return if p2.type == "ApplySetNavigationLocked" then if P0.Navigation.lockNavigationActions == p2.locked then P0 else {
		Navigation = CryoModule.Dictionary.join(P0.Navigation, { lockNavigationActions = p2.locked or false })
	} else P0
end