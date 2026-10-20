local InlineRichText = script:FindFirstAncestor("InlineRichText")
local _ = require(InlineRichText.Types)
local NewResult = require(InlineRichText.Logger):new(script.Name)
local CryoModule = require(InlineRichText.Parent.Cryo)
local NodeConfigModule = require(InlineRichText.NodeConfig)
local NodeStackModule = require(InlineRichText.Parser.NodeStack)
local NodeTypeModule = require(InlineRichText.Enums.NodeType)
local TokenNameModule = require(InlineRichText.Enums.TokenName)
local config = {
	[TokenNameModule.Text] = function(p1, p2, _)
		-- upvalues: NodeTypeModule (copy), NewResult (copy)
		local PeekResult = p1:peek()
		
		if not PeekResult or PeekResult.type ~= NodeTypeModule.Plaintext then
			local _, PushDefaultResult2 = p1:pushDefault(NodeTypeModule.Plaintext)
			
			if not PushDefaultResult2 then
				NewResult:error("Failed to push default plaintext node to add text to")
				
				return nil
			end
		end
		local PeekResult1 = p1:peek()
		PeekResult1.text = `{PeekResult1.text}{p2.text}`
	end,
	[TokenNameModule.Break] = function(p1, _, _)
		-- upvalues: NodeTypeModule (copy), NewResult (copy), CryoModule (copy), NodeConfigModule (copy)
		local BREAK, BREAK2 = p1:push({
			name = "BREAK",
			text = "",
			type = NodeTypeModule.InlineCustom,
			children = {},
			attributes = {}
		})
		local _, BREAK2_1 = p1:findAndClose("BREAK")
		
		if not BREAK2 or not BREAK2_1 then
			NewResult:error("Failed to push break node")
			
			return nil
		end
		for _, value in CryoModule.List.reverse(BREAK) do
			local PeekResult = p1:peek()
			local ByNode = PeekResult and NodeConfigModule.getByNode(PeekResult)
			
			if not ByNode then break end
			if ByNode.children[value.type] then
				local _, PushResult2 = p1:push(value)
				
				if not PushResult2 then
					NewResult:error(`Failed to re-open node {value.name} after break`)
					
					return nil
				end
			end
		end
	end,
	[TokenNameModule.Open] = function(p2, p3, p4)
		-- upvalues: NewResult (copy)
		local TagAlias = p4.TagAliases[p3.text] or p3.text
		local TagConfiguration = p4.TagConfigurations[TagAlias]
		
		if not TagConfiguration then
			NewResult:error(`No configuration open tag name {TagAlias}`)
			
			return nil
		end
		local OverrideName = TagConfiguration.OverrideName or TagAlias
		local _, PushResult2 = p2:push({
			text = "",
			type = TagConfiguration.NodeType,
			name = OverrideName,
			children = {},
			attributes = p3.attributes
		})
		
		if PushResult2 then return end
		NewResult:error(`Failed to push open tag {OverrideName}`)
		
		return nil
	end,
	[TokenNameModule.Close] = function(p2, p3, p4)
		-- upvalues: NewResult (copy)
		local TagAlias = p4.TagAliases[p3.text] or p3.text
		local TagConfiguration = p4.TagConfigurations[TagAlias]
		
		if not TagConfiguration then
			NewResult:error(`No configuration close tag name {TagAlias}`)
			
			return nil
		end
		local OverrideName = TagConfiguration.OverrideName or TagAlias
		local _, AndClose2 = p2:findAndClose(OverrideName)
		
		if AndClose2 then return end
		NewResult:error(`Failed to find and close tag {OverrideName}`)
		
		return nil
	end
}

return function(List, p2)
	-- upvalues: NodeStackModule (copy), config (copy), NewResult (copy)
	local NewNodeStack = NodeStackModule.new()
	
	for _, value in List do
		local Entry: (any, any, any) -> () = config[value.name]
		
		if Entry then
			Entry(NewNodeStack, value, p2)
		else
			NewResult:error(`No processor for token name {value.name}`)
		end
	end
	return NewNodeStack:buildRoot()
end