local markdown = script:FindFirstAncestor("Markdown")
local _ = require(markdown.Types)
local constantsModule = require(script.Parent.Parent.Constants)
local LISTS = constantsModule.LISTS
local STYLED_TEXT = constantsModule.STYLED_TEXT
local DIVIDERS = constantsModule.DIVIDERS
local nodeTypeModule = require(markdown.Enums.NodeType)
local getNodeTypeModule = require(script.Parent.Parent.getNodeType)
local isNodeBlockModule = require(script.Parent.Parent.isNodeBlock)
local insert = table.insert
local t = {}

local function createTextNode(p1, p2)
	-- upvalues: getNodeTypeModule (ref)
	return {
		name = "TEXT",
		text = p1.text,
		children = {},
		offset = p1.offset,
		type = getNodeTypeModule("TEXT", p2)
	}
end

function t.buildTree(p1, p2)
	-- upvalues: nodeTypeModule (ref), getNodeTypeModule (ref), insert (ref), t (ref), STYLED_TEXT (ref), createTextNode (ref), LISTS (ref), isNodeBlockModule (ref), DIVIDERS (ref)
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
		elseif var2.name == "EMPHASIS_START" then
			insert(list, {
				name = "STYLED_TEXT",
				attributes = { style = var2.text },
				children = {},
				offset = var2.offset,
				type = getNodeTypeModule("STYLED_TEXT", p2)
			})
		elseif var2.name == "EMPHASIS_END" then
			t.closeNode(list, function(p1)
				return p1.name == "STYLED_TEXT"
			end)
		elseif STYLED_TEXT[var2.name] then
			insert(var3.children, createTextNode(var2, p2))
		elseif LISTS[var2.name] and var2.capture then
			t.closeNode(list, function(p1)
				-- upvalues: isNodeBlockModule (copy)
				return isNodeBlockModule(p1)
			end)
			insert(list, {
				name = "LIST_ITEM",
				children = {},
				attributes = { depth = #var2.capture[1], prefix = var2.capture[2] },
				offset = var2.offset,
				type = getNodeTypeModule("LIST_ITEM", p2)
			})
		elseif var2.name == "HEADING" and not var2.isBlock then
			if not t.closeNode(list, function(p1)
				return p1.name == "HEADING"
			end) then
				insert(var3.children, createTextNode(var2, p2))
			end
		elseif var2.isBlock then
			t.closeNode(list, function(p1)
				-- upvalues: isNodeBlockModule (copy)
				return isNodeBlockModule(p1)
			end)
			local var4 = if DIVIDERS[var2.name] then list[#list].children else list
			local t_2 = {}
			local t_3 = {}
			
			if var2.name == "HEADING" and var2.capture then
				t_2.depth = #var2.capture[1]
			end
			insert(var4, {
				name = var2.name,
				children = t_3,
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
		elseif var2.name == "LINK_START" and var2.capture then
			insert(list, {
				name = "LINK",
				text = var2.capture[1],
				attributes = { url = var2.capture[2], title = var2.capture[3] },
				children = {},
				offset = var2.offset,
				type = getNodeTypeModule("LINK", p2)
			})
		elseif var2.name == "LINK_END" then
			t.closeNode(list, function(p1)
				return p1.name == "LINK"
			end)
		elseif var2.name == "IMAGE" and var2.capture then
			insert(var3.children, {
				name = var2.name,
				text = var2.capture[1],
				attributes = { url = var2.capture[2], title = var2.capture[3] },
				offset = var2.offset,
				children = {},
				type = getNodeTypeModule("IMAGE", p2)
			})
		elseif var2.name == "OPEN_CLOSE" and var2.capture then
			local var5 = var2.capture[1]
			local var6 = var2.capture[2]
			
			if var2.capture and var5 == "br" then
				insert(var3.children, {
					name = "BREAK",
					children = {},
					offset = var2.offset,
					type = getNodeTypeModule("BREAK", p2)
				})
			else
				insert(var3.children, {
					name = "TAG",
					text = var5,
					attributes = if var6 then t.parseXmlAttributes(var6) else {},
					children = {},
					offset = var2.offset,
					type = if p2.inlineTags[var5] then nodeTypeModule.InlineSpan else nodeTypeModule.Block
				})
			end
		elseif var2.name == "OPEN" and var2.capture then
			local var7 = var2.capture[1]
			local var8 = var2.capture[2]
			
			if var2.capture and var7 == "br" then
				insert(var3.children, {
					name = "BREAK",
					children = {},
					offset = var2.offset,
					type = getNodeTypeModule("BREAK", p2)
				})
			else
				insert(list, {
					name = "TAG",
					text = var7,
					attributes = if var8 then t.parseXmlAttributes(var8) else {},
					children = {},
					offset = var2.offset,
					type = if p2.inlineTags[var7] then nodeTypeModule.InlineSpan else nodeTypeModule.Block
				})
			end
		elseif var2.name == "CLOSE" and var2.capture then
			local var9 = var2.capture[1]
			assert(t.closeNode(list, function(p1)
				-- upvalues: var9 (ref), var2 (ref)
				if p1.name == "TAG" then
					assert(p1.text == var9, `Found <{p1.text}> at {p1.offset} when trying to close </{var9}> at {var2.offset}`)
					
					return true
				end
				return false
			end), `No open tag exists trying to close </{var9}> at {var2.offset}`)
		elseif var3.name == "HEADING" then
			local matchIndex = string.find(var2.text, "\n", 1, true)
			
			if matchIndex then
				local substring = string.sub(var2.text, 1, matchIndex - 1)
				local substring_1 = string.sub(var2.text, matchIndex + 1)
				
				if string.find(substring_1, "%S") == nil then
					insert(var3.children, {
						name = var2.name,
						text = var2.text,
						children = {},
						offset = var2.offset,
						type = getNodeTypeModule(var2.name, p2)
					})
					var1 += 1
				else
					insert(var3.children, {
						name = var2.name,
						text = substring,
						children = {},
						offset = var2.offset,
						type = getNodeTypeModule(var2.name, p2)
					})
					t.closeNode(list, function(p1)
						return p1.name == "HEADING"
					end)
					insert(list, {
						name = "PARAGRAPH",
						children = {
							{
								name = "TEXT",
								text = substring_1,
								children = {},
								offset = var2.offset + matchIndex + 1,
								type = getNodeTypeModule("TEXT", p2)
							}
						},
						offset = var2.offset,
						type = getNodeTypeModule("PARAGRAPH", p2)
					})
				end
			else
				insert(var3.children, {
					name = var2.name,
					text = var2.text,
					children = {},
					offset = var2.offset,
					type = getNodeTypeModule(var2.name, p2)
				})
				var1 += 1
			end
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
	t.closeNode(list, function(p1)
		-- upvalues: isNodeBlockModule (copy)
		return isNodeBlockModule(p1)
	end)
	t.closeNode(list, function(p1)
		return p1.name == "ROOT"
	end)
	
	return t_1
end

function t.closeNode(p1, p2)
	-- upvalues: t (ref), insert (ref)
	local var1 = t.findLastNodeIndex(p1, p2)
	
	if not var1 then
		return nil
	end
	local var2 = p1[var1]
	
	for i = var1 + 1, #p1 do
		insert(var2.children, p1[i])
	end
	for _ = var1 + 1, #p1 do
		table.remove(p1)
	end
	local var3 = p1[var1 - 1]
	
	if var3 then
		table.remove(p1)
		insert(var3.children, var2)
	end
	return var2
end

function t.findLastNodeIndex(p1, p2)
	for i = #p1, 1, -1 do
		local var1
		local var2 = p1[i]
		
		if typeof(p2) == "string" then
			var1 = var2.name == p2
			var1 = nil
		else
			var1 = p2(var2)
		end
		if not var1 then
			continue
		end
		return i
	end
	return nil
end

function t.parseXmlAttributes(p1)
	local t = {}
	
	for i, v in p1:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]+)\"%s*") do
		t[i] = v
	end
	return t
end

return t.buildTree