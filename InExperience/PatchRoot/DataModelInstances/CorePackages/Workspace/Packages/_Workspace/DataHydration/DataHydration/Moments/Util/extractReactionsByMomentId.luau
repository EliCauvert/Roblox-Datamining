local dataHydration = script:FindFirstAncestor("DataHydration")
local momentsTypesModule = require(dataHydration.Parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local t = {}

for i, v in momentsTypesModule.Enums.ReactionType do
	t[v] = true
end
local function convertApiReactions(p0) --[[ line: 27 ]]
	-- upvalues: t (ref)
	if type(p0) ~= "table" then
		return nil
	end
	local t_1 = {}
	local var5 = false
	local counts = p0.counts
	
	if type(counts) == "table" then
		for i, v in counts do
			if type(i) == "string" and t[i] and (type(v) == "number" and v > 0) then
				t_1[i] = v
				var5 = true
			end
		end
	end
	local userReaction = p0.userReaction or p0.viewerReaction
	
	if type(userReaction) == "string" and t[userReaction] then
		t_1.userReaction = userReaction
		var5 = true
	end
	return if var5 then t_1 else nil
end

return function(p1) --[[ line: 65 | named "extractReactionsByMomentId" ]]
	-- upvalues: convertApiReactions (ref)
	local t = {}
	
	if p1 == nil then
		return t
	end
	for i, v in p1 do
		local entityId = v.entityId or v.id
		
		if entityId ~= nil then
			local var9 = convertApiReactions(v.reactions)
			
			if var9 ~= nil then
				t[entityId] = var9
			end
		end
	end
	return t
end