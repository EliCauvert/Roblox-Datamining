return function(Text: string): string --[[ Line: 1 ]]
	return (string.gsub(Text, "%p", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }))
end