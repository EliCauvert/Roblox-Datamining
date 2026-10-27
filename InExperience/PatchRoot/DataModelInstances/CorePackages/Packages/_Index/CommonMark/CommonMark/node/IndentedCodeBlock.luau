local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return function()
	-- upvalues: NodeModule (copy)
	local IndentedCodeBlock = NodeModule.new("IndentedCodeBlock", true)
	IndentedCodeBlock.literal = nil
	
	return IndentedCodeBlock
end