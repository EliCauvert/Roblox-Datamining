local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local UseNineDotActivityIndicatorModule = require(script:FindFirstAncestor("Chrome").ChromeShared.Hooks.useNineDotActivityIndicator)
local SubmitFreeTrialBlueDotModule = require(CorePackages.Workspace.Packages.InExperienceShop.submitFreeTrialBlueDot)

return function()
	-- upvalues: SignalsReactModule (copy), SubmitFreeTrialBlueDotModule (copy), UseNineDotActivityIndicatorModule (copy), ReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(SubmitFreeTrialBlueDotModule.isHamburgerBlueDotShowing)
	UseNineDotActivityIndicatorModule("free_trial_blue_dot", UseSignalStateResult == true)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), SubmitFreeTrialBlueDotModule (upval)
		if UseSignalStateResult == true then
			SubmitFreeTrialBlueDotModule.reportMounted()
			SubmitFreeTrialBlueDotModule.reportViewed()
			
			return
		end
	end, { UseSignalStateResult })
end