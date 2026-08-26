local parent = script:FindFirstAncestor("SocialToast").Parent
local navigationRoduxModule = require(parent.NavigationRodux)
local reactModule = require(parent.React)
local appPage = require(parent.RobloxAppEnums).AppPage
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function()
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var2 = useDispatch()
	
	return reactModule.useCallback(function(p1)
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		local t = {
			name = appPage.SocialToast,
			extraProps = { toastContent = p1 }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t, nil))
	end, {})
end