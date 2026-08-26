local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local useLeaderboardStore = require(corePackagesService.Workspace.Packages.PlayerList).Hooks.useLeaderboardStore
local titleBarViewModule = require(parent.Components.PresentationCommon.TitleBarView)
local fFlagPlayerListFixLeaderstatsStacking = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking

return reactModule.memo(function(p1)
	-- upvalues: useLeaderboardStore (ref), fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), reactModule (ref), titleBarViewModule (ref)
	local gameStatsList = useLeaderboardStore().getGameStatsList()
	
	return reactModule.createElement(titleBarViewModule, {
		gameStats = gameStatsList,
		gameStatsCount = if fFlagPlayerListFixLeaderstatsStacking then nil elseif fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(gameStatsList.getCount),
		size = p1.size,
		entrySizeX = p1.entrySizeX,
		layoutOrder = p1.layoutOrder,
		contentsVisible = p1.contentsVisible,
		isSmallTouchDevice = p1.isSmallTouchDevice,
		showDivider = p1.showDivider,
		showBackground = p1.showBackground,
		backgroundTransparency = p1.backgroundTransparency,
		useCustomTextColor = p1.useCustomTextColor,
		customTextColor = p1.customTextColor,
		headerPaddingLeft = p1.headerPaddingLeft
	})
end)