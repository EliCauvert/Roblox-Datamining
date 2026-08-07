-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

return {
	escapeRichFormatting = function(p0) --[[ line: 2 ]]
		return p0:gsub("[&<>\"']", {
			["&"] = "&amp;",
			["<"] = "&lt;",
			[">"] = "&gt;",
			["\""] = "&quot;",
			["'"] = "&apos;"
		}):gsub("&amp;%l+;", {
			["&amp;lt;"] = "&lt;",
			["&amp;gt;"] = "&gt;",
			["&amp;quot;"] = "&quot;",
			["&amp;apos;"] = "&apos;",
			["&amp;amp;"] = "&amp;"
		})
	end,
	unescapeRichFormatting = function(p1) --[[ line: 22 ]]
		return p1:gsub("&%l+;", {
			["&lt;"] = "<",
			["&gt;"] = ">",
			["&quot;"] = "\"",
			["&apos;"] = "'",
			["&amp;"] = "&"
		})
	end
}