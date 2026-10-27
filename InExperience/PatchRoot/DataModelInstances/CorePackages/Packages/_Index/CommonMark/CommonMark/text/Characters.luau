local CommonMark = script:FindFirstAncestor("CommonMark")
local UnicodeLettersModule = require(CommonMark.internal.data.UnicodeLetters)
local UnicodePunctuationModule = require(CommonMark.internal.data.UnicodePunctuation)
local UnicodeSpaceSeparatorsModule = require(CommonMark.internal.data.UnicodeSpaceSeparators)
local Utf8Module = require(CommonMark.internal.port.Utf8)
local ByteFunction = string.byte
local CharFunction = string.char
local FindFunction = string.find
local CharactersModule = {
	find = function(p1, p2, p3: number): number
		-- upvalues: FindFunction (copy), CharFunction (copy)
		local FindResult: number = FindFunction(p2, CharFunction(p1), p3 + 1, true)
		
		return if FindResult then FindResult - 1 else -1
	end,
	findLineBreak = function(p1, p2: number): number
		-- upvalues: FindFunction (copy)
		local v1: number = FindFunction(p1, "[\n\r]", p2 + 1)
		
		return if v1 then v1 - 1 else -1
	end
}

function CharactersModule.isBlank(p1): boolean
	-- upvalues: CharactersModule (copy)
	return CharactersModule.skipSpaceTab(p1, 0, #p1) == #p1
end

function CharactersModule.hasNonSpace(p1): boolean
	-- upvalues: CharactersModule (copy)
	local CountP6 = #p1
	
	return CharactersModule.skip(32, p1, 0, CountP6) ~= CountP6
end

local function isInRanges(UnicodeLettersModule, CodePointAtResult): boolean
	local v1 = 1
	local v2 = #UnicodeLettersModule // 2
	while v1 <= v2 do
		local v3 = (v1 + v2) // 2
		
		if CodePointAtResult < UnicodeLettersModule[v3 * 2 - 1] then
			v2 = v3 - 1
		else
			if UnicodeLettersModule[v3 * 2] >= CodePointAtResult then
				return true
			end
			v1 = v3 + 1
		end
	end
	return false
end

function CharactersModule.isLetter(p1, p2)
	-- upvalues: Utf8Module (copy), isInRanges (copy), UnicodeLettersModule (copy)
	return (isInRanges(UnicodeLettersModule, (Utf8Module.codePointAt(p1, p2))))
end

function CharactersModule.isSpaceOrTab(p1, p2: number): boolean
	-- upvalues: ByteFunction (copy)
	if p2 < #p1 then
		local ByteResult = ByteFunction(p1, p2 + 1)
		
		if ByteResult == 32 or ByteResult == 9 then
			return true
		end
	end
	return false
end

function CharactersModule.isPunctuationCodePoint(p1): boolean
	-- upvalues: isInRanges (copy), UnicodePunctuationModule (copy)
	return if isInRanges(UnicodePunctuationModule, p1) then true else p1 == 36 or (p1 == 43 or (p1 == 60 or (p1 == 61 or (p1 == 62 or (p1 == 94 or (p1 == 96 or (p1 == 124 or p1 == 126)))))))
end

function CharactersModule.isWhitespaceCodePoint(p1): boolean
	-- upvalues: UnicodeSpaceSeparatorsModule (copy)
	return p1 == 32 or p1 == 9 or p1 == 10 or p1 == 12 or p1 == 13 or UnicodeSpaceSeparatorsModule[p1] == true
end

function CharactersModule.skip(p1, p2, p3, Count: number): number
	-- upvalues: ByteFunction (copy)
	for i = p3, Count - 1 do
		if ByteFunction(p2, i + 1) ~= p1 then
			return i
		end
	end
	return Count
end

function CharactersModule.skipBackwards(p4, p5, p6, p7: number): number
	-- upvalues: ByteFunction (copy)
	for i = p6, p7, -1 do
		if ByteFunction(p5, i + 1) ~= p4 then
			return i
		end
	end
	return p7 - 1
end

function CharactersModule.skipSpaceTab(p8, p9, Count: number): number
	-- upvalues: ByteFunction (copy)
	for i = p9, Count - 1 do
		local ByteResult = ByteFunction(p8, i + 1)
		
		if ByteResult ~= 32 and ByteResult ~= 9 then
			return i
		end
	end
	return Count
end

function CharactersModule.skipSpaceTabBackwards(p10, p11, p12: number): number
	-- upvalues: ByteFunction (copy)
	for i = p11, p12, -1 do
		local ByteResult = ByteFunction(p10, i + 1)
		
		if ByteResult ~= 32 and ByteResult ~= 9 then
			return i
		end
	end
	return p12 - 1
end

return CharactersModule