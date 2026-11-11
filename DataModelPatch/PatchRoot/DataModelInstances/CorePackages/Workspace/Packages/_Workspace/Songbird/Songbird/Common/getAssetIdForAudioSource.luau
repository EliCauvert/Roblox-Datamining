return function(Sound: Sound): number
	return (tonumber(((if Sound:IsA("Sound") then Sound.SoundId elseif Sound:IsA("AudioPlayer") then Sound.Asset else nil):match("rbxassetid://(.+)"))))
end