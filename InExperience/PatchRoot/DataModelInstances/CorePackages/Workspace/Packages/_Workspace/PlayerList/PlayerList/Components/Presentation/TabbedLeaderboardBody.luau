local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local SignalsModule = require(Parent1.Signals)
local View = require(Parent1.Foundation).View
local LeaderboardTabsBodyModule = require(Parent.Components.Presentation.LeaderboardTabsBody)
local UsePlatformLeaderboardModule = require(Parent.Hooks.usePlatformLeaderboard)
local FallbackSignalsModule = require(Parent.Common.FallbackSignals)
local FFlagPlayerListReskinModule = require(Parent.Flags.FFlagPlayerListReskin)
local LeaderboardViewChangeTelemetryModule = nil

local function _() --[[ Line: 20 | Named "getLeaderboardViewChangeTelemetry" ]]
	-- upvalues: LeaderboardViewChangeTelemetryModule (ref), Parent (copy)
	if LeaderboardViewChangeTelemetryModule == nil then
		LeaderboardViewChangeTelemetryModule = require(Parent.Common.LeaderboardViewChangeTelemetry)
	end
	return LeaderboardViewChangeTelemetryModule
end

return ReactModule.memo(function(p1) --[[ Line: 35 | Named "TabbedLeaderboardBody" ]]
	-- upvalues: ReactModule (copy), FFlagPlayerListReskinModule (copy), UsePlatformLeaderboardModule (copy), FallbackSignalsModule (copy), SignalsModule (copy), LeaderboardViewChangeTelemetryModule (ref), Parent (copy), LeaderboardTabsBodyModule (copy), CryoModule (copy), View (copy)
	local Server, Server2 = ReactModule.useState("server")
	local UseResult = Server2
	
	if FFlagPlayerListReskinModule then
		local UsePlatformLeaderboardModuleResult = UsePlatformLeaderboardModule()
		local GetHasActiveLeaderboard = if UsePlatformLeaderboardModuleResult == nil then FallbackSignalsModule.getHasActiveLeaderboard else UsePlatformLeaderboardModuleResult.getHasActiveLeaderboard
		ReactModule.useEffect(function() --[[ Line: 46 ]]
			-- upvalues: SignalsModule (upval), GetHasActiveLeaderboard (copy), LeaderboardViewChangeTelemetryModule (upval), Parent (upval), Server (copy)
			return SignalsModule.createEffect(function(p2) --[[ Line: 47 ]]
				-- upvalues: GetHasActiveLeaderboard (upval), LeaderboardViewChangeTelemetryModule (upval), Parent (upval), Server (upval)
				local HasActiveLeaderboard = GetHasActiveLeaderboard(p2)
				
				if LeaderboardViewChangeTelemetryModule == nil then
					LeaderboardViewChangeTelemetryModule = require(Parent.Common.LeaderboardViewChangeTelemetry)
				end
				LeaderboardViewChangeTelemetryModule.setCurrentTab(if HasActiveLeaderboard then Server else nil)
			end)
		end, { Server, GetHasActiveLeaderboard })
		ReactModule.useEffect(function() --[[ Line: 53 ]]
			-- upvalues: LeaderboardViewChangeTelemetryModule (upval), Parent (upval)
			return function() --[[ Line: 54 ]]
				-- upvalues: LeaderboardViewChangeTelemetryModule (upval), Parent (upval)
				if LeaderboardViewChangeTelemetryModule == nil then
					LeaderboardViewChangeTelemetryModule = require(Parent.Common.LeaderboardViewChangeTelemetry)
				end
				LeaderboardViewChangeTelemetryModule.clearCurrentTab()
			end
		end, {})
		UseResult = ReactModule.useCallback(function(ActiveTabId) --[[ Line: 59 ]]
			-- upvalues: Server (copy), LeaderboardViewChangeTelemetryModule (upval), Parent (upval), Server2 (copy)
			if ActiveTabId ~= Server then
				if LeaderboardViewChangeTelemetryModule == nil then
					LeaderboardViewChangeTelemetryModule = require(Parent.Common.LeaderboardViewChangeTelemetry)
				end
				LeaderboardViewChangeTelemetryModule.logSwitchTab(ActiveTabId)
			end
			Server2(ActiveTabId)
		end, { Server })
	end
	local JoinResult = {
		Header = p1.panelHeader,
		HeaderDivider = p1.panelDivider,
		LeaderboardTabsBody = ReactModule.createElement(LeaderboardTabsBodyModule, {
			activeTabId = Server,
			onActivated = UseResult,
			onPlatformTabsUnavailable = ReactModule.useCallback(function() --[[ Line: 67 ]]
				-- upvalues: Server2 (copy)
				Server2("server")
			end, {}),
			serverBody = p1.serverBody
		})
	}
	
	if p1.children then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p1.children)
	end
	return ReactModule.createElement(View, p1.panelProps, JoinResult)
end)