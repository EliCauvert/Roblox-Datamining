local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local EnableAudioPlaybackInAppFunction = require(Parent.MediaPlayback).enableAudioPlaybackInApp
local FeedPlaybackSuspension = require(Parent.MomentsCommon).Media.feedPlaybackSuspension
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: ReactModule (copy), EnableAudioPlaybackInAppFunction (copy), FeedPlaybackSuspension (copy)
	ReactModule.useEffect(function()
		-- upvalues: EnableAudioPlaybackInAppFunction (upval)
		EnableAudioPlaybackInAppFunction()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FeedPlaybackSuspension (upval)
		FeedPlaybackSuspension.setSuspended(true)
		
		return function()
			-- upvalues: FeedPlaybackSuspension (upval)
			FeedPlaybackSuspension.setSuspended(false)
		end
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
end