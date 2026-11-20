local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("InterstitialAdPlayer").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InExperienceLocalesModule = require(Parent.InExperienceLocales)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)

return function(p1)
	-- upvalues: ReactModule (copy), InExperienceLocalesModule (copy), LocalizationService (copy), ReactFocusNavigationModule (copy), LocalizationModule (copy), FocusNavigationUtilsModule (copy)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: InExperienceLocalesModule (upval), LocalizationService (upval)
		return InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
	end)
	local UseStateResult1 = ReactModule.useState(function()
		-- upvalues: ReactFocusNavigationModule (upval)
		return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy)
		return function()
			-- upvalues: UseStateResult1 (upval)
			UseStateResult1:teardown()
		end
	end, { UseStateResult1 })
	
	return ReactModule.createElement(LocalizationModule.LocalizationProvider, { localization = UseStateResult }, {
		FocusNavigation = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = UseStateResult1 }, {
			Surfaces = ReactModule.createElement(FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider, nil, p1.children)
		})
	})
end