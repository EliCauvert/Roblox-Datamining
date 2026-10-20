local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local RoactModule = require(Parent.Dev.Roact)
local UIBloxModule = require(Parent.UIBlox)
local DashModule = require(Parent.Dash)
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local AnalyticsModule = require(ProfileQRCode.Analytics)
UIBloxModule.init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
RoactModule.setGlobalConfig({ elementTracing = true })
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

return {
	name = "ProfileQRCode",
	storyRoot = ProfileQRCode,
	roact = RoactModule,
	mapDefinition = function(p1)
		-- upvalues: DashModule (copy), config1 (copy)
		return DashModule.join(p1, { controls = DashModule.join(config1, p1.controls) })
	end,
	mapStory = function(p1)
		-- upvalues: RoactModule (copy), AnalyticsModule (copy), AppStyleProvider (copy), config (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: RoactModule (upval), AnalyticsModule (upval), AppStyleProvider (upval), config (upval), MockLocaleFunction (upval), p1 (copy)
			return RoactModule.createElement(AnalyticsModule.Context.Provider, { value = { fireEvent = function() end } }, {
				Element = RoactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = MockLocaleFunction(p1, p2) })
			})
		end
	end
}