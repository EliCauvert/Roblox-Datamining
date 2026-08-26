local cryoModule = require(script:FindFirstAncestor("NavigationRodux").Parent.Cryo)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	p1 = p1 or { Navigation = { lockNavigationActions = nil } }
	
	return if p2.type == "ApplySetNavigationLocked" then if p1.Navigation.lockNavigationActions == p2.locked then p1 else {
		Navigation = cryoModule.Dictionary.join(p1.Navigation, { lockNavigationActions = p2.locked or false })
	} else p1
end