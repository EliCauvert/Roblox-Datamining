local DependenciesModule = require(script:FindFirstAncestor("InviteLinkExpiredModal").dependencies)
local Roact = DependenciesModule.Roact
local RoactNavigation = DependenciesModule.RoactNavigation
local RoactRodux = DependenciesModule.RoactRodux
local Dash = DependenciesModule.Dash
local NetworkingGames = DependenciesModule.NetworkingGames
local T = DependenciesModule.t
local InviteLinkExpiredModalModule = require(script.Parent.InviteLinkExpiredModal)
local InviteLinkExpiredMapStateToPropsModule = require(script.Parent.inviteLinkExpiredMapStateToProps)
local InviteLinkExpiredModalContainer = Roact.Component:extend("InviteLinkExpiredModalContainer")
InviteLinkExpiredModalContainer.validateProps = T.interface({
	navigation = T.table,
	closeModal = T.callback,
	launchGame = T.callback,
	universeId = T.string
})

function InviteLinkExpiredModalContainer.init(p1)
	function p1.closeModal(p2)
		-- upvalues: p1 (copy)
		local Props = p1.props
		Props.closeModal(p2)
		Props.navigation.pop()
	end
end

function InviteLinkExpiredModalContainer.didMount(p1)
	if #p1.props.universeId > 0 then
		p1.props.getExperiencesDetails(p1.props.universeId)
	end
end

function InviteLinkExpiredModalContainer.render(p1)
	-- upvalues: Roact (copy), InviteLinkExpiredModalModule (copy), Dash (copy)
	return Roact.createElement(InviteLinkExpiredModalModule, Dash.join(p1.props, { closeModal = p1.closeModal }))
end

return RoactNavigation.withNavigation((RoactRodux.connect(InviteLinkExpiredMapStateToPropsModule, function(Callback)
	-- upvalues: NetworkingGames (copy)
	return {
		getExperiencesDetails = function(p1)
			-- upvalues: Callback (copy), NetworkingGames (upval)
			return Callback(NetworkingGames.GetExperiencesDetails.API({ p1 }))
		end
	}
end)(InviteLinkExpiredModalContainer)))