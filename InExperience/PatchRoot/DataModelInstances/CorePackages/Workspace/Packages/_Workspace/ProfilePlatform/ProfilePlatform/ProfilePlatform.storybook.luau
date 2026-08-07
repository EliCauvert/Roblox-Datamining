local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local roactModule = require(parent.Dev.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local UIBloxModule = require(parent.UIBlox)
local cryoModule = require(parent.Cryo)
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
roactModule.setGlobalConfig({ elementTracing = true })
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }

local var8 = function(p0) --[[ line: 41 ]]
	-- upvalues: roduxModule (ref), cryoModule (ref)
	return roduxModule.Store.new(function() --[[ line: 42 ]]
		-- upvalues: cryoModule (copy), p0 (ref)
		return cryoModule.Dictionary.join(p0, { ScreenSize = Vector2.new(600, 600) })
	end, {}, { roduxModule.thunkMiddleware })
end

return {
	name = "ProfilePlatform",
	storyRoot = profilePlatform,
	roact = roactModule,
	roactRodux = roactRoduxModule,
	mapDefinition = function(p1) --[[ line: 54 ]]
		-- upvalues: cryoModule (ref), t_1 (ref)
		return cryoModule.Dictionary.join(p1, {
			controls = cryoModule.Dictionary.join(t_1, p1.controls or {})
		})
	end,
	mapStory = function(p2) --[[ line: 58 ]]
		-- upvalues: roactModule (ref), appStyleProvider (ref), t (ref), roactRoduxModule (ref), var8 (ref), mockLocale (ref)
		return function(p3) --[[ line: 59 ]]
			-- upvalues: roactModule (copy), appStyleProvider (copy), t (copy), roactRoduxModule (copy), var8 (copy), mockLocale (copy), p2 (ref)
			return roactModule.createElement(appStyleProvider, { style = if p3 then t[p3.theme] else t.Default }, {
				storeProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = var8(p3.definition.state or {}) }, { Child = mockLocale(p2, p3) })
			})
		end
	end
}