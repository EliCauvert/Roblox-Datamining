local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local adsManagerMenuButtonViewModule = require(script.Parent.AdsManagerMenuButtonView)
local useAdsManagerMenuButtonViewModelModule = require(script.Parent.useAdsManagerMenuButtonViewModel)

return function(p1)
	-- upvalues: useAdsManagerMenuButtonViewModelModule (ref), reactModule (ref), adsManagerMenuButtonViewModule (ref)
	return reactModule.createElement(adsManagerMenuButtonViewModule, useAdsManagerMenuButtonViewModelModule(p1))
end