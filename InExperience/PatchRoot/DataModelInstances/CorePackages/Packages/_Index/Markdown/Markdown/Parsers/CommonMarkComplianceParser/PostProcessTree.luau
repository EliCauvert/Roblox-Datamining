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

function t.postProcessTree(p0, p1)
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
			local var8, var9 = t.mergeTextNodes(children, var5, nil, p1)
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

function t.buildParagraph(p2, p3, p4, p5)
	-- upvalues: INLINE_TEXT (ref), PLAIN_TEXT (ref), t (ref), insert (ref), getNodeTypeModule (ref)
	local var20, name
	local t_1 = {}
	local var18 = 0
	local var19 = p3
	while var19 <= #p2 do
		var20 = p2[var19]
		name = INLINE_TEXT[var20.name] or (var20.name == "TAG" and (var20.text and p4.inlineTags[var20.text]))
		
		if PLAIN_TEXT[var20.name] then
			local var23, var24 = t.mergeTextNodes(p2, var19, p5, p4)
			
			if var24.text and #var24.text > 0 then
				insert(t_1, var24)
			end
			assert(var23 > 0, "Did not find a rich text node when expected")
			var18 += var23
			var19 += var23
		elseif var20.name == "STYLED_TEXT" then
			local _, var22 = t.buildParagraph(var20.children, 1, p4, true)
			
			if var20.attributes and var20.attributes.style == "INLINE_CODE" then
				var20.children = t.applyCodeSpanRules(var22.children)
			else
				var20.children = var22.children
			end
			insert(t_1, var20)
			var18 += 1
			var19 += 1
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

function t.outputRichText(p6, p7)
	-- upvalues: STYLED_TEXT (ref), t (ref)
	local var25 = if p6.attributes then STYLED_TEXT[p6.attributes.style] else nil
	
	if var25 then
		local var26, var27 = t.mergeTextNodes(p6.children, 1, nil, p7)
		assert(var26 == #p6.children, `Found non-inline content inside inline element at {p6.offset}`)
		
		return `<{var25}>{var27.text}</{var25}>`
	elseif p6.text then
		return p6.text
	end
	assert(false, `No text for node at {p6.offset}`)
end

function t.buildList(p8, p9, p10)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var28 = 0
	local depth = p8[p9].attributes.depth
	local t_1 = {}
	local var30 = p9
	while var30 <= #p8 do
		local var31 = p8[var30]
		
		if var31.name ~= "LIST_ITEM" then break end
		if var31.attributes.depth == depth then
			var31.children = t.postProcessTree(var31, p10)
			insert(t_1, var31)
			var28 += 1
			var30 += 1
			continue
		elseif depth >= var31.attributes.depth then
			break
		end
		local var32, var33 = t.buildList(p8, var30, p10)
		insert(t_1, var33)
		assert(var32 > 0, "Did not find a list node when expected")
		var30 += var32
		var28 += var32
	end
	return var28, {
		name = "LIST",
		attributes = { depth = depth },
		children = t_1,
		offset = p8[p9].offset,
		type = getNodeTypeModule("LIST", p10)
	}
end

function t.buildTable(p11, p12, p13)
	-- upvalues: t (ref), insert (ref), getNodeTypeModule (ref)
	local var34 = 0
	local TABLE_HEADER = {}
	
	for i = p12, #p11 do
		local var36 = p11[i]
		
		if var36.name ~= "TABLE_ROW" then break end
		local var37 = t.buildTableCells(var36, p13)
		
		if var37 then
			var36.children = var37
			insert(TABLE_HEADER, var36)
		elseif #TABLE_HEADER > 0 then
			TABLE_HEADER[#TABLE_HEADER].name = "TABLE_HEADER"
		end
		var34 += 1
	end
	return var34, {
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
	local var40 = true
	local var41 = p14.children[1]
	
	for i = 1, #p14.children do
		local var42 = p14.children[i]
		
		if var42.name == "TABLE_DIVIDER" then
			local t_3 = {
				name = "TABLE_CELL",
				children = t_2,
				offset = if t_2[1] then t_2[1].offset else p14.offset,
				type = getNodeTypeModule("TABLE_CELL", p15)
			}
			t_3.children = t.postProcessTree(t_3, p15)
			insert(t_1, t_3)
			var40 = if var40 then var41.text and var41.text:match("^[ \t-=]+$") ~= nil else false
			t_2 = {}
		else
			insert(t_2, var42)
		end
	end
	return if var40 then nil else t_1
end

function t.mergeTextNodes(p16, p17, p18, p19)
	-- upvalues: PLAIN_TEXT (ref), getNodeTypeModule (ref)
	local var44 = ""
	local var45 = 0
	
	for i = p17, #p16 do
		local var46 = p16[i]
		
		if not PLAIN_TEXT[var46.name] then break end
		var44 ..= var46.text
		var45 += 1
	end
	if not p18 then
		var44 = var44:gsub("^\n*(.-)\n*$", "%1")
	end
	return var45, {
		name = "TEXT",
		text = var44,
		children = {},
		offset = p16[p17].offset,
		type = getNodeTypeModule("TEXT", p19)
	}
end

function t.applyCodeSpanRules(p20)
	local var47 = nil
	local var48 = nil
	local var49 = false
	
	for i, v in p20 do
		if v.text and #v.text > 0 then
			if var47 == nil then
				var47 = v
			end
			var48 = v
			
			if v.text:find("[^\n ]") then
				var49 = true
			end
		end
	end
	if var47 == nil or var48 == nil then
		return p20
	end
	local var50 = (var47.text or ""):gsub("\n", " ")
	local var51 = (var48.text or ""):gsub("\n", " ")
	
	if var50:sub(1, 1) == " " and var51:sub(-1, -1) == " " and var49 then
		if var47 == var48 then
			var50 = var50:sub(2, -2)
			var51 = var50
		else
			var50 = var50:sub(2)
			var51 = var51:sub(1, -2)
		end
	end
	var47.text = var50
	var48.text = var51
	
	return p20
end

return t.postProcessTree