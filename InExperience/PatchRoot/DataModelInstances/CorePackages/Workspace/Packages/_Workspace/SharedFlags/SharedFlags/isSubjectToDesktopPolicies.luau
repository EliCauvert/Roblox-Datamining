local Platform = game:GetService("UserInputService"):GetPlatform()

return function(): boolean --[[ Line: 4 ]]
	-- upvalues: Platform (copy)
	return Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP)
end