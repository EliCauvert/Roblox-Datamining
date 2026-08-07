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
	OPEN = function(p0, p1, p2) --[[ line: 32 ]]
		-- upvalues: parseXmlAttributesModule (ref), tokenNameModule (ref)
		table.insert(p0, {
			name = tokenNameModule.Open,
			text = p1,
			attributes = parseXmlAttributesModule(p2)
		})
	end,
	CLOSE = function(p3, p4) --[[ line: 40 ]]
		-- upvalues: tokenNameModule (ref)
		table.insert(p3, { name = tokenNameModule.Close, text = p4, attributes = {} })
	end,
	OPEN_CLOSE = function(p5, p6, p7) --[[ line: 47 ]]
		-- upvalues: parseXmlAttributesModule (ref), tokenNameModule (ref)
		table.insert(p5, {
			name = tokenNameModule.Open,
			text = p6,
			attributes = parseXmlAttributesModule(p7)
		})
		table.insert(p5, { name = tokenNameModule.Close, text = p6, attributes = {} })
	end
}

return function(p8) --[[ line: 62 | named "tokenize" ]]
	-- upvalues: list (ref), tokenNameModule (ref), escapeRichFormattingModule (ref), t (ref)
	local var10, name, matchIndex, matchIndex_1, var14, var15
	local var6 = 0
	local var7 = 0
	local t_1 = {}
	local replaced = string.gsub(p8, "\n+", " ")
	
	for i in string.gmatch(replaced, "()<") do
		if i >= var6 then
			var6 = i
			var10 = false
			
			for i_1, v in list do
				name = v.name
				local pattern = v.pattern
				matchIndex, matchIndex_1 = string.find(replaced, pattern, var6)
				
				if matchIndex and matchIndex_1 then
					local list_1 = { string.match(replaced, pattern, var6) }
					var14 = list_1[1]
					var15 = list_1[2] or ""
					
					if var14 then
						if var6 ~= var7 then
							table.insert(t_1, {
								name = tokenNameModule.Text,
								text = escapeRichFormattingModule(string.sub(replaced, var7, var6 - 1)),
								attributes = {}
							})
						end
						if var14 ~= "br" then
							t[name](t_1, var14, var15)
						elseif name == "OPEN" or name == "OPEN_CLOSE" then
							table.insert(t_1, { text = "", name = tokenNameModule.Break, attributes = {} })
						end
						var6 += matchIndex_1 - matchIndex + 1
						var7 = var6
						var10 = true
						break
					end
				end
			end
			if not var10 then
				var6 += 1
			end
		end
	end
	var6 = #replaced + 1
	
	if var6 ~= var7 then
		table.insert(t_1, {
			name = tokenNameModule.Text,
			text = escapeRichFormattingModule(string.sub(replaced, var7, var6 - 1)),
			attributes = {}
		})
	end
	if t_1[1] and t_1[1].name == tokenNameModule.Text and t_1[1].text == "" then
		table.remove(t_1, 1)
	end
	return t_1
end