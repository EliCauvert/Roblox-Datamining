local UnescapeRichTextModule = require(script.Parent.unescapeRichText)

return function(Text: string)
	-- upvalues: UnescapeRichTextModule (copy)
	return UnescapeRichTextModule((string.gsub(Text, "<[^>]*>", "")))
end