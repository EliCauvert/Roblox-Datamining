local _ = require(script.Parent.CommentCollectionTypes)
local t = {
	sessionHiddenCommentIds = {},
	recentlyBlockedAuthorIds = {}
}

return function(p1)
	-- upvalues: t (ref)
	local filters = p1.filters or t
	local t_1 = {}
	local t_2 = {}
	
	if p1.pendingSentinel ~= nil then
		table.insert(t_2, p1.pendingSentinel)
		t_1[p1.pendingSentinel] = true
	end
	if not p1.replace then
		for i, v in p1.existingIds do
			if not t_1[v] then
				table.insert(t_2, v)
				t_1[v] = true
			end
		end
	end
	local t_3 = {}
	
	for i, v in p1.pageComments do
		if v.status == "Active" and not t_1[v.commentId] and filters.sessionHiddenCommentIds[v.commentId] ~= true then
			local var1 = if v.author ~= nil then nil else v.author.userId
			
			if var1 == nil or filters.recentlyBlockedAuthorIds[var1] ~= true then
				table.insert(t_2, v.commentId)
				table.insert(t_3, v.commentId)
				t_1[v.commentId] = true
			end
		end
	end
	return {
		orderedCommentIds = t_2,
		addedIds = t_3,
		visibleCount = #t_3,
		shouldContinuePaging = p1.hasMore == true and #t_3 == 0
	}
end