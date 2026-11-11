local MessageToast = script:FindFirstAncestor("MessageToast")
local Parent = MessageToast.Parent
local DependenciesModule = require(MessageToast.dependencies)
local UIBlox = DependenciesModule.UIBlox
UIBlox.init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local Roact = DependenciesModule.Roact
local Dash = DependenciesModule.Dash
local AppStyleProvider = UIBlox.App.Style.AppStyleProvider
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
Roact.setGlobalConfig({ propValidation = true, elementTracing = true })
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

return {
	name = "MessageToast",
	storyRoot = script,
	roact = Roact,
	mapDefinition = function(p1)
		-- upvalues: Dash (copy), config1 (copy)
		return Dash.join(p1, { controls = Dash.join(config1, p1.controls or {}) })
	end,
	mapStory = function(p1)
		-- upvalues: Roact (copy), AppStyleProvider (copy), config (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: Roact (upval), AppStyleProvider (upval), config (upval), MockLocaleFunction (upval), p1 (copy)
			return Roact.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = MockLocaleFunction(p1, p2) })
		end
	end
}