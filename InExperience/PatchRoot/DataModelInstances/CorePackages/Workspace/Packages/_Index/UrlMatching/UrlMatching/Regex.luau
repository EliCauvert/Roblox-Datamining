local function _(p0, p1)
	return "(" .. p1 .. (if type(p0) == "string" then p0 else table.concat(p0, "|")) .. ")"
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
	oneOf = function(p2)
		return "(" .. "?:" .. (if type(p2) == "string" then p2 else table.concat(p2, "|")) .. ")"
	end,
	capture = function(p3)
		return "(" .. "" .. (if type(p3) == "string" then p3 else table.concat(p3, "|")) .. ")"
	end,
	zeroOrOneOf = function(p4)
		return ("(" .. "?:" .. (if type(p4) == "string" then p4 else table.concat(p4, "|")) .. ")") .. "?"
	end,
	zeroOrMore = function(p5)
		return ("(" .. "?:" .. (if type(p5) == "string" then p5 else table.concat(p5, "|")) .. ")") .. "*"
	end,
	oneOrMore = function(p6)
		return ("(" .. "?:" .. (if type(p6) == "string" then p6 else table.concat(p6, "|")) .. ")") .. "+"
	end,
	lookahead = function(p7)
		return "(" .. "?=" .. (if type(p7) == "string" then p7 else table.concat(p7, "|")) .. ")"
	end,
	lookbehind = function(p8)
		return "(" .. "?<=" .. (if type(p8) == "string" then p8 else table.concat(p8, "|")) .. ")"
	end,
	negativeLookahead = function(p9)
		return "(" .. "?!" .. (if type(p9) == "string" then p9 else table.concat(p9, "|")) .. ")"
	end,
	negativeLookbehind = function(p10)
		return "(" .. "?<!" .. (if type(p10) == "string" then p10 else table.concat(p10, "|")) .. ")"
	end,
	matchWhole = function(p11)
		return "^" .. p11 .. "$"
	end,
	regexOr = function(p12, p13)
		return p12 .. "|" .. p13
	end,
	set = function(value)
		return "[" .. value .. "]"
	end,
	notSet = function(value)
		return "[" .. "^" .. value .. "]"
	end
}