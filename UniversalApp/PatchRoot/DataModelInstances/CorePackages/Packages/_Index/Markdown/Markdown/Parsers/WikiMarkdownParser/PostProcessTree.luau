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

function t.postProcessTree(p1, p2) --[[ Line: 23 ]]
	-- upvalues: CONTAINERS (copy), INLINETEXT (copy), t (copy), InsertFunction (copy), PLAINTEXT (copy), IsNodeBlockModule (copy)
	local t1 = {}
	local Total = 1
	local Children = p1.children
	local InlineTag = p1.name == "TAG" and p2.inlineTags[p1.text]
	local NoInlineTag: boolean = CONTAINERS[p1.name] and not InlineTag
	while Total <= #Children do
		local Child = Children[Total]
		local InlineTag1 = Child.name == "TAG" and (Child.text and p2.inlineTags[Child.text])
		
		if (INLINETEXT[Child.name] or InlineTag1) and NoInlineTag then
			local Paragraph, Paragraph2 = t.buildParagraph(Children, Total, p2)
			assert(Paragraph > 0, "Did not find an inline node when expected")
			
			if #Paragraph2.children > 0 then
				InsertFunction(t1, Paragraph2)
			end
			Total += Paragraph
		elseif PLAINTEXT[Child.name] then
			local MergeTextNodesResult, MergeTextNodesResult2 = t.mergeTextNodes(Children, Total, p2)
			assert(MergeTextNodesResult > 0, "Did not find a text node when expected")
			
			if MergeTextNodesResult2.text and #MergeTextNodesResult2.text > 0 then
				InsertFunction(t1, MergeTextNodesResult2)
			end
			Total += MergeTextNodesResult
		elseif Child.name == "LIST_ITEM" then
			local List, List2 = t.buildList(Children, Total, p2)
			InsertFunction(t1, List2)
			assert(List > 0, "Did not find a list node when expected")
			Total += List
		elseif Child.name == "TABLE_ROW" then
			local Table1, Table2 = t.buildTable(Children, Total, p2)
			InsertFunction(t1, Table2)
			assert(Table1 > 0, "Did not find a table row node when expected")
			Total += Table1
		elseif Child.name == "LINE_BREAK" then
			Total += 1
		else
			Child.children = t.postProcessTree(Child, p2)
			InsertFunction(t1, Child)
			Total += 1
		end
	end
	if IsNodeBlockModule(p1) then
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

function t.buildParagraph(Children, Total, p3) --[[ Line: 87 ]]
	-- upvalues: INLINETEXT (copy), PLAINTEXT (copy), t (copy), InsertFunction (copy), GetNodeTypeModule (copy)
	local Children1 = {}
	local Count = 0
	local Count1: number = Total
	while Count1 <= #Children do
		local Child = Children[Count1]
		local InlineTag = Child.name == "TAG" and (Child.text and p3.inlineTags[Child.text])
		local INLINETEXTEntry = INLINETEXT[Child.name] or InlineTag
		
		if PLAINTEXT[Child.name] then
			local MergeTextNodesResult, MergeTextNodesResult2 = t.mergeTextNodes(Children, Count1, p3)
			
			if MergeTextNodesResult2.text and #MergeTextNodesResult2.text > 0 then
				InsertFunction(Children1, MergeTextNodesResult2)
			end
			assert(MergeTextNodesResult > 0, "Did not find a rich text node when expected")
			Count += MergeTextNodesResult
			Count1 += MergeTextNodesResult
		else
			if not INLINETEXTEntry then break end
			InsertFunction(Children1, Child)
			Count += 1
			Count1 += 1
		end
	end
	return Count, {
		name = "PARAGRAPH",
		children = Children1,
		offset = Children[Total].offset,
		type = GetNodeTypeModule("PARAGRAPH", p3)
	}
end

function t.outputRichText(p4, p5) --[[ Line: 123 ]]
	-- upvalues: STYLEDTEXT (copy), t (copy)
	local STYLEDTEXTEntry = if p4.attributes then STYLEDTEXT[p4.attributes.style] else nil
	
	if STYLEDTEXTEntry then
		local MergeTextNodesResult, MergeTextNodesResult2 = t.mergeTextNodes(p4.children, 1, p5)
		assert(MergeTextNodesResult == #p4.children, `Found non-inline content inside inline element at {p4.offset}`)
		
		return `<{STYLEDTEXTEntry}>{MergeTextNodesResult2.text}</{STYLEDTEXTEntry}>`
	elseif p4.text then
		return p4.text
	else
		assert(false, `No text for node at {p4.offset}`)
	end
end

function t.buildList(Children, Count, p6) --[[ Line: 137 ]]
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

function t.buildTable(Children, Total, p7) --[[ Line: 177 ]]
	-- upvalues: t (copy), InsertFunction (copy), GetNodeTypeModule (copy)
	local Count = 0
	local Children1 = {}
	
	for i = Total, #Children do
		local Child = Children[i]
		
		if Child.name ~= "TABLE_ROW" then break end
		local TableCells = t.buildTableCells(Child, p7)
		
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
		type = GetNodeTypeModule("TABLE", p7)
	}
end

function t.buildTableCells(p8, p9) --[[ Line: 207 ]]
	-- upvalues: GetNodeTypeModule (copy), t (copy), InsertFunction (copy)
	local t2 = {}
	local Children = {}
	local v1 = true
	local Child = p8.children[1]
	
	for i = 1, #p8.children do
		local Child1 = p8.children[i]
		
		if Child1.name == "TABLE_DIVIDER" then
			local config = {
				name = "TABLE_CELL",
				children = Children,
				offset = if Children[1] then Children[1].offset else p8.offset,
				type = GetNodeTypeModule("TABLE_CELL", p9)
			}
			config.children = t.postProcessTree(config, p9)
			InsertFunction(t2, config)
			local v2: boolean = Child.text and Child.text:match("^[ \t-=]+$") ~= nil
			v1 = v1 and v2 or false
			Children = {}
		else
			InsertFunction(Children, Child1)
		end
	end
	return if v1 then nil else t2
end

function t.mergeTextNodes(Children, Count, p10) --[[ Line: 240 ]]
	-- upvalues: PLAINTEXT (copy), GetNodeTypeModule (copy)
	local Text = ""
	local Count1 = 0
	
	for i = Count, #Children do
		local Child = Children[i]
		
		if not PLAINTEXT[Child.name] then break end
		Text ..= Child.text
		Count1 += 1
	end
	return Count1, {
		name = "TEXT",
		text = Text:gsub("^\n*(.-)\n*$", "%1"),
		children = {},
		offset = Children[Count].offset,
		type = GetNodeTypeModule("TEXT", p10)
	}
end

return t.postProcessTree