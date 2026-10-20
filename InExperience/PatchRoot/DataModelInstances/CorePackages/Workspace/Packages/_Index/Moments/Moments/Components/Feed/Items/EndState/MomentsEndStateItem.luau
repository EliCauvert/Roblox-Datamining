local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagMomentsNonInfiniteScrollEndStateFixesModule = require(Moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local UseFeedFunction = require(Moments.Components.Feed.FeedContext).useFeed
local MomentsEndStateViewModule = require(script.Parent.MomentsEndStateView)
local Signal = if FFlagMomentsNonInfiniteScrollEndStateFixesModule then SignalsModule.createSignal(true) else nil

return function(Frame)
	-- upvalues: UseFeedFunction (copy), FFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), SignalsReactModule (copy), Signal (ref), ReactModule (copy), MomentsEndStateViewModule (copy)
	local UseFeedResult = UseFeedFunction()
	local LoadMoreBeyondLimitFunction = UseFeedResult.loadMoreBeyondLimit
	
	return ReactModule.createElement(MomentsEndStateViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		onLoadMore = ReactModule.useCallback(function()
			-- upvalues: LoadMoreBeyondLimitFunction (copy)
			if LoadMoreBeyondLimitFunction ~= nil then
				LoadMoreBeyondLimitFunction()
			end
		end, { LoadMoreBeyondLimitFunction }),
		showLoadMore = not FFlagMomentsNonInfiniteScrollEndStateFixesModule or SignalsReactModule.useSignalState(UseFeedResult.getCanLoadMoreBeyondLimit or Signal)
	})
end