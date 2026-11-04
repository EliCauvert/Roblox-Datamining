local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ShopErrorDialogModule = require(InExperienceShop.Components.ShopErrorDialog)
local UseTrialRedemptionErrorDialogViewModelModule = require(script.Parent.useTrialRedemptionErrorDialogViewModel)
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider

local function FocusNavigableShopErrorDialog(p1)
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), Provider (copy), ShopErrorDialogModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactFocusNavigationModule (upval)
		return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:teardown()
		end
	end, { UseMemoResult })
	
	return ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = UseMemoResult }, {
		Registry = ReactModule.createElement(Provider, nil, {
			Dialog = ReactModule.createElement(ShopErrorDialogModule, p1)
		})
	})
end

return function()
	-- upvalues: UseTrialRedemptionErrorDialogViewModelModule (copy), ReactModule (copy), FocusNavigableShopErrorDialog (copy)
	local UseTrialRedemptionErrorDialogViewModelModuleResult = UseTrialRedemptionErrorDialogViewModelModule()
	
	return if UseTrialRedemptionErrorDialogViewModelModuleResult == nil then nil else ReactModule.createElement(FocusNavigableShopErrorDialog, UseTrialRedemptionErrorDialogViewModelModuleResult)
end