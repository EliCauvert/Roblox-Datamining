local _ = require(script:FindFirstAncestor("Markdown").Types)
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

function t.postProcessTree(Node, p1)
	-- upvalues: CONTAINERS (copy), INLINETEXT (copy), t (copy), InsertFunction (copy), PLAINTEXT (copy), IsNodeBlockModule (copy), trimLeadingWhitespace (copy)
	local t1 = {}
	local Total = 1
	local Children = Node.children
	local InlineTag = Node.name == "TAG" and p1.inlineTags[Node.text]
	local NoInlineTag: boolean = CONTAINERS[Node.name] and not InlineTag
	while Total <= #Children do
		local Child = Children[Total]
		local InlineTag1 = Child.name == "TAG" and (Child.text and p1.inlineTags[Child.text])
		
		if (INLINETEXT[Child.name] or InlineTag1) and NoInlineTag then
			local Paragraph, Paragraph2 = t.buildParagraph(Children, Total, p1)
			assert(Paragraph > 0, "Did not find an inline node when expected")
			
			if #Paragraph2.children > 0 then
				InsertFunction(t1, Paragraph2)
			end
			Total += Paragraph
		elseif PLAINTEXT[Child.name] then
			local MergeTextNodesResult, MergeTextNodesResult2 = t.mergeTextNodes(Children, Total, nil, p1)
			assert(MergeTextNodesResult > 0, "Did not find a text node when expected")
			
			if MergeTextNodesResult2.text and #MergeTextNodesResult2.text > 0 then
				InsertFunction(t1, MergeTextNodesResult2)
			end
			Total += MergeTextNodesResult
		elseif Child.name == "LIST_ITEM" then
			local List, List2 = t.buildList(Children, Total, p1)
			InsertFunction(t1, List2)
			assert(List > 0, "Did not find a list node when expected")
			Total += List
		elseif Child.name == "TABLE_ROW" then
			local Table1, Table2 = t.buildTable(Children, Total, p1)
			InsertFunction(t1, Table2)
			assert(Table1 > 0, "Did not find a table row node when expected")
			Total += Table1
		elseif Child.name == "QUOTE" then
			local Quote, Quote2 = t.buildQuote(Children, Total, p1)
			InsertFunction(t1, Quote2)
			assert(Quote > 0, "Did not find a quote node when expected")
			Total += Quote
		elseif Child.name == "LINE_BREAK" then
			Total += 1
		else
			Child.children = t.postProcessTree(Child, p1)
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

function t.buildParagraph(Children, Total: number, p2, p3)
	-- upvalues: INLINETEXT (copy), PLAINTEXT (copy), t (copy), InsertFunction (copy), trimLeadingWhitespace (copy), GetNodeTypeModule (copy)
	local Children1 = {}
	local Count = 0
	local Count1: number = Total
	while Count1 <= #Children do
		local Child = Children[Count1]
		local InlineTag = Child.name == "TAG" and (Child.text and p2.inlineTags[Child.text])
		local INLINETEXTEntry = INLINETEXT[Child.name] or InlineTag
		
		if PLAINTEXT[Child.name] then
			local MergeTextNodesResult, MergeTextNodesResult2 = t.mergeTextNodes(Children, Count1, p3, p2)
			
			if MergeTextNodesResult2.text and #MergeTextNodesResult2.text > 0 then
				InsertFunction(Children1, MergeTextNodesResult2)
			end
			assert(MergeTextNodesResult > 0, "Did not find a rich text node when expected")
			Count += MergeTextNodesResult
			Count1 += MergeTextNodesResult
		elseif Child.name == "STYLED_TEXT" then
			local _, Paragraph2 = t.buildParagraph(Child.children, 1, p2, true)
			
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
			InsertFunction(Children1, Child)
			Count += 1
			Count1 += 1
		end
	end
	if not p3 then
		local Child = Children[Total - 1]
		Children1 = trimLeadingWhitespace(Children1, not (Child and Child.name == "TAG"))
	end
	return Count, {
		name = "PARAGRAPH",
		children = Children1,
		offset = Children[Total].offset,
		type = GetNodeTypeModule("PARAGRAPH", p2)
	}
end

function t.outputRichText(p4, p5)
	-- upvalues: STYLEDTEXT (copy), t (copy)
	local STYLEDTEXTEntry = if p4.attributes then STYLEDTEXT[p4.attributes.style] else nil
	
	if STYLEDTEXTEntry then
		local MergeTextNodesResult, MergeTextNodesResult2 = t.mergeTextNodes(p4.children, 1, nil, p5)
		assert(MergeTextNodesResult == #p4.children, `Found non-inline content inside inline element at {p4.offset}`)
		
		return `<{STYLEDTEXTEntry}>{MergeTextNodesResult2.text}</{STYLEDTEXTEntry}>`
	elseif p4.text then
		return p4.text
	else
		assert(false, `No text for node at {p4.offset}`)
	end
end

function t.buildList(Children, Count, p6)
	-- upvalues: t (copy), InsertFunction (copy), GetNodeTypeModule (copy)
	local Count1 = 0
	local Depth = Children[Count].attributes.depth
	local Children1 = {}
	local Count2: number = Count
	while Count2 <= #Children do
		local Child = Children[Count2]
		
		if Child.name ~= "LIST_ITEM" then break end
		if Child.attributes.depth == Depth then
			Child.children = t.postProcessTree(Child, p6)
			InsertFunction(Children1, Child)
			Count1 += 1
			Count2 += 1
		else
			if Depth >= Child.attributes.depth then break end
			local List, List2 = t.buildList(Children, Count2, p6)
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
		type = GetNodeTypeModule("LIST", p6)
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

function t.buildQuote(Children, Total, p7)
	-- upvalues: t (copy), InsertFunction (copy), isEmptyQuoteLine (copy), GetNodeTypeModule (copy)
	local Count = 0
	local t2 = {}
	local Count1: number = Total
	while Count1 <= #Children and Children[Count1].name == "QUOTE" do
		local Child = Children[Count1]
		InsertFunction(t2, { node = Child, children = t.postProcessTree(Child, p7) })
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
				type = GetNodeTypeModule("BREAK", p7)
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

function t.buildTable(Children, Total, p8)
	-- upvalues: t (copy), InsertFunction (copy), GetNodeTypeModule (copy)
	local Count = 0
	local Children1 = {}
	
	for i = Total, #Children do
		local Child = Children[i]
		
		if Child.name ~= "TABLE_ROW" then break end
		local TableCells = t.buildTableCells(Child, p8)
		
		if TableCells then
			Child.children = TableCells
			InsertFunction(Children1, Child)
		elseif #Children1 > 0 then
			Children1[#Children1].name = "TABLE_HEADER"
		end
		Count += 1
	end
	return Count, {
		name = "TABLE",
		children = Children1,
		offset = Children[Total].offset,
		type = GetNodeTypeModule("TABLE", p8)
	}
end

function t.buildTableCells(p9, p10)
	-- upvalues: GetNodeTypeModule (copy), t (copy), InsertFunction (copy)
	local t3 = {}
	local Children = {}
	local v1 = true
	local Child = p9.children[1]
	
	for i = 1, #p9.children do
		local Child1 = p9.children[i]
		
		if Child1.name == "TABLE_DIVIDER" then
			local config = {
				name = "TABLE_CELL",
				children = Children,
				offset = if Children[1] then Children[1].offset else p9.offset,
				type = GetNodeTypeModule("TABLE_CELL", p10)
			}
			config.children = t.postProcessTree(config, p10)
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

function t.mergeTextNodes(Children, Count, p11, p12)
	-- upvalues: PLAINTEXT (copy), GetNodeTypeModule (copy)
	local Text = ""
	local Count1 = 0
	
	for i = Count, #Children do
		local Child = Children[i]
		
		if not PLAINTEXT[Child.name] then break end
		Text ..= Child.text
		Count1 += 1
	end
	if not p11 then
		Text = Text:gsub("^\n*(.-)\n*$", "%1")
	end
	return Count1, {
		name = "TEXT",
		text = Text,
		children = {},
		offset = Children[Count].offset,
		type = GetNodeTypeModule("TEXT", p12)
	}
end

function t.applyCodeSpanRules(Children)
	local v3 = nil
	local v4 = nil
	local Flag = false
	
	for _, child in Children do
		if child.text and #child.text > 0 then
			if v3 == nil then
				v3 = child
			end
			v4 = child
			
			if child.text:find("[^\n ]") then
				Flag = true
			end
		end
	end
	if v3 == nil or v4 == nil then
		return Children
	end
	local Text = (v3.text or ""):gsub("\n", " ")
	local Text1 = (v4.text or ""):gsub("\n", " ")
	
	if Text:sub(1, 1) == " " and Text1:sub(-1, -1) == " " and Flag then
		if v3 == v4 then
			Text = Text:sub(2, -2)
			Text1 = Text
		else
			Text = Text:sub(2)
			Text1 = Text1:sub(1, -2)
		end
	end
	v3.text = Text
	v4.text = Text1
	
	return Children
end

return t.postProcessTree