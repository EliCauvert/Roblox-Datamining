local parent = script:FindFirstAncestor("SocialToast").Parent
local navigationRoduxModule = require(parent.NavigationRodux)
local reactModule = require(parent.React)
local appPage = require(parent.RobloxAppEnums).AppPage
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function()
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref)
	local var3 = useDispatch()
	
	return reactModule.useCallback(function(p0)
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), var3 (ref), navigateDown (copy)
		local t = {
			name = appPage.SocialToast,
			extraProps = { toastContent = p0 }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var2.down(var2.fromLegacyPage(t))
			
			return
		end
		var3(navigateDown(t, nil))
	end, {})
end