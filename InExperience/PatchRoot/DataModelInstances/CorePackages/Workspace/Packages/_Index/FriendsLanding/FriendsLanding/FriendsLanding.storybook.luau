local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local LoggerModule = require(FriendsLanding.Logger)
local DependenciesModule = require(FriendsLanding.dependencies)
local AppStyleProvider = DependenciesModule.UIBlox.App.Style.AppStyleProvider
local Roact = DependenciesModule.Roact
local UniversalAppPolicy = DependenciesModule.UniversalAppPolicy
local Llama = DependenciesModule.llama
local Parent = FriendsLanding.Parent
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
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
local config1 = { Light = ColorMode.Light, Dark = ColorMode.Dark }
local config2 = { language = "en-us" }

return {
	mapDefinition = function(p1)
		-- upvalues: Llama (copy), config2 (copy)
		return Llama.Dictionary.join(p1, {
			controls = Llama.Dictionary.join(config2, p1.controls or {})
		})
	end,
	roact = Roact,
	mapStory = function(p1)
		-- upvalues: config (copy), Roact (copy), FoundationProvider (copy), config1 (copy), AppStyleProvider (copy), UniversalAppPolicy (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: config (upval), Roact (upval), FoundationProvider (upval), config1 (upval), AppStyleProvider (upval), UniversalAppPolicy (upval), MockLocaleFunction (upval), p1 (copy)
			local Entry = p2 and config[p2.theme] or config.Default
			
			return Roact.createElement(FoundationProvider, { colorMode = config1[Entry.themeName] }, {
				AppStyle = Roact.createElement(AppStyleProvider, { style = Entry }, {
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
			})
		end
	end
}