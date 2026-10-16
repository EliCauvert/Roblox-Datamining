local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local GameTranslatorModule = require(CoreGui:WaitForChild("RobloxGui").Modules.GameTranslator)
local UseLeaderboardStoreFunction = require(CorePackages.Workspace.Packages.PlayerList).Hooks.useLeaderboardStore
local TeamEntryViewModule = require(script.Parent.Parent.Parent.Components.PresentationCommon.TeamEntryView)
local FFlagPlayerListFixLeaderstatsStacking = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking

return ReactModule.memo(function(p1) --[[ Line: 44 | Named "TeamEntryContainer" ]]
	-- upvalues: UseLeaderboardStoreFunction (copy), SignalsReactModule (copy), GameTranslatorModule (copy), CoreGui (copy), FFlagPlayerListFixLeaderstatsStacking (copy), ReactModule (copy), TeamEntryViewModule (copy)
	local GameStatsList = UseLeaderboardStoreFunction().getGameStatsList()
	local Stats = p1.teamData.stats
	local UseSignalStateResult = if FFlagPlayerListFixLeaderstatsStacking then nil else SignalsReactModule.useSignalState(GameStatsList.getCount)
	local UseSignalStateResult1 = if FFlagPlayerListFixLeaderstatsStacking then nil else SignalsReactModule.useSignalState(Stats.getCount)
	
	return ReactModule.createElement(TeamEntryViewModule, {
		teamName = SignalsReactModule.useSignalBinding(function(p2) --[[ Line: 50 ]]
			-- upvalues: GameTranslatorModule (upval), CoreGui (upval), p1 (copy)
			return GameTranslatorModule:TranslateGameText(CoreGui, p1.teamData.name(p2))
		end),
		teamColor = SignalsReactModule.useSignalState(p1.teamData.color),
		gameStatsCount = if FFlagPlayerListFixLeaderstatsStacking then nil else UseSignalStateResult,
		teamStatsCount = if FFlagPlayerListFixLeaderstatsStacking then nil else UseSignalStateResult1,
		gameStats = GameStatsList,
		teamStats = Stats,
		size = p1.size,
		entrySizeX = p1.entrySizeX,
		layoutOrder = p1.layoutOrder,
		isSmallTouchDevice = p1.isSmallTouchDevice,
		isDirectionalPreferred = p1.isDirectionalPreferred
	})
end)