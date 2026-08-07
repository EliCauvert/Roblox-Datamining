-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:45 2026 Pacific Standard Time.

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

local function createTextNode(p0, p1) --[[ line: 23 ]]
	-- upvalues: getNodeTypeModule (ref)
	return {
		name = "TEXT",
		text = p0.text,
		children = {},
		offset = p0.offset,
		type = getNodeTypeModule("TEXT", p1)
	}
end

function t.buildTree(p2, p3) --[[ line: 34 ]]
	-- upvalues: nodeTypeModule (ref), getNodeTypeModule (ref), insert (ref), t (ref), STYLED_TEXT (ref), createTextNode (ref), LISTS (ref), isNodeBlockModule (ref), DIVIDERS (ref)
	local t_1 = {
		name = "ROOT",
		offset = 1,
		children = {},
		type = nodeTypeModule.Root
	}
	local list = { t_1 }
	local var9 = 1
	while var9 <= #p2 do
		local var10 = p2[var9]
		local var11 = list[#list]
		
		if var10.name == "CODE_BLOCK" and var10.capture then
			insert(var11.children, {
				name = "CODE_BLOCK",
				text = string.gsub(var10.capture[2], "^%s*(.-)%s*$", "%1"),
				children = {},
				attributes = { language = var10.capture[1] },
				offset = var10.offset,
				type = getNodeTypeModule("CODE_BLOCK", p3)
			})
		elseif var10.name == "EMPHASIS_START" then
			insert(list, {
				name = "STYLED_TEXT",
				attributes = { style = var10.text },
				children = {},
				offset = var10.offset,
				type = getNodeTypeModule("STYLED_TEXT", p3)
			})
		elseif var10.name == "EMPHASIS_END" then
			t.closeNode(list, function(p4) --[[ line: 76 ]]
				return p4.name == "STYLED_TEXT"
			end)
		elseif STYLED_TEXT[var10.name] then
			insert(var11.children, createTextNode(var10, p3))
		elseif LISTS[var10.name] and var10.capture then
			t.closeNode(list, function(p5) --[[ line: 85 ]]
				-- upvalues: isNodeBlockModule (copy)
				return isNodeBlockModule(p5)
			end)
			insert(list, {
				name = "LIST_ITEM",
				children = {},
				attributes = { depth = #var10.capture[1], prefix = var10.capture[2] },
				offset = var10.offset,
				type = getNodeTypeModule("LIST_ITEM", p3)
			})
		elseif var10.name == "HEADING" and not var10.isBlock then
			if not t.closeNode(list, function(p6) --[[ line: 101 ]]
				return p6.name == "HEADING"
			end) then
				insert(var11.children, createTextNode(var10, p3))
			end
		elseif var10.isBlock then
			t.closeNode(list, function(p7) --[[ line: 110 ]]
				-- upvalues: isNodeBlockModule (copy)
				return isNodeBlockModule(p7)
			end)
			local var12 = if DIVIDERS[var10.name] then list[#list].children else list
			local t_2 = {}
			local t_3 = {}
			
			if var10.name == "HEADING" and var10.capture then
				t_2.depth = #var10.capture[1]
			end
			insert(var12, {
				name = var10.name,
				children = t_3,
				attributes = t_2,
				offset = var10.offset,
				type = getNodeTypeModule(var10.name, p3)
			})
		elseif var10.name == "ESCAPE" and var10.capture then
			insert(var11.children, {
				name = "TEXT",
				text = var10.capture[1],
				offset = var10.offset,
				children = {},
				type = getNodeTypeModule("TEXT", p3)
			})
		elseif var10.name == "LINK_START" and var10.capture then
			insert(list, {
				name = "LINK",
				text = var10.capture[1],
				attributes = { url = var10.capture[2], title = var10.capture[3] },
				children = {},
				offset = var10.offset,
				type = getNodeTypeModule("LINK", p3)
			})
		elseif var10.name == "LINK_END" then
			t.closeNode(list, function(p8) --[[ line: 153 ]]
				return p8.name == "LINK"
			end)
		elseif var10.name == "IMAGE" and var10.capture then
			insert(var11.children, {
				name = var10.name,
				text = var10.capture[1],
				attributes = { url = var10.capture[2], title = var10.capture[3] },
				offset = var10.offset,
				children = {},
				type = getNodeTypeModule("IMAGE", p3)
			})
		elseif var10.name == "OPEN_CLOSE" and var10.capture then
			local var21 = var10.capture[1]
			local var22 = var10.capture[2]
			
			if var10.capture and var21 == "br" then
				insert(var11.children, {
					name = "BREAK",
					children = {},
					offset = var10.offset,
					type = getNodeTypeModule("BREAK", p3)
				})
			else
				insert(var11.children, {
					name = "TAG",
					text = var21,
					attributes = if var22 then t.parseXmlAttributes(var22) else {},
					children = {},
					offset = var10.offset,
					type = if p3.inlineTags[var21] then nodeTypeModule.InlineSpan else nodeTypeModule.Block
				})
			end
		elseif var10.name == "OPEN" and var10.capture then
			local var19 = var10.capture[1]
			local var20 = var10.capture[2]
			
			if var10.capture and var19 == "br" then
				insert(var11.children, {
					name = "BREAK",
					children = {},
					offset = var10.offset,
					type = getNodeTypeModule("BREAK", p3)
				})
			else
				insert(list, {
					name = "TAG",
					text = var19,
					attributes = if var20 then t.parseXmlAttributes(var20) else {},
					children = {},
					offset = var10.offset,
					type = if p3.inlineTags[var19] then nodeTypeModule.InlineSpan else nodeTypeModule.Block
				})
			end
		elseif var10.name == "CLOSE" and var10.capture then
			local var18 = var10.capture[1]
			assert(t.closeNode(list, function(p9) --[[ line: 213 ]]
				-- upvalues: var18 (ref), var10 (ref)
				if p9.name == "TAG" then
					assert(p9.text == var18, `Found <{p9.text}> at {p9.offset} when trying to close </{var18}> at {var10.offset}`)
					
					return true
				end
				return false
			end), `No open tag exists trying to close </{var18}> at {var10.offset}`)
		elseif var11.name == "HEADING" then
			local matchIndex = string.find(var10.text, "\n", 1, true)
			
			if matchIndex then
				local substring = string.sub(var10.text, 1, matchIndex - 1)
				local substring_1 = string.sub(var10.text, matchIndex + 1)
				
				if string.find(substring_1, "%S") == nil then
					insert(var11.children, {
						name = var10.name,
						text = var10.text,
						children = {},
						offset = var10.offset,
						type = getNodeTypeModule(var10.name, p3)
					})
					var9 += 1
				else
					insert(var11.children, {
						name = var10.name,
						text = substring,
						children = {},
						offset = var10.offset,
						type = getNodeTypeModule(var10.name, p3)
					})
					t.closeNode(list, function(p10) --[[ line: 264 ]]
						return p10.name == "HEADING"
					end)
					insert(list, {
						name = "PARAGRAPH",
						children = {
							{
								name = "TEXT",
								text = substring_1,
								children = {},
								offset = var10.offset + matchIndex + 1,
								type = getNodeTypeModule("TEXT", p3)
							}
						},
						offset = var10.offset,
						type = getNodeTypeModule("PARAGRAPH", p3)
					})
				end
			else
				insert(var11.children, {
					name = var10.name,
					text = var10.text,
					children = {},
					offset = var10.offset,
					type = getNodeTypeModule(var10.name, p3)
				})
				var9 += 1
			end
		else
			insert(var11.children, {
				name = var10.name,
				text = var10.text,
				children = {},
				offset = var10.offset,
				type = getNodeTypeModule(var10.name, p3)
			})
		end
		var9 += 1
	end
	t.closeNode(list, function(p11) --[[ line: 294 ]]
		-- upvalues: isNodeBlockModule (copy)
		return isNodeBlockModule(p11)
	end)
	t.closeNode(list, function(p12) --[[ line: 298 ]]
		return p12.name == "ROOT"
	end)
	
	return t_1
end

function t.closeNode(p13, p14) --[[ line: 305 ]]
	-- upvalues: t (ref), insert (ref)
	local var23 = t.findLastNodeIndex(p13, p14)
	
	if not var23 then
		return nil
	end
	local var24 = p13[var23]
	
	for i = var23 + 1, #p13 do
		insert(var24.children, p13[i])
	end
	for _ = var23 + 1, #p13 do
		table.remove(p13)
	end
	local var25 = p13[var23 - 1]
	
	if var25 then
		table.remove(p13)
		insert(var25.children, var24)
	end
	return var24
end

function t.findLastNodeIndex(p15, p16) --[[ line: 332 ]]
	for i = #p15, 1, -1 do
		local var27
		local var26 = p15[i]
		
		if typeof(p16) == "string" then
			var27 = var26.name == p16
			var27 = nil
		else
			var27 = p16(var26)
		end
		if not var27 then
			continue
		end
		return i
	end
	return nil
end

function t.parseXmlAttributes(p17) --[[ line: 344 ]]
	local t = {}
	
	for i, v in p17:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]+)\"%s*") do
		t[i] = v
	end
	return t
end

return t.buildTree