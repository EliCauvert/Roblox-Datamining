local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local _ = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local PlayerListVisibilityStoreModule = require(Parent.Common.PlayerListVisibilityStore)
local LeaderboardTabsModule = require(Parent.Components.Presentation.LeaderboardTabs)
local PlatformLeaderboardViewModule = require(Parent.Components.Presentation.PlatformLeaderboardView)

return ReactModule.memo(function(p1) --[[ Line: 32 | Named "LeaderboardTabsBody" ]]
	-- upvalues: PlayerListVisibilityStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), PlatformLeaderboardViewModule (copy), LeaderboardTabsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.getEffectiveVisible or PlayerListVisibilityStoreModule.getEffectiveVisible)
	local IsServer: boolean = p1.activeTabId == "server" or not UseSignalStateResult
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		LeaderboardTabs = ReactModule.createElement(LeaderboardTabsModule, {
			activeTabId = p1.activeTabId,
			onActivated = p1.onActivated,
			onPlatformTabsUnavailable = p1.onPlatformTabsUnavailable,
			layoutOrder = p1.tabsLayoutOrder or 3
		}),
		LeaderboardBody = if IsServer then p1.serverBody else ReactModule.createElement(PlatformLeaderboardViewModule, {
			tab = if p1.activeTabId == "friends" then "Friends" else "Global",
			layoutOrder = p1.bodyLayoutOrder or 4
		})
	})
end)