local markdown = script:FindFirstAncestor("Markdown")
local _ = require(markdown.Types)
local constantsModule = require(script.Parent.Parent.Constants)
local LISTS = constantsModule.LISTS
local STYLED_TEXT = constantsModule.STYLED_TEXT
local DIVIDERS = constantsModule.DIVIDERS
local insert = table.insert
local nodeTypeModule = require(markdown.Enums.NodeType)
local getNodeTypeModule = require(script.Parent.Parent.getNodeType)
local isNodeBlockModule = require(script.Parent.Parent.isNodeBlock)
local t = {}

function t.buildTree(p1, p2)
	-- upvalues: nodeTypeModule (ref), getNodeTypeModule (ref), insert (ref), STYLED_TEXT (ref), t (ref), LISTS (ref), isNodeBlockModule (ref), DIVIDERS (ref)
	local t_1 = {
		name = "ROOT",
		offset = 1,
		children = {},
		type = nodeTypeModule.Root
	}
	local list = { t_1 }
	local var1 = 1
	while var1 <= #p1 do
		local var2 = p1[var1]
		local var3 = list[#list]
		
		if var2.name == "CODE_BLOCK" and var2.capture then
			insert(var3.children, {
				name = "CODE_BLOCK",
				text = string.gsub(var2.capture[2], "^%s*(.-)%s*$", "%1"),
				children = {},
				attributes = { language = var2.capture[1] },
				offset = var2.offset,
				type = getNodeTypeModule("CODE_BLOCK", p2)
			})
		elseif var2.name == "INLINE_CODE" and var2.capture then
			insert(var3.children, {
				name = "STYLED_TEXT",
				attributes = { style = "INLINE_CODE" },
				children = {
					{
						name = "TEXT",
						text = var2.capture[1],
						children = {},
						offset = var2.offset,
						type = getNodeTypeModule("TEXT", p2)
					}
				},
				offset = var2.offset,
				type = getNodeTypeModule("STYLED_TEXT", p2)
			})
		elseif STYLED_TEXT[var2.name] then
			if not t.closeNode(list, function(p3)
				-- upvalues: var2 (ref)
				if p3.name == "STYLED_TEXT" and p3.attributes and p3.attributes.style then
					assert(p3.attributes.style == var2.name, `Can't put {var9.name} at {var9.offset} inside {p2.attributes.style} at {p2.offset}`)
					
					return true
				end
				return false
			end) then
				insert(list, {
					name = "STYLED_TEXT",
					attributes = { style = var2.name },
					children = {},
					offset = var2.offset,
					type = getNodeTypeModule("STYLED_TEXT", p2)
				})
			end
		elseif LISTS[var2.name] and var2.capture then
			t.closeNode(list, function(p3)
				-- upvalues: isNodeBlockModule (copy)
				return isNodeBlockModule(p3)
			end)
			insert(list, {
				name = "LIST_ITEM",
				children = {},
				attributes = { depth = #var2.capture[1], prefix = var2.capture[2] },
				offset = var2.offset,
				type = getNodeTypeModule("LIST_ITEM", p2)
			})
		elseif var2.isBlock then
			t.closeNode(list, function(p3)
				-- upvalues: isNodeBlockModule (copy)
				return isNodeBlockModule(p3)
			end)
			local t_2 = {}
			
			if var2.name == "HEADING" and var2.capture then
				t_2.depth = #var2.capture[1]
			end
			insert(if DIVIDERS[var2.name] then list[#list].children else list, {
				name = var2.name,
				children = {},
				attributes = t_2,
				offset = var2.offset,
				type = getNodeTypeModule(var2.name, p2)
			})
		elseif var2.name == "ESCAPE" and var2.capture then
			insert(var3.children, {
				name = "TEXT",
				text = var2.capture[1],
				offset = var2.offset,
				children = {},
				type = getNodeTypeModule("TEXT", p2)
			})
		elseif var2.name == "LINK" and var2.capture then
			insert(var3.children, {
				name = "LINK",
				text = var2.capture[1],
				url = var2.capture[2],
				offset = var2.offset,
				children = {
					{
						name = "TEXT",
						text = var2.capture[1],
						offset = string.find(var2.text, var2.capture[1], 1, true) or var2.offset,
						children = {},
						type = getNodeTypeModule("TEXT", p2)
					}
				},
				type = getNodeTypeModule("LINK", p2)
			})
		elseif var2.name == "IMAGE" and var2.capture then
			insert(var3.children, {
				name = var2.name,
				text = var2.capture[1],
				url = var2.capture[2],
				offset = var2.offset,
				children = {},
				type = getNodeTypeModule("IMAGE", p2)
			})
		elseif var2.name == "OPEN_CLOSE" and var2.capture then
			local var4 = var2.capture[1]
			local var5 = var2.capture[2]
			
			if var2.capture and var4 == "br" then
				insert(var3.children, {
					name = "BREAK",
					children = {},
					offset = var2.offset,
					type = getNodeTypeModule("BREAK", p2)
				})
			else
				insert(var3.children, {
					name = "TAG",
					text = var4,
					attributes = if var5 then t.parseXmlAttributes(var5) else {},
					children = {},
					offset = var2.offset,
					type = if p2.inlineTags[var4] then nodeTypeModule.InlineSpan else nodeTypeModule.Block
				})
			end
		elseif var2.name == "OPEN" and var2.capture then
			local var6 = var2.capture[1]
			local var7 = var2.capture[2]
			
			if var2.capture and var6 == "br" then
				insert(var3.children, {
					name = "BREAK",
					children = {},
					offset = var2.offset,
					type = getNodeTypeModule("BREAK", p2)
				})
			else
				insert(list, {
					name = "TAG",
					text = var6,
					attributes = if var7 then t.parseXmlAttributes(var7) else {},
					children = {},
					offset = var2.offset,
					type = if p2.inlineTags[var6] then nodeTypeModule.InlineSpan else nodeTypeModule.Block
				})
			end
		elseif var2.name == "CLOSE" and var2.capture then
			local var8 = var2.capture[1]
			assert(t.closeNode(list, function(p3)
				-- upvalues: var8 (ref), var2 (ref)
				if p3.name == "TAG" then
					assert(p3.text == var8, `Found <{p3.text}> at {p3.offset} when trying to close </{var8}> at {var2.offset}`)
					
					return true
				end
				return false
			end), `No open tag exists trying to close </{var8}> at {var2.offset}`)
		else
			insert(var3.children, {
				name = var2.name,
				text = var2.text,
				children = {},
				offset = var2.offset,
				type = getNodeTypeModule(var2.name, p2)
			})
		end
		var1 += 1
	end
	t.closeNode(list, function(p3)
		-- upvalues: isNodeBlockModule (copy)
		return isNodeBlockModule(p3)
	end)
	t.closeNode(list, function(p3)
		return p3.name == "ROOT"
	end)
	
	return t_1
end

function t.closeNode(p3, p4)
	-- upvalues: t (ref), insert (ref)
	local var9 = t.findLastNodeIndex(p3, p4)
	
	if not var9 then
		return nil
	end
	local var10 = p3[var9]
	
	for i = var9 + 1, #p3 do
		insert(var10.children, p3[i])
	end
	for _ = var9 + 1, #p3 do
		table.remove(p3)
	end
	local var11 = p3[var9 - 1]
	
	if var11 then
		table.remove(p3)
		insert(var11.children, var10)
	end
	return var10
end

function t.findLastNodeIndex(p5, p6)
	for i = #p5, 1, -1 do
		local var12
		local var13 = p5[i]
		
		if typeof(p6) == "string" then
			var12 = var13.name == p6
			var12 = nil
		else
			var12 = p6(var13)
		end
		if not var12 then
			continue
		end
		return i
	end
	return nil
end

function t.parseXmlAttributes(p7)
	local t = {}
	
	for i, v in p7:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]+)\"%s*") do
		t[i] = v
	end
	return t
end

return t.buildTree