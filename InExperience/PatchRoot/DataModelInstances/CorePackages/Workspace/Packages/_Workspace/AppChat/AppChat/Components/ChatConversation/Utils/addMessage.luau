local argCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)

return function(p0, p1, p2)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "table", "addMessage.messages")
	argCheckModule.isType(p1, "string", "addMessage.value")
	
	if p1 == "" then
		return p0
	end
	table.insert(p0, if p2 then { placeId = p1 } else { content = p1 })
	
	return p0
end