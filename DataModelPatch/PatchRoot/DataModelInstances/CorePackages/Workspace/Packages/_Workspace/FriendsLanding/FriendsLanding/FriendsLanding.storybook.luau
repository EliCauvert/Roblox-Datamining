local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local LoggerModule = require(FriendsLanding.Logger)
local DependenciesModule = require(FriendsLanding.dependencies)
local AppStyleProvider = DependenciesModule.UIBlox.App.Style.AppStyleProvider
local Roact = DependenciesModule.Roact
local UniversalAppPolicy = DependenciesModule.UniversalAppPolicy
local Llama = DependenciesModule.llama
local MockLocaleFunction = require(FriendsLanding.Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local NewResult = DependenciesModule.Lumberyak.Logger.new()
NewResult:addSink({
	maxLevel = NewResult.Levels.fromString("info"),
	log = function(_, p1, _)
		print(p1)
	end
})
LoggerModule:setParent(NewResult)
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

return {
	mapDefinition = function(p1)
		-- upvalues: Llama (copy), config1 (copy)
		return Llama.Dictionary.join(p1, {
			controls = Llama.Dictionary.join(config1, p1.controls or {})
		})
	end,
	roact = Roact,
	mapStory = function(p1)
		-- upvalues: Roact (copy), AppStyleProvider (copy), config (copy), UniversalAppPolicy (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: Roact (upval), AppStyleProvider (upval), config (upval), UniversalAppPolicy (upval), MockLocaleFunction (upval), p1 (copy)
			return Roact.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, {
				Roact.createElement(UniversalAppPolicy.Provider, {
					policy = {
						function()
							-- upvalues: p2 (copy)
							return {
								getShowDisplayName = function()
									-- upvalues: p2 (upval)
									return p2.controls.getShowDisplayName
								end
							}
						end
					}
				}, { Child = MockLocaleFunction(p1, p2) })
			})
		end
	end
}