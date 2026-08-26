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

function coreGuiConnector.didMount(p1)
	-- upvalues: userGameSettingsService (ref)
	p1.props.setPerformanceStatsVisible(userGameSettingsService.PerformanceStatsVisible)
end

function coreGuiConnector.render(p1)
	-- upvalues: roactModule (ref), eventConnectionModule (ref), userGameSettingsService (ref), blockedStatusChangedEvent (ref), playersService (ref)
	return roactModule.createFragment({
		PerformanceStatsChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = userGameSettingsService.PerformanceStatsVisibleChanged,
			callback = function(p2)
				-- upvalues: p1 (ref)
				p1.props.setPerformanceStatsVisible(p2)
			end
		}),
		BlockedStatusChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = blockedStatusChangedEvent,
			callback = function(p2, p3)
				-- upvalues: playersService (copy), p1 (ref)
				local var1 = playersService:GetPlayerByUserId(p2)
				
				if var1 then
					p1.props.setPlayerIsBlocked(var1, p3)
				end
			end
		})
	})
end

return roactRoduxModule.connect(nil, function(p1)
	-- upvalues: setPerformanceStatsVisibleModule (ref), setPlayerIsBlockedModule (ref)
	return {
		setPerformanceStatsVisible = function(value)
			-- upvalues: p1 (ref), setPerformanceStatsVisibleModule (copy)
			return p1(setPerformanceStatsVisibleModule(value))
		end,
		setPlayerIsBlocked = function(value, p2)
			-- upvalues: p1 (ref), setPlayerIsBlockedModule (copy)
			return p1(setPlayerIsBlockedModule(value, p2))
		end
	}
end)(coreGuiConnector)