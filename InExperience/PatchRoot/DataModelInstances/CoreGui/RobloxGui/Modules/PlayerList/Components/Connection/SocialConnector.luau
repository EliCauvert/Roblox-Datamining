local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local setPlayerFriendStatusModule = require(script.Parent.Parent.Parent.Actions.SetPlayerFriendStatus)
local eventConnectionModule = require(script.Parent.EventConnection)
local socialConnector = roactModule.PureComponent:extend("SocialConnector")

function socialConnector.didMount(p1)
	p1.mounted = true
end

function socialConnector.render(p1)
	-- upvalues: roactModule (ref), eventConnectionModule (ref), playersService (ref)
	return roactModule.createFragment({
		FriendStatusChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = playersService.LocalPlayer.FriendStatusChanged,
			callback = function(p2, p3)
				-- upvalues: p1 (ref)
				p1.props.setPlayerFriendStatus(p2, p3)
			end
		})
	})
end

function socialConnector.willUnmount(p1)
	p1.mounted = false
end

return roactRoduxModule.connect(nil, function(p1)
	-- upvalues: setPlayerFriendStatusModule (ref)
	return {
		setPlayerFriendStatus = function(value, p2)
			-- upvalues: p1 (ref), setPlayerFriendStatusModule (copy)
			return p1(setPlayerFriendStatusModule(value, p2))
		end
	}
end)(socialConnector)