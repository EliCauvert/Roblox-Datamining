local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local loggerModule = require(friendsLanding.Logger)
local dependenciesModule = require(friendsLanding.dependencies)
local appStyleProvider = dependenciesModule.UIBlox.App.Style.AppStyleProvider
local roact = dependenciesModule.Roact
local universalAppPolicy = dependenciesModule.UniversalAppPolicy
local llama = dependenciesModule.llama
local parent = friendsLanding.Parent
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local var4 = dependenciesModule.Lumberyak.Logger.new()
var4:addSink({
	maxLevel = var4.Levels.fromString("info"),
	log = function(_, p0, _)
		print(p0)
	end
})
loggerModule:setParent(var4)
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { Light = colorMode.Light, Dark = colorMode.Dark }
local t_2 = { language = "en-us" }

return {
	mapDefinition = function(p1)
		-- upvalues: llama (ref), t_2 (ref)
		return llama.Dictionary.join(p1, { controls = llama.Dictionary.join(t_2, p1.controls or {}) })
	end,
	roact = roact,
	mapStory = function(p2)
		-- upvalues: t (ref), roact (ref), foundationProvider (ref), t_1 (ref), appStyleProvider (ref), universalAppPolicy (ref), mockLocale (ref)
		return function(p3)
			-- upvalues: t (copy), roact (copy), foundationProvider (copy), t_1 (copy), appStyleProvider (copy), universalAppPolicy (copy), mockLocale (copy), p2 (ref)
			local var8 = if p3 then t[p3.theme] else t.Default
			
			return roact.createElement(foundationProvider, { colorMode = t_1[var8.themeName] }, {
				AppStyle = roact.createElement(appStyleProvider, { style = var8 }, {
					roact.createElement(universalAppPolicy.Provider, {
						policy = {
							function()
								-- upvalues: p3 (ref)
								return {
									getShowDisplayName = function()
										-- upvalues: p3 (copy)
										return p3.controls.getShowDisplayName
									end
								}
							end
						}
					}, { Child = mockLocale(p2, p3) })
				})
			})
		end
	end
}