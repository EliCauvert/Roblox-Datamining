local CommonMark = script:FindFirstAncestor("CommonMark")
local CustomNodeModule = require(CommonMark.node.CustomNode)
local _ = require(CommonMark.node.Delimited)

return function(ClosingDelimiter)
	-- upvalues: CustomNodeModule (copy)
	local Strikethrough = CustomNodeModule.new("Strikethrough")
	Strikethrough.openingDelimiter = ClosingDelimiter
	Strikethrough.closingDelimiter = ClosingDelimiter
	
	return Strikethrough
end