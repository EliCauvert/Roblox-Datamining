local Leaderboards = script:FindFirstAncestor("Leaderboards")
local Parent = Leaderboards.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local FetchExperienceLeaderboardSeeAllPageIfNeededModule = require(Leaderboards.ExperienceLeaderboardSeeAllPage.fetchExperienceLeaderboardSeeAllPageIfNeeded)

return function(p1, UniverseId, InitialTab)
	-- upvalues: SduiLoadTimer (copy), AppPage (copy), FetchExperienceLeaderboardSeeAllPageIfNeededModule (copy)
	local LoadTimer = SduiLoadTimer.createLoadTimer(AppPage.ExperienceLeaderboardSeeAll)
	LoadTimer.start("navigate")
	p1.navigate(AppPage.ExperienceLeaderboardSeeAll, {
		universeId = UniverseId,
		initialTab = InitialTab,
		pageTimer = LoadTimer,
		url = FetchExperienceLeaderboardSeeAllPageIfNeededModule(UniverseId, InitialTab, LoadTimer)
	})
end