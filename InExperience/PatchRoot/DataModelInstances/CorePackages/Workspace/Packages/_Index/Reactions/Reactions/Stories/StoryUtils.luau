local Reactions = script:FindFirstAncestor("Reactions")
local ConstantsModule = require(Reactions.Constants)
local _ = require(Reactions.Enums.ReactionType)
local _ = require(Reactions.Utils.applyReactionTrigger)

return {
	describeSelection = function(p1): string
		-- upvalues: ConstantsModule (copy)
		local List = {}
		
		for _, possibleReaction in ConstantsModule.PossibleReactions do
			if p1[possibleReaction] then
				table.insert(List, possibleReaction)
			end
		end
		return if #List > 0 then table.concat(List, ", ") else "none"
	end,
	describeChange = function(p2): string
		local List = {}
		
		if p2.added then
			table.insert(List, `added {p2.added}`)
		end
		if p2.removed then
			table.insert(List, `removed {p2.removed}`)
		end
		return if #List > 0 then table.concat(List, ", ") else "none"
	end
}