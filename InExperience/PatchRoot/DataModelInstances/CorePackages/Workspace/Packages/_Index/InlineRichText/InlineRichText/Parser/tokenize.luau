local inlineRichText = script:FindFirstAncestor("InlineRichText")
local _ = require(inlineRichText.Types)
local tokenNameModule = require(inlineRichText.Enums.TokenName)
local parseXmlAttributesModule = require(inlineRichText.Parser.parseXmlAttributes)
local escapeRichFormattingModule = require(inlineRichText.Utils.escapeRichFormatting)
local _ = { Open = "OPEN", Close = "CLOSE", OpenClose = "OPEN_CLOSE" }
local list = {
	{ name = "OPEN_CLOSE", pattern = "^<([%w-]+)%s?([^>]*)/>" },
	{ name = "OPEN", pattern = "^<([%w-]+)%s?([^>]*)>" },
	{ name = "CLOSE", pattern = "^</([%w-]+)%s?([^>]*)>" }
}
local t = {
	OPEN = function(p1, p2, p3)
		-- upvalues: parseXmlAttributesModule (ref), tokenNameModule (ref)
		table.insert(p1, {
			name = tokenNameModule.Open,
			text = p2,
			attributes = parseXmlAttributesModule(p3)
		})
	end,
	CLOSE = function(p1, p2)
		-- upvalues: tokenNameModule (ref)
		table.insert(p1, { name = tokenNameModule.Close, text = p2, attributes = {} })
	end,
	OPEN_CLOSE = function(p1, p2, p3)
		-- upvalues: parseXmlAttributesModule (ref), tokenNameModule (ref)
		table.insert(p1, {
			name = tokenNameModule.Open,
			text = p2,
			attributes = parseXmlAttributesModule(p3)
		})
		table.insert(p1, { name = tokenNameModule.Close, text = p2, attributes = {} })
	end
}

return function(p1)
	-- upvalues: list (ref), tokenNameModule (ref), escapeRichFormattingModule (ref), t (ref)
	local var1, name, matchIndex, matchIndex_1, var2, var3
	local var4 = 0
	local var5 = 0
	local t_1 = {}
	local replaced = string.gsub(p1, "\n+", " ")
	
	for i in string.gmatch(replaced, "()<") do
		if i >= var4 then
			var4 = i
			var1 = false
			
			for i_1, v in list do
				name = v.name
				local pattern = v.pattern
				matchIndex, matchIndex_1 = string.find(replaced, pattern, var4)
				
				if matchIndex and matchIndex_1 then
					local list_1 = { string.match(replaced, pattern, var4) }
					var2 = list_1[1]
					var3 = list_1[2] or ""
					
					if var2 then
						if var4 ~= var5 then
							table.insert(t_1, {
								name = tokenNameModule.Text,
								text = escapeRichFormattingModule(string.sub(replaced, var5, var4 - 1)),
								attributes = {}
							})
						end
						if var2 ~= "br" then
							t[name](t_1, var2, var3)
						elseif name == "OPEN" or name == "OPEN_CLOSE" then
							table.insert(t_1, { text = "", name = tokenNameModule.Break, attributes = {} })
						end
						var4 += matchIndex_1 - matchIndex + 1
						var5 = var4
						var1 = true
						break
					end
				end
			end
			if not var1 then
				var4 += 1
			end
		end
	end
	var4 = #replaced + 1
	
	if var4 ~= var5 then
		table.insert(t_1, {
			name = tokenNameModule.Text,
			text = escapeRichFormattingModule(string.sub(replaced, var5, var4 - 1)),
			attributes = {}
		})
	end
	if t_1[1] and t_1[1].name == tokenNameModule.Text and t_1[1].text == "" then
		table.remove(t_1, 1)
	end
	return t_1
end