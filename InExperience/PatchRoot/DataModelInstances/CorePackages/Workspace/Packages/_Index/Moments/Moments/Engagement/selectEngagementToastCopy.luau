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
		local Args = {
			comments = Callback(Counts.comments or 0),
			milestone = Callback(Counts.milestone or 0)
		}
		
		return if (Counts.moments or 1) <= 1 then {
			titleKey = "Feature.Moments.Title.EngagementMomentDigest",
			textKey = "Feature.Moments.Description.EngagementMomentDigest",
			args = Args
		} else {
			titleKey = "Feature.Moments.Title.EngagementMomentsDigest",
			textKey = "Feature.Moments.Description.EngagementMomentsDigest",
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