local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return function(Literal)
	-- upvalues: NodeModule (copy)
	local Code = NodeModule.new("Code", false)
	Code.literal = Literal
	
	return Code
end