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

return function(p0, p1)
	-- upvalues: nodeConfigModule (ref), name (ref), cryoModule (ref), t (ref)
	local t_1 = {}
	local byNode = nodeConfigModule.getByNode(p0)
	
	if not byNode then
		name:warning(`Node {p0.name}: No config found for node type {p0.type}`)
		
		return t_1
	end
	for i, v in cryoModule.List.map(p0.children, function(p2)
		-- upvalues: nodeConfigModule (copy), name (copy), byNode (ref), p0 (ref), t (copy), p1 (ref), cryoModule (copy)
		local byNode_1 = nodeConfigModule.getByNode(p2)
		
		if not byNode_1 then
			name:warning(`Node {p2.name}: No config found for node {p2.name} type {p2.type}`)
			
			return {}
		elseif not byNode.children[p2.type] then
			name:warning(`Node {p2.name}: Node type {p2.type} is not a valid child of node {p0.name} type {p0.type}`)
			
			return {}
		end
		local type = t[p2.type]
		
		if not type then
			name:warning(`Node {p2.name}: No renderer found for type {p2.type}`)
			
			return {}
		end
		local var9 = type(p2, p1)
		
		if typeof(var9) ~= "table" then
			var9 = { var9 }
		end
		if cryoModule.List.foldLeft(var9, function(p3, p4)
			-- upvalues: byNode_1 (ref)
			return p3 and byNode_1.validateRenderResult(p4)
		end, true) then
			return var9
		end
		name:warning(`Node {p2.name}: Rendered result is not valid for type {p2.type}`)
		
		return {}
	end) do
		for i_1, v_1 in v do
			table.insert(t_1, v_1)
		end
	end
	return t_1
end