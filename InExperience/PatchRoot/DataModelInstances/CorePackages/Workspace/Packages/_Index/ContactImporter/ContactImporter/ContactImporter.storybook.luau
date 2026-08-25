local parent = script.Parent
local parent_1 = parent.Parent
local UIBloxModule = require(parent_1.UIBlox)
UIBloxModule.init(require(parent_1.Dev.RobloxAppUIBloxConfig))
local dependenciesModule = require(parent.dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama
local mockLocale = require(parent_1.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
roact.setGlobalConfig({ propValidation = true, elementTracing = true })
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }

return {
	name = "ContactImporter",
	storyRoot = parent,
	roact = roact,
	mapDefinition = function(p0)
		-- upvalues: llama (ref), t_1 (ref)
		return llama.Dictionary.join(p0, { controls = llama.Dictionary.join(t_1, p0.controls or {}) })
	end,
	mapStory = function(p1)
		-- upvalues: roact (ref), appStyleProvider (ref), t (ref), mockLocale (ref)
		return function(p2)
			-- upvalues: roact (copy), appStyleProvider (copy), t (copy), mockLocale (copy), p1 (ref)
			return roact.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, { Child = mockLocale(p1, p2) })
		end
	end
}