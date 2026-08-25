local _ = require(script:FindFirstAncestor("DataHydration").Moments.MomentsStoreTypes)

local function _(p0)
	local stats = p0.stats
	
	return if stats == nil or type(stats.shareCount) ~= "number" then nil else {
		hasShared = false,
		shareCount = math.max(stats.shareCount, 0)
	}
end

return function(p1)
	local t = {}
	
	if p1 == nil then
		return t
	end
	for i, v in p1 do
		local entityId = v.entityId or v.id
		
		if entityId ~= nil then
			local stats = v.stats
			local var2 = if stats == nil or type(stats.shareCount) ~= "number" then nil else {
				hasShared = false,
				shareCount = math.max(stats.shareCount, 0)
			}
			
			if var2 ~= nil then
				t[entityId] = var2
			end
		end
	end
	return t
end