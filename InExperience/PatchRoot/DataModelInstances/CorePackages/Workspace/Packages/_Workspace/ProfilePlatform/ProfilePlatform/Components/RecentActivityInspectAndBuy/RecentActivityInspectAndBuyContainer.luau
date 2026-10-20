local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local RecentActivityInspectAndBuyViewModule = require(script.Parent.RecentActivityInspectAndBuyView)
local UseRecentActivityInspectAndBuyViewModelModule = require(script.Parent.useRecentActivityInspectAndBuyViewModel)
local t = {}

return function()
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), t (copy), UseRecentActivityInspectAndBuyViewModelModule (copy), RecentActivityInspectAndBuyViewModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(RecentActivityInspectAndBuyViewModule, (UseRecentActivityInspectAndBuyViewModelModule({
		assetIds = UseNavigationResult.getParam("assetIds") or t,
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseNavigationResult (copy)
			UseNavigationResult.goBack()
		end, { UseNavigationResult })
	})))
end