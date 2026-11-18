local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)

local function _(p1)
	return if p1.kind == "rollup" then if p1.category == "commenter" then "commenterLikedComments" elseif p1.category == "creator" then if (p1.counts.moments or 1) <= 1 then "creatorMoment" else "creatorMoments" else nil else nil
end

return function(p1, p2)
	local CommenterLikedComments = if p1.kind == "rollup" then if p1.category == "commenter" then "commenterLikedComments" elseif p1.category == "creator" then if (p1.counts.moments or 1) <= 1 then "creatorMoment" else "creatorMoments" else nil else nil
	
	return {
		kind = p1.kind,
		feedItemId = if p1.feedItemId == "" then nil else p1.feedItemId,
		commentId = p1.commentId,
		actorCount = tostring(p1.counts.commenters or #p1.actorUserIds),
		trigger = if p2 == nil then nil else p2,
		digestVariant = if CommenterLikedComments == nil then nil else CommenterLikedComments
	}
end