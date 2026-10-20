local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local Parent = FriendsMenu.Parent
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Dev.Roact)
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

return {
	name = "FriendsMenu",
	storyRoot = FriendsMenu,
	roact = RoactModule,
	mapDefinition = function(p1)
		-- upvalues: CryoModule (copy), config1 (copy)
		return CryoModule.Dictionary.join(p1, {
			controls = CryoModule.Dictionary.join(config1, p1.controls or {})
		})
	end,
	mapStory = function(p1)
		-- upvalues: RoactModule (copy), AppStyleProvider (copy), config (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: RoactModule (upval), AppStyleProvider (upval), config (upval), MockLocaleFunction (upval), p1 (copy)
			return RoactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = MockLocaleFunction(p1, p2) })
		end
	end
}