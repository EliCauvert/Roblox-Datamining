local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local convertApiMomentCommentsModule = require(dataHydration.Moments.Util.convertApiMomentComments)

return function(p1)
	-- upvalues: convertApiMomentCommentsModule (ref)
	local t = {}
	
	if p1 == nil then
		return t
	end
	for i, v in p1 do
		local feedItemId = v.feedItemId
		
		if type(feedItemId) == "string" and feedItemId ~= "" then
			local var1 = convertApiMomentCommentsModule(v.comments)
			
			if var1 ~= nil then
				t[feedItemId] = var1
			end
		end
	end
	return t
end