local CreateSignalFunction = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Signal3, Signal2_2 = CreateSignalFunction(nil)
	
	return {
		getDeepLinkedMomentId = Signal,
		getDeepLinkedMomentTargetIdType = Signal1,
		getPendingCommentsTarget = Signal3,
		setDeepLinkedMomentId = function(p1)
			-- upvalues: Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy)
			Signal2(p1)
			Signal2_1(if p1 == nil then nil else nil)
			
			if p1 ~= nil then
				Signal2_2(nil)
			end
		end,
		setDeepLinkedMoment = function(DeepLinkId, p1, p2)
			-- upvalues: Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy)
			Signal2(DeepLinkId)
			Signal2_1(if DeepLinkId == nil then nil else p1)
			
			if DeepLinkId ~= nil then
				Signal2_2(if p2 == nil then nil else {
					feedItemId = nil,
					deepLinkId = DeepLinkId,
					commentId = p2.commentId
				})
			end
		end,
		resolvePendingCommentsTarget = function(DeepLinkId, FeedItemId)
			-- upvalues: Signal3 (copy), Signal2_2 (copy)
			local SignalResult = Signal3(false)
			
			if SignalResult ~= nil and SignalResult.deepLinkId == DeepLinkId then
				Signal2_2(if FeedItemId == nil or FeedItemId == "" then nil else {
					deepLinkId = DeepLinkId,
					feedItemId = FeedItemId,
					commentId = SignalResult.commentId
				})
				
				return
			end
		end,
		takeCommentsTarget = function(FeedItemId)
			-- upvalues: Signal3 (copy), Signal2_2 (copy)
			local SignalResult = Signal3(false)
			
			if SignalResult == nil or SignalResult.feedItemId == nil or SignalResult.feedItemId ~= FeedItemId then
				return nil
			else
				Signal2_2(nil)
				
				return { commentId = SignalResult.commentId }
			end
		end
	}
end