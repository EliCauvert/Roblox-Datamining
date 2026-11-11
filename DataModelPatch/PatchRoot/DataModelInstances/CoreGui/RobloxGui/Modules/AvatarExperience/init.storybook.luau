local AvatarExperience = script:FindFirstAncestor("AvatarExperience")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device
local config = { Light = Theme.Light, Dark = Theme.Dark }
local config1 = { Console = Device.Console, Desktop = Device.Desktop }

return {
	name = AvatarExperience.Name,
	roact = ReactModule,
	reactRoblox = require(CorePackages.Packages.ReactRoblox),
	storyRoots = { AvatarExperience },
	mapStory = function(p1)
		-- upvalues: config (copy), ReactModule (copy), FoundationProvider (copy), config1 (copy)
		return function(p2)
			-- upvalues: config (upval), ReactModule (upval), FoundationProvider (upval), config1 (upval), p1 (copy)
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
				FoundationContext = ReactModule.createElement(FoundationProvider, {
					theme = config[p2.theme],
					device = config1[p2.platform],
					preferences = p2.settings
				}, { Child = ReactModule.createElement(p1, p2) })
			})
		end
	end
}