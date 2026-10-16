local Parent = script:FindFirstAncestor("SocialBlockingModal").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage

return function() --[[ Line: 17 | Named "useShowToastOnError" ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), SetCurrentToastMessageFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		blockLimitReachedToast = "Feature.Profile.Message.BlockError",
		blocktargetAlreadyBlockedToast = "Feature.Friends.Error.TargetAlreadyBlockedError"
	})
	
	return ReactModule.useCallback(function(p1) --[[ Line: 25 ]]
		-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), UseLocalizationResult (copy)
		local Number = p1 and p1.Body and tonumber(p1.Body) or nil
		
		if Number == 1 then
			UseDispatchResult(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = UseLocalizationResult.blocktargetAlreadyBlockedToast
			}))
			
			return
		end
		if Number == 2 then
			UseDispatchResult(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = UseLocalizationResult.blockLimitReachedToast
			}))
			
			return
		else
			UseDispatchResult(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = UseLocalizationResult.somethingIsWrongToast
			}))
		end
	end, { UseDispatchResult, UseLocalizationResult })
end