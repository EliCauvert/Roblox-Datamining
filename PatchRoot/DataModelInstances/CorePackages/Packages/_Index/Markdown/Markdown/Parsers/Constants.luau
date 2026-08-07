-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:46 2026 Pacific Standard Time.

return {
	CONTAINERS = { ROOT = true, TAG = true },
	LISTS = {
		BULLET_LIST_ITEM = true,
		BULLET_LIST_ITEM_2 = true,
		ORDERED_LIST_ITEM = true
	},
	INLINE_TEXT = {
		STYLED_TEXT = true,
		INLINE_CODE = true,
		LINK = true,
		IMAGE = true,
		ACTION = true,
		TABLE_DIVIDER = true,
		TABLE_HEADER = true,
		TABLE_HEADER_2 = true,
		TEXT = true,
		BREAK = true
	},
	PLAIN_TEXT = {
		TEXT = true,
		TABLE_DIVIDER = true,
		TABLE_HEADER = true,
		TABLE_HEADER_2 = true
	},
	STYLED_TEXT = {
		BOLD = "b",
		BOLD_2 = "b",
		ITALIC = "i",
		ITALIC_2 = "i",
		STRIKE = "s"
	},
	DIVIDERS = { LINE_BREAK = true, DIVIDER = true },
	ASCII = {
		WHITESPACE_PATTERN = "%s",
		PUNCTUATION_PATTERN = "[!/:;,_`|{}~<>=#&@'%%\"\\%$%(%)%*%+%-%.%?%[%]%^]"
	},
	UNICODE = require(script.Parent.UnicodeConstants)
}