local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local parent = script.Parent.Parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local useLeaderboardStore = playerListModule.Hooks.useLeaderboardStore
local teamEntryViewModule = require(parent.Components.PresentationCommon.TeamEntryView)
local fFlagPlayerListFixLeaderstatsStacking = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking

return reactModule.memo(function(p1)
	-- upvalues: useLeaderboardStore (ref), signalsReactModule (ref), gameTranslatorModule (ref), coreGuiService (ref), fFlagPlayerListFixLeaderstatsStacking (ref), reactModule (ref), teamEntryViewModule (ref)
	local gameStatsList = useLeaderboardStore().getGameStatsList()
	local stats = p1.teamData.stats
	
	return reactModule.createElement(teamEntryViewModule, {
		teamName = signalsReactModule.useSignalBinding(function(p2)
			-- upvalues: gameTranslatorModule (copy), coreGuiService (copy), p1 (ref)
			return gameTranslatorModule:TranslateGameText(coreGuiService, p1.teamData.name(p2))
		end),
		teamColor = signalsReactModule.useSignalState(p1.teamData.color),
		gameStatsCount = if fFlagPlayerListFixLeaderstatsStacking then nil elseif fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(gameStatsList.getCount),
		teamStatsCount = if fFlagPlayerListFixLeaderstatsStacking then nil elseif fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(stats.getCount),
		gameStats = gameStatsList,
		teamStats = stats,
		size = p1.size,
		entrySizeX = p1.entrySizeX,
		layoutOrder = p1.layoutOrder,
		isSmallTouchDevice = p1.isSmallTouchDevice,
		isDirectionalPreferred = p1.isDirectionalPreferred
	})
end)