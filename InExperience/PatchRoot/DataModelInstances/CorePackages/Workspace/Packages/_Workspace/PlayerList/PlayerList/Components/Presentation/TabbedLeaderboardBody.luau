local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local view = require(parent_1.Foundation).View
local leaderboardTabsBodyModule = require(parent.Components.Presentation.LeaderboardTabsBody)

return reactModule.memo(function(p0) --[[ line: 22 | named "TabbedLeaderboardBody" ]]
	-- upvalues: reactModule (ref), leaderboardTabsBodyModule (ref), cryoModule (ref), view (ref)
	local server, server_1 = reactModule.useState("server")
	local t = {
		Header = p0.panelHeader,
		HeaderDivider = p0.panelDivider,
		LeaderboardTabsBody = reactModule.createElement(leaderboardTabsBodyModule, {
			activeTabId = server,
			onActivated = server_1,
			onPlatformTabsUnavailable = reactModule.useCallback(function() --[[ line: 25 ]]
				-- upvalues: server_1 (ref)
				server_1("server")
			end, {}),
			serverBody = p0.serverBody
		})
	}
	
	if p0.children then
		t = cryoModule.Dictionary.join(t, p0.children)
	end
	return reactModule.createElement(view, p0.panelProps, t)
end)