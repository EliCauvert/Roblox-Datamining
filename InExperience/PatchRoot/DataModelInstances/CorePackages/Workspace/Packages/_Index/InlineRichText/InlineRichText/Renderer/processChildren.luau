local inlineRichText = script:FindFirstAncestor("InlineRichText")
local name = require(inlineRichText.Logger):new(script.Name)
local cryoModule = require(inlineRichText.Parent.Cryo)
local _ = require(inlineRichText.Types)
local nodeTypeModule = require(inlineRichText.Enums.NodeType)
local nodeRenderers = script.Parent.NodeRenderers
local nodeConfigModule = require(inlineRichText.NodeConfig)
local t = {
	[nodeTypeModule.Plaintext] = require(nodeRenderers.PlaintextRenderer),
	[nodeTypeModule.EngineTag] = require(nodeRenderers.EngineTagRenderer),
	[nodeTypeModule.InlineCustom] = require(nodeRenderers.InlineCustomRenderer)
}

return function(p1, p2)
	-- upvalues: nodeConfigModule (ref), name (ref), cryoModule (ref), t (ref)
	local t_1 = {}
	local byNode = nodeConfigModule.getByNode(p1)
	
	if not byNode then
		name:warning(`Node {p1.name}: No config found for node type {p1.type}`)
		
		return t_1
	end
	for i, v in cryoModule.List.map(p1.children, function(p3)
		-- upvalues: nodeConfigModule (copy), name (copy), byNode (ref), p1 (ref), t (copy), p2 (ref), cryoModule (copy)
		local byNode_1 = nodeConfigModule.getByNode(p3)
		
		if not byNode_1 then
			name:warning(`Node {p3.name}: No config found for node {p3.name} type {p3.type}`)
			
			return {}
		elseif not byNode.children[p3.type] then
			name:warning(`Node {p3.name}: Node type {p3.type} is not a valid child of node {p1.name} type {p1.type}`)
			
			return {}
		end
		local type = t[p3.type]
		
		if not type then
			name:warning(`Node {p3.name}: No renderer found for type {p3.type}`)
			
			return {}
		end
		local var1 = type(p3, p2)
		
		if typeof(var1) ~= "table" then
			var1 = { var1 }
		end
		if cryoModule.List.foldLeft(var1, function(p4, p5)
			-- upvalues: byNode_1 (ref)
			return p4 and byNode_1.validateRenderResult(p5)
		end, true) then
			return var1
		end
		name:warning(`Node {p3.name}: Rendered result is not valid for type {p3.type}`)
		
		return {}
	end) do
		for i_1, v_1 in v do
			table.insert(t_1, v_1)
		end
	end
	return t_1
end