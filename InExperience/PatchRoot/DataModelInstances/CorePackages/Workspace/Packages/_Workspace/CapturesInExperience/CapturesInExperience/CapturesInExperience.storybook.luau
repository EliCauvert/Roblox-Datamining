local Parent = script.Parent
local Parent1 = Parent.Parent
local DashModule = require(Parent1.Dash)
local RoactModule = require(Parent1.Roact)
local UIBloxModule = require(Parent1.UIBlox)
local CapturesContextModule = require(Parent.Context.CapturesContext)
local MockLocaleFunction = require(Parent1.Dev.SocialTestHelpers).StoryHelpers.mockLocale
UIBloxModule.init((require(Parent1.Dev.RobloxAppUIBloxConfig)))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
RoactModule.setGlobalConfig({ elementTracing = true })
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

return {
	name = "CapturesInExperience",
	storyRoot = Parent,
	roact = RoactModule,
	mapDefinition = function(p1) --[[ Line: 45 ]]
		-- upvalues: DashModule (copy), config1 (copy)
		return DashModule.join(p1, { controls = DashModule.join(config1, p1.controls) })
	end,
	mapStory = function(p1) --[[ Line: 49 ]]
		-- upvalues: RoactModule (copy), CapturesContextModule (copy), DashModule (copy), AppStyleProvider (copy), config (copy), MockLocaleFunction (copy)
		return function(p2) --[[ Line: 50 ]]
			-- upvalues: RoactModule (upval), CapturesContextModule (upval), DashModule (upval), AppStyleProvider (upval), config (upval), MockLocaleFunction (upval), p1 (copy)
			return RoactModule.createElement(CapturesContextModule.Provider, { value = { fireAnalyticsEvent = DashModule.noop } }, {
				Element = RoactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = MockLocaleFunction(p1, p2) })
			})
		end
	end
}