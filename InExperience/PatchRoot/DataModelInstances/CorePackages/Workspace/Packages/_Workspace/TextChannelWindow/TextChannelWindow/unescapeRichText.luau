local config = {
	["&amp;"] = "&",
	["&lt;"] = "<",
	["&gt;"] = ">",
	["&quot;"] = "\"",
	["&apos;"] = "'"
}

return function(Text: string): string
	-- upvalues: config (copy)
	return (string.gsub(Text, "&%a+;", function(Match)
		-- upvalues: config (upval)
		return config[Match] or Match
	end))
end