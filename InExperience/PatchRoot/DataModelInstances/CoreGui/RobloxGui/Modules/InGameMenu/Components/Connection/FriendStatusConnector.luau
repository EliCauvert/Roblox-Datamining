local playersService = game:GetService("Players")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local parent = script.Parent.Parent.Parent
local setFriendStatusModule = require(parent.Actions.SetFriendStatus)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local friendStatusConnector = roact.PureComponent:extend("FriendStatusConnector")

function friendStatusConnector.init(p0) --[[ line: 15 ]]
	-- upvalues: playersService (ref)
	p0.state = { localPlayer = playersService.LocalPlayer }
end

function friendStatusConnector.render(p1) --[[ line: 21 ]]
	-- upvalues: roact (ref), externalEventConnectionModule (ref), playersService (ref)
	local t = {
		PlayerAdded = roact.createElement(externalEventConnectionModule, {
			event = playersService.PlayerAdded,
			callback = function(p2) --[[ line: 25 ]]
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
			callback = function(p3) --[[ line: 38 ]]
				-- upvalues: p1 (ref)
				p1.props.setFriendStatus(p3.UserId, nil)
			end
		})
	}
	
	if p1.state.localPlayer then
		t.FriendStatusChanged = roact.createElement(externalEventConnectionModule, {
			event = playersService.LocalPlayer.FriendStatusChanged,
			callback = function(p4, p5) --[[ line: 47 ]]
				-- upvalues: p1 (ref)
				p1.props.setFriendStatus(p4.UserId, p5)
			end
		})
	end
	return roact.createFragment(t)
end

return roactRodux.UNSTABLE_connect2(nil, function(p6) --[[ line: 56 ]]
	-- upvalues: setFriendStatusModule (ref)
	return {
		setFriendStatus = function(value, p7) --[[ line: 58 ]]
			-- upvalues: p6 (ref), setFriendStatusModule (copy)
			return p6(setFriendStatusModule(value, p7))
		end
	}
end)(friendStatusConnector)