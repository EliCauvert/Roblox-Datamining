local _ = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceUIKit)

return function(p1, p2): boolean
	return p1 ~= nil or p2 ~= nil
end