local parent = script:FindFirstAncestor("Moments").Parent
local _ = require(parent.MomentsTypes)
local reactionType = require(parent.MomentsCommon).Enums.ReactionType
local momentsUpdateReactionTrayOrder = game:DefineFastFlag("MomentsUpdateReactionTrayOrder", false)
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

local function _(p1)
	local replaced = string.gsub(string.lower(p1), "%-", "")
	
	return if replaced == "crying" then "cry" else replaced
end

return {
	reactionTypesFromEmojis = function(p1)
		-- upvalues: t (ref), momentsUpdateReactionTrayOrder (ref), list (ref)
		local t_1 = {}
		local t_2 = {}
		
		for i, v in p1 do
			local replaced = string.gsub(string.lower(v.name), "%-", "")
			local var1 = if replaced == "crying" then "cry" else replaced
			
			if t[var1] then
				table.insert(t_1, var1)
				t_2[var1] = true
			end
		end
		if momentsUpdateReactionTrayOrder then
			t_1 = {}
			
			for i, v_1 in list do
				if t_2[v_1] then
					table.insert(t_1, v_1)
				end
			end
		end
		return if #t_1 == 0 then list else t_1
	end,
	PICKER_REACTION_ORDER = list
}