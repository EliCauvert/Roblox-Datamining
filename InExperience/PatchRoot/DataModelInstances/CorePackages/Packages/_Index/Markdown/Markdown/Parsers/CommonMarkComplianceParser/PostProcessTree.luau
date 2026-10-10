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

local function trimLeadingWhitespace(p1, p2)
	-- upvalues: insert (ref)
	local t = {}
	local var1 = p2
	
	for i, v in p1 do
		if var1 and v.name == "TEXT" and v.text then
			v.text = v.text:gsub("^[ \t]+", "")
			
			if #v.text ~= 0 then
				var1 = v.name == "BREAK" and (v.text ~= nil and string.sub(v.text, -1) == "\n")
				insert(t, v)
			end
		end
	end
	return t
end

function t.postProcessTree(p3, p4)
	-- upvalues: CONTAINERS (ref), INLINE_TEXT (ref), t (ref), insert (ref), PLAIN_TEXT (ref), isNodeBlockModule (ref), trimLeadingWhitespace (ref)
	local var2
	local t_1 = {}
	local var3 = 1
	local children = p3.children
	local var4 = CONTAINERS[p3.name] and not (p3.name == "TAG" and p4.inlineTags[p3.text])
	while var3 <= #children do
		var2 = children[var3]
		
		if (INLINE_TEXT[var2.name] or (var2.name == "TAG" and (var2.text and p4.inlineTags[var2.text]))) and var4 then
			local var5, var6 = t.buildParagraph(children, var3, p4)
			assert(var5 > 0, "Did not find an inline node when expected")
			
			if #var6.children > 0 then
				insert(t_1, var6)
			end
			var3 += var5
		end
		if PLAIN_TEXT[var2.name] then
			local var7, var8 = t.mergeTextNodes(children, var3, nil, p4)
			assert(var7 > 0, "Did not find a text node when expected")
			
			if var8.text and #var8.text > 0 then
				insert(t_1, var8)
			end
			var3 += var7
		elseif var2.name == "LIST_ITEM" then
			local var9, var10 = t.buildList(children, var3, p4)
			insert(t_1, var10)
			assert(var9 > 0, "Did not find a list node when expected")
			var3 += var9
		elseif var2.name == "TABLE_ROW" then
			local var11, var12 = t.buildTable(children, var3, p4)
			insert(t_1, var12)
			assert(var11 > 0, "Did not find a table row node when expected")
			var3 += var11
		elseif var2.name == "QUOTE" then
			local var13, var14 = t.buildQuote(children, var3, p4)
			insert(t_1, var14)
			assert(var13 > 0, "Did not find a quote node when expected")
			var3 += var13
		elseif var2.name == "LINE_BREAK" then
			var3 += 1
		else
			var2.children = t.postProcessTree(var2, p4)
			insert(t_1, var2)
			var3 += 1
		end
	end
	if isNodeBlockModule(p3) then
		t_1 = trimLeadingWhitespace(t_1, false)
		var2 = t_1[1]
		
		if var2 and var2.text then
			var2.text = var2.text:gsub("^%s+", "")
		end
		local var15 = t_1[#t_1]
		
		if var15 and var15.text then
			var15.text = var15.text:gsub("%s+$", "")
		end
	end
	return t_1
end

function t.buildParagraph(p5, p6, p7, p8)
	-- upvalues: INLINE_TEXT (ref), PLAIN_TEXT (ref), t (ref), insert (ref), trimLeadingWhitespace (ref), getNodeTypeModule (ref)
	local var16, name
	local t_1 = {}
	local var17 = 0
	local var18 = p6
	while var18 <= #p5 do
		var16 = p5[var18]
		name = INLINE_TEXT[var16.name] or (var16.name == "TAG" and (var16.text and p7.inlineTags[var16.text]))
		
		if PLAIN_TEXT[var16.name] then
			local var19, var20 = t.mergeTextNodes(p5, var18, p8, p7)
			
			if var20.text and #var20.text > 0 then
				insert(t_1, var20)
			end
			assert(var19 > 0, "Did not find a rich text node when expected")
			var17 += var19
			var18 += var19
		elseif var16.name == "STYLED_TEXT" then
			local _, var21 = t.buildParagraph(var16.children, 1, p7, true)
			
			if var16.attributes and var16.attributes.style == "INLINE_CODE" then
				var16.children = t.applyCodeSpanRules(var21.children)
			else
				var16.children = trimLeadingWhitespace(var21.children, false)
			end
			insert(t_1, var16)
			var17 += 1
			var18 += 1
		elseif not name then
			break
		end
		insert(t_1, var16)
		var17 += 1
		var18 += 1
	end
	if not p8 then
		var16 = p5[p6 - 1]
		t_1 = trimLeadingWhitespace(t_1, not (var16 and var16.name == "TAG"))
	end
	return var17, {
		name = "PARAGRAPH",
		children = t_1,
		offset = p5[p6].offset,
		type = getNodeTypeModule("PARAGRAPH", p7)
	}
end

function t.outputRichText(p9, p10)
	-- upvalues: STYLED_TEXT (ref), t (ref)
	local var22 = if p9.attributes then STYLED_TEXT[p9.attributes.style] else nil
	
	if var22 then
		local var23, var24 = t.mergeTextNodes(p9.children, 1, nil, p10)
		assert(var23 == #p9.children, `Found non-inline content inside inline element at {p9.offset}`)
		
		return `<{var22}>{var24.text}</{var22}>`
	elseif p9.text then
		return p9.text
	end
	assert(false, `No text for node at {p9.offset}`)
end

function t.buildList(p11, p12, p13)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var25 = 0
	local depth = p11[p12].attributes.depth
	local t_1 = {}
	local var26 = p12
	while var26 <= #p11 do
		local var27 = p11[var26]
		
		if var27.name ~= "LIST_ITEM" then break end
		if var27.attributes.depth == depth then
			var27.children = t.postProcessTree(var27, p13)
			insert(t_1, var27)
			var25 += 1
			var26 += 1
			continue
		elseif depth >= var27.attributes.depth then
			break
		end
		local var28, var29 = t.buildList(p11, var26, p13)
		insert(t_1, var29)
		assert(var28 > 0, "Did not find a list node when expected")
		var26 += var28
		var25 += var28
	end
	return var25, {
		name = "LIST",
		attributes = { depth = depth },
		children = t_1,
		offset = p11[p12].offset,
		type = getNodeTypeModule("LIST", p13)
	}
end

local function isEmptyQuoteLine(p14)
	for i, v in p14 do
		if v.name ~= "TEXT" or v.text and #v.text > 0 then
			return false
		end
	end
	return true
end

function t.buildQuote(p15, p16, p17)
	-- upvalues: t (ref), insert (ref), isEmptyQuoteLine (ref), getNodeTypeModule (ref)
	local var30 = 0
	local t_1 = {}
	local var31 = p16
	while var31 <= #p15 and p15[var31].name == "QUOTE" do
		local var32 = p15[var31]
		insert(t_1, { node = var32, children = t.postProcessTree(var32, p17) })
		var30 += 1
		var31 += 1
	end
	local var33 = 1
	local t_1Count = #t_1
	while var33 <= t_1Count and isEmptyQuoteLine(t_1[var33].children) do
		var33 += 1
	end
	while var33 <= t_1Count and isEmptyQuoteLine(t_1[t_1Count].children) do
		t_1Count -= 1
	end
	local t_2 = {}
	
	for i_1 = var33, t_1Count do
		local var34 = t_1[i_1]
		
		if var33 < i_1 then
			insert(t_2, {
				name = "BREAK",
				children = {},
				offset = var34.node.offset,
				type = getNodeTypeModule("BREAK", p17)
			})
		end
		for i, v in var34.children do
			if v.name ~= "TEXT" or v.text ~= "" then
				insert(t_2, v)
			end
		end
	end
	local var35 = p15[p16]
	var35.children = t_2
	
	return var30, var35
end

function t.buildTable(p18, p19, p20)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var36 = 0
	local TABLE_HEADER = {}
	
	for i = p19, #p18 do
		local var37 = p18[i]
		
		if var37.name ~= "TABLE_ROW" then break end
		local var38 = t.buildTableCells(var37, p20)
		
		if var38 then
			var37.children = var38
			insert(TABLE_HEADER, var37)
		elseif #TABLE_HEADER > 0 then
			TABLE_HEADER[#TABLE_HEADER].name = "TABLE_HEADER"
		end
		var36 += 1
	end
	return var36, {
		name = "TABLE",
		children = TABLE_HEADER,
		offset = p18[p19].offset,
		type = getNodeTypeModule("TABLE", p20)
	}
end

function t.buildTableCells(p21, p22)
	-- upvalues: getNodeTypeModule (ref), t (ref), insert (ref)
	local t_1 = {}
	local t_2 = {}
	local var39 = true
	local var40 = p21.children[1]
	
	for i = 1, #p21.children do
		local var41 = p21.children[i]
		
		if var41.name == "TABLE_DIVIDER" then
			local t_3 = {
				name = "TABLE_CELL",
				children = t_2,
				offset = if t_2[1] then t_2[1].offset else p21.offset,
				type = getNodeTypeModule("TABLE_CELL", p22)
			}
			t_3.children = t.postProcessTree(t_3, p22)
			insert(t_1, t_3)
			var39 = if var39 then var40.text and var40.text:match("^[ \t-=]+$") ~= nil else false
			t_2 = {}
		else
			insert(t_2, var41)
		end
	end
	return if var39 then nil else t_1
end

function t.mergeTextNodes(p23, p24, p25, p26)
	-- upvalues: PLAIN_TEXT (ref), getNodeTypeModule (ref)
	local var42 = ""
	local var43 = 0
	
	for i = p24, #p23 do
		local var44 = p23[i]
		
		if not PLAIN_TEXT[var44.name] then break end
		var42 ..= var44.text
		var43 += 1
	end
	if not p25 then
		var42 = var42:gsub("^\n*(.-)\n*$", "%1")
	end
	return var43, {
		name = "TEXT",
		text = var42,
		children = {},
		offset = p23[p24].offset,
		type = getNodeTypeModule("TEXT", p26)
	}
end

function t.applyCodeSpanRules(p27)
	local var45 = nil
	local var46 = nil
	local var47 = false
	
	for i, v in p27 do
		if v.text and #v.text > 0 then
			if var45 == nil then
				var45 = v
			end
			var46 = v
			
			if v.text:find("[^\n ]") then
				var47 = true
			end
		end
	end
	if var45 == nil or var46 == nil then
		return p27
	end
	local var48 = (var45.text or ""):gsub("\n", " ")
	local var49 = (var46.text or ""):gsub("\n", " ")
	
	if var48:sub(1, 1) == " " and var49:sub(-1, -1) == " " and var47 then
		if var45 == var46 then
			var48 = var48:sub(2, -2)
			var49 = var48
		else
			var48 = var48:sub(2)
			var49 = var49:sub(1, -2)
		end
	end
	var45.text = var48
	var46.text = var49
	
	return p27
end

return t.postProcessTree