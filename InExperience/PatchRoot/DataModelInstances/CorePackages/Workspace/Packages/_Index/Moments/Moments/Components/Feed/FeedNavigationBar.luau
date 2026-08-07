local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.FeedTypes)
local navigationBarModule = require(script.Parent.NavigationBar)

return function(p0) --[[ line: 35 | named "FeedNavigationBar" ]]
	-- upvalues: signalsReactModule (ref), reactModule (ref), navigationBarModule (ref)
	local var3 = signalsReactModule.useSignalState(p0.pager.getItems)
	local var4 = signalsReactModule.useSignalState(p0.pager.getCurrentIndex)
	local var3Count = #var3
	local var6 = var3[var3Count]
	local var7 = if var6 == nil or var6.kind ~= "skeleton" then var3Count else var3Count - 1
	
	return reactModule.createElement(navigationBarModule, {
		active = p0.active,
		currentIndex = math.min(var4, math.max(var7, 1)),
		numItems = var7,
		onScrollToNext = p0.onScrollToNext,
		onScrollToPrevious = p0.onScrollToPrevious,
		zIndex = p0.zIndex
	})
end