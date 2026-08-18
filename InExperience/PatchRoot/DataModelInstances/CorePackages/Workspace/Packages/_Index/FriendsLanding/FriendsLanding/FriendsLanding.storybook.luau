local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local loggerModule = require(friendsLanding.Logger)
local dependenciesModule = require(friendsLanding.dependencies)
local appStyleProvider = dependenciesModule.UIBlox.App.Style.AppStyleProvider
local roact = dependenciesModule.Roact
local universalAppPolicy = dependenciesModule.UniversalAppPolicy
local llama = dependenciesModule.llama
local mockLocale = require(friendsLanding.Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local var3 = dependenciesModule.Lumberyak.Logger.new()
var3:addSink({
	maxLevel = var3.Levels.fromString("info"),
	log = function(_, p0, _) --[[ line: 25 ]]
		print(p0)
	end
})
loggerModule:setParent(var3)
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }

return {
	mapDefinition = function(p1) --[[ line: 52 ]]
		-- upvalues: llama (ref), t_1 (ref)
		return llama.Dictionary.join(p1, { controls = llama.Dictionary.join(t_1, p1.controls or {}) })
	end,
	roact = roact,
	mapStory = function(p2) --[[ line: 57 ]]
		-- upvalues: roact (ref), appStyleProvider (ref), t (ref), universalAppPolicy (ref), mockLocale (ref)
		return function(p3) --[[ line: 58 ]]
			-- upvalues: roact (copy), appStyleProvider (copy), t (copy), universalAppPolicy (copy), mockLocale (copy), p2 (ref)
			return roact.createElement(appStyleProvider, { style = if p3 then t[p3.theme] else t.Default }, {
				roact.createElement(universalAppPolicy.Provider, {
					policy = {
						function() --[[ line: 64 ]]
							-- upvalues: p3 (ref)
							return {
								getShowDisplayName = function() --[[ line: 66 ]]
									-- upvalues: p3 (copy)
									return p3.controls.getShowDisplayName
								end
							}
						end
					}
				}, { Child = mockLocale(p2, p3) })
			})
		end
	end
}