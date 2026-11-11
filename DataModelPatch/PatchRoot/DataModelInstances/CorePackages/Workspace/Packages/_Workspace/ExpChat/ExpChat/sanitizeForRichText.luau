return function(Text: string): string
	return (string.gsub(Text, "%p", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }))
end