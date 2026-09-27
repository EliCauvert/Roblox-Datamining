local _ = require(script.Parent.CommentCollectionTypes)
local t = {
	sessionHiddenCommentIds = {},
	recentlyBlockedAuthorIds = {}
}

return function(p1)
	-- upvalues: t (ref)
	local filters = p1.filters or t
	local stickyPostedCommentIds = p1.stickyPostedCommentIds or {}
	local visibleIdsBeforeReconciliation = p1.visibleIdsBeforeReconciliation or {}
	local t_1 = {}
	local t_2 = {}
	
	if p1.pendingSentinel ~= nil then
		table.insert(t_2, p1.pendingSentinel)
		t_1[p1.pendingSentinel] = true
	end
	for i, v in stickyPostedCommentIds do
		if not t_1[v] then
			table.insert(t_2, v)
			t_1[v] = true
		end
	end
	if not p1.replace then
		for i, v_1 in p1.existingIds do
			if not t_1[v_1] then
				table.insert(t_2, v_1)
				t_1[v_1] = true
			end
		end
	end
	local t_3 = {}
	
	for i_2, v_1 in p1.pageComments do
		if v_1.status == "Active" and not t_1[v_1.commentId] and filters.sessionHiddenCommentIds[v_1.commentId] ~= true then
			local var1 = if v_1.author ~= nil then nil else v_1.author.userId
			
			if var1 == nil or filters.recentlyBlockedAuthorIds[var1] ~= true then
				table.insert(t_2, v_1.commentId)
				t_1[v_1.commentId] = true
				
				if not visibleIdsBeforeReconciliation[v_1.commentId] then
					table.insert(t_3, v_1.commentId)
				end
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