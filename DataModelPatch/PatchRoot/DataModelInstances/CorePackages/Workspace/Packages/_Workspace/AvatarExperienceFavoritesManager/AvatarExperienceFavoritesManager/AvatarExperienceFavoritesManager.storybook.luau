local AvatarExperienceFavoritesManager = script:FindFirstAncestor("AvatarExperienceFavoritesManager")
local Parent = AvatarExperienceFavoritesManager.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device
local config = { Light = Theme.Light, Dark = Theme.Dark }
local config1 = { Console = Device.Console, Desktop = Device.Desktop }
local StyleTable = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "AvatarExperienceFavoritesManager",
	storyRoot = AvatarExperienceFavoritesManager,
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: config (copy), ReactModule (copy), FoundationProvider (copy), StyleTable (copy), config1 (copy)
		return function(p2)
			-- upvalues: config (upval), ReactModule (upval), FoundationProvider (upval), StyleTable (upval), config1 (upval), p1 (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				}),
				FoundationProvider = ReactModule.createElement(FoundationProvider, {
					DONOTUSE_colorUpdate = true,
					styleTable = StyleTable,
					theme = config[p2.theme],
					device = config1[p2.platform]
				}, { Child = ReactModule.createElement(p1, p2) })
			})
		end
	end
}