local emojiListModule = require(script:FindFirstAncestor("ExpChat").Parent.EmojiList)
local expChatLargerSingularEmojiBlacklist = game:DefineFastString("ExpChatLargerSingularEmojiBlacklist", "")
local char = utf8.char(65039)

local function _(p1)
	-- upvalues: char (ref)
	return string.gsub(p1, char, "")
end

local _ = function()
	-- upvalues: expChatLargerSingularEmojiBlacklist (ref)
	local t = {}
	
	for i in string.gmatch(expChatLargerSingularEmojiBlacklist, "[^,%s]+") do
		t[i] = true
	end
	return t
end

local var1 = nil

local function getSupportedEmojis()
	-- upvalues: var1 (write), expChatLargerSingularEmojiBlacklist (ref), emojiListModule (ref), char (ref)
	if not var1 then
		local t = {}
		
		for i in string.gmatch(expChatLargerSingularEmojiBlacklist, "[^,%s]+") do
			t[i] = true
		end
		local var2 = t
		local t_1 = {}
		
		for i_1, v in emojiListModule do
			if not var2[i_1] then
				t_1[string.gsub(v.base, char, "")] = true
			end
		end
		var1 = t_1
	end
	return var1
end

return function(p1)
	-- upvalues: getSupportedEmojis (ref), char (ref)
	return getSupportedEmojis()[string.gsub(string.match(p1, "^%s*(.-)%s*$"), char, "")] == true
end