local markdown = script:FindFirstAncestor("Markdown")
local constantsModule = require(markdown.Parsers.Constants)
local _ = require(markdown.Types)
local t = {
	BOLD = { char = "*", length = 1 },
	BOLD_2 = { char = "*", length = 2 },
	ITALIC = { char = "_", length = 1 },
	ITALIC_2 = { char = "_", length = 2 },
	STRIKE = { char = "~", length = 1 },
	INLINE_CODE = { char = "`", length = 1 }
}
local t_1 = {
	getDelimiterInfo = function(p0)
		-- upvalues: t (ref)
		return t[p0]
	end,
	causesLineBreak = function(p1)
		return if p1.name == "TEXT" then string.find(p1.text, "\n", 0, true) ~= nil else true
	end,
	getTokenNameFromCharAndLength = function(p2, p3)
		return if p2 == "`" then "INLINE_CODE" elseif p3 == 2 then if p2 == "*" then "BOLD_2" else "ITALIC_2" elseif p2 == "*" then "BOLD" elseif p2 == "~" then "STRIKE" else "ITALIC"
	end,
	canDelimitersMatch = function(p4, p5)
		return if p4.runLength == 0 or p5.runLength == 0 then false elseif if p4.canOpen then p4.canClose else p5.canOpen and p5.canClose then p4.runLength % 3 == 0 and p5.runLength % 3 == 0 or (p4.runLength + p5.runLength) % 3 ~= 0 else true
	end,
	addDelimiterMatch = function(p6, p7)
		local matches = p6.matches or {}
		p6.matches = matches
		local var5 = 1
		local matchesCount = #matches
		local var7 = matchesCount + 1
		local startIdx = p7.with.startIdx
		while var5 <= matchesCount do
			local floored = math.floor((var5 + matchesCount) / 2)
			
			if startIdx < matches[floored].with.startIdx then
				var7 = floored
				matchesCount = floored - 1
			else
				var5 = floored + 1
			end
		end
		table.insert(matches, var7, p7)
	end,
	isWhitespace = function(p8)
		-- upvalues: constantsModule (ref)
		return if not (not p8 or #p8 == 0) then if p8:match(constantsModule.ASCII.WHITESPACE_PATTERN) == nil then constantsModule.UNICODE.WHITESPACE[utf8.codepoint(p8)] else true else true
	end,
	isPunctuation = function(p9)
		-- upvalues: constantsModule (ref)
		return not (not p9 or #p9 == 0) and (if p9:match(constantsModule.ASCII.PUNCTUATION_PATTERN) then true else constantsModule.UNICODE.PUNCTUATION[utf8.codepoint(p9)])
	end
}

function t_1.isLeftFlanking(p10, p11)
	-- upvalues: t_1 (ref)
	return if t_1.isWhitespace(p11) then false elseif t_1.isPunctuation(p11) then t_1.isWhitespace(p10) or t_1.isPunctuation(p10) else true
end

function t_1.isRightFlanking(p12, p13)
	-- upvalues: t_1 (ref)
	return if t_1.isWhitespace(p12) then false elseif t_1.isPunctuation(p12) then t_1.isWhitespace(p13) or t_1.isPunctuation(p13) else true
end

function t_1.canOpenEmphasis(p14)
	-- upvalues: t_1 (ref)
	return p14.char == "`" or (if t_1.isLeftFlanking(p14.prevChar, p14.nextChar) then if p14.char == "_" then not t_1.isRightFlanking(p14.prevChar, p14.nextChar) or t_1.isPunctuation(p14.prevChar) else true else false)
end

function t_1.canCloseEmphasis(p15)
	-- upvalues: t_1 (ref)
	return p15.char == "`" or (if t_1.isRightFlanking(p15.prevChar, p15.nextChar) then if p15.char == "_" then not t_1.isLeftFlanking(p15.prevChar, p15.nextChar) or t_1.isPunctuation(p15.nextChar) else true else false)
end

function t_1.getCharacterContext(p16, p17, p18)
	if #p16 == 0 then
		return {}
	end
	local char = nil
	local char_1 = nil
	
	if p17 > 1 then
		local byteOffset = utf8.offset(p16, -1, p17)
		
		if byteOffset then
			char = utf8.char(utf8.codepoint(p16, byteOffset))
		end
	end
	local var12 = p17 + p18
	
	if var12 <= #p16 then
		local byteOffset = utf8.offset(p16, 1, var12)
		
		if byteOffset then
			char_1 = utf8.char(utf8.codepoint(p16, byteOffset))
		end
	end
	return { prevChar = char, nextChar = char_1 }
end

function t_1.isInsideInlineCode(p19, p20, p21)
	local t = {}
	local t_1 = nil
	
	for i = p21 or #p19, 1, -1 do
		local var16 = p19[i]
		
		if var16.offset <= p20 then break end
		if var16.name == "INLINE_CODE" then
			if t_1 and t_1.offset - 1 == var16.offset then
				t_1.length += 1
				t_1.offset -= 1
			else
				t_1 = { offset = var16.offset, length = #var16.text }
				table.insert(t, 1, t_1)
			end
		end
	end
	local var19
	local var17 = false
	local var18 = 1
	while var18 <= #t do
		local length = t[var18].length
		var19 = nil
		
		for i_1 = var18 + 1, #t do
			if t[i_1].length ~= length then
				continue
			end
			var19 = i_1
			break
		end
		if not var19 then
			var17 = true
			
			return var17
		end
		var18 = var19 + 1
	end
	return var17
end

return t_1