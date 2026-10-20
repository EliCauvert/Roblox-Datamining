local function _(List, Text): string
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
	oneOf = function(List): string
		return "(" .. "?:" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	capture = function(List): string
		return "(" .. "" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	zeroOrOneOf = function(List): string
		return ("(" .. "?:" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")") .. "?"
	end,
	zeroOrMore = function(List): string
		return ("(" .. "?:" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")") .. "*"
	end,
	oneOrMore = function(List): string
		return ("(" .. "?:" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")") .. "+"
	end,
	lookahead = function(List): string
		return "(" .. "?=" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	lookbehind = function(List): string
		return "(" .. "?<=" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	negativeLookahead = function(List): string
		return "(" .. "?!" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	negativeLookbehind = function(List): string
		return "(" .. "?<!" .. (if type(List) == "string" then List else table.concat(List, "|")) .. ")"
	end,
	matchWhole = function(Text): string
		return "^" .. Text .. "$"
	end,
	regexOr = function(Text, Text1): string
		return Text .. "|" .. Text1
	end,
	set = function(Text): string
		return "[" .. Text .. "]"
	end,
	notSet = function(Text): string
		return "[" .. "^" .. Text .. "]"
	end
}