local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local React = require(CrossExperienceVoice.dependencies).React
local Default = require(CrossExperienceVoice.CrossExperienceVoiceManager).default
local AudioFocusService = Default:getAudioFocusService()

return function()
	-- upvalues: React (copy), AudioFocusService (copy), Default (copy)
	local UseStateResult, UseStateResult2 = React.useState(-1)
	
	if AudioFocusService then
		React.useEffect(function()
			-- upvalues: UseStateResult2 (copy), Default (upval), AudioFocusService (upval)
			UseStateResult2(Default:getCurrentAudioContext())
			AudioFocusService.OnContextRegistered:Connect(function()
				-- upvalues: UseStateResult2 (upval), Default (upval)
				UseStateResult2(Default:getCurrentAudioContext())
			end)
			AudioFocusService.OnContextUnregistered:Connect(function()
				-- upvalues: UseStateResult2 (upval), Default (upval)
				UseStateResult2(Default:getCurrentAudioContext())
			end)
			AudioFocusService.OnDeafenVoiceAudio:Connect(function(_)
				-- upvalues: UseStateResult2 (upval), Default (upval)
				UseStateResult2(Default:getCurrentAudioContext())
			end)
			AudioFocusService.OnUndeafenVoiceAudio:Connect(function(_)
				-- upvalues: UseStateResult2 (upval), Default (upval)
				UseStateResult2(Default:getCurrentAudioContext())
			end)
		end, {})
	end
	return UseStateResult
end