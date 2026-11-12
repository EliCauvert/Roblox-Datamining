local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Types)
local ConstantsModule = require(script.Parent.Parent.Constants)
local LISTS = ConstantsModule.LISTS
local STYLEDTEXT = ConstantsModule.STYLED_TEXT
local DIVIDERS = ConstantsModule.DIVIDERS
local InsertFunction = table.insert
local NodeTypeModule = require(Markdown.Enums.NodeType)
local GetNodeTypeModule = require(script.Parent.Parent.getNodeType)
local IsNodeBlockModule = require(script.Parent.Parent.isNodeBlock)
local t = {}

function t.buildTree(p1, p2)
	-- upvalues: NodeTypeModule (copy), GetNodeTypeModule (copy), InsertFunction (copy), STYLEDTEXT (copy), t (copy), LISTS (copy), IsNodeBlockModule (copy), DIVIDERS (copy)
	local config = {
		name = "ROOT",
		offset = 1,
		children = {},
		type = NodeTypeModule.Root
	}
	local list = { config }
	local Count = 1
	while Count <= #p1 do
		local v1 = p1[Count]
		local Entry = list[#list]
		
		if v1.name == "CODE_BLOCK" and v1.capture then
			InsertFunction(Entry.children, {
				name = "CODE_BLOCK",
				text = string.gsub(v1.capture[2], "^%s*(.-)%s*$", "%1"),
				children = {},
				attributes = { language = v1.capture[1] },
				offset = v1.offset,
				type = GetNodeTypeModule("CODE_BLOCK", p2)
			})
		elseif v1.name == "INLINE_CODE" and v1.capture then
			InsertFunction(Entry.children, {
				name = "STYLED_TEXT",
				attributes = { style = "INLINE_CODE" },
				children = {
					{
						name = "TEXT",
						text = v1.capture[1],
						children = {},
						offset = v1.offset,
						type = GetNodeTypeModule("TEXT", p2)
					}
				},
				offset = v1.offset,
				type = GetNodeTypeModule("STYLED_TEXT", p2)
			})
		elseif STYLEDTEXT[v1.name] then
			if not t.closeNode(list, function(p3): boolean
				-- upvalues: v1 (copy)
				if p3.name == "STYLED_TEXT" and p3.attributes and p3.attributes.style then
					assert(p3.attributes.style == v1.name, `Can't put {v13.name} at {v13.offset} inside {p2.attributes.style} at {p2.offset}`)
					
					return true
				else
					return false
				end
			end) then
				InsertFunction(list, {
					name = "STYLED_TEXT",
					attributes = { style = v1.name },
					children = {},
					offset = v1.offset,
					type = GetNodeTypeModule("STYLED_TEXT", p2)
				})
			end
		elseif LISTS[v1.name] and v1.capture then
			t.closeNode(list, function(p3)
				-- upvalues: IsNodeBlockModule (upval)
				return IsNodeBlockModule(p3)
			end)
			InsertFunction(list, {
				name = "LIST_ITEM",
				children = {},
				attributes = { depth = #v1.capture[1], prefix = v1.capture[2] },
				offset = v1.offset,
				type = GetNodeTypeModule("LIST_ITEM", p2)
			})
		elseif v1.isBlock then
			t.closeNode(list, function(p3)
				-- upvalues: IsNodeBlockModule (upval)
				return IsNodeBlockModule(p3)
			end)
			local Attributes = {}
			
			if v1.name == "HEADING" and v1.capture then
				Attributes.depth = #v1.capture[1]
			end
			InsertFunction(if DIVIDERS[v1.name] then list[#list].children else list, {
				name = v1.name,
				children = {},
				attributes = Attributes,
				offset = v1.offset,
				type = GetNodeTypeModule(v1.name, p2)
			})
		elseif v1.name == "ESCAPE" and v1.capture then
			InsertFunction(Entry.children, {
				name = "TEXT",
				text = v1.capture[1],
				offset = v1.offset,
				children = {},
				type = GetNodeTypeModule("TEXT", p2)
			})
		elseif v1.name == "LINK" and v1.capture then
			InsertFunction(Entry.children, {
				name = "LINK",
				text = v1.capture[1],
				url = v1.capture[2],
				offset = v1.offset,
				children = {
					{
						name = "TEXT",
						text = v1.capture[1],
						offset = string.find(v1.text, v1.capture[1], 1, true) or v1.offset,
						children = {},
						type = GetNodeTypeModule("TEXT", p2)
					}
				},
				type = GetNodeTypeModule("LINK", p2)
			})
		elseif v1.name == "IMAGE" and v1.capture then
			InsertFunction(Entry.children, {
				name = v1.name,
				text = v1.capture[1],
				url = v1.capture[2],
				offset = v1.offset,
				children = {},
				type = GetNodeTypeModule("IMAGE", p2)
			})
		elseif v1.name == "OPEN_CLOSE" and v1.capture then
			local CaptureEntry = v1.capture[1]
			local CaptureEntry1 = v1.capture[2]
			
			if v1.capture and CaptureEntry == "br" then
				InsertFunction(Entry.children, {
					name = "BREAK",
					children = {},
					offset = v1.offset,
					type = GetNodeTypeModule("BREAK", p2)
				})
			else
				InsertFunction(Entry.children, {
					name = "TAG",
					text = CaptureEntry,
					attributes = if CaptureEntry1 then t.parseXmlAttributes(CaptureEntry1) else {},
					children = {},
					offset = v1.offset,
					type = if p2.inlineTags[CaptureEntry] then NodeTypeModule.InlineSpan else NodeTypeModule.Block
				})
			end
		elseif v1.name == "OPEN" and v1.capture then
			local CaptureEntry = v1.capture[1]
			local CaptureEntry2 = v1.capture[2]
			
			if v1.capture and CaptureEntry == "br" then
				InsertFunction(Entry.children, {
					name = "BREAK",
					children = {},
					offset = v1.offset,
					type = GetNodeTypeModule("BREAK", p2)
				})
			else
				InsertFunction(list, {
					name = "TAG",
					text = CaptureEntry,
					attributes = if CaptureEntry2 then t.parseXmlAttributes(CaptureEntry2) else {},
					children = {},
					offset = v1.offset,
					type = if p2.inlineTags[CaptureEntry] then NodeTypeModule.InlineSpan else NodeTypeModule.Block
				})
			end
		elseif v1.name == "CLOSE" and v1.capture then
			local CaptureEntry = v1.capture[1]
			assert(t.closeNode(list, function(p3): boolean
				-- upvalues: CaptureEntry (copy), v1 (copy)
				if p3.name == "TAG" then
					assert(p3.text == CaptureEntry, `Found <{p3.text}> at {p3.offset} when trying to close </{CaptureEntry}> at {v1.offset}`)
					
					return true
				else
					return false
				end
			end), `No open tag exists trying to close </{CaptureEntry}> at {v1.offset}`)
		else
			InsertFunction(Entry.children, {
				name = v1.name,
				text = v1.text,
				children = {},
				offset = v1.offset,
				type = GetNodeTypeModule(v1.name, p2)
			})
		end
		Count += 1
	end
	t.closeNode(list, function(p3)
		-- upvalues: IsNodeBlockModule (upval)
		return IsNodeBlockModule(p3)
	end)
	t.closeNode(list, function(p3): boolean
		return p3.name == "ROOT"
	end)
	
	return config
end

function t.closeNode(List, p3)
	-- upvalues: t (copy), InsertFunction (copy)
	local LastNodeIndex: number = t.findLastNodeIndex(List, p3)
	
	if not LastNodeIndex then
		return nil
	end
	local Entry = List[LastNodeIndex]
	
	for i = LastNodeIndex + 1, #List do
		InsertFunction(Entry.children, List[i])
	end
	for _ = LastNodeIndex + 1, #List do
		table.remove(List)
	end
	local Entry1 = List[LastNodeIndex - 1]
	
	if Entry1 then
		table.remove(List)
		InsertFunction(Entry1.children, Entry)
	end
	return Entry
end

function t.findLastNodeIndex(p4, Callback): number?
	for i = #p4, 1, -1 do
		local v2 = p4[i]
		
		if if typeof(Callback) == "string" then v2.name == Callback else Callback(v2) then
			return i
		end
	end
	return nil
end

function t.parseXmlAttributes(CaptureEntry: string)
	local t = {}
	
	for i, value in CaptureEntry:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]+)\"%s*") do
		t[i] = value
	end
	return t
end

return t.buildTree