local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.MomentsTypes)
local convertApiCommentToCommentModule = require(dataHydration.Moments.Util.convertApiCommentToComment)

return function(p1)
	-- upvalues: convertApiCommentToCommentModule (ref)
	local t = {}
	
	if type(p1) ~= "table" or type(p1.comments) ~= "table" then
		return t
	end
	for i, v in p1.comments do
		local var1 = convertApiCommentToCommentModule(v)
		
		if var1 ~= nil then
			t[var1.commentId] = var1
		end
	end
	return t
end