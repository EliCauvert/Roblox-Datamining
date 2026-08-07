local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local useLeaderboardStore = require(corePackagesService.Workspace.Packages.PlayerList).Hooks.useLeaderboardStore
local titleBarViewModule = require(parent.Components.PresentationCommon.TitleBarView)
local fFlagPlayerListFixLeaderstatsStacking = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking

return reactModule.memo(function(p0) --[[ line: 41 | named "TitleBarContainer" ]]
	-- upvalues: useLeaderboardStore (ref), fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), reactModule (ref), titleBarViewModule (ref)
	local gameStatsList = useLeaderboardStore().getGameStatsList()
	
	return reactModule.createElement(titleBarViewModule, {
		gameStats = gameStatsList,
		gameStatsCount = if fFlagPlayerListFixLeaderstatsStacking then nil elseif fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(gameStatsList.getCount),
		size = p0.size,
		entrySizeX = p0.entrySizeX,
		layoutOrder = p0.layoutOrder,
		contentsVisible = p0.contentsVisible,
		isSmallTouchDevice = p0.isSmallTouchDevice,
		showDivider = p0.showDivider,
		showBackground = p0.showBackground,
		backgroundTransparency = p0.backgroundTransparency,
		useCustomTextColor = p0.useCustomTextColor,
		customTextColor = p0.customTextColor,
		headerPaddingLeft = p0.headerPaddingLeft
	})
end)