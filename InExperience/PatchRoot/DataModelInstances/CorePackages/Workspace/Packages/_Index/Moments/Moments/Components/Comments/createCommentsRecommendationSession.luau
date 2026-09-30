local _ = require(script:FindFirstAncestor("Moments").Components.Feed.FeedTypes)

return function(p1, p2, p3, p4)
	p4 = p4 or os.clock
	local cloned = table.clone(p2)
	local var1 = nil
	local var2 = false
	
	return {
		startView = function()
			-- upvalues: var2 (write), var1 (write), p4 (ref)
			if not var2 and var1 == nil then
				var1 = p4()
			end
		end,
		finishView = function()
			-- upvalues: var1 (write), var2 (write), p1 (ref), cloned (ref), p3 (ref), p4 (ref)
			var1 = nil
			
			if var1 == nil or var2 then
				return
			end
			p1("CommentSectionOpen", cloned, {
				momentsSessionId = p3,
				commentSectionOpenDurationSeconds = math.max(0, p4() - var1)
			})
		end,
		cancel = function()
			-- upvalues: var2 (write), var1 (write)
			var2 = true
			var1 = nil
		end,
		logComment = function(p5)
			-- upvalues: var2 (write), p1 (ref), cloned (ref), p3 (ref)
			if not var2 then
				p1("Comment", cloned, { momentsSessionId = p3, commentText = p5 })
			end
		end,
		logCommentDelete = function()
			-- upvalues: var2 (write), p1 (ref), cloned (ref), p3 (ref)
			if not var2 then
				p1("CommentDelete", cloned, { momentsSessionId = p3 })
			end
		end
	}
end