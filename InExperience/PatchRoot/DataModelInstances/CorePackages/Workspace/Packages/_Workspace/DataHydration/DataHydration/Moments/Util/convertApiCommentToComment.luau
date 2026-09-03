local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)

return function(p1)
	return if type(p1) == "table" then if not (type(p1.commentId) ~= "string" or p1.commentId == "") then if not (type(p1.feedItemId) ~= "string" or p1.feedItemId == "") then if not (type(p1.authorUserId) ~= "string" or p1.authorUserId == "") then if type(p1.text) == "string" then if not (type(p1.createdAt) ~= "string" or p1.createdAt == "") then if p1.isAuthoredByViewer == nil or type(p1.isAuthoredByViewer) == "boolean" then {
		status = "Active",
		editedAt = nil,
		commentId = p1.commentId,
		feedItemId = p1.feedItemId,
		author = { userId = p1.authorUserId },
		text = p1.text,
		createdAt = p1.createdAt,
		isAuthoredByViewer = p1.isAuthoredByViewer == true
	} else nil else nil else nil else nil else nil else nil else nil
end