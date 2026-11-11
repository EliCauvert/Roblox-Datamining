local _ = require(script:FindFirstAncestor("Markdown").Types)
local t = {}

local function sanitize(Text: string)
	return Text:gsub("&amp;", "&"):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&quot;", "\""):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub("\"", "&quot;"):gsub(" *\n *", "\n")
end

local function _(Text: string): string
	return string.gsub(Text, "([^%w_%%%-%.%*%?%(%)#~/:=])", function(Text: string): string
		return string.format("%%%02X", string.byte(Text))
	end)
end

local function map(p1)
	-- upvalues: t (ref)
	local Entry = t[p1.name]
	
	if Entry then
		return Entry(p1)
	else
		error(`No handler found for node {p1.name}`)
	end
end

local _ = function(List): string
	-- upvalues: t (ref)
	if not List then
		return ""
	end
	local v1 = ""
	
	for _, value in List do
		local v2: string = v1
		local Entry = t[value.name]
		local EntryResult = nil
		
		if Entry then
			EntryResult = Entry(value)
		else
			error(`No handler found for node {value.name}`)
			EntryResult = nil
		end
		v1 = v2 .. EntryResult
	end
	return v1
end

local function emptyHandler(p2): string
	-- upvalues: t (ref)
	local Children = p2.children
	
	if not Children then
		return ""
	end
	local v3 = ""
	
	for _, child in Children do
		local v4: string = v3
		local Entry = t[child.name]
		local EntryResult = nil
		
		if Entry then
			EntryResult = Entry(child)
		else
			error(`No handler found for node {child.name}`)
			EntryResult = nil
		end
		v3 = v4 .. EntryResult
	end
	return v3
end

t = {
	ROOT = function(p3): string
		-- upvalues: t (ref)
		local Children = p3.children
		
		if not Children then
			return ""
		end
		local v5 = ""
		
		for _, child in Children do
			local v6: string = v5
			local Entry = t[child.name]
			local EntryResult = nil
			
			if Entry then
				EntryResult = Entry(child)
			else
				error(`No handler found for node {child.name}`)
				EntryResult = nil
			end
			v5 = v6 .. EntryResult
		end
		return v5
	end,
	HEADING = function(p4): string
		-- upvalues: t (ref)
		local Depth = if p4.attributes then p4.attributes.depth else 1
		local v7 = "<h%*>%*</h%*>\n"
		local Children = p4.children
		local v8 = nil
		
		if Children then
			local v9 = ""
			
			for _, child in Children do
				local v10: string = v9
				local Entry = t[child.name]
				local EntryResult = nil
				
				if Entry then
					EntryResult = Entry(child)
				else
					error(`No handler found for node {child.name}`)
					EntryResult = nil
				end
				v9 = v10 .. EntryResult
			end
			v8 = v9
		else
			v8 = ""
		end
		return (v7:format(Depth, v8, Depth))
	end,
	PARAGRAPH = function(p5): string
		-- upvalues: t (ref)
		local v11 = "<p>%*</p>\n"
		local Children = p5.children
		local Text = nil
		
		if Children then
			local v12 = ""
			
			for _, child in Children do
				local v13: string = v12
				local Entry = t[child.name]
				local EntryResult = nil
				
				if Entry then
					EntryResult = Entry(child)
				else
					error(`No handler found for node {child.name}`)
					EntryResult = nil
				end
				v12 = v13 .. EntryResult
			end
			Text = v12
		else
			Text = ""
		end
		return (v11:format((Text:gsub("^ +", ""):gsub(" +$", ""))))
	end,
	TEXT = function(p6)
		-- upvalues: sanitize (copy)
		return sanitize(p6.text or "")
	end,
	STYLED_TEXT = function(p6): string?
		-- upvalues: t (ref)
		local Style = if p6.attributes then p6.attributes.style else nil
		
		if Style == "BOLD" or Style == "ITALIC" then
			local v14 = "<em>%*</em>"
			local Children = p6.children
			local v15 = nil
			
			if Children then
				local v16 = ""
				
				for _, child in Children do
					local v17: string = v16
					local Entry = t[child.name]
					local EntryResult = nil
					
					if Entry then
						EntryResult = Entry(child)
					else
						error(`No handler found for node {child.name}`)
						EntryResult = nil
					end
					v16 = v17 .. EntryResult
				end
				v15 = v16
			else
				v15 = ""
			end
			return (v14:format(v15))
		elseif Style == "BOLD_2" or Style == "ITALIC_2" then
			local v18 = "<strong>%*</strong>"
			local Children = p6.children
			local v19 = nil
			
			if Children then
				local v20 = ""
				
				for _, child1 in Children do
					local v21: string = v20
					local Entry = t[child1.name]
					local EntryResult = nil
					
					if Entry then
						EntryResult = Entry(child1)
					else
						error(`No handler found for node {child1.name}`)
						EntryResult = nil
					end
					v20 = v21 .. EntryResult
				end
				v19 = v20
			else
				v19 = ""
			end
			return (v18:format(v19))
		elseif Style == "STRIKE" then
			local v22 = "<u>%*</u>"
			local Children = p6.children
			local v23 = nil
			
			if Children then
				local v24 = ""
				
				for _, child2 in Children do
					local v25: string = v24
					local Entry = t[child2.name]
					local EntryResult = nil
					
					if Entry then
						EntryResult = Entry(child2)
					else
						error(`No handler found for node {child2.name}`)
						EntryResult = nil
					end
					v24 = v25 .. EntryResult
				end
				v23 = v24
			else
				v23 = ""
			end
			return (v22:format(v23))
		elseif Style == "INLINE_CODE" then
			local v26 = "<code>%*</code>"
			local Children = p6.children
			local v27 = nil
			
			if Children then
				local v28 = ""
				
				for _, child3 in Children do
					local v29: string = v28
					local Entry = t[child3.name]
					local EntryResult = nil
					
					if Entry then
						EntryResult = Entry(child3)
					else
						error(`No handler found for node {child3.name}`)
						EntryResult = nil
					end
					v28 = v29 .. EntryResult
				end
				v27 = v28
			else
				v27 = ""
			end
			return (v26:format(v27))
		else
			if Style ~= nil then
				error(`Unknown text style {Style}`)
				
				return
			end
			local Children = p6.children
			
			if not Children then
				return ""
			end
			local v30 = ""
			
			for _, child4 in Children do
				local v31: string = v30
				local Entry = t[child4.name]
				local EntryResult = nil
				
				if Entry then
					EntryResult = Entry(child4)
				else
					error(`No handler found for node {child4.name}`)
					EntryResult = nil
				end
				v30 = v31 .. EntryResult
			end
			return v30
		end
	end,
	DIVIDER = function(): string
		return "<hr />\n"
	end,
	QUOTE = function(p7): string
		-- upvalues: t (ref)
		local v32 = "<blockquote>\n%*</blockquote>\n"
		local Children = p7.children
		local v33 = nil
		
		if Children then
			local v34 = ""
			
			for _, child in Children do
				local v35: string = v34
				local Entry = t[child.name]
				local EntryResult = nil
				
				if Entry then
					EntryResult = Entry(child)
				else
					error(`No handler found for node {child.name}`)
					EntryResult = nil
				end
				v34 = v35 .. EntryResult
			end
			v33 = v34
		else
			v33 = ""
		end
		return (v32:format(v33))
	end,
	CODE_BLOCK = function(p8): string
		local List = {}
		
		if p8.attributes and p8.attributes.language and p8.attributes.language ~= "" then
			table.insert(List, "language-" .. p8.attributes.language)
		end
		local List1 = {}
		
		if #List > 0 then
			table.insert(List1, `class="{table.concat(List, " ")}"`)
		end
		return `<pre><code{if #List1 > 0 then ` {table.concat(List1, " ")}` else ""}>{p8.text}</code></pre>\n`
	end,
	LIST = function(p9): string
		-- upvalues: t (ref)
		local Ol: string = if p9.attributes and p9.attributes.ordered then "ol" else "ul"
		local v36 = "<%*>\n%*</%*>\n"
		local Children = p9.children
		local v37 = nil
		
		if Children then
			local v38 = ""
			
			for _, child in Children do
				local v39: string = v38
				local Entry = t[child.name]
				local EntryResult = nil
				
				if Entry then
					EntryResult = Entry(child)
				else
					error(`No handler found for node {child.name}`)
					EntryResult = nil
				end
				v38 = v39 .. EntryResult
			end
			v37 = v38
		else
			v37 = ""
		end
		return (v36:format(Ol, v37, Ol))
	end,
	LIST_ITEM = function(p10): string
		-- upvalues: t (ref)
		local v40 = "<li>%*</li>\n"
		local Children = p10.children
		local v41 = nil
		
		if Children then
			local v42 = ""
			
			for _, child in Children do
				local v43: string = v42
				local Entry = t[child.name]
				local EntryResult = nil
				
				if Entry then
					EntryResult = Entry(child)
				else
					error(`No handler found for node {child.name}`)
					EntryResult = nil
				end
				v42 = v43 .. EntryResult
			end
			v41 = v42
		else
			v41 = ""
		end
		return (v40:format(v41))
	end,
	LINK = function(p11): string
		-- upvalues: t (ref), sanitize (copy)
		local Url = p11.attributes and p11.attributes.url or (p11.url or "")
		local Title = p11.attributes and p11.attributes.title or nil
		local Children = p11.children
		local v44 = nil
		
		if Children then
			local v45 = ""
			
			for _, child in Children do
				local v46: string = v45
				local Entry = t[child.name]
				local EntryResult = nil
				
				if Entry then
					EntryResult = Entry(child)
				else
					error(`No handler found for node {child.name}`)
					EntryResult = nil
				end
				v45 = v46 .. EntryResult
			end
			v44 = v45
		else
			v44 = ""
		end
		if v44 == "" and p11.text then
			v44 = sanitize(p11.text)
		end
		return `<a href="{string.gsub(Url, "([^%w_%%%-%.%*%?%(%)#~/:=])", function(Text: string): string
			return string.format("%%%02X", string.byte(Text))
		end)}"{if Title then ` title="{sanitize(Title)}"` else ""}>{v93}</a>`
	end,
	TAG = function(p12): string
		-- upvalues: t (ref)
		local Text = p12.text
		
		if not Text or Text == "" then
			error("TAG node must have a text value")
		end
		local v47 = ""
		
		if p12.attributes then
			for i, attribute in p12.attributes do
				v47 = `{v47} {i}="{attribute}"`
			end
		end
		if not p12.children or #p12.children <= 0 then
			return `<{Text}{v47} />`
		end
		local v48 = "<%*%*>%*</%*>"
		local v49: string = v47
		local Children = p12.children
		local v50 = nil
		
		if Children then
			local v51 = ""
			
			for _, child in Children do
				local v52: string = v51
				local Entry = t[child.name]
				local EntryResult = nil
				
				if Entry then
					EntryResult = Entry(child)
				else
					error(`No handler found for node {child.name}`)
					EntryResult = nil
				end
				v51 = v52 .. EntryResult
			end
			v50 = v51
		else
			v50 = ""
		end
		return (v48:format(Text, v49, v50, Text))
	end,
	LINE_BREAK = function(): string
		return "<br />"
	end,
	BREAK = function(): string
		return "<br />\n"
	end,
	IMAGE = function(p13): string
		-- upvalues: sanitize (copy)
		return `<img src="{string.gsub(p14.attributes and p14.attributes.url or (p14.url or ""), "([^%w_%%%-%.%*%?%(%)#~/:=])", function(Text: string): string
			return string.format("%%%02X", string.byte(Text))
		end)}" alt="{sanitize(p14.text or "")}" />`
	end,
	TABLE_HEADER = emptyHandler,
	TABLE_ROW = emptyHandler,
	ACTION = emptyHandler
}

return {
	map = function(p13)
		-- upvalues: map (copy)
		return map(p13)
	end
}