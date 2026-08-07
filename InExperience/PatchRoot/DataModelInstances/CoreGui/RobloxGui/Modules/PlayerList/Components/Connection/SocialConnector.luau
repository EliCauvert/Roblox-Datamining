local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local setPlayerFriendStatusModule = require(script.Parent.Parent.Parent.Actions.SetPlayerFriendStatus)
local eventConnectionModule = require(script.Parent.EventConnection)
local socialConnector = roactModule.PureComponent:extend("SocialConnector")

function socialConnector.didMount(p0) --[[ line: 17 ]]
	p0.mounted = true
end

function socialConnector.render(p1) --[[ line: 21 ]]
	-- upvalues: roactModule (ref), eventConnectionModule (ref), playersService (ref)
	return roactModule.createFragment({
		FriendStatusChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = playersService.LocalPlayer.FriendStatusChanged,
			callback = function(p2, p3) --[[ line: 25 ]]
				-- upvalues: p1 (ref)
				p1.props.setPlayerFriendStatus(p2, p3)
			end
		})
	})
end

function socialConnector.willUnmount(p4) --[[ line: 32 ]]
	p4.mounted = false
end

return roactRoduxModule.connect(nil, function(p5) --[[ line: 36 | named "mapDispatchToProps" ]]
	-- upvalues: setPlayerFriendStatusModule (ref)
	return {
		setPlayerFriendStatus = function(value, p6) --[[ line: 38 ]]
			-- upvalues: p5 (ref), setPlayerFriendStatusModule (copy)
			return p5(setPlayerFriendStatusModule(value, p6))
		end
	}
end)(socialConnector)