local SetAlias = script:FindFirstAncestor("SetAlias")
local Parent = SetAlias.Parent
local DependenciesModule = require(SetAlias.dependencies)
local Roact = DependenciesModule.Roact
local Dash = DependenciesModule.Dash
local UIBlox = DependenciesModule.UIBlox
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
UIBlox.init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local AppStyleProvider = UIBlox.App.Style.AppStyleProvider
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

return {
	name = "SetAlias",
	storyRoot = SetAlias,
	roact = Roact,
	mapDefinition = function(p1) --[[ Line: 40 ]]
		-- upvalues: Dash (copy), config1 (copy)
		return Dash.join(p1, { controls = Dash.join(config1, p1.controls or {}) })
	end,
	mapStory = function(p1) --[[ Line: 44 ]]
		-- upvalues: Roact (copy), AppStyleProvider (copy), config (copy), MockLocaleFunction (copy)
		return function(p2) --[[ Line: 45 ]]
			-- upvalues: Roact (upval), AppStyleProvider (upval), config (upval), MockLocaleFunction (upval), p1 (copy)
			return Roact.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = MockLocaleFunction(p1, p2) })
		end
	end
}