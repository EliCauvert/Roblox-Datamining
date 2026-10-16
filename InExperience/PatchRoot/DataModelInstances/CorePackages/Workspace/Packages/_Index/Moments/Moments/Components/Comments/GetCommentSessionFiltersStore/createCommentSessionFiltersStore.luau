local _ = require(script.Parent.Parent.GetCommentCollectionStore.CommentCollectionTypes)
local CreateSignalFunction = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal
local config = {
	sessionHiddenCommentIds = {},
	recentlyBlockedAuthorIds = {}
}

return function() --[[ Line: 27 | Named "createCommentSessionFiltersStore" ]]
	-- upvalues: CreateSignalFunction (copy), config (copy)
	local Signal, Signal2 = CreateSignalFunction(config)
	
	return {
		getFilters = Signal,
		reset = function() --[[ Line: 30 ]]
			-- upvalues: Signal2 (copy)
			Signal2({
				sessionHiddenCommentIds = {},
				recentlyBlockedAuthorIds = {}
			})
		end,
		hideCommentForSession = function(Key) --[[ Line: 37 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal(false)
			
			if SignalResult.sessionHiddenCommentIds[Key] ~= true then
				local Copy = table.clone(SignalResult.sessionHiddenCommentIds)
				Copy[Key] = true
				Signal2({
					sessionHiddenCommentIds = Copy,
					recentlyBlockedAuthorIds = SignalResult.recentlyBlockedAuthorIds
				})
				
				return
			end
		end,
		markAuthorRecentlyBlocked = function(Key) --[[ Line: 50 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal(false)
			
			if SignalResult.recentlyBlockedAuthorIds[Key] ~= true then
				local Copy = table.clone(SignalResult.recentlyBlockedAuthorIds)
				Copy[Key] = true
				Signal2({
					sessionHiddenCommentIds = SignalResult.sessionHiddenCommentIds,
					recentlyBlockedAuthorIds = Copy
				})
				
				return
			end
		end,
		unmarkAuthorRecentlyBlocked = function(Key) --[[ Line: 63 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal(false)
			
			if SignalResult.recentlyBlockedAuthorIds[Key] == true then
				local Copy = table.clone(SignalResult.recentlyBlockedAuthorIds)
				Copy[Key] = nil
				Signal2({
					sessionHiddenCommentIds = SignalResult.sessionHiddenCommentIds,
					recentlyBlockedAuthorIds = Copy
				})
				
				return
			end
		end,
		isCommentSessionHidden = function(p1): boolean --[[ Line: 76 ]]
			-- upvalues: Signal (copy)
			return Signal(false).sessionHiddenCommentIds[p1] == true
		end,
		isAuthorRecentlyBlocked = function(p1): boolean --[[ Line: 80 ]]
			-- upvalues: Signal (copy)
			return Signal(false).recentlyBlockedAuthorIds[p1] == true
		end
	}
end