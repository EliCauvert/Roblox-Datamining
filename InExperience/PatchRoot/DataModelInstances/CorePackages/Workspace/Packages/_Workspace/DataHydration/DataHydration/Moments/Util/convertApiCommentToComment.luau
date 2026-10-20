local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local IsCanonicalNonzeroUuidModule = require(script.Parent.isCanonicalNonzeroUuid)

local function decodeReactions(Reactions)
	-- upvalues: IsCanonicalNonzeroUuidModule (copy)
	if type(Reactions) ~= "table" or type(Reactions.counts) ~= "table" then
		return nil
	end
	local Counts = {}
	local t = {}
	local CountCounts = #Reactions.counts
	local Count = 0
	
	for i, count in Reactions.counts do
		if type(i) ~= "number" or i % 1 ~= 0 or i < 1 or CountCounts < i or type(count) ~= "table" or not IsCanonicalNonzeroUuidModule(count.emoteId) or type(count.count) ~= "number" or count.count < 0 or count.count % 1 ~= 0 or t[count.emoteId] ~= nil then
			return nil
		end
		Count += 1
		t[count.emoteId] = count.count
		table.insert(Counts, { emoteId = count.emoteId, count = count.count })
	end
	if Count ~= CountCounts then
		return nil
	end
	local UserReaction = nil
	
	if Reactions.userReaction ~= nil then
		if type(Reactions.userReaction) ~= "table" or not IsCanonicalNonzeroUuidModule(Reactions.userReaction.emoteId) or (t[Reactions.userReaction.emoteId] or 0) <= 0 then
			return nil
		end
		UserReaction = { emoteId = Reactions.userReaction.emoteId }
	end
	return { counts = Counts, userReaction = UserReaction }
end

return function(p1)
	-- upvalues: decodeReactions (copy)
	return if type(p1) == "table" and (type(p1.commentId) == "string" and p1.commentId ~= "" and (type(p1.feedItemId) == "string" and p1.feedItemId ~= "" and (type(p1.authorUserId) == "string" and p1.authorUserId ~= "" and (type(p1.text) == "string" and (type(p1.createdAt) == "string" and p1.createdAt ~= "" and (p1.isAuthoredByViewer == nil or type(p1.isAuthoredByViewer) == "boolean")))))) then {
		status = "Active",
		editedAt = nil,
		commentId = p1.commentId,
		feedItemId = p1.feedItemId,
		author = { userId = p1.authorUserId },
		text = p1.text,
		createdAt = p1.createdAt,
		isAuthoredByViewer = p1.isAuthoredByViewer == true,
		reactions = if p1.reactions == nil then nil else decodeReactions(p1.reactions)
	} else nil
end