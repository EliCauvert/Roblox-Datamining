local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.node.Node)
local _ = require(CommonMark.renderer.NodeRenderer)
local NodeRendererMapModule = {}
NodeRendererMapModule.__index = NodeRendererMapModule

function NodeRendererMapModule.new()
	-- upvalues: NodeRendererMapModule (copy)
	return (setmetatable({ _nodeRenderers = {}, _renderers = {} }, NodeRendererMapModule))
end

function NodeRendererMapModule:add(p1)
	table.insert(self._nodeRenderers, p1)
	
	for _, nodeType in ipairs(p1:getNodeTypes()) do
		if self._renderers[nodeType] == nil then
			self._renderers[nodeType] = p1
		end
	end
end

function NodeRendererMapModule:render(p2)
	local Renderer = self._renderers[p2.kind]
	
	if Renderer ~= nil then
		Renderer:render(p2)
	end
end

function NodeRendererMapModule.beforeRoot(p2, p3)
	for _, nodeRenderer in ipairs(p2._nodeRenderers) do
		local BeforeRootFunction: (any, any) -> () = nodeRenderer.beforeRoot
		
		if BeforeRootFunction ~= nil then
			BeforeRootFunction(nodeRenderer, p3)
		end
	end
end

function NodeRendererMapModule.afterRoot(p4, p5)
	for _, nodeRenderer in ipairs(p4._nodeRenderers) do
		local AfterRootFunction: (any, any) -> () = nodeRenderer.afterRoot
		
		if AfterRootFunction ~= nil then
			AfterRootFunction(nodeRenderer, p5)
		end
	end
end

return NodeRendererMapModule