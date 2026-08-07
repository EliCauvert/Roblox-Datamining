local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local blockedStatusChangedEvent = require(corePackagesService.Workspace.Packages.BlockingUtility):GetBlockedStatusChangedEvent()
local parent = script.Parent.Parent.Parent
local setPerformanceStatsVisibleModule = require(parent.Actions.SetPerformanceStatsVisible)
local setPlayerIsBlockedModule = require(parent.Actions.SetPlayerIsBlocked)
local eventConnectionModule = require(script.Parent.EventConnection)
local coreGuiConnector = roactModule.PureComponent:extend("CoreGuiConnector")

function coreGuiConnector.didMount(p0) --[[ line: 22 ]]
	-- upvalues: userGameSettingsService (ref)
	p0.props.setPerformanceStatsVisible(userGameSettingsService.PerformanceStatsVisible)
end

function coreGuiConnector.render(p1) --[[ line: 26 ]]
	-- upvalues: roactModule (ref), eventConnectionModule (ref), userGameSettingsService (ref), blockedStatusChangedEvent (ref), playersService (ref)
	return roactModule.createFragment({
		PerformanceStatsChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = userGameSettingsService.PerformanceStatsVisibleChanged,
			callback = function(p2) --[[ line: 30 ]]
				-- upvalues: p1 (ref)
				p1.props.setPerformanceStatsVisible(p2)
			end
		}),
		BlockedStatusChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = blockedStatusChangedEvent,
			callback = function(p3, p4) --[[ line: 37 ]]
				-- upvalues: playersService (copy), p1 (ref)
				local var10 = playersService:GetPlayerByUserId(p3)
				
				if var10 then
					p1.props.setPlayerIsBlocked(var10, p4)
				end
			end
		})
	})
end

return roactRoduxModule.connect(nil, function(p5) --[[ line: 47 | named "mapDispatchToProps" ]]
	-- upvalues: setPerformanceStatsVisibleModule (ref), setPlayerIsBlockedModule (ref)
	return {
		setPerformanceStatsVisible = function(value) --[[ line: 49 ]]
			-- upvalues: p5 (ref), setPerformanceStatsVisibleModule (copy)
			return p5(setPerformanceStatsVisibleModule(value))
		end,
		setPlayerIsBlocked = function(value, p6) --[[ line: 53 ]]
			-- upvalues: p5 (ref), setPlayerIsBlockedModule (copy)
			return p5(setPlayerIsBlockedModule(value, p6))
		end
	}
end)(coreGuiConnector)