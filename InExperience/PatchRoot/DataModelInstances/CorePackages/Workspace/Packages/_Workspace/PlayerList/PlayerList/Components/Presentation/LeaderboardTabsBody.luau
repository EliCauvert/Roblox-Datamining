local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local _ = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local playerListVisibilityStoreModule = require(parent.Common.PlayerListVisibilityStore)
local leaderboardTabsModule = require(parent.Components.Presentation.LeaderboardTabs)
local platformLeaderboardViewModule = require(parent.Components.Presentation.PlatformLeaderboardView)

return reactModule.memo(function(value) --[[ line: 32 | named "LeaderboardTabsBody" ]]
	-- upvalues: playerListVisibilityStoreModule (ref), signalsReactModule (ref), reactModule (ref), platformLeaderboardViewModule (ref), leaderboardTabsModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		LeaderboardTabs = reactModule.createElement(leaderboardTabsModule, {
			activeTabId = value.activeTabId,
			onActivated = value.onActivated,
			onPlatformTabsUnavailable = value.onPlatformTabsUnavailable,
			layoutOrder = value.tabsLayoutOrder or 3
		}),
		LeaderboardBody = if if value.activeTabId ~= "server" then not signalsReactModule.useSignalState(value.getEffectiveVisible or playerListVisibilityStoreModule.getEffectiveVisible) else true then value.serverBody else reactModule.createElement(platformLeaderboardViewModule, {
			tab = if value.activeTabId == "friends" then "Friends" else "Global",
			layoutOrder = value.bodyLayoutOrder or 4
		})
	})
end)