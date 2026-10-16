local _ = require(script:FindFirstAncestor("Markdown").Types)
local InsertFunction = table.insert

return function(Text: string) --[[ Line: 11 | Named "tokenize" ]]
	-- upvalues: InsertFunction (copy)
	local config = {
		["\n"] = {
			{ "LINE_BREAK", "^\n", "^\n", 1 },
			{ "HEADING", "^[#]+", "^([#]+)" },
			{ "DIVIDER", "^[-]+[ \t]*\n", "^([-]+)[ \t]*\n", 1 },
			{ "DIVIDER", "^[=]+[ \t]*\n", "^([=]+)[ \t]*\n", 1 },
			{ "BULLET_LIST_ITEM", "^%s*%*", "^(%s*)(%*)" },
			{ "BULLET_LIST_ITEM_2", "^%s*-", "^(%s*)(-)" },
			{ "CODE_BLOCK", "^```[%w]*\n.-```", "^```([%w]*)\n(.-)```" },
			{ "CODE_BLOCK", "^```[%w]*\n.+$", "^```([%w]*)\n(.+)$" },
			{ "QUOTE", "^%s*>" },
			{
				"ORDERED_LIST_ITEM",
				"^%s*[0-9]+%.[ \t]+",
				"^(%s*)([0-9]+)%.[ \t]+"
			},
			{
				"ORDERED_LIST_ITEM",
				"^%s*[A-Za-z]%.[ \t]+",
				"^(%s*)([A-Za-z])%.[ \t]+"
			},
			{ "TABLE_ROW", "^|" }
		},
		["\\"] = { { "ESCAPE", "^\\.", "^\\(.)" } },
		["-"] = { { "TABLE_HEADER", "^[-]+" } },
		["="] = { { "TABLE_HEADER_2", "^[=]+" } },
		["!"] = {
			{
				"IMAGE",
				"^!%[[^%]]+%]%([^%)]+%)",
				"^!%[([^%]]+)%]%(([^%)]+)%)"
			}
		},
		["|"] = { { "TABLE_DIVIDER", "^|" } },
		["<"] = {
			{ "OPEN_CLOSE", "^<[^>]*/>", "^<([%w-]+)%s?([^>]*)/>" },
			{ "CLOSE", "^</[^>]*>", "^</([%w-]+)%s?([^>]*)>" },
			{ "OPEN", "^<[^>]*>", "^<([%w-]+)%s?([^>]*)>" }
		},
		["*"] = { { "BOLD_2", "^%*%*" }, { "BOLD", "^%*" } },
		_ = { { "ITALIC_2", "^__" }, { "ITALIC", "^_" } },
		["~"] = { { "STRIKE", "^~" } },
		["["] = {
			{
				"LINK",
				"^%[[^%]]+%]%([^%)]+%)",
				"^%[([^%]]+)%]%(([^%)]+)%)"
			},
			{ "ACTION", "^%[%[[^%]]+%]%]", "^%[%[([^%]]+)%]%]" }
		},
		["`"] = {
			{ "INLINE_CODE", "^`[^\n`]*`", "^`([^\n`]*)`" },
			{ "INLINE_CODE", "^`[^\n`]+$", "^`([^\n`]+)$" }
		}
	}
	local Offset = 0
	local Offset1 = 0
	local t = {}
	local Segment1 = nil
	local v1 = nil
	local Segment = nil
	local Flag = nil
	while Offset <= #Text do
		Segment1 = if Offset == 0 then "\n" else Text:sub(Offset, Offset)
		local Entry = config[Segment1]
		Flag = false
		
		if Entry then
			v1 = if Segment1 == "\n" then 1 else 0
			Segment = Text:sub(Offset + v1)
			local MatchResult = nil
			
			for _, value in Entry do
				MatchResult = Segment:match(value[2])
				
				if MatchResult then
					local Entry1 = value[1]
					local Entry11 = value[3]
					local v2 = #MatchResult - (value[4] or 0)
					
					if Offset ~= Offset1 then
						InsertFunction(t, {
							name = "TEXT",
							text = Text:sub(Offset1, Offset - 1),
							offset = Offset1
						})
					end
					local config1 = {
						name = Entry1,
						text = MatchResult,
						capture = if Entry11 then { Segment:match(Entry11) } else nil,
						isBlock = Segment1 == "\n"
					}
					config1.offset = Offset
					InsertFunction(t, config1)
					Offset += v1 + v2
					Offset1 = Offset
					Flag = true
					break
				end
			end
		end
		if not Flag then
			Offset += 1
		end
	end
	if Offset ~= Offset1 then
		InsertFunction(t, {
			name = "TEXT",
			text = Text:sub(Offset1, Offset - 1),
			offset = Offset1
		})
	end
	return t
end