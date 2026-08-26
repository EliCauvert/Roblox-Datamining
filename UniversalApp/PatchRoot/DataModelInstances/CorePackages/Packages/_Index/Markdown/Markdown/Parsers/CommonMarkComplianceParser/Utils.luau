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
	getDelimiterInfo = function(p1)
		-- upvalues: t (ref)
		return t[p1]
	end,
	causesLineBreak = function(p1)
		return if p1.name == "TEXT" then string.find(p1.text, "\n", 0, true) ~= nil else true
	end,
	getTokenNameFromCharAndLength = function(p1, p2)
		return if p1 == "`" then "INLINE_CODE" elseif p2 == 2 then if p1 == "*" then "BOLD_2" else "ITALIC_2" elseif p1 == "*" then "BOLD" elseif p1 == "~" then "STRIKE" else "ITALIC"
	end,
	canDelimitersMatch = function(p1, p2)
		return if p1.runLength == 0 or p2.runLength == 0 then false elseif if p1.canOpen then p1.canClose else p2.canOpen and p2.canClose then p1.runLength % 3 == 0 and p2.runLength % 3 == 0 or (p1.runLength + p2.runLength) % 3 ~= 0 else true
	end,
	addDelimiterMatch = function(p1, p2)
		local matches = p1.matches or {}
		p1.matches = matches
		local var1 = 1
		local matchesCount = #matches
		local var2 = matchesCount + 1
		local startIdx = p2.with.startIdx
		while var1 <= matchesCount do
			local floored = math.floor((var1 + matchesCount) / 2)
			
			if startIdx < matches[floored].with.startIdx then
				var2 = floored
				matchesCount = floored - 1
			else
				var1 = floored + 1
			end
		end
		table.insert(matches, var2, p2)
	end,
	isWhitespace = function(p3)
		-- upvalues: constantsModule (ref)
		return if not (not p3 or #p3 == 0) then if p3:match(constantsModule.ASCII.WHITESPACE_PATTERN) == nil then constantsModule.UNICODE.WHITESPACE[utf8.codepoint(p3)] else true else true
	end,
	isPunctuation = function(p3)
		-- upvalues: constantsModule (ref)
		return not (not p3 or #p3 == 0) and (if p3:match(constantsModule.ASCII.PUNCTUATION_PATTERN) then true else constantsModule.UNICODE.PUNCTUATION[utf8.codepoint(p3)])
	end
}

function t_1.isLeftFlanking(p3, p4)
	-- upvalues: t_1 (ref)
	return if t_1.isWhitespace(p4) then false elseif t_1.isPunctuation(p4) then t_1.isWhitespace(p3) or t_1.isPunctuation(p3) else true
end

function t_1.isRightFlanking(p3, p4)
	-- upvalues: t_1 (ref)
	return if t_1.isWhitespace(p3) then false elseif t_1.isPunctuation(p3) then t_1.isWhitespace(p4) or t_1.isPunctuation(p4) else true
end

function t_1.canOpenEmphasis(p3)
	-- upvalues: t_1 (ref)
	return p3.char == "`" or (if t_1.isLeftFlanking(p3.prevChar, p3.nextChar) then if p3.char == "_" then not t_1.isRightFlanking(p3.prevChar, p3.nextChar) or t_1.isPunctuation(p3.prevChar) else true else false)
end

function t_1.canCloseEmphasis(p3)
	-- upvalues: t_1 (ref)
	return p3.char == "`" or (if t_1.isRightFlanking(p3.prevChar, p3.nextChar) then if p3.char == "_" then not t_1.isLeftFlanking(p3.prevChar, p3.nextChar) or t_1.isPunctuation(p3.nextChar) else true else false)
end

function t_1.getCharacterContext(p3, p4, p5)
	if #p3 == 0 then
		return {}
	end
	local char = nil
	local char_1 = nil
	
	if p4 > 1 then
		local byteOffset = utf8.offset(p3, -1, p4)
		
		if byteOffset then
			char = utf8.char(utf8.codepoint(p3, byteOffset))
		end
	end
	local var3 = p4 + p5
	
	if var3 <= #p3 then
		local byteOffset = utf8.offset(p3, 1, var3)
		
		if byteOffset then
			char_1 = utf8.char(utf8.codepoint(p3, byteOffset))
		end
	end
	return { prevChar = char, nextChar = char_1 }
end

function t_1.isInsideInlineCode(p3, p4, p5)
	local t = {}
	local t_1 = nil
	
	for i = p5 or #p3, 1, -1 do
		local var3 = p3[i]
		
		if var3.offset <= p4 then break end
		if var3.name == "INLINE_CODE" then
			if t_1 and t_1.offset - 1 == var3.offset then
				t_1.length += 1
				t_1.offset -= 1
			else
				t_1 = { offset = var3.offset, length = #var3.text }
				table.insert(t, 1, t_1)
			end
		end
	end
	local var4
	local var5 = false
	local var6 = 1
	while var6 <= #t do
		local length = t[var6].length
		var4 = nil
		
		for i_1 = var6 + 1, #t do
			if t[i_1].length ~= length then
				continue
			end
			var4 = i_1
			break
		end
		if not var4 then
			var5 = true
			
			return var5
		end
		var6 = var4 + 1
	end
	return var5
end

return t_1