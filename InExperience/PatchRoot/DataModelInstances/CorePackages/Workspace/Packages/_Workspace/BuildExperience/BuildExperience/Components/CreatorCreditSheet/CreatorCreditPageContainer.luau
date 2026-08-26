local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local creatorCreditPageViewModule = require(script.Parent.CreatorCreditPageView)
local dailyLimitBottomSheetModule = require(script.Parent.DailyLimitBottomSheet)
local useCreatorCreditPageViewModelModule = require(script.Parent.useCreatorCreditPageViewModel)

return function(_)
	-- upvalues: useCreatorCreditPageViewModelModule (ref), reactModule (ref), creatorCreditPageViewModule (ref), dailyLimitBottomSheetModule (ref)
	local var1 = useCreatorCreditPageViewModelModule()
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Page = reactModule.createElement(creatorCreditPageViewModule, var1.pageProps),
		LimitSheet = reactModule.createElement(dailyLimitBottomSheetModule, var1.limitSheetProps)
	})
end