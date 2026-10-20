local EmojiListModule = require(script:FindFirstAncestor("ExpChat").Parent.EmojiList)
local ExpChatLargerSingularEmojiBlacklist = game:DefineFastString("ExpChatLargerSingularEmojiBlacklist", "")
local Character = utf8.char(65039)

local function _(Text: string): string
	-- upvalues: Character (copy)
	return (string.gsub(Text, Character, ""))
end

local _ = function()
	-- upvalues: ExpChatLargerSingularEmojiBlacklist (copy)
	local t = {}
	
	for i in string.gmatch(ExpChatLargerSingularEmojiBlacklist, "[^,%s]+") do
		t[i] = true
	end
	return t
end

local v1 = nil

local function getSupportedEmojis()
	-- upvalues: v1 (ref), ExpChatLargerSingularEmojiBlacklist (copy), EmojiListModule (copy), Character (copy)
	if not v1 then
		local t = {}
		
		for i in string.gmatch(ExpChatLargerSingularEmojiBlacklist, "[^,%s]+") do
			t[i] = true
		end
		local t1 = {}
		
		for i1, value in EmojiListModule do
			if not t[i1] then
				t1[string.gsub(value.base, Character, "")] = true
			end
		end
		v1 = t1
	end
	return v1
end

return function(Text: string): boolean
	-- upvalues: getSupportedEmojis (copy), Character (copy)
	return getSupportedEmojis()[string.gsub(string.match(Text, "^%s*(.-)%s*$"), Character, "")] == true
end