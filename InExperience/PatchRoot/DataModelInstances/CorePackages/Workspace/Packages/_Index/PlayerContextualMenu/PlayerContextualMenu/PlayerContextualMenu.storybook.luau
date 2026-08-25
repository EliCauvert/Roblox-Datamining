local playerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local parent = playerContextualMenu.Parent
local dashModule = require(parent.Dash)
local roactModule = require(parent.Dev.Roact)
local UIBloxModule = require(parent.UIBlox)
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
roactModule.setGlobalConfig({ elementTracing = true })
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }

return {
	name = "PlayerContextualMenu",
	storyRoot = playerContextualMenu,
	roact = roactModule,
	mapDefinition = function(p0)
		-- upvalues: dashModule (ref), t_1 (ref)
		return dashModule.join(p0, { controls = dashModule.join(t_1, p0.controls) })
	end,
	mapStory = function(p1)
		-- upvalues: roactModule (ref), appStyleProvider (ref), t (ref), mockLocale (ref)
		return function(p2)
			-- upvalues: roactModule (copy), appStyleProvider (copy), t (copy), mockLocale (copy), p1 (ref)
			return roactModule.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, { Child = mockLocale(p1, p2) })
		end
	end
}