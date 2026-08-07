local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)

local function decodeEmoji(p0) --[[ line: 11 ]]
	return if type(p0) == "table" then if not (type(p0.id) ~= "string" or p0.id == "") then if type(p0.name) == "string" and p0.name ~= "" then {
		id = p0.id,
		name = p0.name,
		assetSource = if type(p0.asset_source) == "string" then p0.asset_source else nil,
		unicode = if type(p0.unicode) == "string" then p0.unicode else nil
	} else nil else nil else nil
end

local function decodeEmojiSet(value) --[[ line: 30 ]]
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
			local var3 = decodeEmoji(v)
			
			if var3 ~= nil then
				table.insert(t, var3)
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
	decodeGetEmojiSetsResponse = function(value) --[[ line: 60 ]]
		-- upvalues: decodeEmojiSet (ref)
		local t = {}
		
		if type(value) == "table" and type(value.emoji_sets) == "table" then
			for i, v in value.emoji_sets do
				local var5 = decodeEmojiSet(v)
				
				if var5 ~= nil then
					table.insert(t, var5)
				end
			end
		end
		return {
			emojiSets = t,
			nextCursor = if type(value) == "table" and type(value.next_cursor) == "string" then value.next_cursor else nil,
			previousCursor = if type(value) == "table" and type(value.previous_cursor) == "string" then value.previous_cursor else nil
		}
	end,
	flattenEmojis = function(p1) --[[ line: 82 ]]
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