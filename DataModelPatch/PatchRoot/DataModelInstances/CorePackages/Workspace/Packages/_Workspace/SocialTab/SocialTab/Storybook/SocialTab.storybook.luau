local SocialTab = script:FindFirstAncestor("SocialTab")
local Parent = SocialTab.Parent
require(Parent.UIBlox).init(require(Parent.Dev.RobloxAppUIBloxConfig))
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local MockLocaleModule = require(script.Parent.temp.mockLocale)
local StyleWrapperModule = require(script.Parent.temp.styleWrapper)
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
	storyRoots = { SocialTab.Components },
	roact = Roact,
	mapStory = function(p1)
		-- upvalues: MockLocaleModule (copy), StyleWrapperModule (copy)
		return function(p2)
			-- upvalues: MockLocaleModule (upval), StyleWrapperModule (upval), p1 (copy)
			return MockLocaleModule(StyleWrapperModule(p1, p2))
		end
	end
}