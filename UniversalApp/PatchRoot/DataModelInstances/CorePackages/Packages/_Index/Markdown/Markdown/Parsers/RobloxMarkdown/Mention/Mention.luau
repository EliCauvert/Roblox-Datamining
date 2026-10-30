local CommonMarkModule = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)

return function(Id, Name)
	-- upvalues: CommonMarkModule (copy)
	local Mention = CommonMarkModule.Node.CustomNode.new("Mention")
	Mention.id = Id
	Mention.name = Name
	
	return Mention
end