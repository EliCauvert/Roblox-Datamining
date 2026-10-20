return {
	KeywordNormalize = function(Text: string)
		return (Text:gsub("￼", ""):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", ""))
	end
}