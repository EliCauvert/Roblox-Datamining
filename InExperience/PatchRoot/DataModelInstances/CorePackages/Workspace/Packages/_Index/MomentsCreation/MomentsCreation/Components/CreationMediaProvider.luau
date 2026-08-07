local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local enableAudioPlaybackInApp = require(parent.MediaPlayback).enableAudioPlaybackInApp
local feedPlaybackSuspension = require(parent.MomentsCommon).Media.feedPlaybackSuspension
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p0) --[[ line: 45 | named "CreationMediaProvider" ]]
	-- upvalues: reactModule (ref), enableAudioPlaybackInApp (ref), feedPlaybackSuspension (ref)
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: enableAudioPlaybackInApp (copy)
		enableAudioPlaybackInApp()
	end, {})
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: feedPlaybackSuspension (copy)
		feedPlaybackSuspension.setSuspended(true)
		
		return function() --[[ line: 53 ]]
			-- upvalues: feedPlaybackSuspension (copy)
			feedPlaybackSuspension.setSuspended(false)
		end
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, p0.children)
end