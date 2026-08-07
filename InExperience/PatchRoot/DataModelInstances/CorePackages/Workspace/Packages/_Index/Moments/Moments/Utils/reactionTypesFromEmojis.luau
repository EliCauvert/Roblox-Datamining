local parent = script:FindFirstAncestor("Moments").Parent
local _ = require(parent.MomentsTypes)
local reactionType = require(parent.MomentsCommon).Enums.ReactionType
local t = {
	[reactionType.ThumbsUp] = true,
	[reactionType.Heart] = true,
	[reactionType.LaughJoy] = true,
	[reactionType.Wow] = true,
	[reactionType.Cry] = true,
	[reactionType.Fire] = true,
	[reactionType.Skull] = true
}
local list = {
	reactionType.ThumbsUp, reactionType.Heart, reactionType.LaughJoy,
	reactionType.Wow, reactionType.Cry, reactionType.Fire, reactionType.Skull
}

local function _(p0) --[[ line: 37 | named "normalizeEmojiName" ]]
	local replaced = string.gsub(string.lower(p0), "%-", "")
	
	return if replaced == "crying" then "cry" else replaced
end

return {
	reactionTypesFromEmojis = function(p1) --[[ line: 47 ]]
		-- upvalues: t (ref), list (ref)
		local t_1 = {}
		
		for i, v in p1 do
			local replaced = string.gsub(string.lower(v.name), "%-", "")
			local var5 = if replaced == "crying" then "cry" else replaced
			
			if t[var5] then
				table.insert(t_1, var5)
			end
		end
		return if #t_1 == 0 then list else t_1
	end,
	FALLBACK_PICKER_REACTIONS = list
}