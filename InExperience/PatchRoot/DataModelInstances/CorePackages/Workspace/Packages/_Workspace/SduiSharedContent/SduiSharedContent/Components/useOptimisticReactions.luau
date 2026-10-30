local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(SduiSharedContent.Stores.ContentReactionsStoreTypes)
local CreateContentReactionsStoreModule = require(SduiSharedContent.Stores.createContentReactionsStore)
local GetContentReactionsStoreModule = require(SduiSharedContent.Stores.getContentReactionsStore)
local t = {}

return function(p1, p2, Callback)
	-- upvalues: t (copy), ReactModule (copy), CreateContentReactionsStoreModule (copy), GetContentReactionsStoreModule (copy), SignalsReactModule (copy), PromiseModule (copy)
	local P1 = p2 or t
	local P0 = p1 or ""
	local IsPMatch = P0 == ""
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsPMatch (copy), CreateContentReactionsStoreModule (upval)
		return if IsPMatch then CreateContentReactionsStoreModule() else nil
	end, { IsPMatch })
	local UseMemoResult1 = UseMemoResult or GetContentReactionsStoreModule(false)
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return if UseMemoResult then UseMemoResult.dispose else nil
	end, { UseMemoResult })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult1 (copy), P0 (copy), P1 (copy)
		return UseMemoResult1.getReactions(P0, P1)
	end, {
		UseMemoResult1,
		P0,
		SignalsReactModule.useSignalState(UseMemoResult1.getContentReactions(P0).data),
		P1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult1 (copy), P0 (copy), P1 (copy)
		UseMemoResult1.reconcileReactions(P0, P1)
	end, { UseMemoResult1, P0, P1 })
	
	return UseMemoResult2, (ReactModule.useCallback(function(p3)
		-- upvalues: Callback (copy), UseMemoResult1 (copy), P0 (copy), PromiseModule (upval), P1 (copy)
		local EmoteId = p3.emoteId
		
		if EmoteId == "" or Callback == nil then return end
		if UseMemoResult1.isReactionPending(P0, EmoteId) then return end
		local NoHasUserAppliedReaction = not p3.hasUserAppliedReaction
		local CallbackResult = Callback(nil, nil, { emoteId = EmoteId, shouldAdd = NoHasUserAppliedReaction })
		
		if PromiseModule.is(CallbackResult) then
			UseMemoResult1.updateReaction(P0, P1, p3, {
				emoteId = EmoteId,
				reactionType = p3.reactionType,
				hasUserAppliedReaction = NoHasUserAppliedReaction,
				reactionCount = math.max(0, (p3.reactionCount or 0) + (if NoHasUserAppliedReaction then 1 else -1))
			}, CallbackResult)
			
			return
		end
	end, { UseMemoResult1, P0, P1, Callback }))
end