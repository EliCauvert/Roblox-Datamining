local Parent = script.Parent
local Parent1 = Parent.Parent
local UIBloxModule = require(Parent1.UIBlox)
UIBloxModule.init(require(Parent1.Dev.RobloxAppUIBloxConfig))
local DependenciesModule = require(Parent.dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local MockLocaleFunction = require(Parent1.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
Roact.setGlobalConfig({ propValidation = true, elementTracing = true })
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

return {
	name = "ContactImporter",
	storyRoot = Parent,
	roact = Roact,
	mapDefinition = function(p1) --[[ Line: 44 ]]
		-- upvalues: Llama (copy), config1 (copy)
		return Llama.Dictionary.join(p1, {
			controls = Llama.Dictionary.join(config1, p1.controls or {})
		})
	end,
	mapStory = function(p1) --[[ Line: 48 ]]
		-- upvalues: Roact (copy), AppStyleProvider (copy), config (copy), MockLocaleFunction (copy)
		return function(p2) --[[ Line: 49 ]]
			-- upvalues: Roact (upval), AppStyleProvider (upval), config (upval), MockLocaleFunction (upval), p1 (copy)
			return Roact.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = MockLocaleFunction(p1, p2) })
		end
	end
}