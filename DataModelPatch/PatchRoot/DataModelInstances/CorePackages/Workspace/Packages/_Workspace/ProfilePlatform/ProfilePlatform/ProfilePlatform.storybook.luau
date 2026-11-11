local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local RoactModule = require(Parent.Dev.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local UIBloxModule = require(Parent.UIBlox)
local CryoModule = require(Parent.Cryo)
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

local function v10(State)
	-- upvalues: RoduxModule (copy), CryoModule (copy)
	return RoduxModule.Store.new(function()
		-- upvalues: CryoModule (upval), State (copy)
		return CryoModule.Dictionary.join(State, { ScreenSize = Vector2.new(600, 600) })
	end, {}, { RoduxModule.thunkMiddleware })
end

return {
	name = "ProfilePlatform",
	storyRoot = ProfilePlatform,
	roact = RoactModule,
	roactRodux = RoactRoduxModule,
	mapDefinition = function(p1)
		-- upvalues: CryoModule (copy), config1 (copy)
		return CryoModule.Dictionary.join(p1, {
			controls = CryoModule.Dictionary.join(config1, p1.controls or {})
		})
	end,
	mapStory = function(p1)
		-- upvalues: RoactModule (copy), AppStyleProvider (copy), config (copy), RoactRoduxModule (copy), v10 (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: RoactModule (upval), AppStyleProvider (upval), config (upval), RoactRoduxModule (upval), v10 (upval), MockLocaleFunction (upval), p1 (copy)
			return RoactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, {
				storeProvider = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = v10(p2.definition.state or {}) }, { Child = MockLocaleFunction(p1, p2) })
			})
		end
	end
}