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
	[tokenNameModule.Text] = function(p1, p2, _)
		-- upvalues: nodeTypeModule (ref), name (ref)
		local var1 = p1:peek()
		
		if not var1 or var1.type ~= nodeTypeModule.Plaintext then
			local _, plaintext = p1:pushDefault(nodeTypeModule.Plaintext)
			
			if plaintext then
				local var2 = p1:peek()
				var2.text = `{var2.text}{p2.text}`
				
				return
			else
				name:error("Failed to push default plaintext node to add text to")
				
				return nil
			end
		end
	end,
	[tokenNameModule.Break] = function(p1, _, _)
		-- upvalues: nodeTypeModule (ref), name (ref), cryoModule (ref), nodeConfigModule (ref)
		local var1, var2 = p1:push({
			name = "BREAK",
			text = "",
			type = nodeTypeModule.InlineCustom,
			children = {},
			attributes = {}
		})
		local _, _break = p1:findAndClose("BREAK")
		
		if not var2 or not _break then
			name:error("Failed to push break node")
			
			return nil
		end
		for i, v in cryoModule.List.reverse(var1) do
			local var3 = p1:peek()
			local var4 = var3 and nodeConfigModule.getByNode(var3)
			
			if not var4 then break end
			if var4.children[v.type] then
				local _, var5 = p1:push(v)
				
				if not var5 then
					name:error(`Failed to re-open node {v.name} after break`)
					
					return nil
				end
			end
		end
	end,
	[tokenNameModule.Open] = function(p2, p3, p4)
		-- upvalues: name (ref)
		local text = p4.TagAliases[p3.text] or p3.text
		local var6 = p4.TagConfigurations[text]
		
		if not var6 then
			name:error(`No configuration open tag name {text}`)
			
			return nil
		end
		text = var6.OverrideName or text
		local _, var7 = p2:push({
			text = "",
			type = var6.NodeType,
			name = text,
			children = {},
			attributes = p3.attributes
		})
		
		if var7 then
			return
		end
		name:error(`Failed to push open tag {text}`)
		
		return nil
	end,
	[tokenNameModule.Close] = function(p2, p3, p4)
		-- upvalues: name (ref)
		local text = p4.TagAliases[p3.text] or p3.text
		local var6 = p4.TagConfigurations[text]
		
		if not var6 then
			name:error(`No configuration close tag name {text}`)
			
			return nil
		end
		text = var6.OverrideName or text
		local _, var7 = p2:findAndClose(text)
		
		if var7 then
			return
		end
		name:error(`Failed to find and close tag {text}`)
		
		return nil
	end
}

return function(p2, p3)
	-- upvalues: nodeStackModule (ref), t (ref), name (ref)
	local var6 = nodeStackModule.new()
	
	for i, v in p2 do
		local name_1 = t[v.name]
		
		if name_1 then
			name_1(var6, v, p3)
		else
			name:error(`No processor for token name {v.name}`)
		end
	end
	return var6:buildRoot()
end