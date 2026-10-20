local _ = require(script:FindFirstAncestor("ChatUIPrimitives").Types)

return function(p1, p2): boolean
	if p2 then
		local Translation = p1.translation
		
		return Translation ~= nil and (Translation ~= "" and Translation ~= p1.content)
	else
		return false
	end
end