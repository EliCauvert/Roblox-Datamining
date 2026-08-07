-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

return {
	sanitizeRichText = function(p0) --[[ line: 3 ]]
		return string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(p0, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), "\"", "&quot;"), "'", "&apos;")
	end,
	convertTabsToSpaces = function(value) --[[ line: 11 ]]
		return string.gsub(value, "\t", "    ")
	end,
	removeControlChars = function(p1) --[[ line: 15 ]]
		return string.gsub(p1, "[\0\1\2\3\4\5\6\a\b\11\f\r\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
	end
}