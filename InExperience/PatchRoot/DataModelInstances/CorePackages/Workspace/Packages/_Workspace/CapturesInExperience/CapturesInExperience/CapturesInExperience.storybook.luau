local parent = script.Parent
local parent_1 = parent.Parent
local dashModule = require(parent_1.Dash)
local roactModule = require(parent_1.Roact)
local socialTestHelpersModule = require(parent_1.Dev.SocialTestHelpers)
local UIBloxModule = require(parent_1.UIBlox)
local robloxAppUIBloxConfigModule = require(parent_1.Dev.RobloxAppUIBloxConfig)
local capturesContextModule = require(parent.Context.CapturesContext)
local mockLocale = socialTestHelpersModule.StoryHelpers.mockLocale
UIBloxModule.init(robloxAppUIBloxConfigModule)
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
roactModule.setGlobalConfig({ elementTracing = true })
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }

return {
	name = "CapturesInExperience",
	storyRoot = parent,
	roact = roactModule,
	mapDefinition = function(p1)
		-- upvalues: dashModule (ref), t_1 (ref)
		return dashModule.join(p1, { controls = dashModule.join(t_1, p1.controls) })
	end,
	mapStory = function(p1)
		-- upvalues: roactModule (ref), capturesContextModule (ref), dashModule (ref), appStyleProvider (ref), t (ref), mockLocale (ref)
		return function(p2)
			-- upvalues: roactModule (copy), capturesContextModule (copy), dashModule (copy), appStyleProvider (copy), t (copy), mockLocale (copy), p1 (ref)
			return roactModule.createElement(capturesContextModule.Provider, { value = { fireAnalyticsEvent = dashModule.noop } }, {
				Element = roactModule.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, { Child = mockLocale(p1, p2) })
			})
		end
	end
}