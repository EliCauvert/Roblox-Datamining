local ArgCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)

return function(List, Content, p1)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(List, "table", "addMessage.messages")
	ArgCheckModule.isType(Content, "string", "addMessage.value")
	
	if Content == "" then
		return List
	else
		table.insert(List, p1 and { placeId = Content } or { content = Content })
		
		return List
	end
end