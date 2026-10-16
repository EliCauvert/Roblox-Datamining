local _ = require(script:FindFirstAncestor("DataHydration").Moments.MomentsStoreTypes)

local function _(p1) --[[ Line: 13 | Named "extractShareInfo" ]]
	local Stats = p1.stats
	
	return if Stats == nil or type(Stats.shareCount) ~= "number" then nil else {
		hasShared = false,
		shareCount = math.max(Stats.shareCount, 0)
	}
end

return function(List) --[[ Line: 25 | Named "extractShareInfoByMomentId" ]]
	local t = {}
	
	if List == nil then
		return t
	end
	for _, value in List do
		local EntityId = value.entityId or value.id
		local NoEntityId = EntityId == nil
		local Config = nil
		
		if not NoEntityId then
			local Stats = value.stats
			Config = if Stats == nil or type(Stats.shareCount) ~= "number" then nil else {
				hasShared = false,
				shareCount = math.max(Stats.shareCount, 0)
			}
			NoEntityId = Config == nil
		end
		if not NoEntityId then
			t[EntityId] = Config
		end
	end
	return t
end