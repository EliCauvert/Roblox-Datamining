local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local UIBloxModule = require(parent.UIBlox)
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Dev.Roact)
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }

return {
	name = "FriendsMenu",
	storyRoot = friendsMenu,
	roact = roactModule,
	mapDefinition = function(p0)
		-- upvalues: cryoModule (ref), t_1 (ref)
		return cryoModule.Dictionary.join(p0, {
			controls = cryoModule.Dictionary.join(t_1, p0.controls or {})
		})
	end,
	mapStory = function(p1)
		-- upvalues: roactModule (ref), appStyleProvider (ref), t (ref), mockLocale (ref)
		return function(p2)
			-- upvalues: roactModule (copy), appStyleProvider (copy), t (copy), mockLocale (copy), p1 (ref)
			return roactModule.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, { Child = mockLocale(p1, p2) })
		end
	end
}