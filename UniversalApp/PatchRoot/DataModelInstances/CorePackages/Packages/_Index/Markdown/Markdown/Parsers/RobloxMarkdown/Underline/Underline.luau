local CommonMarkModule = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)

return function(ClosingDelimiter)
	-- upvalues: CommonMarkModule (copy)
	local Underline = CommonMarkModule.Node.CustomNode.new("Underline")
	Underline.openingDelimiter = ClosingDelimiter
	Underline.closingDelimiter = ClosingDelimiter
	
	return Underline
end