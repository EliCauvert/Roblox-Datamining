local Parent = script:FindFirstAncestor("AppChat").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UnfilteredThreadsLearnMoreUrl = game:DefineFastString("UnfilteredThreadsLearnMoreUrl", "https://en.help.roblox.com/")

return function() --[[ Line: 13 ]]
	-- upvalues: AppPage (copy), UnfilteredThreadsLearnMoreUrl (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return function(p1) --[[ Line: 14 ]]
		-- upvalues: AppPage (upval), UnfilteredThreadsLearnMoreUrl (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		local config = {
			name = AppPage.GenericWebPage,
			detail = UnfilteredThreadsLearnMoreUrl,
			extraProps = { title = "" }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownFunction(config, nil))
		end
	end
end