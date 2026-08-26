local setAlias = script:FindFirstAncestor("SetAlias")
local parent = setAlias.Parent
local dependenciesModule = require(setAlias.dependencies)
local roact = dependenciesModule.Roact
local dash = dependenciesModule.Dash
local UIBlox = dependenciesModule.UIBlox
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
UIBlox.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appStyleProvider = UIBlox.App.Style.AppStyleProvider
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }

return {
	name = "SetAlias",
	storyRoot = setAlias,
	roact = roact,
	mapDefinition = function(p1)
		-- upvalues: dash (ref), t_1 (ref)
		return dash.join(p1, { controls = dash.join(t_1, p1.controls or {}) })
	end,
	mapStory = function(p1)
		-- upvalues: roact (ref), appStyleProvider (ref), t (ref), mockLocale (ref)
		return function(p2)
			-- upvalues: roact (copy), appStyleProvider (copy), t (copy), mockLocale (copy), p1 (ref)
			return roact.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, { Child = mockLocale(p1, p2) })
		end
	end
}