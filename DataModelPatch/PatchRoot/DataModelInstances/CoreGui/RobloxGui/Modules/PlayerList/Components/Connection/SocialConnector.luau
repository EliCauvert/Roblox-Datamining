local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SetPlayerFriendStatusModule = require(script.Parent.Parent.Parent.Actions.SetPlayerFriendStatus)
local EventConnectionModule = require(script.Parent.EventConnection)
local SocialConnector = RoactModule.PureComponent:extend("SocialConnector")

function SocialConnector.didMount(p1)
	p1.mounted = true
end

function SocialConnector.render(p1)
	-- upvalues: RoactModule (copy), EventConnectionModule (copy), Players (copy)
	return RoactModule.createFragment({
		FriendStatusChangedConnection = RoactModule.createElement(EventConnectionModule, {
			event = Players.LocalPlayer.FriendStatusChanged,
			callback = function(p2, p3)
				-- upvalues: p1 (copy)
				p1.props.setPlayerFriendStatus(p2, p3)
			end
		})
	})
end

function SocialConnector.willUnmount(p1)
	p1.mounted = false
end

return RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: SetPlayerFriendStatusModule (copy)
	return {
		setPlayerFriendStatus = function(p1, p2)
			-- upvalues: Callback (copy), SetPlayerFriendStatusModule (upval)
			return Callback(SetPlayerFriendStatusModule(p1, p2))
		end
	}
end)(SocialConnector)