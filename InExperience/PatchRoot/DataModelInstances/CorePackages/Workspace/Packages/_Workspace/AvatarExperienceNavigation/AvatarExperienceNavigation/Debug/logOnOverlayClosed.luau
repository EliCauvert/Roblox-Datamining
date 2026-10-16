local AxRnOverlay = require(script:FindFirstAncestor("AvatarExperienceNavigation").Parent.AppDebug).LogTree.logger("ax.rn.overlay")

return function(p1, p2) --[[ Line: 6 ]]
	-- upvalues: AxRnOverlay (copy)
	AxRnOverlay:info("onOverlayClosed {}, captureFocus: {}", p1, p2)
end