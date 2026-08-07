local cryoModule = require(script:FindFirstAncestor("NavigationRodux").Parent.Cryo)

return function(p0, p1) --[[ line: 8 ]]
	-- upvalues: cryoModule (ref)
	p0 = p0 or { Navigation = { lockNavigationActions = nil } }
	
	return if p1.type == "ApplySetNavigationLocked" then if p0.Navigation.lockNavigationActions == p1.locked then p0 else {
		Navigation = cryoModule.Dictionary.join(p0.Navigation, { lockNavigationActions = p1.locked or false })
	} else p0
end