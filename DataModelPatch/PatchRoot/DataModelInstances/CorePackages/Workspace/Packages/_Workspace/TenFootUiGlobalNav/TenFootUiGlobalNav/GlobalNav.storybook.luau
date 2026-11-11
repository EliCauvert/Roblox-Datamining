local TenFootUiGlobalNav = script:FindFirstAncestor("TenFootUiGlobalNav")
local Parent = TenFootUiGlobalNav.Parent
local RoactCompatModule = require(Parent.Dev.RoactCompat)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
RoactCompatModule.setGlobalConfig({ elementTracing = true })
local Dark = { themeName = "Dark", fontName = "Gotham" }
local config = {
	Default = Dark,
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = Dark
}

return {
	name = "TenFootUIGlobalNav",
	storyRoots = { TenFootUiGlobalNav },
	roact = RoactCompatModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), AppStyleProvider (copy), config (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), AppStyleProvider (upval), config (upval), p1 (copy)
			return ReactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = ReactModule.createElement(p1, p2) })
		end
	end
}