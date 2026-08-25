return function(value)
	return tonumber((if value:IsA("Sound") then value.SoundId elseif value:IsA("AudioPlayer") then value.Asset else nil):match("rbxassetid://(.+)"))
end