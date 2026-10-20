local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)

local function decodeEmoji(p1)
	return if type(p1) == "table" and (type(p1.id) == "string" and p1.id ~= "" and (type(p1.name) == "string" and p1.name ~= "")) then {
		id = p1.id,
		name = p1.name,
		assetSource = if type(p1.asset_source) == "string" then p1.asset_source else nil,
		unicode = if type(p1.unicode) == "string" then p1.unicode else nil
	} else nil
end

local function decodeEmojiSet(p1)
	-- upvalues: decodeEmoji (copy)
	if type(p1) ~= "table" then
		return nil
	end
	if type(p1.emoji_set_id) ~= "string" or p1.emoji_set_id == "" then
		return nil
	end
	if type(p1.emoji_set_name) ~= "string" or p1.emoji_set_name == "" then
		return nil
	end
	local EmojiPage = {}
	
	if type(p1.emoji_page) == "table" then
		for _, value in p1.emoji_page do
			local DecodeEmojiResult = decodeEmoji(value)
			
			if DecodeEmojiResult ~= nil then
				table.insert(EmojiPage, DecodeEmojiResult)
			end
		end
	end
	return {
		emojiSetId = p1.emoji_set_id,
		emojiSetName = p1.emoji_set_name,
		emojiPage = EmojiPage,
		nextCursor = if type(p1.next_cursor) == "string" then p1.next_cursor else nil,
		previousCursor = if type(p1.previous_cursor) == "string" then p1.previous_cursor else nil
	}
end

return {
	decodeGetEmojiSetsResponse = function(p2)
		-- upvalues: decodeEmojiSet (copy)
		local EmojiSets = {}
		
		if type(p2) == "table" and type(p2.emoji_sets) == "table" then
			for _, emojiSet in p2.emoji_sets do
				local DecodeEmojiSetResult = decodeEmojiSet(emojiSet)
				
				if DecodeEmojiSetResult ~= nil then
					table.insert(EmojiSets, DecodeEmojiSetResult)
				end
			end
		end
		return {
			emojiSets = EmojiSets,
			nextCursor = if type(p2) == "table" and type(p2.next_cursor) == "string" then p2.next_cursor else nil,
			previousCursor = if type(p2) == "table" and type(p2.previous_cursor) == "string" then p2.previous_cursor else nil
		}
	end,
	flattenEmojis = function(p3)
		if p3 == nil then
			return {}
		end
		local List = {}
		
		for _, emojiSet in p3.emojiSets do
			for _, value in emojiSet.emojiPage do
				table.insert(List, value)
			end
		end
		return List
	end
}