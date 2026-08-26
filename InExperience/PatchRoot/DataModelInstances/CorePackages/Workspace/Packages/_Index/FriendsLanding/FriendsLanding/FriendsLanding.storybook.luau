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
local var1 = dependenciesModule.Lumberyak.Logger.new()
var1:addSink({
	maxLevel = var1.Levels.fromString("info"),
	log = function(_, p1, _)
		print(p1)
	end
})
loggerModule:setParent(var1)
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
	mapStory = function(p1)
		-- upvalues: t (ref), roact (ref), foundationProvider (ref), t_1 (ref), appStyleProvider (ref), universalAppPolicy (ref), mockLocale (ref)
		return function(p2)
			-- upvalues: t (copy), roact (copy), foundationProvider (copy), t_1 (copy), appStyleProvider (copy), universalAppPolicy (copy), mockLocale (copy), p1 (ref)
			local var2 = if p2 then t[p2.theme] else t.Default
			
			return roact.createElement(foundationProvider, { colorMode = t_1[var2.themeName] }, {
				AppStyle = roact.createElement(appStyleProvider, { style = var2 }, {
					roact.createElement(universalAppPolicy.Provider, {
						policy = {
							function()
								-- upvalues: p2 (ref)
								return {
									getShowDisplayName = function()
										-- upvalues: p2 (copy)
										return p2.controls.getShowDisplayName
									end
								}
							end
						}
					}, { Child = mockLocale(p1, p2) })
				})
			})
		end
	end
}