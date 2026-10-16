local AppHeaderBar = script:FindFirstAncestor("AppHeaderBar")
local Parent = AppHeaderBar.Parent
local RoactCompatModule = require(Parent.Dev.RoactCompat)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local ColorMode = require(Parent.Foundation).Enums.ColorMode
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Constants = UIBloxModule.App.Style.Constants
local Light = ColorMode.Light
local Dark = ColorMode.Dark
local Gotham = Constants.FontName.Gotham
RoactCompatModule.setGlobalConfig({ elementTracing = true })
local config = {
	Default = { themeName = Light, fontName = Gotham },
	Light = { themeName = Light, fontName = Gotham },
	Dark = { themeName = Dark, fontName = Gotham }
}
local config1 = {
	Console = Constants.DeviceType.Console,
	Desktop = Constants.DeviceType.Desktop
}

return {
	name = "AppHeaderBar",
	storyRoots = { AppHeaderBar },
	roact = RoactCompatModule,
	mapStory = function(p1) --[[ Line: 48 ]]
		-- upvalues: config (copy), ReactModule (copy), AppStyleProvider (copy), config1 (copy)
		return function(p2) --[[ Line: 49 ]]
			-- upvalues: config (upval), ReactModule (upval), AppStyleProvider (upval), config1 (upval), p1 (copy)
			local Entry = config[p2.theme]
			
			return ReactModule.createElement(AppStyleProvider, {
				style = {
					themeName = Entry.themeName,
					fontName = Entry.fontName,
					deviceType = config1[p2.platform],
					settings = p2.settings
				}
			}, { Child = ReactModule.createElement(p1, p2) })
		end
	end
}