local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local CreatorCreditPageViewModule = require(script.Parent.CreatorCreditPageView)
local DailyLimitBottomSheetModule = require(script.Parent.DailyLimitBottomSheet)
local UseCreatorCreditPageViewModelModule = require(script.Parent.useCreatorCreditPageViewModel)

return function(_)
	-- upvalues: UseCreatorCreditPageViewModelModule (copy), ReactModule (copy), CreatorCreditPageViewModule (copy), DailyLimitBottomSheetModule (copy)
	local UseCreatorCreditPageViewModelModuleResult = UseCreatorCreditPageViewModelModule()
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Page = ReactModule.createElement(CreatorCreditPageViewModule, UseCreatorCreditPageViewModelModuleResult.pageProps),
		LimitSheet = ReactModule.createElement(DailyLimitBottomSheetModule, UseCreatorCreditPageViewModelModuleResult.limitSheetProps)
	})
end