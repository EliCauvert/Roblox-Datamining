local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local isCanonicalNonzeroUuidModule = require(script.Parent.isCanonicalNonzeroUuid)

local function decodeReactions(p1)
	-- upvalues: isCanonicalNonzeroUuidModule (ref)
	if type(p1) ~= "table" or type(p1.counts) ~= "table" then
		return nil
	end
	local t = {}
	local t_1 = {}
	local countsCount = #p1.counts
	local var1 = 0
	
	for i, v in p1.counts do
		if type(i) == "number" and i % 1 == 0 and (i >= 1 and countsCount >= i) and (type(v) == "table" and isCanonicalNonzeroUuidModule(v.emoteId) and (type(v.count) == "number" and v.count >= 0)) and (v.count % 1 == 0 and t_1[v.emoteId] == nil) then
			var1 += 1
			t_1[v.emoteId] = v.count
			table.insert(t, { emoteId = v.emoteId, count = v.count })
			continue
		end
		return nil
	end
	if var1 ~= countsCount then
		return nil
	end
	local t_2 = nil
	
	if p1.userReaction ~= nil then
		if type(p1.userReaction) ~= "table" or not isCanonicalNonzeroUuidModule(p1.userReaction.emoteId) or (t_1[p1.userReaction.emoteId] or 0) <= 0 then
			return nil
		end
		t_2 = { emoteId = p1.userReaction.emoteId }
	end
	return { counts = t, userReaction = t_2 }
end

return function(p2)
	-- upvalues: decodeReactions (ref)
	return if type(p2) == "table" then if not (type(p2.commentId) ~= "string" or p2.commentId == "") then if not (type(p2.feedItemId) ~= "string" or p2.feedItemId == "") then if not (type(p2.authorUserId) ~= "string" or p2.authorUserId == "") then if type(p2.text) == "string" then if not (type(p2.createdAt) ~= "string" or p2.createdAt == "") then if p2.isAuthoredByViewer == nil or type(p2.isAuthoredByViewer) == "boolean" then {
		status = "Active",
		editedAt = nil,
		commentId = p2.commentId,
		feedItemId = p2.feedItemId,
		author = { userId = p2.authorUserId },
		text = p2.text,
		createdAt = p2.createdAt,
		isAuthoredByViewer = p2.isAuthoredByViewer == true,
		reactions = if p2.reactions == nil then nil else decodeReactions(p2.reactions)
	} else nil else nil else nil else nil else nil else nil else nil
end