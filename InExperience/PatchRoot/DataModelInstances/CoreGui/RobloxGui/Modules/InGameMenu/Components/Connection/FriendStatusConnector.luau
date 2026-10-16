local Players = game:GetService("Players")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local Parent = script.Parent.Parent.Parent
local SetFriendStatusModule = require(Parent.Actions.SetFriendStatus)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local FriendStatusConnector = Roact.PureComponent:extend("FriendStatusConnector")

function FriendStatusConnector.init(p1) --[[ Line: 15 ]]
	-- upvalues: Players (copy)
	p1.state = { localPlayer = Players.LocalPlayer }
end

function FriendStatusConnector.render(p1) --[[ Line: 21 ]]
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), Players (copy)
	local config = {
		PlayerAdded = Roact.createElement(ExternalEventConnectionModule, {
			event = Players.PlayerAdded,
			callback = function(LocalPlayer) --[[ Line: 25 ]]
				-- upvalues: Players (upval), p1 (copy)
				if LocalPlayer == Players.LocalPlayer then
					p1:setState({ localPlayer = LocalPlayer })
					
					return
				else
					p1.props.setFriendStatus(LocalPlayer.UserId, Enum.FriendStatus.Unknown)
				end
			end
		}),
		PlayerRemoving = Roact.createElement(ExternalEventConnectionModule, {
			event = Players.PlayerRemoving,
			callback = function(Player) --[[ Line: 38 ]]
				-- upvalues: p1 (copy)
				p1.props.setFriendStatus(Player.UserId, nil)
			end
		})
	}
	
	if p1.state.localPlayer then
		config.FriendStatusChanged = Roact.createElement(ExternalEventConnectionModule, {
			event = Players.LocalPlayer.FriendStatusChanged,
			callback = function(Player, p2) --[[ Line: 47 ]]
				-- upvalues: p1 (copy)
				p1.props.setFriendStatus(Player.UserId, p2)
			end
		})
	end
	return Roact.createFragment(config)
end

return RoactRodux.UNSTABLE_connect2(nil, function(Callback) --[[ Line: 56 ]]
	-- upvalues: SetFriendStatusModule (copy)
	return {
		setFriendStatus = function(p1, p2) --[[ Line: 58 ]]
			-- upvalues: Callback (copy), SetFriendStatusModule (upval)
			return Callback(SetFriendStatusModule(p1, p2))
		end
	}
end)(FriendStatusConnector)