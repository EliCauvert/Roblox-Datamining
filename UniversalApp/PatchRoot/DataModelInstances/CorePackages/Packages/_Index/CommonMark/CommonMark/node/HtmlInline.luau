local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return function()
	-- upvalues: NodeModule (copy)
	local HtmlInline = NodeModule.new("HtmlInline", false)
	HtmlInline.literal = nil
	
	return HtmlInline
end