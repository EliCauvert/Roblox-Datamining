local function _(List, Text): string --[[ Line: 29 | Named "group" ]]
	return "(" .. Text .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
end

return {
	SLASH = "\\/",
	QUESTION = "\\?",
	DASH = "\\-",
	DOT = "\\.",
	HASH = "\\#",
	COLON = "\\:",
	STRING_START = "^",
	STRING_END = "$",
	NON_WHITESPACE = "\\S",
	WHITESPACE = "\\s",
	ALPHANUMERIC = "\\w",
	oneOf = function(List): string --[[ Line: 33 ]]
		return "(" .. "?:" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	capture = function(List): string --[[ Line: 37 ]]
		return "(" .. "" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	zeroOrOneOf = function(List): string --[[ Line: 41 ]]
		return ("(" .. "?:" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")") .. "?"
	end,
	zeroOrMore = function(List): string --[[ Line: 65 ]]
		return ("(" .. "?:" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")") .. "*"
	end,
	oneOrMore = function(List): string --[[ Line: 61 ]]
		return ("(" .. "?:" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")") .. "+"
	end,
	lookahead = function(List): string --[[ Line: 45 ]]
		return "(" .. "?=" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	lookbehind = function(List): string --[[ Line: 53 ]]
		return "(" .. "?<=" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	negativeLookahead = function(List): string --[[ Line: 49 ]]
		return "(" .. "?!" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	negativeLookbehind = function(List): string --[[ Line: 57 ]]
		return "(" .. "?<!" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	matchWhole = function(Text): string --[[ Line: 69 ]]
		return "^" .. Text .. "$"
	end,
	regexOr = function(Text, Text1): string --[[ Line: 73 ]]
		return Text .. "|" .. Text1
	end,
	set = function(Text): string --[[ Line: 77 ]]
		return "[" .. Text .. "]"
	end,
	notSet = function(Text): string --[[ Line: 81 ]]
		return "[" .. "^" .. Text .. "]"
	end
}