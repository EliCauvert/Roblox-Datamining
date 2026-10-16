local IconModule = require(script.Parent.Parent.Icon)

return {
	[Enum.Platform.PS3] = IconModule.Playstation,
	[Enum.Platform.PS4] = IconModule.Playstation,
	[Enum.Platform.PS5] = IconModule.Playstation,
	[Enum.Platform.XBoxOne] = IconModule.Xbox,
	[Enum.Platform.XBox360] = IconModule.Xbox,
	[Enum.Platform.Android] = IconModule.Android,
	[Enum.Platform.IOS] = IconModule.Apple,
	[Enum.Platform.OSX] = IconModule.Apple,
	[Enum.Platform.Windows] = IconModule.Microsoft,
	[Enum.Platform.MetaOS] = IconModule.Meta
}