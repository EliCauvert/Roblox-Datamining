local parent = script:FindFirstAncestor("VoiceChat").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var0 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0) --[[ line: 14 ]]
	-- upvalues: appPage (ref), fFlagSignalsNavP3Dispatch (ref), var0 (ref), navigateDown (ref)
	return function(p1) --[[ line: 15 ]]
		-- upvalues: appPage (copy), p0 (ref), fFlagSignalsNavP3Dispatch (copy), var0 (copy), navigateDown (copy)
		local t = { name = appPage.AgeVerificationRequired, detail = p0 }
		
		if fFlagSignalsNavP3Dispatch then
			var0.down(var0.fromLegacyPage(t))
			
			return
		end
		p1:dispatch(navigateDown(t))
	end
end