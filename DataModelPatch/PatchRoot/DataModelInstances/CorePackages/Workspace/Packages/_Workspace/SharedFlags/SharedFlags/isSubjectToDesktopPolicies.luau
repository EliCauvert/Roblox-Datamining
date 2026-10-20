local Platform = game:GetService("UserInputService"):GetPlatform()

return function(): boolean
	-- upvalues: Platform (copy)
	return Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP)
end