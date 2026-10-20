local ToastLite = script:FindFirstAncestor("ToastLite")
local Parent = ToastLite.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
UIBloxModule.init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local config = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "ToastLite",
	storyRoot = ToastLite,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), AppStyleProvider (copy), config (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), AppStyleProvider (upval), config (upval), p1 (copy)
			return ReactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = ReactModule.createElement(p1, p2) })
		end
	end
}