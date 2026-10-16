return function(Sound: Sound): number --[[ Line: 1 | Named "getAssetIdForAudioSource" ]]
	return (tonumber(((if Sound:IsA("Sound") then Sound.SoundId elseif Sound:IsA("AudioPlayer") then Sound.Asset else nil):match("rbxassetid://(.+)"))))
end