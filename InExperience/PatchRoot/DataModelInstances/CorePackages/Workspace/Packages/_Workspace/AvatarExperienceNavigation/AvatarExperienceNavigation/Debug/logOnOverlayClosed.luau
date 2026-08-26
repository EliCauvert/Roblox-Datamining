local var1 = require(script:FindFirstAncestor("AvatarExperienceNavigation").Parent.AppDebug).LogTree.logger("ax.rn.overlay")

return function(p1, p2)
	-- upvalues: var1 (ref)
	var1:info("onOverlayClosed {}, captureFocus: {}", p1, p2)
end