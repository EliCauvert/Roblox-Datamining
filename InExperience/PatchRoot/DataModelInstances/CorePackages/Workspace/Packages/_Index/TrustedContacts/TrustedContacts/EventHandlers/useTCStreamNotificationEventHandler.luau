local parent = script:FindFirstAncestor("TrustedContacts").Parent
local reactModule = require(parent.React)
local appPage = require(parent.RobloxAppEnums).AppPage
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local sources = require(parent.SocialLuaAnalytics).Analytics.Enums.Sources
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function()
	-- upvalues: useDispatch (ref), useLocalization (ref), reactModule (ref), appPage (ref), sources (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), setCurrentToastMessage (ref)
	local var2 = useDispatch()
	local var3 = useLocalization({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong"
	})
	
	return reactModule.useCallback(function(p1)
		-- upvalues: appPage (copy), sources (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy), setCurrentToastMessage (copy), var3 (ref)
		local callback = p1 and p1.callback
		local senderUserid = p1 and (p1.clientEventsPayload and p1.clientEventsPayload.sender_userid)
		
		if not senderUserid then
			var2(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var3.somethingIsWrongToast
			}))
			
			return
		end
		local t = {
			name = appPage.TrustedContactsModal,
			props = {
				userId = senderUserid,
				source = sources.StreamNotification,
				onRequestAccepted = callback
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t), true)
			
			return
		end
		var2(navigateDown(t, true))
	end, { var2, var3 })
end