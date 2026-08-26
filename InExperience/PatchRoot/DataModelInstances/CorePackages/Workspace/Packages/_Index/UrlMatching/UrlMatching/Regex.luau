local function _(p1, p2)
	return "(" .. p1 .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")"
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
	oneOf = function(p1)
		return "(" .. "?:" .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")"
	end,
	capture = function(p1)
		return "(" .. "" .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")"
	end,
	zeroOrOneOf = function(p1)
		return ("(" .. "?:" .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")") .. "?"
	end,
	zeroOrMore = function(p1)
		return ("(" .. "?:" .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")") .. "*"
	end,
	oneOrMore = function(p1)
		return ("(" .. "?:" .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")") .. "+"
	end,
	lookahead = function(p1)
		return "(" .. "?=" .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")"
	end,
	lookbehind = function(p1)
		return "(" .. "?<=" .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")"
	end,
	negativeLookahead = function(p1)
		return "(" .. "?!" .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")"
	end,
	negativeLookbehind = function(p1)
		return "(" .. "?<!" .. (if type(p1) == "string" then p1 else table.concat(p1, "|")) .. ")"
	end,
	matchWhole = function(p1)
		return "^" .. p11 .. "$"
	end,
	regexOr = function(p1, p2)
		return p1 .. "|" .. p13
	end,
	set = function(value)
		return "[" .. value .. "]"
	end,
	notSet = function(value)
		return "[" .. "^" .. value .. "]"
	end
}