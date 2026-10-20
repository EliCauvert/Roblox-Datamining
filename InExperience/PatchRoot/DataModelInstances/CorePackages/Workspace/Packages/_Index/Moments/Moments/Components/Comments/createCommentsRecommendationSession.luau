local _ = require(script:FindFirstAncestor("Moments").Components.Feed.FeedTypes)

return function(Callback, Tbl, MomentsSessionId, p1)
	local Callback1 = p1 or os.clock
	local Copy = table.clone(Tbl)
	local v1 = nil
	local Flag = false
	
	return {
		startView = function()
			-- upvalues: Flag (ref), v1 (ref), Callback1 (copy)
			if not Flag and v1 == nil then
				v1 = Callback1()
			end
		end,
		finishView = function()
			-- upvalues: v1 (ref), Flag (ref), Callback (copy), Copy (copy), MomentsSessionId (copy), Callback1 (copy)
			local v2 = v1
			v1 = nil
			
			if v2 ~= nil and not Flag then
				Callback("CommentSectionOpen", Copy, {
					momentsSessionId = MomentsSessionId,
					commentSectionOpenDurationSeconds = math.max(0, Callback1() - v2)
				})
				
				return
			end
		end,
		cancel = function()
			-- upvalues: Flag (ref), v1 (ref)
			Flag = true
			v1 = nil
		end,
		logComment = function(CommentText)
			-- upvalues: Flag (ref), Callback (copy), Copy (copy), MomentsSessionId (copy)
			if not Flag then
				Callback("Comment", Copy, {
					momentsSessionId = MomentsSessionId,
					commentText = CommentText
				})
			end
		end,
		logCommentDelete = function()
			-- upvalues: Flag (ref), Callback (copy), Copy (copy), MomentsSessionId (copy)
			if not Flag then
				Callback("CommentDelete", Copy, { momentsSessionId = MomentsSessionId })
			end
		end
	}
end