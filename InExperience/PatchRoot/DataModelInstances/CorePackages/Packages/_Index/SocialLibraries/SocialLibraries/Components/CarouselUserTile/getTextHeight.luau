local text = require(script:FindFirstAncestor("SocialLibraries").dependencies).Text
local _ = require(script.Parent.StyleTypes)

return function(p0, p1, p2)
	-- upvalues: text (ref)
	return text.GetTextHeight(p0, p1, p2)
end