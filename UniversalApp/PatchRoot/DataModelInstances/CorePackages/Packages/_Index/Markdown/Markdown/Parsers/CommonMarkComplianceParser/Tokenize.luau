local _ = require(script:FindFirstAncestor("Markdown").Types)
local ConstantsModule = require(script.Parent.Parent.Constants)
local PostProcessTokensModule = require(script.Parent.PostProcessTokens)
local UtilsModule = require(script.Parent.Utils)
local InsertFunction = table.insert
local list = { { "BREAK", "^\\\n" }, { "ESCAPE", "^\\(%p)" } }
local list1 = { { "IMAGE", "^!%[([^%]]+)%]%(([^%)]+)%)" } }
local list2 = {
	{ "OPEN_CLOSE", "^<([%w-]+)%s?([^>]*)/>" },
	{ "CLOSE", "^</([%w-]+)%s?([^>]*)>" },
	{ "OPEN", "^<([%w-]+)%s?([^>]*)>" }
}
local list3 = { { "BOLD_2", "^%*%*" }, { "BOLD", "^%*" } }
local list4 = { { "ITALIC_2", "^__" }, { "ITALIC", "^_" } }
local list5 = { { "STRIKE", "^~" } }
local list6 = { { "INLINE_CODE", "^`" } }
local config = {
	["\\"] = list,
	["!"] = list1,
	["<"] = list2,
	["*"] = list3,
	_ = list4,
	["~"] = list5,
	["`"] = list6
}
local config1 = {
	["\n"] = {
		{ "LINE_BREAK", "^\n", 1 },
		{ "HEADING", "^ ? ? ?(##?#?#?#?#?)[ \t]+", 1 },
		{ "HEADING", "^ ? ? ?(##?#?#?#?#?)\n", 1 },
		{
			"DIVIDER",
			"^ ? ? ?%-[ \t]*%-[ \t]*%-[ \t]*[%- \t]*\n",
			1
		},
		{
			"DIVIDER",
			"^ ? ? ?%*[ \t]*%*[ \t]*%*[ \t]*[%* \t]*\n",
			1
		},
		{ "DIVIDER", "^ ? ? ?_[ \t]*_[ \t]*_[ \t]*[_ \t]*\n", 1 },
		{ "BULLET_LIST_ITEM", "^(%s*)(%* )" },
		{ "BULLET_LIST_ITEM_2", "^(%s*)(- )" },
		{ "CODE_BLOCK", "^```[ \t]*([^\n]*)[ \t]*\n(.-)```" },
		{ "CODE_BLOCK", "^```[ \t]*([^\n]*)[ \t]*\n(.+)$" },
		{ "CODE_BLOCK", "^~~~[ \t]*([^\n]*)[ \t]*\n(.-)~~~" },
		{ "CODE_BLOCK", "^~~~[ \t]*([^\n]*)[ \t]*\n(.+)$" },
		{ "QUOTE", "^%s*>" },
		{ "ORDERED_LIST_ITEM", "^(%s*)([0-9]+)%.[ \t]+" },
		{ "ORDERED_LIST_ITEM", "^(%s*)([A-Za-z])%.[ \t]+" },
		{ "TABLE_ROW", "^|" }
	},
	["\\"] = list,
	["-"] = { { "TABLE_HEADER", "^[-]+" } },
	["="] = { { "TABLE_HEADER_2", "^[=]+" } },
	["!"] = list1,
	["|"] = { { "TABLE_DIVIDER", "^|" } },
	["<"] = list2,
	["*"] = list3,
	_ = list4,
	["~"] = list5,
	["["] = {
		{
			"LINK",
			"^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]\"([^\n]+)\"[ \t]*%)"
		},
		{
			"LINK",
			"^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]'([^\n]+)'[ \t]*%)"
		},
		{
			"LINK",
			"^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]%(([^\n]+)%)[ \t]*%)"
		},
		{ "LINK", "^%[([^%]]*)%]%([ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*<>[ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*<([^\n\t]+)>[ \t]*%)" },
		{ "LINK", "^%[([^%]]*)%]%([ \t]*([^\n\t ]+)[ \t]*%)" },
		{ "ACTION", "^%[%[([^%]]+)%]%]" }
	},
	["`"] = list6
}
local list7 = { { "LINE_BREAK", "^[ \t\r]+\n", 1 } }
table.move(config1["\n"], 1, #config1["\n"], #list7 + 1, list7)
local config2 = {
	LINK = {
		startToken = "LINK_START",
		endToken = "LINK_END",
		textStartOffset = 1,
		mapToText = function(p1) --[[ Line: 109 ]]
			return p1.capture and p1.capture[1] or ""
		end
	}
}
local list71 = { { "HEADING", "^  ? ?(#+)%s*\n", 1 } }

local function tokenizeTextSpan(Text: string, NewOffset: number, p1, p2) --[[ Line: 123 ]]
	-- upvalues: config (copy), list7 (copy), config1 (copy), list71 (copy), UtilsModule (copy), ConstantsModule (copy), InsertFunction (copy), PostProcessTokensModule (copy)
	local StartIndex = 0
	local StartIndex1 = 0
	local v1 = 0
	local t = {}
	local v2 = nil
	local v3 = nil
	local Segment = nil
	local Flag = nil
	while StartIndex <= #Text do
		Segment = if StartIndex == 0 and not p1 then "\n" else string.sub(Text, StartIndex, StartIndex)
		local Entry = if p1 then config[Segment] or {} elseif Segment == "\n" and v2 == "QUOTE" then list7 else config1[Segment] or list71
		Flag = false
		v3 = 0
		
		if Segment == "\n" and not p1 then
			v3 = 1
			v1 = StartIndex
		end
		local v4 = nil
		local list1 = nil
		local Segment1 = nil
		local CharacterContext = nil
		local Entry1 = nil
		for _, value in Entry do
			local Pattern = value[2]
			local StartIndex2, EndIndex = string.find(Text, Pattern, StartIndex + v3)
			
			if StartIndex2 and EndIndex then
				Segment1 = string.sub(Text, StartIndex2, EndIndex)
				Entry1 = value[1]
				v4 = #Segment1 - (value[3] or 0)
				CharacterContext = nil
				
				if not p1 then
					local _, EndIndex1 = string.find(Segment1, "\n[^\n]*$")
					
					if EndIndex1 then
						v1 = EndIndex1 + StartIndex2
					end
				end
				if Entry1 ~= "ESCAPE" or not UtilsModule.isInsideInlineCode(t, v1) then
					if ConstantsModule.STYLED_TEXT[Entry1] then
						CharacterContext = UtilsModule.getCharacterContext(Text, StartIndex, v3 + v4)
					end
					list1 = { string.match(Text, Pattern, StartIndex + v3) }
					
					if not p1 or Segment ~= "<" or #list1 <= 0 or p2.inlineTags[list1[1]] then
						if StartIndex ~= StartIndex1 then
							InsertFunction(t, {
								name = "TEXT",
								text = string.sub(Text, StartIndex1, StartIndex - 1),
								offset = StartIndex1 + NewOffset
							})
						end
						local IsSegmentMatch: boolean = not p1 and Segment == "\n"
						
						if IsSegmentMatch then
							v2 = Entry1
						end
						local config2 = {
							name = Entry1,
							text = Segment1,
							capture = if #list1 > 0 then list1 else nil,
							isBlock = IsSegmentMatch
						}
						config2.offset = StartIndex + NewOffset
						config2.context = CharacterContext
						InsertFunction(t, config2)
						StartIndex += v3 + v4
						StartIndex1 = StartIndex
						Flag = true
						break
					end
				end
			end
		end
		if not Flag then
			StartIndex += 1
		end
	end
	if StartIndex ~= StartIndex1 then
		InsertFunction(t, {
			name = "TEXT",
			text = string.sub(Text, StartIndex1, StartIndex - 1),
			offset = StartIndex1 + NewOffset
		})
	end
	return PostProcessTokensModule(t)
end

return function(Text: string, p3) --[[ Line: 232 | Named "tokenize" ]]
	-- upvalues: tokenizeTextSpan (copy), config2 (copy), InsertFunction (copy)
	local t = {}
	
	for _, value in tokenizeTextSpan(Text, 0, false, p3) do
		local Entry = config2[value.name]
		
		if Entry then
			local list = {
				{
					name = Entry.startToken,
					offset = value.offset,
					text = string.sub(Text, value.offset, value.offset + Entry.textStartOffset - 1),
					capture = value.capture
				}
			}
			local MapToTextResult = Entry.mapToText(value)
			local KenizeTextSpan = tokenizeTextSpan(MapToTextResult, value.offset + Entry.textStartOffset, true, p3)
			table.move(KenizeTextSpan, 1, #KenizeTextSpan, 2, list)
			local NewOffset = value.offset + Entry.textStartOffset + #MapToTextResult
			InsertFunction(list, {
				name = Entry.endToken,
				offset = NewOffset,
				text = string.sub(Text, NewOffset, value.offset + #value.text - 1)
			})
			table.move(list, 1, #list, #t + 1, t)
		else
			InsertFunction(t, value)
		end
	end
	return t
end