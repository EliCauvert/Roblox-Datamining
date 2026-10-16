local Parent = script:FindFirstAncestor("VoiceChat").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(Detail) --[[ Line: 14 ]]
	-- upvalues: AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return function(p1) --[[ Line: 15 ]]
		-- upvalues: AppPage (upval), Detail (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		local config = { name = AppPage.AgeVerificationRequired, detail = Detail }
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownFunction(config))
		end
	end
end