local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local StyleWrapperModule = require(script.Parent.temp.styleWrapper)
local MockLocaleModule = require(script.Parent.temp.mockLocale)
local LoggerModule = require(SocialTab.Logger)
local NewResult = DependenciesModule.Lumberyak.Logger.new()
NewResult:addSink({
	maxLevel = NewResult.Levels.fromString("info"),
	log = function(_, p1, _)
		print(p1)
	end
})
LoggerModule:setParent(NewResult)

return {
	storyRoots = { SocialTab.UserCarousel.Components },
	roact = Roact,
	mapStory = function(p1)
		-- upvalues: MockLocaleModule (copy), StyleWrapperModule (copy)
		return function(p2)
			-- upvalues: MockLocaleModule (upval), StyleWrapperModule (upval), p1 (copy)
			return MockLocaleModule(StyleWrapperModule(p1, p2))
		end
	end
}