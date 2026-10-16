local Markdown = script:FindFirstAncestor("Markdown")
local ConstantsModule = require(Markdown.Parsers.Constants)
local _ = require(Markdown.Types)
local config = {
	BOLD = { char = "*", length = 1 },
	BOLD_2 = { char = "*", length = 2 },
	ITALIC = { char = "_", length = 1 },
	ITALIC_2 = { char = "_", length = 2 },
	STRIKE = { char = "~", length = 1 },
	INLINE_CODE = { char = "`", length = 1 }
}
local Utils = {
	getDelimiterInfo = function(p1) --[[ Line: 63 ]]
		-- upvalues: config (copy)
		return config[p1]
	end,
	causesLineBreak = function(p1): boolean --[[ Line: 67 ]]
		return p1.name ~= "TEXT" or string.find(p1.text, "\n", 0, true) ~= nil
	end,
	getTokenNameFromCharAndLength = function(p1, p2): string --[[ Line: 71 ]]
		return if p1 == "`" then "INLINE_CODE" elseif p1 == "~" then "STRIKE" elseif p2 == 2 then if p1 == "*" then "BOLD_2" else "ITALIC_2" elseif p1 == "*" then "BOLD" else "ITALIC"
	end,
	canDelimitersMatch = function(p1, p2): boolean --[[ Line: 83 ]]
		return p1.runLength ~= 0 and p2.runLength ~= 0 and (not (p1.canOpen and p1.canClose or p2.canOpen and p2.canClose) or (p1.runLength % 3 == 0 and p2.runLength % 3 == 0 or (p1.runLength + p2.runLength) % 3 ~= 0))
	end,
	addDelimiterMatch = function(p1, p2) --[[ Line: 110 ]]
		local Matches = p1.matches or {}
		p1.matches = Matches
		local v1 = 1
		local CountMatches = #Matches
		local NewCountMatches = CountMatches + 1
		local StartIdx = p2.with.startIdx
		while v1 <= CountMatches do
			local Floored = math.floor((v1 + CountMatches) / 2)
			
			if StartIdx < Matches[Floored].with.startIdx then
				NewCountMatches = Floored
				CountMatches = Floored - 1
			else
				v1 = Floored + 1
			end
		end
		table.insert(Matches, NewCountMatches, p2)
	end,
	isWhitespace = function(Text): boolean --[[ Line: 136 ]]
		-- upvalues: ConstantsModule (copy)
		return not Text or #Text == 0 or Text:match(ConstantsModule.ASCII.WHITESPACE_PATTERN) ~= nil or (if ConstantsModule.UNICODE.WHITESPACE[utf8.codepoint(Text)] then true else false)
	end,
	isPunctuation = function(Text): boolean --[[ Line: 158 ]]
		-- upvalues: ConstantsModule (copy)
		return if Text and #Text ~= 0 then if Text:match(ConstantsModule.ASCII.PUNCTUATION_PATTERN) then true elseif ConstantsModule.UNICODE.PUNCTUATION[utf8.codepoint(Text)] then true else false else false
	end
}

function Utils.isLeftFlanking(PrevChar, NextChar) --[[ Line: 179 ]]
	-- upvalues: Utils (copy)
	return not Utils.isWhitespace(NextChar) and (not Utils.isPunctuation(NextChar) or (Utils.isWhitespace(PrevChar) or Utils.isPunctuation(PrevChar)))
end

function Utils.isRightFlanking(PrevChar, NextChar) --[[ Line: 201 ]]
	-- upvalues: Utils (copy)
	return not Utils.isWhitespace(PrevChar) and (not Utils.isPunctuation(PrevChar) or (Utils.isWhitespace(NextChar) or Utils.isPunctuation(NextChar)))
end

function Utils.canOpenEmphasis(CharacterContext) --[[ Line: 223 ]]
	-- upvalues: Utils (copy)
	return CharacterContext.char == "`" or (if Utils.isLeftFlanking(CharacterContext.prevChar, CharacterContext.nextChar) then CharacterContext.char ~= "_" or (not Utils.isRightFlanking(CharacterContext.prevChar, CharacterContext.nextChar) or Utils.isPunctuation(CharacterContext.prevChar)) else false)
end

function Utils.canCloseEmphasis(CharacterContext) --[[ Line: 248 ]]
	-- upvalues: Utils (copy)
	return CharacterContext.char == "`" or (if Utils.isRightFlanking(CharacterContext.prevChar, CharacterContext.nextChar) then CharacterContext.char ~= "_" or (not Utils.isLeftFlanking(CharacterContext.prevChar, CharacterContext.nextChar) or Utils.isPunctuation(CharacterContext.nextChar)) else false)
end

function Utils.getCharacterContext(Text, p3: number, p4: number) --[[ Line: 271 ]]
	if #Text == 0 then
		return {}
	end
	local Character: string? = nil
	local Character1: string? = nil
	
	if p3 > 1 then
		local OffsetResult = utf8.offset(Text, -1, p3)
		
		if OffsetResult then
			Character = utf8.char(utf8.codepoint(Text, OffsetResult))
		end
	end
	local v2 = p3 + p4
	
	if v2 <= #Text then
		local OffsetResult = utf8.offset(Text, 1, v2)
		
		if OffsetResult then
			Character1 = utf8.char(utf8.codepoint(Text, OffsetResult))
		end
	end
	return { prevChar = Character, nextChar = Character1 }
end

function Utils.isInsideInlineCode(p3, p4, p5): boolean --[[ Line: 305 ]]
	local List = {}
	local v2 = nil
	local P18 = p5 or #p3
	for i = P18, 1, -1 do
		local v3 = p3[i]
		
		if v3.offset <= p4 then break end
		if v3.name == "INLINE_CODE" then
			if v2 and v2.offset - 1 == v3.offset then
				v2.length += 1
				v2.offset -= 1
			else
				v2 = { offset = v3.offset, length = #v3.text }
				table.insert(List, 1, v2)
			end
		end
	end
	local Flag = false
	local v4 = 1
	local v5 = nil
	while v4 <= #List do
		local Length = List[v4].length
		v5 = nil
		
		for i1 = v4 + 1, #List do
			if List[i1].length ~= Length then
				continue
			end
			v5 = i1
			break
		end
		if not v5 then
			Flag = true
			
			return Flag
		end
		v4 = v5 + 1
	end
	return Flag
end

return Utils