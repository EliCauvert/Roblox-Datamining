local platform = game:GetService("UserInputService"):GetPlatform()

return function()
	-- upvalues: platform (ref)
	return if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
end