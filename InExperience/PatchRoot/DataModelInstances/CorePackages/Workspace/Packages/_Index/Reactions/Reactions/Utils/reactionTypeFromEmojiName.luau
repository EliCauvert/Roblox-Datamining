local Reactions = script:FindFirstAncestor("Reactions")
local config = { crying = require(Reactions.Enums.ReactionType).Cry }

for _, possibleReaction in require(Reactions.Constants).PossibleReactions do
	config[possibleReaction] = possibleReaction
end
return function(Text: string)
	-- upvalues: config (copy)
	return config[string.gsub(string.lower(Text), "%-", "")]
end