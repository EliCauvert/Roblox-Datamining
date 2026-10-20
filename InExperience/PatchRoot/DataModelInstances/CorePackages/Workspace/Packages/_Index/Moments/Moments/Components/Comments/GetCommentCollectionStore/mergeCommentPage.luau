local _ = require(script.Parent.CommentCollectionTypes)
local config = {
	sessionHiddenCommentIds = {},
	recentlyBlockedAuthorIds = {}
}

return function(p1)
	-- upvalues: config (copy)
	local Filters = p1.filters or config
	local StickyPostedCommentIds = p1.stickyPostedCommentIds or {}
	local VisibleIdsBeforeReconciliation = p1.visibleIdsBeforeReconciliation or {}
	local t = {}
	local List = {}
	
	if p1.pendingSentinel ~= nil then
		table.insert(List, p1.pendingSentinel)
		t[p1.pendingSentinel] = true
	end
	for _, stickyPostedCommentId in StickyPostedCommentIds do
		if not t[stickyPostedCommentId] then
			table.insert(List, stickyPostedCommentId)
			t[stickyPostedCommentId] = true
		end
	end
	if not p1.replace then
		for _, existingId in p1.existingIds do
			if not t[existingId] then
				table.insert(List, existingId)
				t[existingId] = true
			end
		end
	end
	local AddedIds = {}
	
	for _, pageComment in p1.pageComments do
		if pageComment.status == "Active" and not t[pageComment.commentId] and Filters.sessionHiddenCommentIds[pageComment.commentId] ~= true then
			local UserId = if pageComment.author == nil then nil else pageComment.author.userId
			
			if UserId == nil or Filters.recentlyBlockedAuthorIds[UserId] ~= true then
				table.insert(List, pageComment.commentId)
				t[pageComment.commentId] = true
				
				if not VisibleIdsBeforeReconciliation[pageComment.commentId] then
					table.insert(AddedIds, pageComment.commentId)
				end
			end
		end
	end
	return {
		orderedCommentIds = List,
		addedIds = AddedIds,
		visibleCount = #AddedIds,
		shouldContinuePaging = p1.hasMore == true and #AddedIds == 0
	}
end