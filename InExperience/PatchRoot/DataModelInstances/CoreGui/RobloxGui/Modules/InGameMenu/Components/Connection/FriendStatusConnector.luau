local playersService = game:GetService("Players")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local parent = script.Parent.Parent.Parent
local setFriendStatusModule = require(parent.Actions.SetFriendStatus)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local friendStatusConnector = roact.PureComponent:extend("FriendStatusConnector")

function friendStatusConnector.init(p1)
	-- upvalues: playersService (ref)
	p1.state = { localPlayer = playersService.LocalPlayer }
end

function friendStatusConnector.render(p1)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), playersService (ref)
	local t = {
		PlayerAdded = roact.createElement(externalEventConnectionModule, {
			event = playersService.PlayerAdded,
			callback = function(p2)
				-- upvalues: playersService (copy), p1 (ref)
				if p2 == playersService.LocalPlayer then
					p1:setState({ localPlayer = p2 })
					
					return
				end
				p1.props.setFriendStatus(p2.UserId, Enum.FriendStatus.Unknown)
			end
		}),
		PlayerRemoving = roact.createElement(externalEventConnectionModule, {
			event = playersService.PlayerRemoving,
			callback = function(p2)
				-- upvalues: p1 (ref)
				p1.props.setFriendStatus(p2.UserId, nil)
			end
		})
	}
	
	if p1.state.localPlayer then
		t.FriendStatusChanged = roact.createElement(externalEventConnectionModule, {
			event = playersService.LocalPlayer.FriendStatusChanged,
			callback = function(p2, p3)
				-- upvalues: p1 (ref)
				p1.props.setFriendStatus(p2.UserId, p3)
			end
		})
	end
	return roact.createFragment(t)
end

return roactRodux.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: setFriendStatusModule (ref)
	return {
		setFriendStatus = function(value, p2)
			-- upvalues: p1 (ref), setFriendStatusModule (copy)
			return p1(setFriendStatusModule(value, p2))
		end
	}
end)(friendStatusConnector)