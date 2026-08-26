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

function t.buildParagraph(p3, p4, p5, p6)
	-- upvalues: INLINE_TEXT (ref), PLAIN_TEXT (ref), t (ref), insert (ref), getNodeTypeModule (ref)
	local var13, name
	local t_1 = {}
	local var14 = 0
	local var15 = p4
	while var15 <= #p3 do
		var13 = p3[var15]
		name = INLINE_TEXT[var13.name] or (var13.name == "TAG" and (var13.text and p5.inlineTags[var13.text]))
		
		if PLAIN_TEXT[var13.name] then
			local var16, var17 = t.mergeTextNodes(p3, var15, p6, p5)
			
			if var17.text and #var17.text > 0 then
				insert(t_1, var17)
			end
			assert(var16 > 0, "Did not find a rich text node when expected")
			var14 += var16
			var15 += var16
		elseif var13.name == "STYLED_TEXT" then
			local _, var18 = t.buildParagraph(var13.children, 1, p5, true)
			
			if var13.attributes and var13.attributes.style == "INLINE_CODE" then
				var13.children = t.applyCodeSpanRules(var18.children)
			else
				var13.children = var18.children
			end
			insert(t_1, var13)
			var14 += 1
			var15 += 1
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

function t.outputRichText(p7, p8)
	-- upvalues: STYLED_TEXT (ref), t (ref)
	local var19 = if p7.attributes then STYLED_TEXT[p7.attributes.style] else nil
	
	if var19 then
		local var20, var21 = t.mergeTextNodes(p7.children, 1, nil, p8)
		assert(var20 == #p7.children, `Found non-inline content inside inline element at {p7.offset}`)
		
		return `<{var19}>{var21.text}</{var19}>`
	elseif p7.text then
		return p7.text
	end
	assert(false, `No text for node at {p7.offset}`)
end

function t.buildList(p9, p10, p11)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var22 = 0
	local depth = p9[p10].attributes.depth
	local t_1 = {}
	local var23 = p10
	while var23 <= #p9 do
		local var24 = p9[var23]
		
		if var24.name ~= "LIST_ITEM" then break end
		if var24.attributes.depth == depth then
			var24.children = t.postProcessTree(var24, p11)
			insert(t_1, var24)
			var22 += 1
			var23 += 1
			continue
		elseif depth >= var24.attributes.depth then
			break
		end
		local var25, var26 = t.buildList(p9, var23, p11)
		insert(t_1, var26)
		assert(var25 > 0, "Did not find a list node when expected")
		var23 += var25
		var22 += var25
	end
	return var22, {
		name = "LIST",
		attributes = { depth = depth },
		children = t_1,
		offset = p9[p10].offset,
		type = getNodeTypeModule("LIST", p11)
	}
end

function t.buildTable(p12, p13, p14)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var27 = 0
	local TABLE_HEADER = {}
	
	for i = p13, #p12 do
		local var28 = p12[i]
		
		if var28.name ~= "TABLE_ROW" then break end
		local var29 = t.buildTableCells(var28, p14)
		
		if var29 then
			var28.children = var29
			insert(TABLE_HEADER, var28)
		elseif #TABLE_HEADER > 0 then
			TABLE_HEADER[#TABLE_HEADER].name = "TABLE_HEADER"
		end
		var27 += 1
	end
	return var27, {
		name = "TABLE",
		children = TABLE_HEADER,
		offset = p12[p13].offset,
		type = getNodeTypeModule("TABLE", p14)
	}
end

function t.buildTableCells(p15, p16)
	-- upvalues: getNodeTypeModule (ref), t (ref), insert (ref)
	local t_1 = {}
	local t_2 = {}
	local var30 = true
	local var31 = p15.children[1]
	
	for i = 1, #p15.children do
		local var32 = p15.children[i]
		
		if var32.name == "TABLE_DIVIDER" then
			local t_3 = {
				name = "TABLE_CELL",
				children = t_2,
				offset = if t_2[1] then t_2[1].offset else p15.offset,
				type = getNodeTypeModule("TABLE_CELL", p16)
			}
			t_3.children = t.postProcessTree(t_3, p16)
			insert(t_1, t_3)
			var30 = if var30 then var31.text and var31.text:match("^[ \t-=]+$") ~= nil else false
			t_2 = {}
		else
			insert(t_2, var32)
		end
	end
	return if var30 then nil else t_1
end

function t.mergeTextNodes(p17, p18, p19, p20)
	-- upvalues: PLAIN_TEXT (ref), getNodeTypeModule (ref)
	local var33 = ""
	local var34 = 0
	
	for i = p18, #p17 do
		local var35 = p17[i]
		
		if not PLAIN_TEXT[var35.name] then break end
		var33 ..= var35.text
		var34 += 1
	end
	if not p19 then
		var33 = var33:gsub("^\n*(.-)\n*$", "%1")
	end
	return var34, {
		name = "TEXT",
		text = var33,
		children = {},
		offset = p17[p18].offset,
		type = getNodeTypeModule("TEXT", p20)
	}
end

function t.applyCodeSpanRules(p21)
	local var36 = nil
	local var37 = nil
	local var38 = false
	
	for i, v in p21 do
		if v.text and #v.text > 0 then
			if var36 == nil then
				var36 = v
			end
			var37 = v
			
			if v.text:find("[^\n ]") then
				var38 = true
			end
		end
	end
	if var36 == nil or var37 == nil then
		return p21
	end
	local var39 = (var36.text or ""):gsub("\n", " ")
	local var40 = (var37.text or ""):gsub("\n", " ")
	
	if var39:sub(1, 1) == " " and var40:sub(-1, -1) == " " and var38 then
		if var36 == var37 then
			var39 = var39:sub(2, -2)
			var40 = var39
		else
			var39 = var39:sub(2)
			var40 = var40:sub(1, -2)
		end
	end
	var36.text = var39
	var37.text = var40
	
	return p21
end

return t.postProcessTree