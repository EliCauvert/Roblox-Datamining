local _ = require(script:FindFirstAncestor("Markdown").Types)
local t = {}
local t_1 = {}

local function sanitize(p0) --[[ line: 8 ]]
	return p0:gsub("&amp;", "&"):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&quot;", "\""):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub("\"", "&quot;"):gsub(" *\n *", "\n")
end

local function _(p1) --[[ line: 21 | named "urlEncode" ]]
	return string.gsub(p1, "([^%w_%%%-%.%*%?%(%)#~/:=])", function(p2) --[[ line: 22 ]]
		return string.format("%%%02X", string.byte(p2))
	end)
end

local function map(p3) --[[ line: 27 ]]
	-- upvalues: t_1 (write)
	local name = t_1[p3.name]
	
	if name then
		return name(p3)
	end
	error(`No handler found for node {p3.name}`)
end

local _ = function(p4) --[[ line: 36 | named "processChildren" ]]
	-- upvalues: t_1 (write)
	if not p4 then
		return ""
	end
	local var5 = ""
	
	for i, v in p4 do
		local var7
		local var6 = var5
		local name = t_1[v.name]
		
		if name then
			var7 = name(v)
		else
			error(`No handler found for node {v.name}`)
			var7 = nil
		end
		var5 = var6 .. var7
	end
	return var5
end

local function emptyHandler(p5) --[[ line: 155 ]]
	-- upvalues: t_1 (write)
	local children = p5.children
	
	if not children then
		return ""
	end
	local var8 = ""
	
	for i, v in children do
		local var10
		local var9 = var8
		local name = t_1[v.name]
		
		if name then
			var10 = name(v)
		else
			error(`No handler found for node {v.name}`)
			var10 = nil
		end
		var8 = var9 .. var10
	end
	return var8
end

t_1 = {
	ROOT = function(p6) --[[ line: 48 ]]
		-- upvalues: t_1 (write)
		local children = p6.children
		
		if not children then
			return ""
		end
		local var11 = ""
		
		for i, v in children do
			local var13
			local var12 = var11
			local name = t_1[v.name]
			
			if name then
				var13 = name(v)
			else
				error(`No handler found for node {v.name}`)
				var13 = nil
			end
			var11 = var12 .. var13
		end
		return var11
	end,
	HEADING = function(p7) --[[ line: 52 ]]
		-- upvalues: t_1 (write)
		local var16
		local var14 = if p7.attributes then p7.attributes.depth else 1
		local var15 = "<h%*>%*</h%*>\n"
		local children = p7.children
		
		if children then
			local var17 = ""
			
			for i, v in children do
				local var19
				local var18 = var17
				local name = t_1[v.name]
				
				if name then
					var19 = name(v)
				else
					error(`No handler found for node {v.name}`)
					var19 = nil
				end
				var17 = var18 .. var19
			end
			var16 = var17
		else
			var16 = ""
		end
		return var15:format(var14, var16, var14)
	end,
	PARAGRAPH = function(p8) --[[ line: 57 ]]
		-- upvalues: t_1 (write)
		local var21
		local var20 = "<p>%*</p>\n"
		local children = p8.children
		
		if children then
			local var22 = ""
			
			for i, v in children do
				local var24
				local var23 = var22
				local name = t_1[v.name]
				
				if name then
					var24 = name(v)
				else
					error(`No handler found for node {v.name}`)
					var24 = nil
				end
				var22 = var23 .. var24
			end
			var21 = var22
		else
			var21 = ""
		end
		return var20:format(var21:gsub("^ +", ""):gsub(" +$", ""))
	end,
	TEXT = function(p9) --[[ line: 107 ]]
		-- upvalues: sanitize (ref)
		return sanitize(p9.text or "")
	end,
	STYLED_TEXT = function(p10) --[[ line: 90 ]]
		-- upvalues: t_1 (write)
		local var25 = if p10.attributes then p10.attributes.style else nil
		
		if var25 == "BOLD" or var25 == "ITALIC" then
			local var27
			local var26 = "<em>%*</em>"
			local children = p10.children
			
			if children then
				local var28 = ""
				
				for i, v in children do
					local var30
					local var29 = var28
					local name = t_1[v.name]
					
					if name then
						var30 = name(v)
					else
						error(`No handler found for node {v.name}`)
						var30 = nil
					end
					var28 = var29 .. var30
				end
				var27 = var28
			else
				var27 = ""
			end
			return var26:format(var27)
		elseif var25 == "BOLD_2" or var25 == "ITALIC_2" then
			local var32
			local var31 = "<strong>%*</strong>"
			local children = p10.children
			
			if children then
				local var33 = ""
				
				for i, v in children do
					local var35
					local var34 = var33
					local name = t_1[v.name]
					
					if name then
						var35 = name(v)
					else
						error(`No handler found for node {v.name}`)
						var35 = nil
					end
					var33 = var34 .. var35
				end
				var32 = var33
			else
				var32 = ""
			end
			return var31:format(var32)
		elseif var25 == "STRIKE" then
			local var37
			local var36 = "<u>%*</u>"
			local children = p10.children
			
			if children then
				local var38 = ""
				
				for i, v in children do
					local var40
					local var39 = var38
					local name = t_1[v.name]
					
					if name then
						var40 = name(v)
					else
						error(`No handler found for node {v.name}`)
						var40 = nil
					end
					var38 = var39 .. var40
				end
				var37 = var38
			else
				var37 = ""
			end
			return var36:format(var37)
		elseif var25 == "INLINE_CODE" then
			local var42
			local var41 = "<code>%*</code>"
			local children = p10.children
			
			if children then
				local var43 = ""
				
				for i, v in children do
					local var45
					local var44 = var43
					local name = t_1[v.name]
					
					if name then
						var45 = name(v)
					else
						error(`No handler found for node {v.name}`)
						var45 = nil
					end
					var43 = var44 .. var45
				end
				var42 = var43
			else
				var42 = ""
			end
			return var41:format(var42)
		elseif var25 ~= nil then
			error(`Unknown text style {var25}`)
			
			return
		end
		local children = p10.children
		
		if not children then
			return ""
		end
		local var46 = ""
		
		for i, v in children do
			local var48
			local var47 = var46
			local name = t_1[v.name]
			
			if name then
				var48 = name(v)
			else
				error(`No handler found for node {v.name}`)
				var48 = nil
			end
			var46 = var47 .. var48
		end
		return var46
	end,
	DIVIDER = function() --[[ line: 61 ]]
		return "<hr />\n"
	end,
	QUOTE = function(p11) --[[ line: 65 ]]
		-- upvalues: t_1 (write)
		local var50
		local var49 = "<blockquote>\n%*</blockquote>\n"
		local children = p11.children
		
		if children then
			local var51 = ""
			
			for i, v in children do
				local var53
				local var52 = var51
				local name = t_1[v.name]
				
				if name then
					var53 = name(v)
				else
					error(`No handler found for node {v.name}`)
					var53 = nil
				end
				var51 = var52 .. var53
			end
			var50 = var51
		else
			var50 = ""
		end
		return var49:format(var50)
	end,
	CODE_BLOCK = function(p12) --[[ line: 69 ]]
		local t = {}
		
		if p12.attributes and p12.attributes.language and p12.attributes.language ~= "" then
			table.insert(t, "language-" .. p12.attributes.language)
		end
		local t_1 = {}
		
		if #t > 0 then
			table.insert(t_1, `class="{table.concat(t, " ")}"`)
		end
		return `<pre><code{if #t_1 > 0 then ` {table.concat(t_1, " ")}` else ""}>{p12.text}</code></pre>\n`
	end,
	LIST = function(p13) --[[ line: 81 ]]
		-- upvalues: t_1 (write)
		local var58
		local var56 = if p13.attributes then if p13.attributes.ordered then "ol" else "ul" else "ul"
		local var57 = "<%*>\n%*</%*>\n"
		local children = p13.children
		
		if children then
			local var59 = ""
			
			for i, v in children do
				local var61
				local var60 = var59
				local name = t_1[v.name]
				
				if name then
					var61 = name(v)
				else
					error(`No handler found for node {v.name}`)
					var61 = nil
				end
				var59 = var60 .. var61
			end
			var58 = var59
		else
			var58 = ""
		end
		return var57:format(var56, var58, var56)
	end,
	LIST_ITEM = function(p14) --[[ line: 86 ]]
		-- upvalues: t_1 (write)
		local var63
		local var62 = "<li>%*</li>\n"
		local children = p14.children
		
		if children then
			local var64 = ""
			
			for i, v in children do
				local var66
				local var65 = var64
				local name = t_1[v.name]
				
				if name then
					var66 = name(v)
				else
					error(`No handler found for node {v.name}`)
					var66 = nil
				end
				var64 = var65 .. var66
			end
			var63 = var64
		else
			var63 = ""
		end
		return var62:format(var63)
	end,
	LINK = function(p15) --[[ line: 111 ]]
		-- upvalues: t_1 (write), sanitize (ref)
		local var69
		local var67 = if p15.attributes then p15.attributes.url else p15.url or ""
		local var68 = if p15.attributes then p15.attributes.title else nil
		local children = p15.children
		
		if children then
			local var70 = ""
			
			for i, v in children do
				local var72
				local var71 = var70
				local name = t_1[v.name]
				
				if name then
					var72 = name(v)
				else
					error(`No handler found for node {v.name}`)
					var72 = nil
				end
				var70 = var71 .. var72
			end
			var69 = var70
		else
			var69 = ""
		end
		if var69 == "" and p15.text then
			var69 = sanitize(p15.text)
		end
		return `<a href="{string.gsub(var67, "([^%w_%%%-%.%*%?%(%)#~/:=])", function(p16) --[[ line: 22 ]]
			return string.format("%%%02X", string.byte(p16))
		end)}"{if var68 then ` title="{sanitize(var68)}"` else ""}>{var69}</a>`
	end,
	TAG = function(p17) --[[ line: 123 ]]
		-- upvalues: t_1 (write)
		local text = p17.text
		
		if not text or text == "" then
			error("TAG node must have a text value")
		end
		local var73 = ""
		
		if p17.attributes then
			for i, v in p17.attributes do
				var73 = `{var73} {i}="{v}"`
			end
		end
		if not p17.children or #p17.children <= 0 then
			return `<{text}{var73} />`
		end
		local var77
		local var74 = "<%*%*>%*</%*>"
		local var75 = text
		local var76 = var73
		local children = p17.children
		
		if children then
			local var78 = ""
			
			for i, v in children do
				local var80
				local var79 = var78
				local name = t_1[v.name]
				
				if name then
					var80 = name(v)
				else
					error(`No handler found for node {v.name}`)
					var80 = nil
				end
				var78 = var79 .. var80
			end
			var77 = var78
		else
			var77 = ""
		end
		return var74:format(var75, var76, var77, text)
	end,
	LINE_BREAK = function() --[[ line: 141 ]]
		return "<br />"
	end,
	BREAK = function() --[[ line: 145 ]]
		return "<br />\n"
	end,
	IMAGE = function(p18) --[[ line: 149 ]]
		-- upvalues: sanitize (ref)
		return `<img src="{string.gsub(if p18.attributes then p18.attributes.url else p18.url or "", "([^%w_%%%-%.%*%?%(%)#~/:=])", function(p19) --[[ line: 22 ]]
			return string.format("%%%02X", string.byte(p19))
		end)}" alt="{sanitize(p18.text or "")}" />`
	end,
	TABLE_HEADER = emptyHandler,
	TABLE_ROW = emptyHandler,
	ACTION = emptyHandler
}

function t.map(p20) --[[ line: 181 ]]
	-- upvalues: map (ref)
	return map(p20)
end

return t