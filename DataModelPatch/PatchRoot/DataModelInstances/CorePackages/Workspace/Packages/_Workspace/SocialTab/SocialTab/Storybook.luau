local SocialTab = script:FindFirstAncestor("SocialTab")
local LoggerModule = require(SocialTab.Logger)
local StyleSwapperModule = require(script.temp.StyleSwapper)
local NewResult = require(SocialTab.devDependencies).Lumberyak.Logger.new()
NewResult:addSink({
	maxLevel = NewResult.Levels.fromString("info"),
	log = function(_, p1, _)
		if not _G.__TESTEZ_RUNNING_TEST__ then
			print(p1)
		end
	end
})
LoggerModule:setParent(NewResult)

return {
	name = "SocialTab",
	storyRoot = SocialTab.Components,
	middleware = StyleSwapperModule()
}