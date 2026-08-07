local var0 = require(script:FindFirstAncestor("AvatarExperienceNavigation").Parent.AppDebug).LogTree.logger("ax.rn.overlay")

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: var0 (ref)
	var0:info("onOverlayClosed {}, captureFocus: {}", p0, p1)
end