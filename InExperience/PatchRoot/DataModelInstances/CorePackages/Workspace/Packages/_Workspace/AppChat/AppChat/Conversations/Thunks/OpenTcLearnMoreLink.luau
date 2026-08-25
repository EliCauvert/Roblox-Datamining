local parent = script:FindFirstAncestor("AppChat").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var0 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appChatTcLearnMoreUrl = game:DefineFastString("AppChatTcLearnMoreUrl", "https://en.help.roblox.com/")

return function()
	-- upvalues: appPage (ref), appChatTcLearnMoreUrl (ref), fFlagSignalsNavP3Dispatch (ref), var0 (ref), navigateDown (ref)
	return function(p0)
		-- upvalues: appPage (copy), appChatTcLearnMoreUrl (copy), fFlagSignalsNavP3Dispatch (copy), var0 (copy), navigateDown (copy)
		local t = {
			name = appPage.GenericWebPage,
			detail = appChatTcLearnMoreUrl,
			extraProps = { title = "" }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var0.down(var0.fromLegacyPage(t))
			
			return
		end
		p0:dispatch(navigateDown(t, nil))
	end
end