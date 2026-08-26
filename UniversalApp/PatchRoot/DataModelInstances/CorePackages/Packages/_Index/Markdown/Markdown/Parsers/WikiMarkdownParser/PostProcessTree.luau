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
			local var6, var7 = t.mergeTextNodes(children, var2, p2)
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

function t.buildParagraph(p3, p4, p5)
	-- upvalues: INLINE_TEXT (ref), PLAIN_TEXT (ref), t (ref), insert (ref), getNodeTypeModule (ref)
	local var13, name
	local t_1 = {}
	local var14 = 0
	local var15 = p4
	while var15 <= #p3 do
		var13 = p3[var15]
		name = INLINE_TEXT[var13.name] or (var13.name == "TAG" and (var13.text and p5.inlineTags[var13.text]))
		
		if PLAIN_TEXT[var13.name] then
			local var16, var17 = t.mergeTextNodes(p3, var15, p5)
			
			if var17.text and #var17.text > 0 then
				insert(t_1, var17)
			end
			assert(var16 > 0, "Did not find a rich text node when expected")
			var14 += var16
			var15 += var16
		elseif not name then
			break
		end
		insert(t_1, var13)
		var14 += 1
		var15 += 1
	end
	return var14, {
		name = "PARAGRAPH",
		children = t_1,
		offset = p3[p4].offset,
		type = getNodeTypeModule("PARAGRAPH", p5)
	}
end

function t.outputRichText(p6, p7)
	-- upvalues: STYLED_TEXT (ref), t (ref)
	local var18 = if p6.attributes then STYLED_TEXT[p6.attributes.style] else nil
	
	if var18 then
		local var19, var20 = t.mergeTextNodes(p6.children, 1, p7)
		assert(var19 == #p6.children, `Found non-inline content inside inline element at {p6.offset}`)
		
		return `<{var18}>{var20.text}</{var18}>`
	elseif p6.text then
		return p6.text
	end
	assert(false, `No text for node at {p6.offset}`)
end

function t.buildList(p8, p9, p10)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var21 = 0
	local depth = p8[p9].attributes.depth
	local t_1 = {}
	local var22 = p9
	while var22 <= #p8 do
		local var23 = p8[var22]
		
		if var23.name ~= "LIST_ITEM" then break end
		if var23.attributes.depth == depth then
			var23.children = t.postProcessTree(var23, p10)
			insert(t_1, var23)
			var21 += 1
			var22 += 1
			continue
		elseif depth >= var23.attributes.depth then
			break
		end
		local var24, var25 = t.buildList(p8, var22, p10)
		insert(t_1, var25)
		assert(var24 > 0, "Did not find a list node when expected")
		var22 += var24
		var21 += var24
	end
	return var21, {
		name = "LIST",
		attributes = { depth = depth },
		children = t_1,
		offset = p8[p9].offset,
		type = getNodeTypeModule("LIST", p10)
	}
end

function t.buildTable(p11, p12, p13)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var26 = 0
	local TABLE_HEADER = {}
	
	for i = p12, #p11 do
		local var27 = p11[i]
		
		if var27.name ~= "TABLE_ROW" then break end
		local var28 = t.buildTableCells(var27, p13)
		
		if var28 then
			var27.children = var28
			insert(TABLE_HEADER, var27)
		elseif #TABLE_HEADER > 0 then
			TABLE_HEADER[#TABLE_HEADER].name = "TABLE_HEADER"
		end
		var26 += 1
	end
	return var26, {
		name = "TABLE",
		children = TABLE_HEADER,
		offset = p11[p12].offset,
		type = getNodeTypeModule("TABLE", p13)
	}
end

function t.buildTableCells(p14, p15)
	-- upvalues: getNodeTypeModule (ref), t (ref), insert (ref)
	local t_1 = {}
	local t_2 = {}
	local var29 = true
	local var30 = p14.children[1]
	
	for i = 1, #p14.children do
		local var31 = p14.children[i]
		
		if var31.name == "TABLE_DIVIDER" then
			local t_3 = {
				name = "TABLE_CELL",
				children = t_2,
				offset = if t_2[1] then t_2[1].offset else p14.offset,
				type = getNodeTypeModule("TABLE_CELL", p15)
			}
			t_3.children = t.postProcessTree(t_3, p15)
			insert(t_1, t_3)
			var29 = if var29 then var30.text and var30.text:match("^[ \t-=]+$") ~= nil else false
			t_2 = {}
		else
			insert(t_2, var31)
		end
	end
	return if var29 then nil else t_1
end

function t.mergeTextNodes(p16, p17, p18)
	-- upvalues: PLAIN_TEXT (ref), getNodeTypeModule (ref)
	local var32 = ""
	local var33 = 0
	
	for i = p17, #p16 do
		local var34 = p16[i]
		
		if not PLAIN_TEXT[var34.name] then break end
		var32 ..= var34.text
		var33 += 1
	end
	return var33, {
		name = "TEXT",
		text = var32:gsub("^\n*(.-)\n*$", "%1"),
		children = {},
		offset = p16[p17].offset,
		type = getNodeTypeModule("TEXT", p18)
	}
end

return t.postProcessTree