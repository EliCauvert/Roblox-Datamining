local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local AdsManagerMenuButtonViewModule = require(script.Parent.AdsManagerMenuButtonView)
local UseAdsManagerMenuButtonViewModelModule = require(script.Parent.useAdsManagerMenuButtonViewModel)

return function(p1)
	-- upvalues: UseAdsManagerMenuButtonViewModelModule (copy), ReactModule (copy), AdsManagerMenuButtonViewModule (copy)
	return ReactModule.createElement(AdsManagerMenuButtonViewModule, (UseAdsManagerMenuButtonViewModelModule(p1)))
end