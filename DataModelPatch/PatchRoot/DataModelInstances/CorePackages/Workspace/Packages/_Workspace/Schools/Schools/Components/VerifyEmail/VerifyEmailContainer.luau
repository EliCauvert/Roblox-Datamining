local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local VerifyEmailPageModule = require(script.Parent.VerifyEmailPage)
local TextKeysModule = require(Schools.Common.TextKeys)
local IsValidEmailModule = require(Schools.Common.isValidEmail)
local RoutesModule = require(Schools.Navigation.Routes)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), IsValidEmailModule (copy), RoutesModule (copy), VerifyEmailPageModule (copy)
	local Navigation = p1.navigation
	local UseLocalizationResult = UseLocalizationFunction({
		errorInvalidEmail = TextKeysModule.VerifyEmailErrorInvalidEmail
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function()
		return nil
	end)
	
	return ReactModule.createElement(VerifyEmailPageModule, {
		email = UseStateResult,
		onEmailChanged = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
			UseStateResult2(p2)
			UseStateResult2_1(nil)
		end, {}),
		errorMessage = UseStateResult1,
		onContinue = ReactModule.useCallback(function()
			-- upvalues: IsValidEmailModule (upval), UseStateResult (copy), UseStateResult2_1 (copy), UseLocalizationResult (copy), Navigation (copy), RoutesModule (upval)
			if IsValidEmailModule(UseStateResult) then
				UseStateResult2_1(nil)
				Navigation.navigate(RoutesModule.SchoolWaitlist)
				
				return
			else
				UseStateResult2_1(UseLocalizationResult.errorInvalidEmail)
			end
		end, {
			UseStateResult,
			UseLocalizationResult.errorInvalidEmail,
			Navigation
		}),
		onBack = ReactModule.useCallback(function()
			-- upvalues: Navigation (copy)
			Navigation.pop()
		end, { Navigation }),
		onLearnMore = ReactModule.useCallback(function() end, {}),
		onTermsOfService = ReactModule.useCallback(function() end, {}),
		onPrivacyPolicy = ReactModule.useCallback(function() end, {})
	})
end