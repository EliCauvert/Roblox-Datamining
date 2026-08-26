local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)

local function decodeEmoji(p1)
	return if type(p1) == "table" then if not (type(p1.id) ~= "string" or p1.id == "") then if type(p1.name) == "string" and p1.name ~= "" then {
		id = p1.id,
		name = p1.name,
		assetSource = if type(p1.asset_source) == "string" then p1.asset_source else nil,
		unicode = if type(p1.unicode) == "string" then p1.unicode else nil
	} else nil else nil else nil
end

local function decodeEmojiSet(value)
	-- upvalues: decodeEmoji (ref)
	if type(value) ~= "table" then
		return nil
	elseif type(value.emoji_set_id) ~= "string" or value.emoji_set_id == "" then
		return nil
	elseif type(value.emoji_set_name) ~= "string" or value.emoji_set_name == "" then
		return nil
	end
	local t = {}
	
	if type(value.emoji_page) == "table" then
		for i, v in value.emoji_page do
			local var1 = decodeEmoji(v)
			
			if var1 ~= nil then
				table.insert(t, var1)
			end
		end
	end
	return {
		emojiSetId = value.emoji_set_id,
		emojiSetName = value.emoji_set_name,
		emojiPage = t,
		nextCursor = if type(value.next_cursor) == "string" then value.next_cursor else nil,
		previousCursor = if type(value.previous_cursor) == "string" then value.previous_cursor else nil
	}
end

return {
	decodeGetEmojiSetsResponse = function(value)
		-- upvalues: decodeEmojiSet (ref)
		local t = {}
		
		if type(value) == "table" and type(value.emoji_sets) == "table" then
			for i, v in value.emoji_sets do
				local var2 = decodeEmojiSet(v)
				
				if var2 ~= nil then
					table.insert(t, var2)
				end
			end
		end
		return {
			emojiSets = t,
			nextCursor = if type(value) == "table" and type(value.next_cursor) == "string" then value.next_cursor else nil,
			previousCursor = if type(value) == "table" and type(value.previous_cursor) == "string" then value.previous_cursor else nil
		}
	end,
	flattenEmojis = function(p1)
		if p1 == nil then
			return {}
		end
		local t = {}
		
		for i, v in p1.emojiSets do
			for i_1, v_1 in v.emojiPage do
				table.insert(t, v_1)
			end
		end
		return t
	end
}