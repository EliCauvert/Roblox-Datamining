local _ = require(script:FindFirstAncestor("ChatUIPrimitives").Types)

return function(p1, p2)
	return if p2 and p1.translation ~= nil and p1.translation ~= "" then p1.translation else p1.content
end