local _ = require(script:FindFirstAncestor("Markdown").Types)
local insert = table.insert
local constantsModule = require(script.Parent.Parent.Constants)
local CONTAINERS = constantsModule.CONTAINERS
local INLINE_TEXT = constantsModule.INLINE_TEXT
local PLAIN_TEXT = constantsModule.PLAIN_TEXT
local STYLED_TEXT = constantsModule.STYLED_TEXT
local getNodeTypeModule = require(script.Parent.Parent.getNodeType)
local isNodeBlockModule = require(script.Parent.Parent.isNodeBlock)
local t = {}

function t.postProcessTree(p1, p2)
	-- upvalues: CONTAINERS (ref), INLINE_TEXT (ref), t (ref), insert (ref), PLAIN_TEXT (ref), isNodeBlockModule (ref)
	local var1
	local t_1 = {}
	local var2 = 1
	local children = p1.children
	local var3 = CONTAINERS[p1.name] and not (p1.name == "TAG" and p2.inlineTags[p1.text])
	while var2 <= #children do
		var1 = children[var2]
		
		if (INLINE_TEXT[var1.name] or (var1.name == "TAG" and (var1.text and p2.inlineTags[var1.text]))) and var3 then
			local var4, var5 = t.buildParagraph(children, var2, p2)
			assert(var4 > 0, "Did not find an inline node when expected")
			
			if #var5.children > 0 then
				insert(t_1, var5)
			end
			var2 += var4
		end
		if PLAIN_TEXT[var1.name] then
			local var6, var7 = t.mergeTextNodes(children, var2, nil, p2)
			assert(var6 > 0, "Did not find a text node when expected")
			
			if var7.text and #var7.text > 0 then
				insert(t_1, var7)
			end
			var2 += var6
		elseif var1.name == "LIST_ITEM" then
			local var8, var9 = t.buildList(children, var2, p2)
			insert(t_1, var9)
			assert(var8 > 0, "Did not find a list node when expected")
			var2 += var8
		elseif var1.name == "TABLE_ROW" then
			local var10, var11 = t.buildTable(children, var2, p2)
			insert(t_1, var11)
			assert(var10 > 0, "Did not find a table row node when expected")
			var2 += var10
		elseif var1.name == "LINE_BREAK" then
			var2 += 1
		else
			var1.children = t.postProcessTree(var1, p2)
			insert(t_1, var1)
			var2 += 1
		end
	end
	if isNodeBlockModule(p1) then
		var1 = t_1[1]
		
		if var1 and var1.text then
			var1.text = var1.text:gsub("^%s+", "")
		end
		local var12 = t_1[#t_1]
		
		if var12 and var12.text then
			var12.text = var12.text:gsub("%s+$", "")
		end
	end
	return t_1
end

function t.buildParagraph(p1, p2, p3, p4)
	-- upvalues: INLINE_TEXT (ref), PLAIN_TEXT (ref), t (ref), insert (ref), getNodeTypeModule (ref)
	local var1, name
	local t_1 = {}
	local var2 = 0
	local var3 = p2
	while var3 <= #p1 do
		var1 = p1[var3]
		name = INLINE_TEXT[var1.name] or (var1.name == "TAG" and (var1.text and p3.inlineTags[var1.text]))
		
		if PLAIN_TEXT[var1.name] then
			local var4, var5 = t.mergeTextNodes(p1, var3, p4, p3)
			
			if var5.text and #var5.text > 0 then
				insert(t_1, var5)
			end
			assert(var4 > 0, "Did not find a rich text node when expected")
			var2 += var4
			var3 += var4
		elseif var1.name == "STYLED_TEXT" then
			local _, var6 = t.buildParagraph(var1.children, 1, p3, true)
			
			if var1.attributes and var1.attributes.style == "INLINE_CODE" then
				var1.children = t.applyCodeSpanRules(var6.children)
			else
				var1.children = var6.children
			end
			insert(t_1, var1)
			var2 += 1
			var3 += 1
		elseif not name then
			break
		end
		insert(t_1, var1)
		var2 += 1
		var3 += 1
	end
	return var2, {
		name = "PARAGRAPH",
		children = t_1,
		offset = p1[p2].offset,
		type = getNodeTypeModule("PARAGRAPH", p3)
	}
end

function t.outputRichText(p1, p2)
	-- upvalues: STYLED_TEXT (ref), t (ref)
	local var1 = if p1.attributes then STYLED_TEXT[p1.attributes.style] else nil
	
	if var1 then
		local var2, var3 = t.mergeTextNodes(p1.children, 1, nil, p2)
		assert(var2 == #p1.children, `Found non-inline content inside inline element at {p1.offset}`)
		
		return `<{var1}>{var3.text}</{var1}>`
	elseif p1.text then
		return p1.text
	end
	assert(false, `No text for node at {p1.offset}`)
end

function t.buildList(p1, p2, p3)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var1 = 0
	local depth = p1[p2].attributes.depth
	local t_1 = {}
	local var2 = p2
	while var2 <= #p1 do
		local var3 = p1[var2]
		
		if var3.name ~= "LIST_ITEM" then break end
		if var3.attributes.depth == depth then
			var3.children = t.postProcessTree(var3, p3)
			insert(t_1, var3)
			var1 += 1
			var2 += 1
			continue
		elseif depth >= var3.attributes.depth then
			break
		end
		local var4, var5 = t.buildList(p1, var2, p3)
		insert(t_1, var5)
		assert(var4 > 0, "Did not find a list node when expected")
		var2 += var4
		var1 += var4
	end
	return var1, {
		name = "LIST",
		attributes = { depth = depth },
		children = t_1,
		offset = p1[p2].offset,
		type = getNodeTypeModule("LIST", p3)
	}
end

function t.buildTable(p1, p2, p3)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var1 = 0
	local TABLE_HEADER = {}
	
	for i = p2, #p1 do
		local var2 = p1[i]
		
		if var2.name ~= "TABLE_ROW" then break end
		local var3 = t.buildTableCells(var2, p3)
		
		if var3 then
			var2.children = var3
			insert(TABLE_HEADER, var2)
		elseif #TABLE_HEADER > 0 then
			TABLE_HEADER[#TABLE_HEADER].name = "TABLE_HEADER"
		end
		var1 += 1
	end
	return var1, {
		name = "TABLE",
		children = TABLE_HEADER,
		offset = p1[p2].offset,
		type = getNodeTypeModule("TABLE", p3)
	}
end

function t.buildTableCells(p1, p2)
	-- upvalues: getNodeTypeModule (ref), t (ref), insert (ref)
	local t_1 = {}
	local t_2 = {}
	local var1 = true
	local var2 = p1.children[1]
	
	for i = 1, #p1.children do
		local var3 = p1.children[i]
		
		if var3.name == "TABLE_DIVIDER" then
			local t_3 = {
				name = "TABLE_CELL",
				children = t_2,
				offset = if t_2[1] then t_2[1].offset else p1.offset,
				type = getNodeTypeModule("TABLE_CELL", p2)
			}
			t_3.children = t.postProcessTree(t_3, p2)
			insert(t_1, t_3)
			var1 = if var1 then var2.text and var2.text:match("^[ \t-=]+$") ~= nil else false
			t_2 = {}
		else
			insert(t_2, var3)
		end
	end
	return if var1 then nil else t_1
end

function t.mergeTextNodes(p1, p2, p3, p4)
	-- upvalues: PLAIN_TEXT (ref), getNodeTypeModule (ref)
	local var1 = ""
	local var2 = 0
	
	for i = p2, #p1 do
		local var3 = p1[i]
		
		if not PLAIN_TEXT[var3.name] then break end
		var1 ..= var3.text
		var2 += 1
	end
	if not p3 then
		var1 = var1:gsub("^\n*(.-)\n*$", "%1")
	end
	return var2, {
		name = "TEXT",
		text = var1,
		children = {},
		offset = p1[p2].offset,
		type = getNodeTypeModule("TEXT", p4)
	}
end

function t.applyCodeSpanRules(p1)
	local var1 = nil
	local var2 = nil
	local var3 = false
	
	for i, v in p1 do
		if v.text and #v.text > 0 then
			if var1 == nil then
				var1 = v
			end
			var2 = v
			
			if v.text:find("[^\n ]") then
				var3 = true
			end
		end
	end
	if var1 == nil or var2 == nil then
		return p1
	end
	local var4 = (var1.text or ""):gsub("\n", " ")
	local var5 = (var2.text or ""):gsub("\n", " ")
	
	if var4:sub(1, 1) == " " and var5:sub(-1, -1) == " " and var3 then
		if var1 == var2 then
			var4 = var4:sub(2, -2)
			var5 = var4
		else
			var4 = var4:sub(2)
			var5 = var5:sub(1, -2)
		end
	end
	var1.text = var4
	var2.text = var5
	
	return p1
end

return t.postProcessTree