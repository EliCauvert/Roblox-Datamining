local _ = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceUIKit)

return function(p1, p2)
	return if p1 == nil then p2 ~= nil else true
end