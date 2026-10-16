local PlayerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local Parent = PlayerContextualMenu.Parent
local DashModule = require(Parent.Dash)
local RoactModule = require(Parent.Dev.Roact)
local UIBloxModule = require(Parent.UIBlox)
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
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
	name = "PlayerContextualMenu",
	storyRoot = PlayerContextualMenu,
	roact = RoactModule,
	mapDefinition = function(p1) --[[ Line: 47 ]]
		-- upvalues: DashModule (copy), config1 (copy)
		return DashModule.join(p1, { controls = DashModule.join(config1, p1.controls) })
	end,
	mapStory = function(p1) --[[ Line: 51 ]]
		-- upvalues: RoactModule (copy), AppStyleProvider (copy), config (copy), MockLocaleFunction (copy)
		return function(p2) --[[ Line: 52 ]]
			-- upvalues: RoactModule (upval), AppStyleProvider (upval), config (upval), MockLocaleFunction (upval), p1 (copy)
			return RoactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = MockLocaleFunction(p1, p2) })
		end
	end
}