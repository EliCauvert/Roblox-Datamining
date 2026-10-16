local DependenciesModule = require(script:FindFirstAncestor("VoiceChat").dependencies)
local Promise = DependenciesModule.Promise
local Default = DependenciesModule.LinkingProtocol.LinkingProtocol.default
local SettingsRoute = DependenciesModule.LinkingProtocol.Enums.SettingsRoute

return function() --[[ Line: 9 ]]
	-- upvalues: Promise (copy), Default (copy), SettingsRoute (copy)
	return Promise.new(function(Callback, Callback1) --[[ Line: 10 ]]
		-- upvalues: Default (upval), SettingsRoute (upval)
		Default:switchToSettingsApp(SettingsRoute.Microphone):andThen(function() --[[ Line: 12 ]]
			-- upvalues: Callback (copy)
			Callback()
		end):catch(function() --[[ Line: 15 ]]
			-- upvalues: Callback1 (copy)
			Callback1()
		end)
	end)
end