local function _(p1)
	return if type(p1) == "table" then p1 else nil
end

local function decodeEmoji(p1)
	local v1 = if type(p1) == "table" then p1 else nil
	
	if v1 == nil then
		return nil
	end
	local Id = v1.id
	
	if type(Id) == "string" and Id ~= "" then
		local Name = v1.name
		
		return if type(Name) == "string" and Name ~= "" then { id = Id, name = Name } else nil
	else
		return nil
	end
end

return function(p1)
	-- upvalues: decodeEmoji (copy)
	local List = {}
	local v1 = if type(p1) == "table" then p1 else nil
	local EmojiSets1 = nil
	
	if v1 == nil then
		EmojiSets1 = nil
	else
		local EmojiSets = v1.emoji_sets
		EmojiSets1 = if type(EmojiSets) == "table" then EmojiSets else nil
	end
	if EmojiSets1 == nil then
		return List
	end
	for _, value in EmojiSets1 do
		local v2 = if type(value) == "table" then value else nil
		local EmojiPage1 = nil
		
		if v2 == nil then
			EmojiPage1 = nil
		else
			local EmojiPage = v2.emoji_page
			EmojiPage1 = if type(EmojiPage) == "table" then EmojiPage else nil
		end
		if EmojiPage1 ~= nil then
			for _, value1 in EmojiPage1 do
				local DecodeEmojiResult = decodeEmoji(value1)
				
				if DecodeEmojiResult ~= nil then
					table.insert(List, DecodeEmojiResult)
				end
			end
		end
	end
	return List
end