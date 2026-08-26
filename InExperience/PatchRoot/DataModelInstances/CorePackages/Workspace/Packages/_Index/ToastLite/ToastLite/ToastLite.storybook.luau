local toastLite = script:FindFirstAncestor("ToastLite")
local parent = toastLite.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local t = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "ToastLite",
	storyRoot = toastLite,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), appStyleProvider (ref), t (ref)
		return function(p2)
			-- upvalues: reactModule (copy), appStyleProvider (copy), t (copy), p1 (ref)
			return reactModule.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, { Child = reactModule.createElement(p1, p2) })
		end
	end
}