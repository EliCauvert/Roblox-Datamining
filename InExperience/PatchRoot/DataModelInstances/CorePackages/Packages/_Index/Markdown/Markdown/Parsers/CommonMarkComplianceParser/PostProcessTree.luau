local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Types)
local Flags = require(Markdown.Parent.MarkdownCore).Flags
local NodeTypeModule = require(Markdown.Enums.NodeType)
local TableAlignmentModule = require(Markdown.Enums.TableAlignment)
local InsertFunction = table.insert
local ConstantsModule = require(script.Parent.Parent.Constants)
local CONTAINERS = ConstantsModule.CONTAINERS
local INLINETEXT = ConstantsModule.INLINE_TEXT
local PLAINTEXT = ConstantsModule.PLAIN_TEXT
local STYLEDTEXT = ConstantsModule.STYLED_TEXT
local GetNodeTypeModule = require(script.Parent.Parent.getNodeType)
local IsNodeBlockModule = require(script.Parent.Parent.isNodeBlock)
local t = {}

local function trimLeadingWhitespace(Children, IsSegmentMatch)
	-- upvalues: InsertFunction (copy)
	local t = {}
	local IsSegmentMatch1: boolean = IsSegmentMatch
	
	for _, child in Children do
		if IsSegmentMatch1 and child.name == "TEXT" and child.text then
			child.text = child.text:gsub("^[ \t]+", "")
			
			if #child.text == 0 then
				continue
			end
		end
		IsSegmentMatch1 = child.name == "BREAK" and (child.text ~= nil and string.sub(child.text, -1) == "\n")
		InsertFunction(t, child)
	end
	return t
end

local function makeContentInline(p1, p2)
	-- upvalues: NodeTypeModule (copy), GetNodeTypeModule (copy), makeContentInline (copy)
	if p1.name == "TAG" then
		p1.type = NodeTypeModule.InlineSpan
	elseif p1.name == "DIVIDER" then
		p1.name = "BREAK"
		p1.type = GetNodeTypeModule("BREAK", p2)
	end
	for _, child in p1.children do
		makeContentInline(child, p2)
	end
end

function t.postProcessTree(Node, p3)
	-- upvalues: Flags (copy), NodeTypeModule (copy), CONTAINERS (copy), makeContentInline (copy), INLINETEXT (copy), t (copy), InsertFunction (copy), PLAINTEXT (copy), IsNodeBlockModule (copy), trimLeadingWhitespace (copy)
	local t1 = {}
	local Total = 1
	local Children = Node.children
	local InlineTag = Node.name == "TAG" and (p3.inlineTags[Node.text] or Flags.FFlagMarkdownTagFallbacks and Node.type == NodeTypeModule.InlineSpan)
	local NoInlineTag: boolean = CONTAINERS[Node.name] and not InlineTag
	local IsTypeMatch: boolean = Flags.FFlagMarkdownTagFallbacks and (Node.type == NodeTypeModule.TextBlock or Node.type == NodeTypeModule.InlineSpan)
	while Total <= #Children do
		local Child = Children[Total]
		
		if IsTypeMatch and Child.name == "TAG" then
			makeContentInline(Child, p3)
		end
		local InlineTag1 = Child.name == "TAG" and (Child.text and p3.inlineTags[Child.text])
		
		if (INLINETEXT[Child.name] or InlineTag1) and NoInlineTag then
			local Paragraph, Paragraph2 = t.buildParagraph(Children, Total, p3)
			assert(Paragraph > 0, "Did not find an inline node when expected")
			
			if #Paragraph2.children > 0 then
				InsertFunction(t1, Paragraph2)
			end
			Total += Paragraph
		elseif PLAINTEXT[Child.name] then
			local MergeTextNodesResult, MergeTextNodesResult2 = t.mergeTextNodes(Children, Total, nil, p3)
			assert(MergeTextNodesResult > 0, "Did not find a text node when expected")
			
			if MergeTextNodesResult2.text and #MergeTextNodesResult2.text > 0 then
				InsertFunction(t1, MergeTextNodesResult2)
			end
			Total += MergeTextNodesResult
		elseif Child.name == "LIST_ITEM" then
			local List, List2 = t.buildList(Children, Total, p3)
			InsertFunction(t1, List2)
			assert(List > 0, "Did not find a list node when expected")
			Total += List
		elseif Child.name == "TABLE_ROW" then
			local Table1, Table2 = t.buildTable(Children, Total, p3)
			InsertFunction(t1, Table2)
			assert(Table1 > 0, "Did not find a table row node when expected")
			Total += Table1
		elseif Child.name == "QUOTE" then
			local Quote, Quote2 = t.buildQuote(Children, Total, p3)
			InsertFunction(t1, Quote2)
			assert(Quote > 0, "Did not find a quote node when expected")
			Total += Quote
		elseif Child.name == "LINE_BREAK" then
			Total += 1
		else
			Child.children = t.postProcessTree(Child, p3)
			InsertFunction(t1, Child)
			Total += 1
		end
	end
	if IsNodeBlockModule(Node) then
		t1 = trimLeadingWhitespace(t1, false)
		local Entry = t1[1]
		
		if Entry and Entry.text then
			Entry.text = Entry.text:gsub("^%s+", "")
		end
		local Entry1 = t1[#t1]
		
		if Entry1 and Entry1.text then
			Entry1.text = Entry1.text:gsub("%s+$", "")
		end
	end
	return t1
end

function t.buildParagraph(Children, Total: number, p4, p5)
	-- upvalues: INLINETEXT (copy), PLAINTEXT (copy), t (copy), InsertFunction (copy), trimLeadingWhitespace (copy), Flags (copy), makeContentInline (copy), GetNodeTypeModule (copy)
	local Children1 = {}
	local Count = 0
	local Count1: number = Total
	while Count1 <= #Children do
		local Child = Children[Count1]
		local InlineTag = Child.name == "TAG" and (Child.text and p4.inlineTags[Child.text])
		local INLINETEXTEntry = INLINETEXT[Child.name] or InlineTag
		
		if PLAINTEXT[Child.name] then
			local MergeTextNodesResult, MergeTextNodesResult2 = t.mergeTextNodes(Children, Count1, p5, p4)
			
			if MergeTextNodesResult2.text and #MergeTextNodesResult2.text > 0 then
				InsertFunction(Children1, MergeTextNodesResult2)
			end
			assert(MergeTextNodesResult > 0, "Did not find a rich text node when expected")
			Count += MergeTextNodesResult
			Count1 += MergeTextNodesResult
		elseif Child.name == "STYLED_TEXT" then
			local _, Paragraph2 = t.buildParagraph(Child.children, 1, p4, true)
			
			if Child.attributes and Child.attributes.style == "INLINE_CODE" then
				Child.children = t.applyCodeSpanRules(Paragraph2.children)
			else
				Child.children = trimLeadingWhitespace(Paragraph2.children, false)
			end
			InsertFunction(Children1, Child)
			Count += 1
			Count1 += 1
		else
			if not INLINETEXTEntry then break end
			if Flags.FFlagMarkdownTagFallbacks and Child.name == "TAG" then
				makeContentInline(Child, p4)
			end
			InsertFunction(Children1, Child)
			Count += 1
			Count1 += 1
		end
	end
	if not p5 then
		local Child = Children[Total - 1]
		Children1 = trimLeadingWhitespace(Children1, not (Child and Child.name == "TAG"))
	end
	return Count, {
		name = "PARAGRAPH",
		children = Children1,
		offset = Children[Total].offset,
		type = GetNodeTypeModule("PARAGRAPH", p4)
	}
end

function t.outputRichText(p6, p7)
	-- upvalues: STYLEDTEXT (copy), t (copy)
	local STYLEDTEXTEntry = if p6.attributes then STYLEDTEXT[p6.attributes.style] else nil
	
	if STYLEDTEXTEntry then
		local MergeTextNodesResult, MergeTextNodesResult2 = t.mergeTextNodes(p6.children, 1, nil, p7)
		assert(MergeTextNodesResult == #p6.children, `Found non-inline content inside inline element at {p6.offset}`)
		
		return `<{STYLEDTEXTEntry}>{MergeTextNodesResult2.text}</{STYLEDTEXTEntry}>`
	elseif p6.text then
		return p6.text
	else
		assert(false, `No text for node at {p6.offset}`)
	end
end

function t.buildList(Children, Count, p8)
	-- upvalues: t (copy), InsertFunction (copy), GetNodeTypeModule (copy)
	local Count1 = 0
	local Depth = Children[Count].attributes.depth
	local Children1 = {}
	local Count2: number = Count
	while Count2 <= #Children do
		local Child = Children[Count2]
		
		if Child.name ~= "LIST_ITEM" then break end
		if Child.attributes.depth == Depth then
			Child.children = t.postProcessTree(Child, p8)
			InsertFunction(Children1, Child)
			Count1 += 1
			Count2 += 1
		else
			if Depth >= Child.attributes.depth then break end
			local List, List2 = t.buildList(Children, Count2, p8)
			InsertFunction(Children1, List2)
			assert(List > 0, "Did not find a list node when expected")
			Count2 += List
			Count1 += List
		end
	end
	return Count1, {
		name = "LIST",
		attributes = { depth = Depth },
		children = Children1,
		offset = Children[Count].offset,
		type = GetNodeTypeModule("LIST", p8)
	}
end

local function isEmptyQuoteLine(Children): boolean
	for _, child in Children do
		if child.name ~= "TEXT" or child.text and #child.text > 0 then
			return false
		end
	end
	return true
end

function t.buildQuote(Children, Total, p9)
	-- upvalues: t (copy), InsertFunction (copy), isEmptyQuoteLine (copy), GetNodeTypeModule (copy)
	local Count = 0
	local t2 = {}
	local Count1: number = Total
	while Count1 <= #Children and Children[Count1].name == "QUOTE" do
		local Child = Children[Count1]
		InsertFunction(t2, { node = Child, children = t.postProcessTree(Child, p9) })
		Count += 1
		Count1 += 1
	end
	local Count2 = 1
	local CountT1 = #t2
	while Count2 <= CountT1 and isEmptyQuoteLine(t2[Count2].children) do
		Count2 += 1
	end
	while Count2 <= CountT1 and isEmptyQuoteLine(t2[CountT1].children) do
		CountT1 -= 1
	end
	local Children1 = {}
	
	for i = Count2, CountT1 do
		local Entry = t2[i]
		
		if Count2 < i then
			InsertFunction(Children1, {
				name = "BREAK",
				children = {},
				offset = Entry.node.offset,
				type = GetNodeTypeModule("BREAK", p9)
			})
		end
		for _, child in Entry.children do
			if child.name ~= "TEXT" or child.text ~= "" then
				InsertFunction(Children1, child)
			end
		end
	end
	local Child = Children[Total]
	Child.children = Children1
	
	return Count, Child
end

local function buildTableCellsLegacy(p10, p11)
	-- upvalues: GetNodeTypeModule (copy), t (copy), InsertFunction (copy)
	local t3 = {}
	local Children = {}
	local v1 = true
	local Child = p10.children[1]
	
	for i = 1, #p10.children do
		local Child1 = p10.children[i]
		
		if Child1.name == "TABLE_DIVIDER" then
			local config = {
				name = "TABLE_CELL",
				children = Children,
				offset = if Children[1] then Children[1].offset else p10.offset,
				type = GetNodeTypeModule("TABLE_CELL", p11)
			}
			config.children = t.postProcessTree(config, p11)
			InsertFunction(t3, config)
			local v2: boolean = Child.text and Child.text:match("^[ \t-=]+$") ~= nil
			v1 = v1 and v2 or false
			Children = {}
		else
			InsertFunction(Children, Child1)
		end
	end
	return if v1 then nil else t3
end

local function buildTableLegacy(p12, p13, p14)
	-- upvalues: buildTableCellsLegacy (copy), InsertFunction (copy), GetNodeTypeModule (copy)
	local Count = 0
	local Children = {}
	
	for i = p13, #p12 do
		local v3 = p12[i]
		
		if v3.name ~= "TABLE_ROW" then break end
		local TableCellsLegacy = buildTableCellsLegacy(v3, p14)
		
		if TableCellsLegacy then
			v3.children = TableCellsLegacy
			InsertFunction(Children, v3)
		elseif #Children > 0 then
			Children[#Children].name = "TABLE_HEADER"
		end
		Count += 1
	end
	return Count, {
		name = "TABLE",
		children = Children,
		offset = p12[p13].offset,
		type = GetNodeTypeModule("TABLE", p14)
	}
end

local function getDelimiterAlignment(p15)
	-- upvalues: TableAlignmentModule (copy)
	local Text = ""
	
	for _, child in p15.children do
		Text ..= child.text or ""
	end
	local Match: string = string.match(Text, "^%s*(.-)%s*$") or ""
	local IsSegmentMatch = string.sub(Match, 1, 1) == ":"
	local IsSegmentMatch1 = string.sub(Match, -1) == ":"
	
	return if IsSegmentMatch and IsSegmentMatch1 then TableAlignmentModule.Center elseif IsSegmentMatch1 then TableAlignmentModule.Right elseif IsSegmentMatch then TableAlignmentModule.Left else nil
end

function t.buildTable(Children, Total, p16)
	-- upvalues: Flags (copy), buildTableLegacy (copy), t (copy), getDelimiterAlignment (copy), InsertFunction (copy), GetNodeTypeModule (copy)
	if not Flags.FFlagMarkdownTables then
		return buildTableLegacy(Children, Total, p16)
	end
	local Count = 0
	local Children1 = {}
	local t4 = {}
	
	for i = Total, #Children do
		local Child = Children[i]
		
		if Child.name ~= "TABLE_ROW" then break end
		local TableCells, TableCells2 = t.buildTableCells(Child, p16)
		
		if TableCells2 and Count == 1 then
			Children1[1].name = "TABLE_HEADER"
			
			for i1, tableCell in TableCells do
				t4[i1] = getDelimiterAlignment(tableCell)
			end
		else
			Child.children = TableCells
			InsertFunction(Children1, Child)
		end
		Count += 1
	end
	if Children1[1] then
		local CountChildren = #Children1[1].children
		
		for _, value in Children1 do
			for _ = #value.children + 1, CountChildren do
				InsertFunction(value.children, t.buildTableCell({}, value, p16))
			end
			for _ = CountChildren + 1, #value.children do
				table.remove(value.children)
			end
			for i2, child in value.children do
				local Entry = t4[i2]
				
				if Entry then
					child.attributes = { alignment = Entry }
				end
			end
		end
	end
	return Count, {
		name = "TABLE",
		children = Children1,
		offset = Children[Total].offset,
		type = GetNodeTypeModule("TABLE", p16)
	}
end

local function isDividerCell(TableCell): boolean
	local Text = ""
	
	for _, child in TableCell.children do
		if child.name ~= "TEXT" then
			return false
		end
		Text ..= child.text or ""
	end
	return Text:match("^%s*:?%-+:?%s*$") ~= nil
end

local function hasContent(List): boolean
	for _, value in List do
		if value.name ~= "TEXT" or value.text and value.text:find("%S") then
			return true
		end
	end
	return false
end

function t.buildTableCell(Entry, p17, p18)
	-- upvalues: GetNodeTypeModule (copy), t (copy)
	local config = {
		name = "TABLE_CELL",
		children = Entry,
		offset = if Entry[1] then Entry[1].offset else p17.offset,
		type = GetNodeTypeModule("TABLE_CELL", p18)
	}
	config.children = t.postProcessTree(config, p18)
	
	return config
end

function t.buildTableCells(p17, p18)
	-- upvalues: t (copy), InsertFunction (copy), isDividerCell (copy), hasContent (copy)
	local t5 = {}
	local Children = {}
	local v4 = true
	
	for i = 1, #p17.children do
		local Child = p17.children[i]
		
		if Child.name == "TABLE_DIVIDER" then
			local TableCell = t.buildTableCell(Children, p17, p18)
			InsertFunction(t5, TableCell)
			v4 = v4 and isDividerCell(TableCell)
			Children = {}
		else
			InsertFunction(Children, Child)
		end
	end
	if hasContent(Children) then
		local TableCell = t.buildTableCell(Children, p17, p18)
		InsertFunction(t5, TableCell)
		v4 = v4 and isDividerCell(TableCell)
	end
	return t5, v4 and #t5 > 0
end

function t.mergeTextNodes(Children, Count, p19, p20)
	-- upvalues: PLAINTEXT (copy), GetNodeTypeModule (copy)
	local Text = ""
	local Count1 = 0
	
	for i = Count, #Children do
		local Child = Children[i]
		
		if not PLAINTEXT[Child.name] then break end
		Text ..= Child.text
		Count1 += 1
	end
	if not p19 then
		Text = Text:gsub("^\n*(.-)\n*$", "%1")
	end
	return Count1, {
		name = "TEXT",
		text = Text,
		children = {},
		offset = Children[Count].offset,
		type = GetNodeTypeModule("TEXT", p20)
	}
end

function t.applyCodeSpanRules(Children)
	local v5 = nil
	local v6 = nil
	local Flag = false
	
	for _, child in Children do
		if child.text and #child.text > 0 then
			if v5 == nil then
				v5 = child
			end
			v6 = child
			
			if child.text:find("[^\n ]") then
				Flag = true
			end
		end
	end
	if v5 == nil or v6 == nil then
		return Children
	end
	local Text = (v5.text or ""):gsub("\n", " ")
	local Text1 = (v6.text or ""):gsub("\n", " ")
	
	if Text:sub(1, 1) == " " and Text1:sub(-1, -1) == " " and Flag then
		if v5 == v6 then
			Text = Text:sub(2, -2)
			Text1 = Text
		else
			Text = Text:sub(2)
			Text1 = Text1:sub(1, -2)
		end
	end
	v5.text = Text
	v6.text = Text1
	
	return Children
end

return t.postProcessTree