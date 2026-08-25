return {
	sanitizeRichText = function(p0)
		return string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(p0, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), "\"", "&quot;"), "'", "&apos;")
	end,
	convertTabsToSpaces = function(value)
		return string.gsub(value, "\t", "    ")
	end,
	removeControlChars = function(p1)
		return string.gsub(p1, "[\0\1\2\3\4\5\6\a\b\11\f\r\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
	end
}