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

function t.postProcessTree(p0, p1) --[[ line: 23 ]]
	-- upvalues: CONTAINERS (ref), INLINE_TEXT (ref), t (ref), insert (ref), PLAIN_TEXT (ref), isNodeBlockModule (ref)
	local var7
	local t_1 = {}
	local var5 = 1
	local children = p0.children
	local var6 = CONTAINERS[p0.name] and not (p0.name == "TAG" and p1.inlineTags[p0.text])
	while var5 <= #children do
		var7 = children[var5]
		
		if (INLINE_TEXT[var7.name] or (var7.name == "TAG" and (var7.text and p1.inlineTags[var7.text]))) and var6 then
			local var14, var15 = t.buildParagraph(children, var5, p1)
			assert(var14 > 0, "Did not find an inline node when expected")
			
			if #var15.children > 0 then
				insert(t_1, var15)
			end
			var5 += var14
		end
		if PLAIN_TEXT[var7.name] then
			local var8, var9 = t.mergeTextNodes(children, var5, p1)
			assert(var8 > 0, "Did not find a text node when expected")
			
			if var9.text and #var9.text > 0 then
				insert(t_1, var9)
			end
			var5 += var8
		elseif var7.name == "LIST_ITEM" then
			local var10, var11 = t.buildList(children, var5, p1)
			insert(t_1, var11)
			assert(var10 > 0, "Did not find a list node when expected")
			var5 += var10
		elseif var7.name == "TABLE_ROW" then
			local var12, var13 = t.buildTable(children, var5, p1)
			insert(t_1, var13)
			assert(var12 > 0, "Did not find a table row node when expected")
			var5 += var12
		elseif var7.name == "LINE_BREAK" then
			var5 += 1
		else
			var7.children = t.postProcessTree(var7, p1)
			insert(t_1, var7)
			var5 += 1
		end
	end
	if isNodeBlockModule(p0) then
		var7 = t_1[1]
		
		if var7 and var7.text then
			var7.text = var7.text:gsub("^%s+", "")
		end
		local var16 = t_1[#t_1]
		
		if var16 and var16.text then
			var16.text = var16.text:gsub("%s+$", "")
		end
	end
	return t_1
end

function t.buildParagraph(p2, p3, p4) --[[ line: 87 ]]
	-- upvalues: INLINE_TEXT (ref), PLAIN_TEXT (ref), t (ref), insert (ref), getNodeTypeModule (ref)
	local var20, name
	local t_1 = {}
	local var18 = 0
	local var19 = p3
	while var19 <= #p2 do
		var20 = p2[var19]
		name = INLINE_TEXT[var20.name] or (var20.name == "TAG" and (var20.text and p4.inlineTags[var20.text]))
		
		if PLAIN_TEXT[var20.name] then
			local var22, var23 = t.mergeTextNodes(p2, var19, p4)
			
			if var23.text and #var23.text > 0 then
				insert(t_1, var23)
			end
			assert(var22 > 0, "Did not find a rich text node when expected")
			var18 += var22
			var19 += var22
		elseif not name then
			break
		end
		insert(t_1, var20)
		var18 += 1
		var19 += 1
	end
	return var18, {
		name = "PARAGRAPH",
		children = t_1,
		offset = p2[p3].offset,
		type = getNodeTypeModule("PARAGRAPH", p4)
	}
end

function t.outputRichText(p5, p6) --[[ line: 123 ]]
	-- upvalues: STYLED_TEXT (ref), t (ref)
	local var24 = if p5.attributes then STYLED_TEXT[p5.attributes.style] else nil
	
	if var24 then
		local var25, var26 = t.mergeTextNodes(p5.children, 1, p6)
		assert(var25 == #p5.children, `Found non-inline content inside inline element at {p5.offset}`)
		
		return `<{var24}>{var26.text}</{var24}>`
	elseif p5.text then
		return p5.text
	end
	assert(false, `No text for node at {p5.offset}`)
end

function t.buildList(p7, p8, p9) --[[ line: 137 ]]
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var27 = 0
	local depth = p7[p8].attributes.depth
	local t_1 = {}
	local var29 = p8
	while var29 <= #p7 do
		local var30 = p7[var29]
		
		if var30.name ~= "LIST_ITEM" then break end
		if var30.attributes.depth == depth then
			var30.children = t.postProcessTree(var30, p9)
			insert(t_1, var30)
			var27 += 1
			var29 += 1
			continue
		elseif depth >= var30.attributes.depth then
			break
		end
		local var31, var32 = t.buildList(p7, var29, p9)
		insert(t_1, var32)
		assert(var31 > 0, "Did not find a list node when expected")
		var29 += var31
		var27 += var31
	end
	return var27, {
		name = "LIST",
		attributes = { depth = depth },
		children = t_1,
		offset = p7[p8].offset,
		type = getNodeTypeModule("LIST", p9)
	}
end

function t.buildTable(p10, p11, p12) --[[ line: 177 ]]
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var33 = 0
	local TABLE_HEADER = {}
	
	for i = p11, #p10 do
		local var35 = p10[i]
		
		if var35.name ~= "TABLE_ROW" then break end
		local var36 = t.buildTableCells(var35, p12)
		
		if var36 then
			var35.children = var36
			insert(TABLE_HEADER, var35)
		elseif #TABLE_HEADER > 0 then
			TABLE_HEADER[#TABLE_HEADER].name = "TABLE_HEADER"
		end
		var33 += 1
	end
	return var33, {
		name = "TABLE",
		children = TABLE_HEADER,
		offset = p10[p11].offset,
		type = getNodeTypeModule("TABLE", p12)
	}
end

function t.buildTableCells(p13, p14) --[[ line: 207 ]]
	-- upvalues: getNodeTypeModule (ref), t (ref), insert (ref)
	local t_1 = {}
	local t_2 = {}
	local var39 = true
	local var40 = p13.children[1]
	
	for i = 1, #p13.children do
		local var41 = p13.children[i]
		
		if var41.name == "TABLE_DIVIDER" then
			local t_3 = {
				name = "TABLE_CELL",
				children = t_2,
				offset = if t_2[1] then t_2[1].offset else p13.offset,
				type = getNodeTypeModule("TABLE_CELL", p14)
			}
			t_3.children = t.postProcessTree(t_3, p14)
			insert(t_1, t_3)
			var39 = if var39 then var40.text and var40.text:match("^[ \t-=]+$") ~= nil else false
			t_2 = {}
		else
			insert(t_2, var41)
		end
	end
	return if var39 then nil else t_1
end

function t.mergeTextNodes(p15, p16, p17) --[[ line: 240 ]]
	-- upvalues: PLAIN_TEXT (ref), getNodeTypeModule (ref)
	local var43 = ""
	local var44 = 0
	
	for i = p16, #p15 do
		local var45 = p15[i]
		
		if not PLAIN_TEXT[var45.name] then break end
		var43 ..= var45.text
		var44 += 1
	end
	return var44, {
		name = "TEXT",
		text = var43:gsub("^\n*(.-)\n*$", "%1"),
		children = {},
		offset = p15[p16].offset,
		type = getNodeTypeModule("TEXT", p17)
	}
end

return t.postProcessTree