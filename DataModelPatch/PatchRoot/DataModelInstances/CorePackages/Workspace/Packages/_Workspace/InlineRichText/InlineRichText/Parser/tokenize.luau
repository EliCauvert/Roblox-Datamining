local InlineRichText = script:FindFirstAncestor("InlineRichText")
local _ = require(InlineRichText.Types)
local TokenNameModule = require(InlineRichText.Enums.TokenName)
local ParseXmlAttributesModule = require(InlineRichText.Parser.parseXmlAttributes)
local EscapeRichFormattingModule = require(InlineRichText.Utils.escapeRichFormatting)
local list = {
	{ name = "OPEN_CLOSE", pattern = "^<([%w-]+)%s?([^>]*)/>" },
	{ name = "OPEN", pattern = "^<([%w-]+)%s?([^>]*)>" },
	{ name = "CLOSE", pattern = "^</([%w-]+)%s?([^>]*)>" }
}
local config = {
	OPEN = function(List, Text, p1)
		-- upvalues: ParseXmlAttributesModule (copy), TokenNameModule (copy)
		table.insert(List, {
			name = TokenNameModule.Open,
			text = Text,
			attributes = ParseXmlAttributesModule(p1)
		})
	end,
	CLOSE = function(List, Text)
		-- upvalues: TokenNameModule (copy)
		table.insert(List, {
			name = TokenNameModule.Close,
			text = Text,
			attributes = {}
		})
	end,
	OPEN_CLOSE = function(List, Text, p1)
		-- upvalues: ParseXmlAttributesModule (copy), TokenNameModule (copy)
		table.insert(List, {
			name = TokenNameModule.Open,
			text = Text,
			attributes = ParseXmlAttributesModule(p1)
		})
		table.insert(List, {
			name = TokenNameModule.Close,
			text = Text,
			attributes = {}
		})
	end
}

return function(Text: string)
	-- upvalues: list (copy), TokenNameModule (copy), EscapeRichFormattingModule (copy), config (copy)
	local Init = 0
	local StartIndex = 0
	local List = {}
	local Replaced = string.gsub(Text, "\n+", " ")
	local Entry = nil
	local Flag = nil
	local EndIndex = nil
	local Entry1 = nil
	local StartIndex1 = nil
	local Name = nil
	
	for i in string.gmatch(Replaced, "()<") do
		if i >= Init then
			Init = i
			Flag = false
			
			for _, value in list do
				Name = value.name
				local Pattern = value.pattern
				StartIndex1, EndIndex = string.find(Replaced, Pattern, Init)
				
				if StartIndex1 and EndIndex then
					local list1 = { string.match(Replaced, Pattern, Init) }
					Entry = list1[1]
					Entry1 = list1[2] or ""
					
					if Entry then
						if Init ~= StartIndex then
							table.insert(List, {
								name = TokenNameModule.Text,
								text = EscapeRichFormattingModule((string.sub(Replaced, StartIndex, Init - 1))),
								attributes = {}
							})
						end
						if Entry == "br" then
							if Name == "OPEN" or Name == "OPEN_CLOSE" then
								table.insert(List, { text = "", name = TokenNameModule.Break, attributes = {} })
							end
						else
							config[Name](List, Entry, Entry1)
						end
						Init += EndIndex - StartIndex1 + 1
						StartIndex = Init
						Flag = true
						break
					end
				end
			end
			if not Flag then
				Init += 1
			end
		end
	end
	local StartIndex2 = #Replaced + 1
	
	if StartIndex2 ~= StartIndex then
		table.insert(List, {
			name = TokenNameModule.Text,
			text = EscapeRichFormattingModule((string.sub(Replaced, StartIndex, StartIndex2 - 1))),
			attributes = {}
		})
	end
	if List[1] and List[1].name == TokenNameModule.Text and List[1].text == "" then
		table.remove(List, 1)
	end
	return List
end