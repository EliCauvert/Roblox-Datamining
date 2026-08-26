local argCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)

return function(p1, p2, p3)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "table", "addMessage.messages")
	argCheckModule.isType(p2, "string", "addMessage.value")
	
	if p2 == "" then
		return p1
	end
	table.insert(p1, if p3 then { placeId = p2 } else { content = p2 })
	
	return p1
end