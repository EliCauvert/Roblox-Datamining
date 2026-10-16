local InlineRichText = script:FindFirstAncestor("InlineRichText")
local NewResult = require(InlineRichText.Logger):new(script.Name)
local CryoModule = require(InlineRichText.Parent.Cryo)
local _ = require(InlineRichText.Types)
local NodeTypeModule = require(InlineRichText.Enums.NodeType)
local NodeRenderers = script.Parent.NodeRenderers
local NodeConfigModule = require(InlineRichText.NodeConfig)
local config = {
	[NodeTypeModule.Plaintext] = require(NodeRenderers.PlaintextRenderer),
	[NodeTypeModule.EngineTag] = require(NodeRenderers.EngineTagRenderer),
	[NodeTypeModule.InlineCustom] = require(NodeRenderers.InlineCustomRenderer)
}

return function(p1, p2) --[[ Line: 20 | Named "processChildren" ]]
	-- upvalues: NodeConfigModule (copy), NewResult (copy), CryoModule (copy), config (copy)
	local List = {}
	local ByNode = NodeConfigModule.getByNode(p1)
	
	if not ByNode then
		NewResult:warning(`Node {p1.name}: No config found for node type {p1.type}`)
		
		return List
	end
	for _, value in CryoModule.List.map(p1.children, function(p3) --[[ Line: 28 ]]
		-- upvalues: NodeConfigModule (upval), NewResult (upval), ByNode (copy), p1 (copy), config (upval), p2 (copy), CryoModule (upval)
		local ByNode = NodeConfigModule.getByNode(p3)
		
		if not ByNode then
			NewResult:warning(`Node {p3.name}: No config found for node {p3.name} type {p3.type}`)
			
			return {}
		end
		if not ByNode.children[p3.type] then
			NewResult:warning(`Node {p3.name}: Node type {p3.type} is not a valid child of node {p1.name} type {p1.type}`)
			
			return {}
		end
		local Callback = config[p3.type]
		
		if not Callback then
			NewResult:warning(`Node {p3.name}: No renderer found for type {p3.type}`)
			
			return {}
		end
		local CallbackResult = Callback(p3, p2)
		
		if typeof(CallbackResult) ~= "table" then
			CallbackResult = { CallbackResult }
		end
		if CryoModule.List.foldLeft(CallbackResult, function(p4, p5) --[[ Line: 49 ]]
			-- upvalues: ByNode (copy)
			return p4 and ByNode.validateRenderResult(p5)
		end, true) then
			return CallbackResult
		else
			NewResult:warning(`Node {p3.name}: Rendered result is not valid for type {p3.type}`)
			
			return {}
		end
	end) do
		for _, value1 in value do
			table.insert(List, value1)
		end
	end
	return List
end