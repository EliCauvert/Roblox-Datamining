local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Types)
local ConstantsModule = require(script.Parent.Parent.Constants)
local LISTS = ConstantsModule.LISTS
local STYLEDTEXT = ConstantsModule.STYLED_TEXT
local DIVIDERS = ConstantsModule.DIVIDERS
local NodeTypeModule = require(Markdown.Enums.NodeType)
local GetNodeTypeModule = require(script.Parent.Parent.getNodeType)
local IsNodeBlockModule = require(script.Parent.Parent.isNodeBlock)
local Flags = require(Markdown.Parent.MarkdownCore).Flags
local InsertFunction = table.insert
local config = {
	area = true,
	base = true,
	br = true,
	col = true,
	embed = true,
	hr = true,
	img = true,
	input = true,
	link = true,
	meta = true,
	source = true,
	track = true,
	wbr = true
}
local config1 = { Button = true }
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

local function createHorizontalRuleNode(p1, p2, p3)
	-- upvalues: NodeTypeModule (copy), GetNodeTypeModule (copy)
	local IsTypeMatch: boolean = p2.type == NodeTypeModule.Root or p2.type == NodeTypeModule.Block and p2.name ~= "TABLE_ROW"
	local DIVIDER: string = if IsTypeMatch then "DIVIDER" else "BREAK"
	
	return {
		name = DIVIDER,
		children = {},
		offset = p1.offset,
		type = GetNodeTypeModule(DIVIDER, p3)
	}
end

local function isLineStartAfter(TextNode, p1): boolean
	if TextNode.isBlock then
		return true
	elseif TextNode.name == "TEXT" then
		local Match: string? = string.match(TextNode.text, "\n([^\n]*)$")
		
		return if Match then string.find(Match, "^[ \t]*$") ~= nil else p1 and string.find(TextNode.text, "^[ \t]*$") ~= nil
	else
		return false
	end
end

local function isWellFormedOpenTag(Text: string): boolean
	local Match: string? = string.match(Text, "^<%a[%w%-]*(.-)>$")
	while Match and string.find(Match, "%S") do
		local Match1: string? = string.match(Match, "^%s+[%a_:][%w_%.:%-]*(.*)$")
		
		if not Match1 then
			return false
		end
		Match = string.match(Match1, "^%s*=%s*\"[^\"]*\"(.*)$") or (string.match(Match1, "^%s*=%s*'[^']*'(.*)$") or (string.match(Match1, "^%s*=%s*[^%s\"'=<>`]+(.*)$") or Match1))
	end
	return Match ~= nil
end

local function _(p1, p2, p3)
	-- upvalues: config1 (copy), isWellFormedOpenTag (copy)
	local CaptureEntry = p1.capture[1]
	
	return not config1[CaptureEntry] and (if p3.inlineTags[CaptureEntry] == true then isWellFormedOpenTag(p1.text) else p2 and isWellFormedOpenTag(p1.text))
end

local function findUnpairedTags(List, p1)
	-- upvalues: isLineStartAfter (copy), config (copy), InsertFunction (copy), config1 (copy), isWellFormedOpenTag (copy)
	local t = {}
	local t1 = {}
	local v1 = true
	local IsTABLEROW = false
	local v2 = 1
	
	local function _(p2)
		-- upvalues: t1 (copy), t (copy)
		for i = #t1, p2, -1 do
			t[t1[i].token] = true
			t1[i] = nil
		end
	end
	local v3 = nil
	
	for _, Token in List do
		local StartsLine: boolean = v1
		v1 = isLineStartAfter(Token, v1)
		
		if Token.isBlock then
			if IsTABLEROW then
				for i = #t1, v2, -1 do
					t[t1[i].token] = true
					t1[i] = nil
				end
			end
			for i1, value in t1 do
				if p1.inlineTags[value.tag] then
					for i2 = #t1, i1, -1 do
						t[t1[i2].token] = true
						t1[i2] = nil
					end
					break
				else
					continue
				end
			end
			IsTABLEROW = Token.name == "TABLE_ROW"
			v2 = if IsTABLEROW then #t1 + 1 else 1
		elseif IsTABLEROW and Token.name == "TABLE_DIVIDER" then
			for i3 = #t1, v2, -1 do
				t[t1[i3].token] = true
				t1[i3] = nil
			end
		end
		if Token.capture then
			local CaptureEntry = Token.capture[1]
			
			if Token.name == "OPEN" and not config[CaptureEntry] then
				InsertFunction(t1, {
					token = Token,
					tag = CaptureEntry,
					startsLine = StartsLine
				})
			elseif Token.name == "CLOSE" then
				v3 = nil
				
				for i4 = #t1, v2, -1 do
					if t1[i4].tag ~= CaptureEntry then
						continue
					end
					v3 = i4
					break
				end
				if v3 then
					for i5 = #t1, v3 + 1, -1 do
						t[t1[i5].token] = true
						t1[i5] = nil
					end
					t1[v3] = nil
				else
					t[Token] = true
				end
			end
		end
	end
	for _, value1 in t1 do
		if p1.isStreaming then
			local Token1 = value1.token
			local StartsLine = value1.startsLine
			local CaptureEntry = Token1.capture[1]
			
			if not config1[CaptureEntry] and (if p1.inlineTags[CaptureEntry] == true then isWellFormedOpenTag(Token1.text) else StartsLine and isWellFormedOpenTag(Token1.text)) then
				continue
			end
		end
		t[value1.token] = true
	end
	return t
end

function t.buildTree(p3, p4)
	-- upvalues: Flags (copy), findUnpairedTags (copy), NodeTypeModule (copy), GetNodeTypeModule (copy), InsertFunction (copy), t (copy), config1 (copy), STYLEDTEXT (copy), createTextNode (copy), LISTS (copy), IsNodeBlockModule (copy), DIVIDERS (copy), createHorizontalRuleNode (copy), config (copy)
	local UnpairedTags = if Flags.FFlagMarkdownTagFallbacks then findUnpairedTags(p3, p4) else {}
	local config2 = {
		name = "ROOT",
		offset = 1,
		children = {},
		type = NodeTypeModule.Root
	}
	local list = { config2 }
	local Count = 1
	while Count <= #p3 do
		local TextNode = p3[Count]
		local Entry = list[#list]
		
		if TextNode.name == "CODE_BLOCK" and TextNode.capture then
			InsertFunction(Entry.children, {
				name = "CODE_BLOCK",
				text = string.gsub(TextNode.capture[2], "^%s*(.-)%s*$", "%1"),
				children = {},
				attributes = { language = TextNode.capture[1] },
				offset = TextNode.offset,
				type = GetNodeTypeModule("CODE_BLOCK", p4)
			})
		elseif TextNode.name == "EMPHASIS_START" then
			InsertFunction(list, {
				name = "STYLED_TEXT",
				attributes = { style = TextNode.text },
				children = {},
				offset = TextNode.offset,
				type = GetNodeTypeModule("STYLED_TEXT", p4)
			})
		elseif TextNode.name == "EMPHASIS_END" then
			t.closeNode(list, function(p5): boolean
				return p5.name == "STYLED_TEXT"
			end)
		elseif Flags.FFlagMarkdownTagFallbacks and UnpairedTags[TextNode] and TextNode.name == "OPEN" and TextNode.capture and config1[TextNode.capture[1]] then
			local CaptureEntry = TextNode.capture[2]
			InsertFunction(Entry.children, {
				name = "TAG",
				text = TextNode.capture[1],
				attributes = if CaptureEntry then t.parseXmlAttributes(CaptureEntry) else {},
				children = {},
				offset = TextNode.offset,
				type = NodeTypeModule.Block
			})
		elseif STYLEDTEXT[TextNode.name] or Flags.FFlagMarkdownTagFallbacks and UnpairedTags[TextNode] then
			InsertFunction(Entry.children, (createTextNode(TextNode, p4)))
		elseif LISTS[TextNode.name] and TextNode.capture then
			t.closeNode(list, function(p5)
				-- upvalues: IsNodeBlockModule (upval)
				return IsNodeBlockModule(p5)
			end)
			InsertFunction(list, {
				name = "LIST_ITEM",
				children = {},
				attributes = {
					depth = #TextNode.capture[1],
					prefix = TextNode.capture[2]
				},
				offset = TextNode.offset,
				type = GetNodeTypeModule("LIST_ITEM", p4)
			})
		elseif TextNode.name == "HEADING" and not TextNode.isBlock then
			if not t.closeNode(list, function(p5): boolean
				return p5.name == "HEADING"
			end) then
				InsertFunction(Entry.children, (createTextNode(TextNode, p4)))
			end
		elseif TextNode.isBlock then
			t.closeNode(list, function(p5)
				-- upvalues: IsNodeBlockModule (upval)
				return IsNodeBlockModule(p5)
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
				type = GetNodeTypeModule(TextNode.name, p4)
			})
		elseif TextNode.name == "ESCAPE" and TextNode.capture then
			InsertFunction(Entry.children, {
				name = "TEXT",
				text = TextNode.capture[1],
				offset = TextNode.offset,
				children = {},
				type = GetNodeTypeModule("TEXT", p4)
			})
		elseif TextNode.name == "LINK_START" and TextNode.capture then
			InsertFunction(list, {
				name = "LINK",
				text = TextNode.capture[1],
				attributes = { url = TextNode.capture[2], title = TextNode.capture[3] },
				children = {},
				offset = TextNode.offset,
				type = GetNodeTypeModule("LINK", p4)
			})
		elseif TextNode.name == "LINK_END" then
			t.closeNode(list, function(p5): boolean
				return p5.name == "LINK"
			end)
		elseif TextNode.name == "IMAGE" and TextNode.capture then
			InsertFunction(Entry.children, {
				name = TextNode.name,
				text = TextNode.capture[1],
				attributes = { url = TextNode.capture[2], title = TextNode.capture[3] },
				offset = TextNode.offset,
				children = {},
				type = GetNodeTypeModule("IMAGE", p4)
			})
		elseif TextNode.name == "OPEN_CLOSE" and TextNode.capture then
			local CaptureEntry = TextNode.capture[1]
			local CaptureEntry1 = TextNode.capture[2]
			
			if TextNode.capture and CaptureEntry == "br" then
				InsertFunction(Entry.children, {
					name = "BREAK",
					children = {},
					offset = TextNode.offset,
					type = GetNodeTypeModule("BREAK", p4)
				})
			elseif Flags.FFlagMarkdownTagFallbacks and CaptureEntry == "hr" then
				InsertFunction(Entry.children, (createHorizontalRuleNode(TextNode, Entry, p4)))
			else
				InsertFunction(Entry.children, {
					name = "TAG",
					text = CaptureEntry,
					attributes = if CaptureEntry1 then t.parseXmlAttributes(CaptureEntry1) else {},
					children = {},
					offset = TextNode.offset,
					type = if p4.inlineTags[CaptureEntry] then NodeTypeModule.InlineSpan else NodeTypeModule.Block
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
					type = GetNodeTypeModule("BREAK", p4)
				})
			elseif Flags.FFlagMarkdownTagFallbacks and CaptureEntry == "hr" then
				InsertFunction(Entry.children, (createHorizontalRuleNode(TextNode, Entry, p4)))
			elseif Flags.FFlagMarkdownTagFallbacks and config[CaptureEntry] then
				InsertFunction(Entry.children, {
					name = "TAG",
					text = CaptureEntry,
					attributes = if CaptureEntry2 then t.parseXmlAttributes(CaptureEntry2) else {},
					children = {},
					offset = TextNode.offset,
					type = if p4.inlineTags[CaptureEntry] then NodeTypeModule.InlineSpan else NodeTypeModule.Block
				})
			else
				InsertFunction(list, {
					name = "TAG",
					text = CaptureEntry,
					attributes = if CaptureEntry2 then t.parseXmlAttributes(CaptureEntry2) else {},
					children = {},
					offset = TextNode.offset,
					type = if p4.inlineTags[CaptureEntry] then NodeTypeModule.InlineSpan else NodeTypeModule.Block
				})
			end
		elseif Flags.FFlagMarkdownTagFallbacks and (TextNode.name == "CLOSE" and TextNode.capture) then
			local CaptureEntry = TextNode.capture[1]
			
			if not t.closeNode(list, function(TextNode): boolean
				-- upvalues: CaptureEntry (copy)
				return TextNode.name == "TAG" and TextNode.text == CaptureEntry
			end) then
				InsertFunction(Entry.children, (createTextNode(TextNode, p4)))
			end
		elseif TextNode.name == "CLOSE" and TextNode.capture then
			local CaptureEntry3 = TextNode.capture[1]
			assert(t.closeNode(list, function(TextNode1): boolean
				-- upvalues: CaptureEntry3 (copy), TextNode (copy)
				if TextNode1.name == "TAG" then
					assert(TextNode1.text == CaptureEntry3, `Found <{TextNode1.text}> at {TextNode1.offset} when trying to close </{CaptureEntry3}> at {TextNode.offset}`)
					
					return true
				else
					return false
				end
			end), `No open tag exists trying to close </{CaptureEntry3}> at {TextNode.offset}`)
		elseif Entry.name == "HEADING" then
			local FoundAt: number? = string.find(TextNode.text, "\n", 1, true)
			
			if not FoundAt then
				InsertFunction(Entry.children, {
					name = TextNode.name,
					text = TextNode.text,
					children = {},
					offset = TextNode.offset,
					type = GetNodeTypeModule(TextNode.name, p4)
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
						type = GetNodeTypeModule(TextNode.name, p4)
					})
					Count += 1
					continue
				else
					InsertFunction(Entry.children, {
						name = TextNode.name,
						text = Segment,
						children = {},
						offset = TextNode.offset,
						type = GetNodeTypeModule(TextNode.name, p4)
					})
					t.closeNode(list, function(p5): boolean
						return p5.name == "HEADING"
					end)
					InsertFunction(list, {
						name = "PARAGRAPH",
						children = {
							{
								name = "TEXT",
								text = Segment1,
								children = {},
								offset = TextNode.offset + FoundAt + 1,
								type = GetNodeTypeModule("TEXT", p4)
							}
						},
						offset = TextNode.offset,
						type = GetNodeTypeModule("PARAGRAPH", p4)
					})
				end
			end
		else
			InsertFunction(Entry.children, {
				name = TextNode.name,
				text = TextNode.text,
				children = {},
				offset = TextNode.offset,
				type = GetNodeTypeModule(TextNode.name, p4)
			})
		end
		Count += 1
	end
	t.closeNode(list, function(p5)
		-- upvalues: IsNodeBlockModule (upval)
		return IsNodeBlockModule(p5)
	end)
	t.closeNode(list, function(p5): boolean
		return p5.name == "ROOT"
	end)
	
	return config2
end

function t.closeNode(List, p5)
	-- upvalues: t (copy), InsertFunction (copy)
	local LastNodeIndex: number = t.findLastNodeIndex(List, p5)
	
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

function t.findLastNodeIndex(p6, Callback): number?
	for i = #p6, 1, -1 do
		local v4 = p6[i]
		
		if if typeof(Callback) == "string" then v4.name == Callback else Callback(v4) then
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