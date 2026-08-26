local text = require(script:FindFirstAncestor("SocialLibraries").dependencies).Text
local _ = require(script.Parent.StyleTypes)

return function(p1, p2, p3)
	-- upvalues: text (ref)
	return text.GetTextHeight(p1, p2, p3)
end