local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local _ = require(Parent.Foundation)
local FFlagAXCategoryTabFullRowTapArea = require(Parent.AvatarExperienceFlags).FFlagAXCategoryTabFullRowTapArea

return function(p1)
	-- upvalues: FFlagAXCategoryTabFullRowTapArea (copy)
	return if FFlagAXCategoryTabFullRowTapArea then p1.Size.Size_1000 else p1.Size.Size_800
end