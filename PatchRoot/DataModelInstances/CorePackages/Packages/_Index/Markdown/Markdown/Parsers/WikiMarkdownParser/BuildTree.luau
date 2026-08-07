-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

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

function t.buildTree(p0, p1) --[[ line: 21 ]]
	-- upvalues: nodeTypeModule (ref), getNodeTypeModule (ref), insert (ref), STYLED_TEXT (ref), t (ref), LISTS (ref), isNodeBlockModule (ref), DIVIDERS (ref)
	local t_1 = {
		name = "ROOT",
		offset = 1,
		children = {},
		type = nodeTypeModule.Root
	}
	local list = { t_1 }
	local var8 = 1
	while var8 <= #p0 do
		local var9 = p0[var8]
		local var10 = list[#list]
		
		if var9.name == "CODE_BLOCK" and var9.capture then
			insert(var10.children, {
				name = "CODE_BLOCK",
				text = string.gsub(var9.capture[2], "^%s*(.-)%s*$", "%1"),
				children = {},
				attributes = { language = var9.capture[1] },
				offset = var9.offset,
				type = getNodeTypeModule("CODE_BLOCK", p1)
			})
		elseif var9.name == "INLINE_CODE" and var9.capture then
			insert(var10.children, {
				name = "STYLED_TEXT",
				attributes = { style = "INLINE_CODE" },
				children = {
					{
						name = "TEXT",
						text = var9.capture[1],
						children = {},
						offset = var9.offset,
						type = getNodeTypeModule("TEXT", p1)
					}
				},
				offset = var9.offset,
				type = getNodeTypeModule("STYLED_TEXT", p1)
			})
		elseif STYLED_TEXT[var9.name] then
			if not t.closeNode(list, function(p2) --[[ line: 70 ]]
				-- upvalues: var9 (ref)
				if p2.name == "STYLED_TEXT" and p2.attributes and p2.attributes.style then
					assert(p2.attributes.style == var9.name, `Can't put {var9.name} at {var9.offset} inside {p2.attributes.style} at {p2.offset}`)
					
					return true
				end
				return false
			end) then
				insert(list, {
					name = "STYLED_TEXT",
					attributes = { style = var9.name },
					children = {},
					offset = var9.offset,
					type = getNodeTypeModule("STYLED_TEXT", p1)
				})
			end
		elseif LISTS[var9.name] and var9.capture then
			t.closeNode(list, function(p3) --[[ line: 95 ]]
				-- upvalues: isNodeBlockModule (copy)
				return isNodeBlockModule(p3)
			end)
			insert(list, {
				name = "LIST_ITEM",
				children = {},
				attributes = { depth = #var9.capture[1], prefix = var9.capture[2] },
				offset = var9.offset,
				type = getNodeTypeModule("LIST_ITEM", p1)
			})
		elseif var9.isBlock then
			t.closeNode(list, function(p4) --[[ line: 111 ]]
				-- upvalues: isNodeBlockModule (copy)
				return isNodeBlockModule(p4)
			end)
			local t_2 = {}
			
			if var9.name == "HEADING" and var9.capture then
				t_2.depth = #var9.capture[1]
			end
			insert(if DIVIDERS[var9.name] then list[#list].children else list, {
				name = var9.name,
				children = {},
				attributes = t_2,
				offset = var9.offset,
				type = getNodeTypeModule(var9.name, p1)
			})
		elseif var9.name == "ESCAPE" and var9.capture then
			insert(var10.children, {
				name = "TEXT",
				text = var9.capture[1],
				offset = var9.offset,
				children = {},
				type = getNodeTypeModule("TEXT", p1)
			})
		elseif var9.name == "LINK" and var9.capture then
			insert(var10.children, {
				name = "LINK",
				text = var9.capture[1],
				url = var9.capture[2],
				offset = var9.offset,
				children = {
					{
						name = "TEXT",
						text = var9.capture[1],
						offset = string.find(var9.text, var9.capture[1], 1, true) or var9.offset,
						children = {},
						type = getNodeTypeModule("TEXT", p1)
					}
				},
				type = getNodeTypeModule("LINK", p1)
			})
		elseif var9.name == "IMAGE" and var9.capture then
			insert(var10.children, {
				name = var9.name,
				text = var9.capture[1],
				url = var9.capture[2],
				offset = var9.offset,
				children = {},
				type = getNodeTypeModule("IMAGE", p1)
			})
		elseif var9.name == "OPEN_CLOSE" and var9.capture then
			local var15 = var9.capture[1]
			local var16 = var9.capture[2]
			
			if var9.capture and var15 == "br" then
				insert(var10.children, {
					name = "BREAK",
					children = {},
					offset = var9.offset,
					type = getNodeTypeModule("BREAK", p1)
				})
			else
				insert(var10.children, {
					name = "TAG",
					text = var15,
					attributes = if var16 then t.parseXmlAttributes(var16) else {},
					children = {},
					offset = var9.offset,
					type = if p1.inlineTags[var15] then nodeTypeModule.InlineSpan else nodeTypeModule.Block
				})
			end
		elseif var9.name == "OPEN" and var9.capture then
			local var13 = var9.capture[1]
			local var14 = var9.capture[2]
			
			if var9.capture and var13 == "br" then
				insert(var10.children, {
					name = "BREAK",
					children = {},
					offset = var9.offset,
					type = getNodeTypeModule("BREAK", p1)
				})
			else
				insert(list, {
					name = "TAG",
					text = var13,
					attributes = if var14 then t.parseXmlAttributes(var14) else {},
					children = {},
					offset = var9.offset,
					type = if p1.inlineTags[var13] then nodeTypeModule.InlineSpan else nodeTypeModule.Block
				})
			end
		elseif var9.name == "CLOSE" and var9.capture then
			local var12 = var9.capture[1]
			assert(t.closeNode(list, function(p5) --[[ line: 209 ]]
				-- upvalues: var12 (ref), var9 (ref)
				if p5.name == "TAG" then
					assert(p5.text == var12, `Found <{p5.text}> at {p5.offset} when trying to close </{var12}> at {var9.offset}`)
					
					return true
				end
				return false
			end), `No open tag exists trying to close </{var12}> at {var9.offset}`)
		else
			insert(var10.children, {
				name = var9.name,
				text = var9.text,
				children = {},
				offset = var9.offset,
				type = getNodeTypeModule(var9.name, p1)
			})
		end
		var8 += 1
	end
	t.closeNode(list, function(p6) --[[ line: 234 ]]
		-- upvalues: isNodeBlockModule (copy)
		return isNodeBlockModule(p6)
	end)
	t.closeNode(list, function(p7) --[[ line: 238 ]]
		return p7.name == "ROOT"
	end)
	
	return t_1
end

function t.closeNode(p8, p9) --[[ line: 245 ]]
	-- upvalues: t (ref), insert (ref)
	local var17 = t.findLastNodeIndex(p8, p9)
	
	if not var17 then
		return nil
	end
	local var18 = p8[var17]
	
	for i = var17 + 1, #p8 do
		insert(var18.children, p8[i])
	end
	for _ = var17 + 1, #p8 do
		table.remove(p8)
	end
	local var19 = p8[var17 - 1]
	
	if var19 then
		table.remove(p8)
		insert(var19.children, var18)
	end
	return var18
end

function t.findLastNodeIndex(p10, p11) --[[ line: 272 ]]
	for i = #p10, 1, -1 do
		local var21
		local var20 = p10[i]
		
		if typeof(p11) == "string" then
			var21 = var20.name == p11
			var21 = nil
		else
			var21 = p11(var20)
		end
		if not var21 then
			continue
		end
		return i
	end
	return nil
end

function t.parseXmlAttributes(p12) --[[ line: 284 ]]
	local t = {}
	
	for i, v in p12:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]+)\"%s*") do
		t[i] = v
	end
	return t
end

return t.buildTree