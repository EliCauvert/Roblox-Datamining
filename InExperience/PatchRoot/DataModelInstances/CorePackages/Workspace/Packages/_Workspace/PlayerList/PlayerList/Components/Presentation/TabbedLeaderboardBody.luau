local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local view = require(parent_1.Foundation).View
local leaderboardTabsBodyModule = require(parent.Components.Presentation.LeaderboardTabsBody)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), view (ref), leaderboardTabsBodyModule (ref)
	local server, server_1 = reactModule.useState("server")
	
	return reactModule.createElement(view, p0.panelProps, {
		Header = p0.panelHeader,
		HeaderDivider = p0.panelDivider,
		LeaderboardTabsBody = reactModule.createElement(leaderboardTabsBodyModule, {
			activeTabId = server,
			onActivated = server_1,
			onPlatformTabsUnavailable = reactModule.useCallback(function()
				-- upvalues: server_1 (ref)
				server_1("server")
			end, {}),
			serverBody = p0.serverBody
		})
	})
end)