local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local recentActivityInspectAndBuyViewModule = require(script.Parent.RecentActivityInspectAndBuyView)
local useRecentActivityInspectAndBuyViewModelModule = require(script.Parent.useRecentActivityInspectAndBuyViewModel)
local t = {}

return function()
	-- upvalues: useNavigation (ref), reactModule (ref), t (ref), useRecentActivityInspectAndBuyViewModelModule (ref), recentActivityInspectAndBuyViewModule (ref)
	local var4 = useNavigation()
	
	return reactModule.createElement(recentActivityInspectAndBuyViewModule, useRecentActivityInspectAndBuyViewModelModule({
		assetIds = var4.getParam("assetIds") or t,
		onClose = reactModule.useCallback(function()
			-- upvalues: var4 (ref)
			var4.goBack()
		end, { var4 })
	}))
end