local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local fFlagMomentsNonInfiniteScrollEndStateFixesModule = require(moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local useFeed = require(moments.Components.Feed.FeedContext).useFeed
local momentsEndStateViewModule = require(script.Parent.MomentsEndStateView)
local var1 = if fFlagMomentsNonInfiniteScrollEndStateFixesModule then signalsModule.createSignal(true) else nil

return function(p1)
	-- upvalues: useFeed (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), signalsReactModule (ref), var1 (write), reactModule (ref), momentsEndStateViewModule (ref)
	local var2 = useFeed()
	local var3 = true
	
	if fFlagMomentsNonInfiniteScrollEndStateFixesModule then
		var3 = signalsReactModule.useSignalState(var2.getCanLoadMoreBeyondLimit or var1)
	end
	local loadMoreBeyondLimit = var2.loadMoreBeyondLimit
	
	return reactModule.createElement(momentsEndStateViewModule, {
		LayoutOrder = p1.LayoutOrder,
		onLoadMore = reactModule.useCallback(function()
			-- upvalues: loadMoreBeyondLimit (ref)
			if loadMoreBeyondLimit ~= nil then
				loadMoreBeyondLimit()
			end
		end, { loadMoreBeyondLimit }),
		showLoadMore = var3
	})
end