return function(value) --[[ line: 1 | named "getAssetIdForAudioSource" ]]
	return tonumber((if value:IsA("Sound") then value.SoundId elseif value:IsA("AudioPlayer") then value.Asset else nil):match("rbxassetid://(.+)"))
end