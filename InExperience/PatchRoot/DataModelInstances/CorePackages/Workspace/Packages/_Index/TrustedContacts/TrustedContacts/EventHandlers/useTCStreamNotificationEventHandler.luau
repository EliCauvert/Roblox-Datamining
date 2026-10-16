local Parent = script:FindFirstAncestor("TrustedContacts").Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function() --[[ Line: 22 ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AppPage (copy), Sources (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), SetCurrentToastMessageFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong"
	})
	
	return (ReactModule.useCallback(function(p1) --[[ Line: 30 ]]
		-- upvalues: AppPage (upval), Sources (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (copy)
		local Callback = p1 and p1.callback
		local SenderUserid = p1 and (p1.clientEventsPayload and p1.clientEventsPayload.sender_userid)
		
		if not SenderUserid then
			UseDispatchResult(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = UseLocalizationResult.somethingIsWrongToast
			}))
			
			return
		end
		local config = {
			name = AppPage.TrustedContactsModal,
			props = {
				userId = SenderUserid,
				source = Sources.StreamNotification,
				onRequestAccepted = Callback
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config), true)
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config, true))
		end
	end, { UseDispatchResult, UseLocalizationResult }))
end