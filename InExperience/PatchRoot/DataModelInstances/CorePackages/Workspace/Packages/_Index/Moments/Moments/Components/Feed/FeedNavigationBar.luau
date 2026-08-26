local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.FeedTypes)
local navigationBarModule = require(script.Parent.NavigationBar)

return function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), navigationBarModule (ref)
	local var1 = signalsReactModule.useSignalState(p1.pager.getItems)
	local var2 = signalsReactModule.useSignalState(p1.pager.getCurrentIndex)
	local var3Count = #var1
	local var3 = var1[var3Count]
	local var4 = if var3 == nil or var3.kind ~= "skeleton" then var3Count else var3Count - 1
	
	return reactModule.createElement(navigationBarModule, {
		active = p1.active,
		currentIndex = math.min(var2, math.max(var4, 1)),
		numItems = var4,
		onScrollToNext = p1.onScrollToNext,
		onScrollToPrevious = p1.onScrollToPrevious,
		zIndex = p1.zIndex
	})
end