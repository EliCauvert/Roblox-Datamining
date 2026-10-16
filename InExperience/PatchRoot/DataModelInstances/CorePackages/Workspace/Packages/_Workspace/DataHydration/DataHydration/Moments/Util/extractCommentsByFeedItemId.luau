local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConvertApiMomentCommentsModule = require(DataHydration.Moments.Util.convertApiMomentComments)

return function(List) --[[ Line: 14 | Named "extractCommentsByFeedItemId" ]]
	-- upvalues: ConvertApiMomentCommentsModule (copy)
	local t = {}
	
	if List == nil then
		return t
	end
	for _, value in List do
		local FeedItemId = value.feedItemId
		
		if type(FeedItemId) == "string" and FeedItemId ~= "" then
			local ConvertApiMomentCommentsModuleResult = ConvertApiMomentCommentsModule(value.comments)
			
			if ConvertApiMomentCommentsModuleResult ~= nil then
				t[FeedItemId] = ConvertApiMomentCommentsModuleResult
			end
		end
	end
	return t
end