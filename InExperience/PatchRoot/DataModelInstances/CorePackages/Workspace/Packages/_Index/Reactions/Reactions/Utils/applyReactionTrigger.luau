local Reactions = script:FindFirstAncestor("Reactions")
local ReactionTriggerModule = require(Reactions.Enums.ReactionTrigger)
local ThumbsUp = require(Reactions.Enums.ReactionType).ThumbsUp

local function _(List)
	for i, value in List do
		if value then
			return i
		end
	end
	return nil
end

return function(State, ButtonTap, p1, p2)
	-- upvalues: ThumbsUp (copy), ReactionTriggerModule (copy)
	local IsAllowMultiple: boolean = p2 ~= nil and p2.allowMultiple == true
	local Removed = nil
	
	if IsAllowMultiple then
		Removed = nil
	else
		Removed = nil
		
		for i, selectedReaction in State.selectedReactions do
			if selectedReaction then
				Removed = i
				break
			end
		end
	end
	local P3 = (if ButtonTap == ReactionTriggerModule.PickerSelect then p1 else ButtonTap == ReactionTriggerModule.ButtonTap and p1 or Removed) or ThumbsUp
	local IsSelectedReaction = State.selectedReactions[P3] == true
	
	if IsSelectedReaction and ButtonTap == ReactionTriggerModule.DoubleTap then
		return {
			added = nil,
			removed = nil,
			state = State,
			celebratedReaction = P3
		}
	end
	local Copy = if IsAllowMultiple then table.clone(State.selectedReactions) else {}
	local Copy1 = table.clone(State.reactionCounts)
	
	local function _(Key)
		-- upvalues: Copy1 (copy)
		local v1 = (Copy1[Key] or 0) - 1
		
		if v1 > 0 then
			Copy1[Key] = v1
			
			return
		else
			Copy1[Key] = nil
		end
	end
	
	if IsSelectedReaction then
		Copy[P3] = nil
		local v1 = (Copy1[P3] or 0) - 1
		
		if v1 > 0 then
			Copy1[P3] = v1
		else
			Copy1[P3] = nil
		end
		return {
			added = nil,
			celebratedReaction = nil,
			state = { selectedReactions = Copy, reactionCounts = Copy1 },
			removed = P3
		}
	else
		if Removed ~= nil then
			local v2 = (Copy1[Removed] or 0) - 1
			
			if v2 > 0 then
				Copy1[Removed] = v2
			else
				Copy1[Removed] = nil
			end
		end
		Copy[P3] = true
		Copy1[P3] = (Copy1[P3] or 0) + 1
		
		return {
			state = { selectedReactions = Copy, reactionCounts = Copy1 },
			added = P3,
			removed = Removed,
			celebratedReaction = P3
		}
	end
end