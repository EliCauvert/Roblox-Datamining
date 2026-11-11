local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local t = {}

for _, value in require(DataHydration.Parent.MomentsTypes).Enums.ReactionType do
	t[value] = true
end
local function convertApiReactions(Reactions)
	-- upvalues: t (copy)
	if type(Reactions) ~= "table" then
		return nil
	end
	local t1 = {}
	local Flag = false
	local Counts = Reactions.counts
	
	if type(Counts) == "table" then
		for i, count in Counts do
			if type(i) == "string" and t[i] and type(count) == "number" and count > 0 then
				t1[i] = count
				Flag = true
			end
		end
	end
	local UserReaction = Reactions.userReaction or Reactions.viewerReaction
	
	if type(UserReaction) == "string" and t[UserReaction] then
		t1.userReaction = UserReaction
		Flag = true
	end
	return if Flag then t1 else nil
end

return function(List)
	-- upvalues: convertApiReactions (copy)
	local t = {}
	
	if List == nil then
		return t
	end
	for _, value in List do
		local EntityId = value.entityId or value.id
		local NoEntityId = EntityId == nil
		local ConvertApiReactionsResult = nil
		
		if not NoEntityId then
			ConvertApiReactionsResult = convertApiReactions(value.reactions)
			NoEntityId = ConvertApiReactionsResult == nil
		end
		if not NoEntityId then
			t[EntityId] = ConvertApiReactionsResult
		end
	end
	return t
end