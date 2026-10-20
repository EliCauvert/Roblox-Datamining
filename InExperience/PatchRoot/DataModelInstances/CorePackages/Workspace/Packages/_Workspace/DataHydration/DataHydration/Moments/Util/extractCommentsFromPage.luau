local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.MomentsTypes)
local ConvertApiCommentToCommentModule = require(DataHydration.Moments.Util.convertApiCommentToComment)

return function(p1)
	-- upvalues: ConvertApiCommentToCommentModule (copy)
	local t = {}
	
	if type(p1) ~= "table" or type(p1.comments) ~= "table" then
		return t
	end
	for _, comment in p1.comments do
		local ConvertApiCommentToCommentModuleResult = ConvertApiCommentToCommentModule(comment)
		
		if ConvertApiCommentToCommentModuleResult ~= nil then
			t[ConvertApiCommentToCommentModuleResult.commentId] = ConvertApiCommentToCommentModuleResult
		end
	end
	return t
end