local _ = require(script:FindFirstAncestor("CommonMark").renderer.NodeRenderer)
local StrikethroughNodeRendererModule = {}
StrikethroughNodeRendererModule.__index = StrikethroughNodeRendererModule

function StrikethroughNodeRendererModule:getNodeTypes()
	return { "Strikethrough" }
end

return StrikethroughNodeRendererModule