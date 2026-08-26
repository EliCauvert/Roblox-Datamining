local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local enableAudioPlaybackInApp = require(parent.MediaPlayback).enableAudioPlaybackInApp
local feedPlaybackSuspension = require(parent.MomentsCommon).Media.feedPlaybackSuspension
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: reactModule (ref), enableAudioPlaybackInApp (ref), feedPlaybackSuspension (ref)
	reactModule.useEffect(function()
		-- upvalues: enableAudioPlaybackInApp (copy)
		enableAudioPlaybackInApp()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: feedPlaybackSuspension (copy)
		feedPlaybackSuspension.setSuspended(true)
		
		return function()
			-- upvalues: feedPlaybackSuspension (copy)
			feedPlaybackSuspension.setSuspended(false)
		end
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, p1.children)
end