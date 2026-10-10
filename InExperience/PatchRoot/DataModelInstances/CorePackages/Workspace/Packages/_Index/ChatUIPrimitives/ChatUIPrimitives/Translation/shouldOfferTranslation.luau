local _ = require(script:FindFirstAncestor("ChatUIPrimitives").Types)

return function(p1, p2)
	if not p2 then
		return false
	end
	local translation = p1.translation
	
	return translation ~= nil and (translation ~= "" and translation ~= p1.content)
end