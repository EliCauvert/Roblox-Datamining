local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.FeedTypes)
local NavigationBarModule = require(script.Parent.NavigationBar)

return function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), NavigationBarModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.pager.getItems)
	local CountUseSignalStateResult = #UseSignalStateResult
	local UseSignalStateResultEntry = UseSignalStateResult[CountUseSignalStateResult]
	local CountUseSignalStateResult1: number = if UseSignalStateResultEntry == nil or UseSignalStateResultEntry.kind ~= "skeleton" then CountUseSignalStateResult else CountUseSignalStateResult - 1
	
	return ReactModule.createElement(NavigationBarModule, {
		active = p1.active,
		currentIndex = math.min(SignalsReactModule.useSignalState(p1.pager.getCurrentIndex), (math.max(CountUseSignalStateResult1, 1))),
		numItems = CountUseSignalStateResult1,
		onScrollToNext = p1.onScrollToNext,
		onScrollToPrevious = p1.onScrollToPrevious,
		zIndex = p1.zIndex
	})
end