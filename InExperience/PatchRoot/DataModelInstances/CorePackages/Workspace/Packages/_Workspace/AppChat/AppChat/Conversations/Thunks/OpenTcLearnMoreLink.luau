local parent = script:FindFirstAncestor("AppChat").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appChatTcLearnMoreUrl = game:DefineFastString("AppChatTcLearnMoreUrl", "https://en.help.roblox.com/")

return function()
	-- upvalues: appPage (ref), appChatTcLearnMoreUrl (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	return function(p1)
		-- upvalues: appPage (copy), appChatTcLearnMoreUrl (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
		local t = {
			name = appPage.GenericWebPage,
			detail = appChatTcLearnMoreUrl,
			extraProps = { title = "" }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p1:dispatch(navigateDown(t, nil))
	end
end