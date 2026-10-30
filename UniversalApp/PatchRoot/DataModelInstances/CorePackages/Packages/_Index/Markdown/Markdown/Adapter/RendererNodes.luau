local Markdown = script:FindFirstAncestor("Markdown")
local NodeTypeModule = require(Markdown.Enums.NodeType)
local _ = require(Markdown.Types)
local NodeConfiguration = require(Markdown.Parsers.DefaultParserOptions).nodeConfiguration
local Frozen = table.freeze({
	[NodeTypeModule.InlineSpan] = true,
	[NodeTypeModule.InlineLeaf] = true
})
local Frozen1 = table.freeze({
	[NodeTypeModule.Root] = true,
	[NodeTypeModule.Block] = true
})
local RendererNodesModule = {
	create = function(Name)
		-- upvalues: NodeConfiguration (copy)
		local NodeConfigurationEntry = NodeConfiguration[Name]
		
		if NodeConfigurationEntry == nil then
			error(`{Name} isn't a renderer node`)
		end
		return {
			offset = 0,
			name = Name,
			type = NodeConfigurationEntry.type,
			children = {}
		}
	end,
	offsetAt = function(p1, CreateResult, Index): number
		-- upvalues: Frozen (copy), NodeTypeModule (copy)
		return if Frozen[CreateResult.type] or p1.type == NodeTypeModule.Root and Index == 1 then 0 else 1
	end
}

function RendererNodesModule.append(p1, Name, Attributes)
	-- upvalues: RendererNodesModule (copy)
	local NewRendererNodes = RendererNodesModule.create(Name)
	NewRendererNodes.attributes = Attributes
	local Children = p1.children
	local Index = #Children + 1
	Children[Index] = NewRendererNodes
	NewRendererNodes.index = Index
	NewRendererNodes.offset = RendererNodesModule.offsetAt(p1, NewRendererNodes, Index)
	
	return NewRendererNodes
end

function RendererNodesModule.appendText(p1, Text)
	-- upvalues: RendererNodesModule (copy)
	local TEXT = RendererNodesModule.append(p1, "TEXT")
	TEXT.text = Text
	
	return TEXT
end

function RendererNodesModule.isInline(p1): boolean
	-- upvalues: Frozen (copy)
	return Frozen[p1.type] == true
end

function RendererNodesModule.holdsBlocks(p1): boolean
	-- upvalues: Frozen1 (copy)
	return Frozen1[p1.type] == true
end

return RendererNodesModule