local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local signalsModule = require(parent_1.Signals)
local view = require(parent_1.Foundation).View
local leaderboardTabsBodyModule = require(parent.Components.Presentation.LeaderboardTabsBody)
local usePlatformLeaderboardModule = require(parent.Hooks.usePlatformLeaderboard)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)
local fFlagPlayerListReskinViewChangeTelemetryModule = require(parent.Flags.FFlagPlayerListReskinViewChangeTelemetry)
local var1 = nil

local function _()
	-- upvalues: var1 (write), parent (ref)
	if var1 == nil then
		var1 = require(parent.Common.LeaderboardViewChangeTelemetry)
	end
	return var1
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), fFlagPlayerListReskinViewChangeTelemetryModule (ref), usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), signalsModule (ref), var1 (write), parent (ref), leaderboardTabsBodyModule (ref), cryoModule (ref), view (ref)
	local server, server_1 = reactModule.useState("server")
	local var2 = server_1
	
	if fFlagPlayerListReskinViewChangeTelemetryModule then
		local var3 = usePlatformLeaderboardModule()
		local var4 = if var3 ~= nil then fallbackSignalsModule.getHasActiveLeaderboard else var3.getHasActiveLeaderboard
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var4 (ref), var1 (copy), parent (copy), server (ref)
			return signalsModule.createEffect(function(p2)
				-- upvalues: var4 (copy), var1 (copy), parent (copy), server (copy)
				local var5 = var4(p2)
				
				if var1 == nil then
					var1 = require(parent.Common.LeaderboardViewChangeTelemetry)
				end
				var1.setCurrentTab(if var5 then server else nil)
			end)
		end, { server, var4 })
		reactModule.useEffect(function()
			-- upvalues: var1 (copy), parent (copy)
			return function()
				-- upvalues: var1 (copy), parent (copy)
				if var1 == nil then
					var1 = require(parent.Common.LeaderboardViewChangeTelemetry)
				end
				var1.clearCurrentTab()
			end
		end, {})
		var2 = reactModule.useCallback(function(p2)
			-- upvalues: server (ref), var1 (copy), parent (copy), server_1 (ref)
			if p2 ~= server then
				if var1 == nil then
					var1 = require(parent.Common.LeaderboardViewChangeTelemetry)
				end
				var1.logSwitchTab(p2)
			end
			server_1(p2)
		end, { server })
	end
	local t = {
		Header = p1.panelHeader,
		HeaderDivider = p1.panelDivider,
		LeaderboardTabsBody = reactModule.createElement(leaderboardTabsBodyModule, {
			activeTabId = server,
			onActivated = var2,
			onPlatformTabsUnavailable = reactModule.useCallback(function()
				-- upvalues: server_1 (ref)
				server_1("server")
			end, {}),
			serverBody = p1.serverBody
		})
	}
	
	if p1.children then
		t = cryoModule.Dictionary.join(t, p1.children)
	end
	return reactModule.createElement(view, p1.panelProps, t)
end)