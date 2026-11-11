local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local View = require(Parent1.Foundation).View
local PlayerListVisibilityStoreModule = require(Parent.Common.PlayerListVisibilityStore)
local LeaderboardTabsModule = require(Parent.Components.Presentation.LeaderboardTabs)
local PlatformLeaderboardViewModule = require(Parent.Components.Presentation.PlatformLeaderboardView)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), PlayerListVisibilityStoreModule (copy), PlatformLeaderboardViewModule (copy), View (copy), LeaderboardTabsModule (copy)
	local Server, Server2 = ReactModule.useState("server")
	local UseSignalStateResult = SignalsReactModule.useSignalState(PlayerListVisibilityStoreModule.getEffectiveVisible)
	local IsServer: boolean = Server == "server" or not UseSignalStateResult
	
	return ReactModule.createElement(View, p1.panelProps, {
		Header = p1.panelHeader,
		HeaderDivider = p1.panelDivider,
		LeaderboardTabs = ReactModule.createElement(LeaderboardTabsModule, {
			layoutOrder = 3,
			activeTabId = Server,
			onActivated = Server2,
			onPlatformTabsUnavailable = ReactModule.useCallback(function()
				-- upvalues: Server2 (copy)
				Server2("server")
			end, {})
		}),
		LeaderboardBody = if IsServer then p1.serverBody else ReactModule.createElement(PlatformLeaderboardViewModule, {
			layoutOrder = 4,
			tab = if Server == "friends" then "Friends" else "Global"
		})
	})
end)