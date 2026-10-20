local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Types)
local ConstantsModule = require(script.Parent.Parent.Constants)
local LISTS = ConstantsModule.LISTS
local STYLEDTEXT = ConstantsModule.STYLED_TEXT
local DIVIDERS = ConstantsModule.DIVIDERS
local NodeTypeModule = require(Markdown.Enums.NodeType)
local GetNodeTypeModule = require(script.Parent.Parent.getNodeType)
local IsNodeBlockModule = require(script.Parent.Parent.isNodeBlock)
local InsertFunction = table.insert
local t = {}

local function createTextNode(TextNode, p1)
	-- upvalues: GetNodeTypeModule (copy)
	return {
		name = "TEXT",
		text = TextNode.text,
		children = {},
		offset = TextNode.offset,
		type = GetNodeTypeModule("TEXT", p1)
	}
end

function t.buildTree(p1, p2)
	-- upvalues: NodeTypeModule (copy), GetNodeTypeModule (copy), InsertFunction (copy), t (copy), STYLEDTEXT (copy), createTextNode (copy), LISTS (copy), IsNodeBlockModule (copy), DIVIDERS (copy)
	local config = {
		name = "ROOT",
		offset = 1,
		children = {},
		type = NodeTypeModule.Root
	}
	local list = { config }
	local Count = 1
	while Count <= #p1 do
		local TextNode = p1[Count]
		local Entry = list[#list]
		
		if TextNode.name == "CODE_BLOCK" and TextNode.capture then
			InsertFunction(Entry.children, {
				name = "CODE_BLOCK",
				text = string.gsub(TextNode.capture[2], "^%s*(.-)%s*$", "%1"),
				children = {},
				attributes = { language = TextNode.capture[1] },
				offset = TextNode.offset,
				type = GetNodeTypeModule("CODE_BLOCK", p2)
			})
		elseif TextNode.name == "EMPHASIS_START" then
			InsertFunction(list, {
				name = "STYLED_TEXT",
				attributes = { style = TextNode.text },
				children = {},
				offset = TextNode.offset,
				type = GetNodeTypeModule("STYLED_TEXT", p2)
			})
		elseif TextNode.name == "EMPHASIS_END" then
			t.closeNode(list, function(p3): boolean
				return p3.name == "STYLED_TEXT"
			end)
		elseif STYLEDTEXT[TextNode.name] then
			InsertFunction(Entry.children, (createTextNode(TextNode, p2)))
		elseif LISTS[TextNode.name] and TextNode.capture then
			t.closeNode(list, function(p3)
				-- upvalues: IsNodeBlockModule (upval)
				return IsNodeBlockModule(p3)
			end)
			InsertFunction(list, {
				name = "LIST_ITEM",
				children = {},
				attributes = {
					depth = #TextNode.capture[1],
					prefix = TextNode.capture[2]
				},
				offset = TextNode.offset,
				type = GetNodeTypeModule("LIST_ITEM", p2)
			})
		elseif TextNode.name == "HEADING" and not TextNode.isBlock then
			if not t.closeNode(list, function(p3): boolean
				return p3.name == "HEADING"
			end) then
				InsertFunction(Entry.children, (createTextNode(TextNode, p2)))
			end
		elseif TextNode.isBlock then
			t.closeNode(list, function(p3)
				-- upvalues: IsNodeBlockModule (upval)
				return IsNodeBlockModule(p3)
			end)
			local Children = if DIVIDERS[TextNode.name] then list[#list].children else list
			local Attributes = {}
			local Children1 = {}
			
			if TextNode.name == "HEADING" and TextNode.capture then
				Attributes.depth = #TextNode.capture[1]
			end
			InsertFunction(Children, {
				name = TextNode.name,
				children = Children1,
				attributes = Attributes,
				offset = TextNode.offset,
				type = GetNodeTypeModule(TextNode.name, p2)
			})
		elseif TextNode.name == "ESCAPE" and TextNode.capture then
			InsertFunction(Entry.children, {
				name = "TEXT",
				text = TextNode.capture[1],
				offset = TextNode.offset,
				children = {},
				type = GetNodeTypeModule("TEXT", p2)
			})
		elseif TextNode.name == "LINK_START" and TextNode.capture then
			InsertFunction(list, {
				name = "LINK",
				text = TextNode.capture[1],
				attributes = { url = TextNode.capture[2], title = TextNode.capture[3] },
				children = {},
				offset = TextNode.offset,
				type = GetNodeTypeModule("LINK", p2)
			})
		elseif TextNode.name == "LINK_END" then
			t.closeNode(list, function(p3): boolean
				return p3.name == "LINK"
			end)
		elseif TextNode.name == "IMAGE" and TextNode.capture then
			InsertFunction(Entry.children, {
				name = TextNode.name,
				text = TextNode.capture[1],
				attributes = { url = TextNode.capture[2], title = TextNode.capture[3] },
				offset = TextNode.offset,
				children = {},
				type = GetNodeTypeModule("IMAGE", p2)
			})
		elseif TextNode.name == "OPEN_CLOSE" and TextNode.capture then
			local CaptureEntry = TextNode.capture[1]
			local CaptureEntry1 = TextNode.capture[2]
			
			if TextNode.capture and CaptureEntry == "br" then
				InsertFunction(Entry.children, {
					name = "BREAK",
					children = {},
					offset = TextNode.offset,
					type = GetNodeTypeModule("BREAK", p2)
				})
			else
				InsertFunction(Entry.children, {
					name = "TAG",
					text = CaptureEntry,
					attributes = if CaptureEntry1 then t.parseXmlAttributes(CaptureEntry1) else {},
					children = {},
					offset = TextNode.offset,
					type = if p2.inlineTags[CaptureEntry] then NodeTypeModule.InlineSpan else NodeTypeModule.Block
				})
			end
		elseif TextNode.name == "OPEN" and TextNode.capture then
			local CaptureEntry = TextNode.capture[1]
			local CaptureEntry2 = TextNode.capture[2]
			
			if TextNode.capture and CaptureEntry == "br" then
				InsertFunction(Entry.children, {
					name = "BREAK",
					children = {},
					offset = TextNode.offset,
					type = GetNodeTypeModule("BREAK", p2)
				})
			else
				InsertFunction(list, {
					name = "TAG",
					text = CaptureEntry,
					attributes = if CaptureEntry2 then t.parseXmlAttributes(CaptureEntry2) else {},
					children = {},
					offset = TextNode.offset,
					type = if p2.inlineTags[CaptureEntry] then NodeTypeModule.InlineSpan else NodeTypeModule.Block
				})
			end
		elseif TextNode.name == "CLOSE" and TextNode.capture then
			local CaptureEntry = TextNode.capture[1]
			assert(t.closeNode(list, function(TextNode1): boolean
				-- upvalues: CaptureEntry (copy), TextNode (copy)
				if TextNode1.name == "TAG" then
					assert(TextNode1.text == CaptureEntry, `Found <{TextNode1.text}> at {TextNode1.offset} when trying to close </{CaptureEntry}> at {TextNode.offset}`)
					
					return true
				else
					return false
				end
			end), `No open tag exists trying to close </{CaptureEntry}> at {TextNode.offset}`)
		elseif Entry.name == "HEADING" then
			local FoundAt: number? = string.find(TextNode.text, "\n", 1, true)
			
			if not FoundAt then
				InsertFunction(Entry.children, {
					name = TextNode.name,
					text = TextNode.text,
					children = {},
					offset = TextNode.offset,
					type = GetNodeTypeModule(TextNode.name, p2)
				})
				Count += 1
				continue
			else
				local Segment = string.sub(TextNode.text, 1, FoundAt - 1)
				local Segment1 = string.sub(TextNode.text, FoundAt + 1)
				
				if string.find(Segment1, "%S") == nil then
					InsertFunction(Entry.children, {
						name = TextNode.name,
						text = TextNode.text,
						children = {},
						offset = TextNode.offset,
						type = GetNodeTypeModule(TextNode.name, p2)
					})
					Count += 1
					continue
				else
					InsertFunction(Entry.children, {
						name = TextNode.name,
						text = Segment,
						children = {},
						offset = TextNode.offset,
						type = GetNodeTypeModule(TextNode.name, p2)
					})
					t.closeNode(list, function(p3): boolean
						return p3.name == "HEADING"
					end)
					InsertFunction(list, {
						name = "PARAGRAPH",
						children = {
							{
								name = "TEXT",
								text = Segment1,
								children = {},
								offset = TextNode.offset + FoundAt + 1,
								type = GetNodeTypeModule("TEXT", p2)
							}
						},
						offset = TextNode.offset,
						type = GetNodeTypeModule("PARAGRAPH", p2)
					})
				end
			end
		else
			InsertFunction(Entry.children, {
				name = TextNode.name,
				text = TextNode.text,
				children = {},
				offset = TextNode.offset,
				type = GetNodeTypeModule(TextNode.name, p2)
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
		local v1 = p4[i]
		
		if if typeof(Callback) == "string" then v1.name == Callback else Callback(v1) then
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