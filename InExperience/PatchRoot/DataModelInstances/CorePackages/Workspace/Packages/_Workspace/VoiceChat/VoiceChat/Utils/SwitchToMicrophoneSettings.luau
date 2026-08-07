local dependenciesModule = require(script:FindFirstAncestor("VoiceChat").dependencies)
local promise = dependenciesModule.Promise
local default = dependenciesModule.LinkingProtocol.LinkingProtocol.default
local settingsRoute = dependenciesModule.LinkingProtocol.Enums.SettingsRoute

return function() --[[ line: 9 ]]
	-- upvalues: promise (ref), default (ref), settingsRoute (ref)
	return promise.new(function(p0, p1) --[[ line: 10 ]]
		-- upvalues: default (copy), settingsRoute (copy)
		default:switchToSettingsApp(settingsRoute.Microphone):andThen(function() --[[ line: 12 ]]
			-- upvalues: p0 (ref)
			p0()
		end):catch(function() --[[ line: 15 ]]
			-- upvalues: p1 (ref)
			p1()
		end)
	end)
end