local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.node.Delimited)
local NodeModule = require(CommonMark.node.Node)

return function(ClosingDelimiter)
	-- upvalues: NodeModule (copy)
	local StrongEmphasis = NodeModule.new("StrongEmphasis", false)
	StrongEmphasis.openingDelimiter = ClosingDelimiter
	StrongEmphasis.closingDelimiter = ClosingDelimiter
	
	return StrongEmphasis
end