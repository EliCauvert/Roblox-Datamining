local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local creatorCreditPageViewModule = require(script.Parent.CreatorCreditPageView)
local dailyLimitBottomSheetModule = require(script.Parent.DailyLimitBottomSheet)
local useCreatorCreditPageViewModelModule = require(script.Parent.useCreatorCreditPageViewModel)

return function(_)
	-- upvalues: useCreatorCreditPageViewModelModule (ref), reactModule (ref), creatorCreditPageViewModule (ref), dailyLimitBottomSheetModule (ref)
	local var4 = useCreatorCreditPageViewModelModule()
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Page = reactModule.createElement(creatorCreditPageViewModule, var4.pageProps),
		LimitSheet = reactModule.createElement(dailyLimitBottomSheetModule, var4.limitSheetProps)
	})
end