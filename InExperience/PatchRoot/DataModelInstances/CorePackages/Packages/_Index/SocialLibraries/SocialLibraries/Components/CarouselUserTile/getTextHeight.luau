local text = require(script:FindFirstAncestor("SocialLibraries").dependencies).Text

return function(p1, p2, p3)
	-- upvalues: text (ref)
	return text.GetTextHeight(p1, p2, p3)
end