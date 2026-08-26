local appHeaderBar = script:FindFirstAncestor("AppHeaderBar")
local parent = appHeaderBar.Parent
local roactCompatModule = require(parent.Dev.RoactCompat)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local colorMode = require(parent.Foundation).Enums.ColorMode
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local constants = UIBloxModule.App.Style.Constants
local light = colorMode.Light
local dark = colorMode.Dark
local gotham = constants.FontName.Gotham
roactCompatModule.setGlobalConfig({ elementTracing = true })
local t = {
	Default = { themeName = light, fontName = gotham },
	Light = { themeName = light, fontName = gotham },
	Dark = { themeName = dark, fontName = gotham }
}
local t_1 = {
	Console = constants.DeviceType.Console,
	Desktop = constants.DeviceType.Desktop
}

return {
	name = "AppHeaderBar",
	storyRoots = { appHeaderBar },
	roact = roactCompatModule,
	mapStory = function(p1)
		-- upvalues: t (ref), reactModule (ref), appStyleProvider (ref), t_1 (ref)
		return function(p2)
			-- upvalues: t (copy), reactModule (copy), appStyleProvider (copy), t_1 (copy), p1 (ref)
			local theme = t[p2.theme]
			
			return reactModule.createElement(appStyleProvider, {
				style = {
					themeName = theme.themeName,
					fontName = theme.fontName,
					deviceType = t_1[p2.platform],
					settings = p2.settings
				}
			}, { Child = reactModule.createElement(p1, p2) })
		end
	end
}