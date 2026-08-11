local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local view = require(parent_1.Foundation).View
local playerListVisibilityStoreModule = require(parent.Common.PlayerListVisibilityStore)
local leaderboardTabsModule = require(parent.Components.Presentation.LeaderboardTabs)
local platformLeaderboardViewModule = require(parent.Components.Presentation.PlatformLeaderboardView)

return reactModule.memo(function(p0) --[[ line: 32 | named "TabbedLeaderboardBody" ]]
	-- upvalues: reactModule (ref), signalsReactModule (ref), playerListVisibilityStoreModule (ref), platformLeaderboardViewModule (ref), view (ref), leaderboardTabsModule (ref)
	local server, server_1 = reactModule.useState("server")
	
	return reactModule.createElement(view, p0.panelProps, {
		Header = p0.panelHeader,
		HeaderDivider = p0.panelDivider,
		LeaderboardTabs = reactModule.createElement(leaderboardTabsModule, {
			layoutOrder = 3,
			activeTabId = server,
			onActivated = server_1,
			onPlatformTabsUnavailable = reactModule.useCallback(function() --[[ line: 35 ]]
				-- upvalues: server_1 (ref)
				server_1("server")
			end, {})
		}),
		LeaderboardBody = if if server ~= "server" then not signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible) else true then p0.serverBody else reactModule.createElement(platformLeaderboardViewModule, {
			layoutOrder = 4,
			tab = if server == "friends" then "Friends" else "Global"
		})
	})
end)