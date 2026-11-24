local Enums = require(game:GetService("CorePackages").Workspace.Packages.CallProtocol).Enums

return {
	isStreamingEligible = function(p1, p2): boolean
		local IsEnabled = p1:IsEnabled(p2, Enum.AvatarChatServiceFeature.UserAudioEligible) or p1:IsEnabled(p2, Enum.AvatarChatServiceFeature.UserVideoEligible)
		
		return if IsEnabled and p1:IsPlaceEnabled() then true else false
	end,
	getTrackerErrorPrompt = function(TrackerError, p1)
		return if TrackerError == Enum.TrackerError.VideoNoPermission then p1.VideoNoPermission elseif TrackerError == Enum.TrackerError.VideoUnsupported then p1.VideoUnsupported elseif TrackerError == Enum.TrackerError.UnsupportedDevice then p1.UnsupportedDevice else p1.NotAvailable
	end,
	shouldEnableAudioAnimation = function(p1, p2, p3)
		return if p3 then p1 and p2 else p1
	end,
	getInitialVideoEnabled = function(p1)
		-- upvalues: Enums (copy)
		return p1.status ~= Enums.CallStatus.Idle.rawValue() and p1.status ~= Enums.CallStatus.Ringing.rawValue() and p1.camEnabled
	end
}