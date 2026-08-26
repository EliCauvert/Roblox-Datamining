local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local react = require(crossExperienceVoice.dependencies).React
local default = require(crossExperienceVoice.CrossExperienceVoiceManager).default
local audioFocusService = default:getAudioFocusService()

return function()
	-- upvalues: react (ref), audioFocusService (ref), default (ref)
	local var1, var2 = react.useState(-1)
	
	if audioFocusService then
		react.useEffect(function()
			-- upvalues: var2 (ref), default (copy), audioFocusService (copy)
			var2(default:getCurrentAudioContext())
			audioFocusService.OnContextRegistered:Connect(function()
				-- upvalues: var2 (copy), default (copy)
				var2(default:getCurrentAudioContext())
			end)
			audioFocusService.OnContextUnregistered:Connect(function()
				-- upvalues: var2 (copy), default (copy)
				var2(default:getCurrentAudioContext())
			end)
			audioFocusService.OnDeafenVoiceAudio:Connect(function(_)
				-- upvalues: var2 (copy), default (copy)
				var2(default:getCurrentAudioContext())
			end)
			audioFocusService.OnUndeafenVoiceAudio:Connect(function(_)
				-- upvalues: var2 (copy), default (copy)
				var2(default:getCurrentAudioContext())
			end)
		end, {})
	end
	return var1
end