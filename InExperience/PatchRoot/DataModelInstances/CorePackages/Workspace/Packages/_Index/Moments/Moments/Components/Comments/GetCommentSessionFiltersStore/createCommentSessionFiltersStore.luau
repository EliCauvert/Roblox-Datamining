local _ = require(script.Parent.Parent.GetCommentCollectionStore.CommentCollectionTypes)
local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal
local t = {
	sessionHiddenCommentIds = {},
	recentlyBlockedAuthorIds = {}
}

return function()
	-- upvalues: createSignal (ref), t (ref)
	local var1, var2 = createSignal(t)
	
	return {
		getFilters = var1,
		hideCommentForSession = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			local var3 = var1(false)
			
			if var3.sessionHiddenCommentIds[p1] == true then
				return
			end
			local cloned = table.clone(var3.sessionHiddenCommentIds)
			cloned[p1] = true
			var2({
				sessionHiddenCommentIds = cloned,
				recentlyBlockedAuthorIds = var3.recentlyBlockedAuthorIds
			})
		end,
		markAuthorRecentlyBlocked = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			local var3 = var1(false)
			
			if var3.recentlyBlockedAuthorIds[p1] == true then
				return
			end
			local cloned = table.clone(var3.recentlyBlockedAuthorIds)
			cloned[p1] = true
			var2({
				sessionHiddenCommentIds = var3.sessionHiddenCommentIds,
				recentlyBlockedAuthorIds = cloned
			})
		end,
		isCommentSessionHidden = function(p1)
			-- upvalues: var1 (ref)
			return var1(false).sessionHiddenCommentIds[p1] == true
		end,
		isAuthorRecentlyBlocked = function(p1)
			-- upvalues: var1 (ref)
			return var1(false).recentlyBlockedAuthorIds[p1] == true
		end
	}
end