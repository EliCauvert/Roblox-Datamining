local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return function()
	-- upvalues: NodeModule (copy)
	local HtmlBlock = NodeModule.new("HtmlBlock", true)
	HtmlBlock.literal = nil
	
	return HtmlBlock
end