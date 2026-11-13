local Reactions = script:FindFirstAncestor("Reactions")
local ConstantsModule = require(Reactions.Constants)
local config = { crying = require(Reactions.Enums.ReactionType).Cry }

for _, possibleReaction in ConstantsModule.PossibleReactions do
	config[possibleReaction] = possibleReaction
end
return function(Text: string)
	-- upvalues: config (copy)
	return config[string.gsub(string.lower(Text), "%-", "")]
end