local moments = script:FindFirstAncestor("Moments")
local _ = require(moments.Parent.MomentsTypes)
local commentCollectionTypesModule = require(moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes)
local _ = require(script.Parent.CommentRowTypes)

return function(p1, p2)
	-- upvalues: commentCollectionTypesModule (ref)
	local list = table.create(#p1.orderedCommentIds + (if p1.pendingSubmission ~= nil then 0 else 1))
	local pendingSubmission = p1.pendingSubmission
	
	if pendingSubmission ~= nil then
		table.insert(list, {
			type = "pending",
			key = commentCollectionTypesModule.pendingSentinel(pendingSubmission.clientRequestId),
			text = pendingSubmission.text,
			status = pendingSubmission.status
		})
	end
	for i, v in p1.orderedCommentIds do
		if not commentCollectionTypesModule.isPendingSentinel(v) then
			local var1 = p2(v)
			local t = { type = "comment", key = `comment:{v}`, commentId = v }
			local var2 = var1 == nil and ((if var1 == nil then var1.text else nil) or "")
			t.text = var2
			t.createdAt = if var1 ~= nil then "" else var1.createdAt
			table.insert(list, t)
		end
	end
	return list
end