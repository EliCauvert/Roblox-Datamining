local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsTypes)
local ReactionType = require(Parent.MomentsCommon).Enums.ReactionType
local MomentsUpdateReactionTrayOrder = game:DefineFastFlag("MomentsUpdateReactionTrayOrder", false)
local config = {
	[ReactionType.ThumbsUp] = true,
	[ReactionType.Heart] = true,
	[ReactionType.LaughJoy] = true,
	[ReactionType.Wow] = true,
	[ReactionType.Cry] = true,
	[ReactionType.Fire] = true,
	[ReactionType.Skull] = true
}
local list = {
	ReactionType.ThumbsUp, ReactionType.Heart, ReactionType.LaughJoy,
	ReactionType.Wow, ReactionType.Cry, ReactionType.Fire, ReactionType.Skull
}

local function _(Text: string): string --[[ Line: 38 | Named "normalizeEmojiName" ]]
	local Replaced = string.gsub(string.lower(Text), "%-", "")
	
	return if Replaced == "crying" then "cry" else Replaced
end

return {
	reactionTypesFromEmojis = function(List) --[[ Line: 48 ]]
		-- upvalues: config (copy), MomentsUpdateReactionTrayOrder (copy), list (copy)
		local List1 = {}
		local t = {}
		
		for _, value in List do
			local Replaced = string.gsub(string.lower(value.name), "%-", "")
			local Cry: string = if Replaced == "crying" then "cry" else Replaced
			
			if config[Cry] then
				table.insert(List1, Cry)
				t[Cry] = true
			end
		end
		if MomentsUpdateReactionTrayOrder then
			List1 = {}
			
			for _, value1 in list do
				if t[value1] then
					table.insert(List1, value1)
				end
			end
		end
		return if #List1 == 0 then list else List1
	end,
	PICKER_REACTION_ORDER = list
}