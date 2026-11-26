local EnUs = require(script:FindFirstAncestor("AvatarWorkshop").Parent.InExperienceLocales).Localization.new("en-us")

return function(p1, p2)
	-- upvalues: EnUs (copy)
	return EnUs:Format(p1, p2)
end