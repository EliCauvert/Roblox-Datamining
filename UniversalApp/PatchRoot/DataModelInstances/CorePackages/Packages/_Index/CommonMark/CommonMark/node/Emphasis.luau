local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.node.Delimited)
local NodeModule = require(CommonMark.node.Node)

return function(ClosingDelimiter)
	-- upvalues: NodeModule (copy)
	local Emphasis = NodeModule.new("Emphasis", false)
	Emphasis.openingDelimiter = ClosingDelimiter
	Emphasis.closingDelimiter = ClosingDelimiter
	
	return Emphasis
end