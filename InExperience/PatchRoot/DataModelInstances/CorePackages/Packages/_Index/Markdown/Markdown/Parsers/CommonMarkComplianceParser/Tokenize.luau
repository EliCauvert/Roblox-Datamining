local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Types)
local ConstantsModule = require(script.Parent.Parent.Constants)
local PostProcessTokensModule = require(script.Parent.PostProcessTokens)
local UtilsModule = require(script.Parent.Utils)
local Flags = require(Markdown.Parent.MarkdownCore).Flags
local InsertFunction = table.insert
local config = {
	ACTION = true,
	OPEN = true,
	CLOSE = true,
	OPEN_CLOSE = true
}

local function createInlineCodeTracker(Text)
	local v1 = -1
	local Count = nil
	local Count1 = 0
	local v2 = -1
	local Flag = nil
	
	local function _()
		-- upvalues: Count1 (ref), Count (ref), Flag (ref)
		if Count1 == 0 then return end
		if Count == nil then
			Count = Count1
		elseif Count == Count1 then
			Count = nil
		end
		Count1 = 0
		Flag = nil
	end
	
	local _ = function(p1)
		-- upvalues: v1 (ref), Count (ref), Count1 (ref), v2 (ref), Flag (ref)
		if p1 ~= v1 then
			v1 = p1
			Count = nil
			Count1 = 0
			v2 = -1
			Flag = nil
		end
	end
	
	return {
		addBacktick = function(p1, StartIndex)
			-- upvalues: v1 (ref), Count (ref), Count1 (ref), v2 (ref), Flag (ref)
			if p1 ~= v1 then
				v1 = p1
				Count = nil
				Count1 = 0
				v2 = -1
				Flag = nil
			end
			if StartIndex ~= v2 + 1 and Count1 ~= 0 then
				if Count == nil then
					Count = Count1
				elseif Count == Count1 then
					Count = nil
				end
				Count1 = 0
				Flag = nil
			end
			Count1 += 1
			v2 = StartIndex
		end,
		isInside = function(p1): boolean
			-- upvalues: v1 (ref), Count (ref), Count1 (ref), v2 (ref), Flag (ref)
			if p1 ~= v1 then
				v1 = p1
				Count = nil
				Count1 = 0
				v2 = -1
				Flag = nil
			end
			if Count1 ~= 0 then
				if Count == nil then
					Count = Count1
				elseif Count == Count1 then
					Count = nil
				end
				Count1 = 0
				Flag = nil
			end
			return Count ~= nil
		end,
		isInsideClosed = function(p1, Init: number): boolean
			-- upvalues: v1 (ref), Count (ref), Count1 (ref), v2 (ref), Flag (ref), Text (copy)
			if p1 ~= v1 then
				v1 = p1
				Count = nil
				Count1 = 0
				v2 = -1
				Flag = nil
			end
			if Count1 ~= 0 then
				if Count == nil then
					Count = Count1
				elseif Count == Count1 then
					Count = nil
				end
				Count1 = 0
				Flag = nil
			end
			if Count == nil then
				return false
			end
			if Flag == nil then
				Flag = false
				local FoundAt: number = string.find(Text, "\n", Init, true) or #Text + 1
				for i in string.gmatch(string.sub(Text, Init, FoundAt - 1), "`+") do
					if #i == Count then
						Flag = true
						break
					end
				end
			end
			return Flag
		end
	}
end

local list = { { "TABLE_ROW", "^[ \t]*|?" } }

local function getTableRowCells(Text: string)
	-- upvalues: InsertFunction (copy)
	local t = {}
	
	for i in string.gmatch(string.gsub(string.gsub(string.gsub(string.match(Text, "^%s*(.-)%s*$") or "", "^|", ""), "|$", ""), "\\|", "") .. "|", "([^|]*)|") do
		InsertFunction(t, i)
	end
	return t
end

local function isDelimiterRow(Text: string): boolean
	-- upvalues: getTableRowCells (copy)
	if not string.find(Text, "|", 1, true) then
		return false
	end
	for _, value in getTableRowCells(Text) do
		if not string.match(value, "^%s*:?%-+:?%s*$") then
			return false
		end
	end
	return true
end

local Patterns = {
	"^ ? ? ?##?#?#?#?#?[ \t]", "^ ? ? ?##?#?#?#?#?$",
	"^ ? ? ?%-[ \t]*%-[ \t]*%-[ \t]*[%- \t]*$",
	"^ ? ? ?%*[ \t]*%*[ \t]*%*[ \t]*[%* \t]*$",
	"^ ? ? ?_[ \t]*_[ \t]*_[ \t]*[_ \t]*$", "^%s*[%*%-] ", "^%s*```", "^%s*~~~",
	"^%s*>", "^%s*[0-9]+%.[ \t]", "^%s*[A-Za-z]%.[ \t]"
}

local function _(Text: string): boolean
	-- upvalues: Patterns (copy)
	for _, pattern in Patterns do
		if string.find(Text, pattern) then
			return true
		end
	end
	return false
end

local _ = function(Text: string, p1): boolean
	-- upvalues: getTableRowCells (copy)
	return string.find(Text, "^[%s|:%-]*$") ~= nil and #getTableRowCells(Text) <= p1
end

local function isTableRow(Text: string, Init: number, IsTABLEROW, p1)
	-- upvalues: isDelimiterRow (copy), Patterns (copy), getTableRowCells (copy)
	local FoundAt: number? = string.find(Text, "\n", Init, true)
	local Segment = string.sub(Text, Init, if FoundAt then FoundAt - 1 else #Text)
	
	if IsTABLEROW then
		local v3 = false
		
		if string.find(Segment, "%S") ~= nil then
			v3 = isDelimiterRow(Segment)
			
			if not v3 then
				local Flag = false
				
				for _, pattern in Patterns do
					if string.find(Segment, pattern) then
						Flag = true
						break
					end
				end
				v3 = not Flag
			end
		end
		return v3
	else
		if string.find(Segment, "|", 1, true) then
			local Flag = false
			
			for _, pattern1 in Patterns do
				if string.find(Segment, pattern1) then
					Flag = true
					break
				end
			end
			if not Flag then
				local IsSegmentMatch: boolean = p1 and string.sub(Segment, 1, 1) == "|"
				
				if FoundAt then
					local FoundAt1: number? = string.find(Text, "\n", FoundAt + 1, true)
					local Segment1 = string.sub(Text, FoundAt + 1, if FoundAt1 then FoundAt1 - 1 else #Text)
					local Count = #getTableRowCells(Segment)
					
					return isDelimiterRow(Segment1) and #getTableRowCells(Segment1) == Count or IsSegmentMatch and (not FoundAt1 and (string.find(Segment1, "^[%s|:%-]*$") ~= nil and #getTableRowCells(Segment1) <= Count))
				else
					return IsSegmentMatch
				end
			end
		end
		return false
	end
end

local list1 = { { "BREAK", "^\\\n" }, { "ESCAPE", "^\\(%p)" } }
local list2 = { { "IMAGE", "^!%[([^%]]+)%]%(([^%)]+)%)" } }
local list3 = {
	{ "OPEN_CLOSE", "^<([%w-]+)%s?([^>]*)/>" },
	{ "CLOSE", "^</([%w-]+)%s?([^>]*)>" },
	{ "OPEN", "^<([%w-]+)%s?([^>]*)>" }
}
local list4 = { { "BOLD_2", "^%*%*" }, { "BOLD", "^%*" } }
local list5 = { { "ITALIC_2", "^__" }, { "ITALIC", "^_" } }
local list6 = { { "STRIKE", "^~" } }
local list7 = { { "INLINE_CODE", "^`" } }
local config1 = {
	["\\"] = list1,
	["!"] = list2,
	["<"] = list3,
	["*"] = list4,
	_ = list5,
	["~"] = list6,
	["`"] = list7
}
local config2 = {
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
	["\\"] = list1,
	["-"] = { { "TABLE_HEADER", "^[-]+" } },
	["="] = { { "TABLE_HEADER_2", "^[=]+" } },
	["!"] = list2,
	["|"] = { { "TABLE_DIVIDER", "^|" } },
	["<"] = list3,
	["*"] = list4,
	_ = list5,
	["~"] = list6,
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
	["`"] = list7
}
local list8 = { { "LINE_BREAK", "^[ \t\r]+\n", 1 } }
table.move(config2["\n"], 1, #config2["\n"], #list8 + 1, list8)

local function withoutTableRow(List)
	-- upvalues: InsertFunction (copy)
	local t = {}
	
	for _, value in List do
		if value[1] ~= "TABLE_ROW" then
			InsertFunction(t, value)
		end
	end
	return t
end

local WithoutTableRowResult = withoutTableRow(config2["\n"])
local WithoutTableRowResult1 = withoutTableRow(list8)
local config3 = {
	LINK = {
		startToken = "LINK_START",
		endToken = "LINK_END",
		textStartOffset = 1,
		mapToText = function(p2)
			return p2.capture and p2.capture[1] or ""
		end
	}
}
local list9 = { { "HEADING", "^  ? ?(#+)%s*\n", 1 } }

local function tokenizeTextSpan(Text: string, NewOffset: number, p2, p3)
	-- upvalues: Flags (copy), createInlineCodeTracker (copy), isTableRow (copy), config1 (copy), WithoutTableRowResult1 (copy), list8 (copy), list (copy), WithoutTableRowResult (copy), config2 (copy), list9 (copy), UtilsModule (copy), config (copy), ConstantsModule (copy), InsertFunction (copy), PostProcessTokensModule (copy)
	local StartIndex1 = 0
	local StartIndex = 0
	local v4 = 0
	local t = {}
	local v5 = nil
	local IsTABLEROW = false
	local IsIsStreaming: boolean = Flags.FFlagMarkdownTables and p3.isStreaming == true
	local InlineCodeTracker = if Flags.FFlagMarkdownTagFallbacks then createInlineCodeTracker(Text) else nil
	local Segment = nil
	local v6 = nil
	local v7 = nil
	local Flag = nil
	while StartIndex1 <= #Text do
		Segment = if StartIndex1 == 0 and not p2 then "\n" else string.sub(Text, StartIndex1, StartIndex1)
		local NoP11: boolean = Segment == "\n" and not p2
		local IsTableRow = Flags.FFlagMarkdownTables and (NoP11 and isTableRow(Text, StartIndex1 + 1, IsTABLEROW, IsIsStreaming and (StartIndex1 <= 1 or string.sub(Text, StartIndex1 - 1, StartIndex1 - 1) == "\n")))
		local NoIsTableRow: boolean = Flags.FFlagMarkdownTables and (NoP11 and not IsTableRow)
		local Entry = if p2 then config1[Segment] or {} elseif Segment == "\n" and v5 == "QUOTE" then if NoIsTableRow then WithoutTableRowResult1 else list8 elseif IsTableRow then list elseif NoIsTableRow then WithoutTableRowResult else config2[Segment] or list9
		Flag = false
		v6 = nil
		v7 = 0
		
		if Segment == "\n" and not p2 then
			v7 = 1
			v4 = StartIndex1
		end
		local list1 = nil
		local CharacterContext = nil
		local Segment1 = nil
		local Entry1 = nil
		local v8 = nil
		for _, value in Entry do
			local Pattern = value[2]
			local StartIndex2, EndIndex = string.find(Text, Pattern, StartIndex1 + v7)
			
			if StartIndex2 and EndIndex then
				Segment1 = string.sub(Text, StartIndex2, EndIndex)
				Entry1 = value[1]
				v8 = #Segment1 - (value[3] or 0)
				CharacterContext = nil
				
				if not p2 then
					local _, EndIndex1 = string.find(Segment1, "\n[^\n]*$")
					
					if EndIndex1 then
						v4 = EndIndex1 + StartIndex2
					end
				end
				local IsSegmentMatch: boolean = Flags.FFlagMarkdownTables and (v5 == "TABLE_ROW" and Segment1 == "\\|")
				
				if (Entry1 ~= "ESCAPE" or IsSegmentMatch or not (if InlineCodeTracker then InlineCodeTracker.isInside(v4) else UtilsModule.isInsideInlineCode(t, v4))) and (not InlineCodeTracker or not config[Entry1] or not InlineCodeTracker.isInsideClosed(v4, StartIndex1)) then
					if ConstantsModule.STYLED_TEXT[Entry1] then
						CharacterContext = UtilsModule.getCharacterContext(Text, StartIndex1, v7 + v8)
					end
					list1 = { string.match(Text, Pattern, StartIndex1 + v7) }
					
					if not p2 or Segment ~= "<" or #list1 <= 0 or p3.inlineTags[list1[1]] then
						if StartIndex1 ~= StartIndex then
							InsertFunction(t, {
								name = "TEXT",
								text = string.sub(Text, StartIndex, StartIndex1 - 1),
								offset = StartIndex + NewOffset
							})
						end
						local IsSegmentMatch1: boolean = not p2 and Segment == "\n"
						
						if IsSegmentMatch1 then
							v5 = Entry1
						end
						InsertFunction(t, {
							name = Entry1,
							text = Segment1,
							capture = if #list1 > 0 then list1 else nil,
							isBlock = IsSegmentMatch1,
							offset = StartIndex1 + NewOffset,
							context = CharacterContext
						})
						
						if InlineCodeTracker and Entry1 == "INLINE_CODE" then
							InlineCodeTracker.addBacktick(v4, StartIndex1)
						end
						StartIndex1 += v7 + v8
						StartIndex = StartIndex1
						Flag = true
						v6 = Entry1
						break
					end
				end
			end
		end
		if not Flag then
			StartIndex1 += 1
		end
		if Flags.FFlagMarkdownTables and NoP11 then
			IsTABLEROW = v6 == "TABLE_ROW"
		end
	end
	if StartIndex1 ~= StartIndex then
		InsertFunction(t, {
			name = "TEXT",
			text = string.sub(Text, StartIndex, StartIndex1 - 1),
			offset = StartIndex + NewOffset
		})
	end
	return PostProcessTokensModule(t)
end

return function(Text: string, p4)
	-- upvalues: tokenizeTextSpan (copy), config3 (copy), InsertFunction (copy)
	local t = {}
	
	for _, value in tokenizeTextSpan(Text, 0, false, p4) do
		local Entry = config3[value.name]
		
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
			local KenizeTextSpan = tokenizeTextSpan(MapToTextResult, value.offset + Entry.textStartOffset, true, p4)
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