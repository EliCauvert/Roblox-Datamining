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
	mapStory = function(p0) --[[ line: 48 ]]
		-- upvalues: t (ref), reactModule (ref), appStyleProvider (ref), t_1 (ref)
		return function(p1) --[[ line: 49 ]]
			-- upvalues: t (copy), reactModule (copy), appStyleProvider (copy), t_1 (copy), p0 (ref)
			local theme = t[p1.theme]
			
			return reactModule.createElement(appStyleProvider, {
				style = {
					themeName = theme.themeName,
					fontName = theme.fontName,
					deviceType = t_1[p1.platform],
					settings = p1.settings
				}
			}, { Child = reactModule.createElement(p0, p1) })
		end
	end
}