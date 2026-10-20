local AxRnOverlay = require(script:FindFirstAncestor("AvatarExperienceNavigation").Parent.AppDebug).LogTree.logger("ax.rn.overlay")

return function(p1, p2)
	-- upvalues: AxRnOverlay (copy)
	AxRnOverlay:info("onOverlayClosed {}, captureFocus: {}", p1, p2)
end