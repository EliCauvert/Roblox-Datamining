local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local _ = require(inlineRichText.Types)
local name = require(inlineRichText.Logger):new(script.Name)
local cryoModule = require(parent.Cryo)
local nodeConfigModule = require(inlineRichText.NodeConfig)
local nodeStackModule = require(inlineRichText.Parser.NodeStack)
local nodeTypeModule = require(inlineRichText.Enums.NodeType)
local tokenNameModule = require(inlineRichText.Enums.TokenName)
local t = {
	[tokenNameModule.Text] = function(p0, p1, _) --[[ line: 16 ]]
		-- upvalues: nodeTypeModule (ref), name (ref)
		local var8 = p0:peek()
		
		if not var8 or var8.type ~= nodeTypeModule.Plaintext then
			local _, plaintext = p0:pushDefault(nodeTypeModule.Plaintext)
			
			if plaintext then
				local var10 = p0:peek()
				var10.text = `{var10.text}{p1.text}`
				
				return
			else
				name:error("Failed to push default plaintext node to add text to")
				
				return nil
			end
		end
	end,
	[tokenNameModule.Break] = function(p2, _, _) --[[ line: 30 ]]
		-- upvalues: nodeTypeModule (ref), name (ref), cryoModule (ref), nodeConfigModule (ref)
		local var11, var12 = p2:push({
			name = "BREAK",
			text = "",
			type = nodeTypeModule.InlineCustom,
			children = {},
			attributes = {}
		})
		local _, _break = p2:findAndClose("BREAK")
		
		if not var12 or not _break then
			name:error("Failed to push break node")
			
			return nil
		end
		for i, v in cryoModule.List.reverse(var11) do
			local var14 = p2:peek()
			local var15 = var14 and nodeConfigModule.getByNode(var14)
			
			if not var15 then break end
			if var15.children[v.type] then
				local _, var16 = p2:push(v)
				
				if not var16 then
					name:error(`Failed to re-open node {v.name} after break`)
					
					return nil
				end
			end
		end
	end,
	[tokenNameModule.Open] = function(p3, p4, p5) --[[ line: 64 ]]
		-- upvalues: name (ref)
		local text = p5.TagAliases[p4.text] or p4.text
		local var18 = p5.TagConfigurations[text]
		
		if not var18 then
			name:error(`No configuration open tag name {text}`)
			
			return nil
		end
		text = var18.OverrideName or text
		local _, var19 = p3:push({
			text = "",
			type = var18.NodeType,
			name = text,
			children = {},
			attributes = p4.attributes
		})
		
		if var19 then
			return
		end
		name:error(`Failed to push open tag {text}`)
		
		return nil
	end,
	[tokenNameModule.Close] = function(p6, p7, p8) --[[ line: 87 ]]
		-- upvalues: name (ref)
		local text = p8.TagAliases[p7.text] or p7.text
		local var21 = p8.TagConfigurations[text]
		
		if not var21 then
			name:error(`No configuration close tag name {text}`)
			
			return nil
		end
		text = var21.OverrideName or text
		local _, var22 = p6:findAndClose(text)
		
		if var22 then
			return
		end
		name:error(`Failed to find and close tag {text}`)
		
		return nil
	end
}

return function(p9, p10) --[[ line: 106 | named "buildTree" ]]
	-- upvalues: nodeStackModule (ref), t (ref), name (ref)
	local var23 = nodeStackModule.new()
	
	for i, v in p9 do
		local name_1 = t[v.name]
		
		if name_1 then
			name_1(var23, v, p10)
		else
			name:error(`No processor for token name {v.name}`)
		end
	end
	return var23:buildRoot()
end