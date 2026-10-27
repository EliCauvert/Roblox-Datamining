local Reactions = script:FindFirstAncestor("Reactions")
local ConstantsModule = require(Reactions.Constants)
local _ = require(Reactions.Enums.ReactionType)

return function(p1, p2: number)
	-- upvalues: ConstantsModule (copy)
	local List = {}
	local TotalCount = 0
	
	for DisplayOrder, possibleReaction in ConstantsModule.PossibleReactions do
		local Count = p1[possibleReaction] or 0
		
		if Count > 0 then
			table.insert(List, {
				reactionType = possibleReaction,
				count = Count,
				displayOrder = DisplayOrder
			})
			TotalCount += Count
		end
	end
	table.sort(List, function(A, B): boolean
		return if A.count == B.count then A.displayOrder < B.displayOrder else B.count < A.count
	end)
	local Reactions = {}
	
	for i = 1, math.min(p2, #List) do
		Reactions[i] = List[i].reactionType
	end
	return { reactions = Reactions, totalCount = TotalCount }
end