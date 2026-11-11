local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local BlockedStatusChangedEvent = require(CorePackages.Workspace.Packages.BlockingUtility):GetBlockedStatusChangedEvent()
local Parent = script.Parent.Parent.Parent
local SetPerformanceStatsVisibleModule = require(Parent.Actions.SetPerformanceStatsVisible)
local SetPlayerIsBlockedModule = require(Parent.Actions.SetPlayerIsBlocked)
local EventConnectionModule = require(script.Parent.EventConnection)
local CoreGuiConnector = RoactModule.PureComponent:extend("CoreGuiConnector")

function CoreGuiConnector.didMount(p1)
	-- upvalues: UserGameSettings (copy)
	p1.props.setPerformanceStatsVisible(UserGameSettings.PerformanceStatsVisible)
end

function CoreGuiConnector.render(p1)
	-- upvalues: RoactModule (copy), EventConnectionModule (copy), UserGameSettings (copy), BlockedStatusChangedEvent (copy), Players (copy)
	return RoactModule.createFragment({
		PerformanceStatsChangedConnection = RoactModule.createElement(EventConnectionModule, {
			event = UserGameSettings.PerformanceStatsVisibleChanged,
			callback = function(p2)
				-- upvalues: p1 (copy)
				p1.props.setPerformanceStatsVisible(p2)
			end
		}),
		BlockedStatusChangedConnection = RoactModule.createElement(EventConnectionModule, {
			event = BlockedStatusChangedEvent,
			callback = function(UserId, p2)
				-- upvalues: Players (upval), p1 (copy)
				local Player = Players:GetPlayerByUserId(UserId)
				
				if Player then
					p1.props.setPlayerIsBlocked(Player, p2)
				end
			end
		})
	})
end

return RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: SetPerformanceStatsVisibleModule (copy), SetPlayerIsBlockedModule (copy)
	return {
		setPerformanceStatsVisible = function(p1)
			-- upvalues: Callback (copy), SetPerformanceStatsVisibleModule (upval)
			return Callback(SetPerformanceStatsVisibleModule(p1))
		end,
		setPlayerIsBlocked = function(p1, p2)
			-- upvalues: Callback (copy), SetPlayerIsBlockedModule (upval)
			return Callback(SetPlayerIsBlockedModule(p1, p2))
		end
	}
end)(CoreGuiConnector)