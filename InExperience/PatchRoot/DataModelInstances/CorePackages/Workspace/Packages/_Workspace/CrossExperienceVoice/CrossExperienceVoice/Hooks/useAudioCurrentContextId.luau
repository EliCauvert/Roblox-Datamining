local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local react = require(crossExperienceVoice.dependencies).React
local default = require(crossExperienceVoice.CrossExperienceVoiceManager).default
local audioFocusService = default:getAudioFocusService()

return function()
	-- upvalues: react (ref), audioFocusService (ref), default (ref)
	local var2, var3 = react.useState(-1)
	
	if audioFocusService then
		react.useEffect(function()
			-- upvalues: var3 (ref), default (copy), audioFocusService (copy)
			var3(default:getCurrentAudioContext())
			audioFocusService.OnContextRegistered:Connect(function()
				-- upvalues: var3 (copy), default (copy)
				var3(default:getCurrentAudioContext())
			end)
			audioFocusService.OnContextUnregistered:Connect(function()
				-- upvalues: var3 (copy), default (copy)
				var3(default:getCurrentAudioContext())
			end)
			audioFocusService.OnDeafenVoiceAudio:Connect(function(_)
				-- upvalues: var3 (copy), default (copy)
				var3(default:getCurrentAudioContext())
			end)
			audioFocusService.OnUndeafenVoiceAudio:Connect(function(_)
				-- upvalues: var3 (copy), default (copy)
				var3(default:getCurrentAudioContext())
			end)
		end, {})
	end
	return var2
end