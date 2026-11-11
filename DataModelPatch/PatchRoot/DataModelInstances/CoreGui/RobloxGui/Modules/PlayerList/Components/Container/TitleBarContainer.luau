local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local UseLeaderboardStoreFunction = require(CorePackages.Workspace.Packages.PlayerList).Hooks.useLeaderboardStore
local TitleBarViewModule = require(script.Parent.Parent.Parent.Components.PresentationCommon.TitleBarView)
local FFlagPlayerListFixLeaderstatsStacking = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking

return ReactModule.memo(function(p1)
	-- upvalues: UseLeaderboardStoreFunction (copy), FFlagPlayerListFixLeaderstatsStacking (copy), SignalsReactModule (copy), ReactModule (copy), TitleBarViewModule (copy)
	local GameStatsList = UseLeaderboardStoreFunction().getGameStatsList()
	local UseSignalStateResult = if FFlagPlayerListFixLeaderstatsStacking then nil else SignalsReactModule.useSignalState(GameStatsList.getCount)
	
	return ReactModule.createElement(TitleBarViewModule, {
		gameStats = GameStatsList,
		gameStatsCount = if FFlagPlayerListFixLeaderstatsStacking then nil else UseSignalStateResult,
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