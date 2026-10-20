local ShareLinkInvalidModal = script:FindFirstAncestor("ShareLinkInvalidModal")
local Parent = ShareLinkInvalidModal.Parent
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local DependenciesModule = require(ShareLinkInvalidModal.dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
Roact.setGlobalConfig({ propValidation = true, elementTracing = true })
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

return {
	name = "ShareLinkInvalidModal",
	storyRoot = script,
	roact = Roact,
	mapDefinition = function(p1)
		-- upvalues: Llama (copy), config1 (copy)
		return Llama.Dictionary.join(p1, {
			controls = Llama.Dictionary.join(config1, p1.controls or {})
		})
	end,
	mapStory = function(p1)
		-- upvalues: Roact (copy), AppStyleProvider (copy), config (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: Roact (upval), AppStyleProvider (upval), config (upval), MockLocaleFunction (upval), p1 (copy)
			return Roact.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = MockLocaleFunction(p1, p2) })
		end
	end
}