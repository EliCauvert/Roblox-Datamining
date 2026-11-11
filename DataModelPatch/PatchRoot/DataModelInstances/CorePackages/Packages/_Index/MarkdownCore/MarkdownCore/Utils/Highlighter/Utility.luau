return {
	sanitizeRichText = function(Text: string): string
		return string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(Text, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), "\"", "&quot;"), "'", "&apos;")
	end,
	convertTabsToSpaces = function(Text: string): string
		return string.gsub(Text, "\t", "    ")
	end,
	removeControlChars = function(Text: string): string
		return string.gsub(Text, "[\0\1\2\3\4\5\6\a\b\11\f\r\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
	end
}