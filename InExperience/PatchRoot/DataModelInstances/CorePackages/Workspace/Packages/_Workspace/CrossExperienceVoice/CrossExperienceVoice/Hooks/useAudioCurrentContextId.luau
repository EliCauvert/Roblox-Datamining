local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local react = require(crossExperienceVoice.dependencies).React
local default = require(crossExperienceVoice.CrossExperienceVoiceManager).default
local audioFocusService = default:getAudioFocusService()

return function() --[[ line: 8 ]]
	-- upvalues: react (ref), audioFocusService (ref), default (ref)
	local var2, var3 = react.useState(-1)
	
	if audioFocusService then
		react.useEffect(function() --[[ line: 12 ]]
			-- upvalues: var3 (ref), default (copy), audioFocusService (copy)
			var3(default:getCurrentAudioContext())
			audioFocusService.OnContextRegistered:Connect(function() --[[ line: 15 ]]
				-- upvalues: var3 (copy), default (copy)
				var3(default:getCurrentAudioContext())
			end)
			audioFocusService.OnContextUnregistered:Connect(function() --[[ line: 19 ]]
				-- upvalues: var3 (copy), default (copy)
				var3(default:getCurrentAudioContext())
			end)
			audioFocusService.OnDeafenVoiceAudio:Connect(function(_) --[[ line: 23 ]]
				-- upvalues: var3 (copy), default (copy)
				var3(default:getCurrentAudioContext())
			end)
			audioFocusService.OnUndeafenVoiceAudio:Connect(function(_) --[[ line: 27 ]]
				-- upvalues: var3 (copy), default (copy)
				var3(default:getCurrentAudioContext())
			end)
		end, {})
	end
	return var2
end