local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local fFlagMomentsNonInfiniteScrollEndStateFixesModule = require(moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local useFeed = require(moments.Components.Feed.FeedContext).useFeed
local momentsEndStateViewModule = require(script.Parent.MomentsEndStateView)
local var6 = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then signalsModule.createSignal(true) else nil

return function(p0)
	-- upvalues: useFeed (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), signalsReactModule (ref), var6 (write), reactModule (ref), momentsEndStateViewModule (ref)
	local var7 = useFeed()
	local var8 = true
	
	if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
		var8 = signalsReactModule.useSignalState(var7.getCanLoadMoreBeyondLimit or var6)
	end
	local loadMoreBeyondLimit = var7.loadMoreBeyondLimit
	
	return reactModule.createElement(momentsEndStateViewModule, {
		LayoutOrder = p0.LayoutOrder,
		onLoadMore = reactModule.useCallback(function()
			-- upvalues: loadMoreBeyondLimit (ref)
			if loadMoreBeyondLimit ~= nil then
				loadMoreBeyondLimit()
			end
		end, { loadMoreBeyondLimit }),
		showLoadMore = var8
	})
end