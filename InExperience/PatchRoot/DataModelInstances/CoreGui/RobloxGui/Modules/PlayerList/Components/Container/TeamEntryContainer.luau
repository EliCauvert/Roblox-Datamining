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

return reactModule.memo(function(p0)
	-- upvalues: useLeaderboardStore (ref), signalsReactModule (ref), gameTranslatorModule (ref), coreGuiService (ref), fFlagPlayerListFixLeaderstatsStacking (ref), reactModule (ref), teamEntryViewModule (ref)
	local gameStatsList = useLeaderboardStore().getGameStatsList()
	local stats = p0.teamData.stats
	
	return reactModule.createElement(teamEntryViewModule, {
		teamName = signalsReactModule.useSignalBinding(function(p1)
			-- upvalues: gameTranslatorModule (copy), coreGuiService (copy), p0 (ref)
			return gameTranslatorModule:TranslateGameText(coreGuiService, p0.teamData.name(p1))
		end),
		teamColor = signalsReactModule.useSignalState(p0.teamData.color),
		gameStatsCount = if fFlagPlayerListFixLeaderstatsStacking then nil elseif fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(gameStatsList.getCount),
		teamStatsCount = if fFlagPlayerListFixLeaderstatsStacking then nil elseif fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(stats.getCount),
		gameStats = gameStatsList,
		teamStats = stats,
		size = p0.size,
		entrySizeX = p0.entrySizeX,
		layoutOrder = p0.layoutOrder,
		isSmallTouchDevice = p0.isSmallTouchDevice,
		isDirectionalPreferred = p0.isDirectionalPreferred
	})
end)