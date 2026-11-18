local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)

local function selectDigestCopy(p1, Callback)
	local Counts = p1.counts
	
	if p1.category == "commenter" then
		return {
			titleKey = "Feature.Moments.Title.EngagementLikedCommentsDigest",
			textKey = "Feature.Moments.Description.EngagementLikedCommentsDigest",
			args = { likedComments = Callback(Counts.likedComments or 0) }
		}
	elseif p1.category == "creator" then
		local Comments = Counts.comments or 0
		local Milestone = Counts.milestone or 0
		local IsMilestoneAbove = Milestone > 1
		local Args = {
			comments = Callback(Comments),
			milestone = Callback(Milestone)
		}
		
		return if (Counts.moments or 1) <= 1 then {
			titleKey = "Feature.Moments.Title.EngagementMomentDigest",
			textKey = if Comments == 1 then if IsMilestoneAbove then "Feature.Moments.Description.EngagementOneCommentDigest" else "Feature.Moments.Description.EngagementOneCommentFirstReactionDigest" elseif IsMilestoneAbove then "Feature.Moments.Description.EngagementMomentDigest" else "Feature.Moments.Description.EngagementMomentFirstReactionDigest",
			args = Args
		} else {
			titleKey = "Feature.Moments.Title.EngagementMomentsDigest",
			textKey = if Comments == 0 or Comments == 1 and not IsMilestoneAbove then "Feature.Moments.Description.EngagementMomentsReactionsDigest" elseif Comments == 1 then "Feature.Moments.Description.EngagementOneCommentDigest" elseif IsMilestoneAbove then "Feature.Moments.Description.EngagementMomentsDigest" else "Feature.Moments.Description.EngagementMomentsCommentsDigest",
			args = Args
		}
	else
		return nil
	end
end

return function(p1, Name, Callback)
	-- upvalues: selectDigestCopy (copy)
	if p1.kind == "comments" then
		if Name == nil then
			return nil
		else
			local Commenters = p1.counts.commenters or 1
			
			return if Commenters <= 1 then {
				titleKey = "Feature.Moments.Title.EngagementNewComment",
				textKey = "Feature.Moments.Description.EngagementNewComment",
				args = { name = Name }
			} elseif Commenters == 2 then {
				titleKey = "Feature.Moments.Title.EngagementNewComments",
				textKey = "Feature.Moments.Description.EngagementNewCommentsOneOther",
				args = { name = Name }
			} else {
				titleKey = "Feature.Moments.Title.EngagementNewComments",
				textKey = "Feature.Moments.Description.EngagementNewComments",
				args = { name = Name, count = Callback(Commenters - 1) }
			}
		end
	elseif p1.kind == "reactionMilestone" then
		local Milestone = p1.counts.milestone or 1
		
		return if Milestone <= 1 then {
			titleKey = "Feature.Moments.Title.EngagementFirstReaction",
			textKey = "Feature.Moments.Description.EngagementFirstReaction",
			args = {}
		} else {
			titleKey = "Feature.Moments.Title.EngagementReactionMilestone",
			textKey = "Feature.Moments.Description.EngagementReactionMilestone",
			args = { count = Callback(Milestone) }
		}
	else
		return if p1.kind == "likes" then {
			titleKey = "Feature.Moments.Title.EngagementFirstLike",
			textKey = "Feature.Moments.Description.EngagementFirstLike",
			args = {}
		} elseif p1.kind == "rollup" then selectDigestCopy(p1, Callback) else nil
	end
end