local DependenciesModule = require(script:FindFirstAncestor("ShareLinkInvalidModal").dependencies)
local Roact = DependenciesModule.Roact
local RoactNavigation = DependenciesModule.RoactNavigation
local RoactRodux = DependenciesModule.RoactRodux
local Dash = DependenciesModule.Dash
local T = DependenciesModule.t
local ShareLinkInvalidModalModule = require(script.Parent.ShareLinkInvalidModal)
local ShareLinkInvalidModalContainer = Roact.Component:extend("ShareLinkInvalidModalContainer")
ShareLinkInvalidModalContainer.validateProps = T.interface({
	navigation = T.table,
	closeModal = T.optional(T.callback)
})

function ShareLinkInvalidModalContainer.init(p1)
	function p1.closeModal()
		-- upvalues: p1 (copy)
		local Props = p1.props
		
		if Props.closeModal then
			Props.closeModal()
		end
		Props.navigation.pop()
	end
end

function ShareLinkInvalidModalContainer.render(p1)
	-- upvalues: Roact (copy), ShareLinkInvalidModalModule (copy), Dash (copy)
	return Roact.createElement(ShareLinkInvalidModalModule, Dash.join(p1.props, { closeModal = p1.closeModal }))
end

return RoactNavigation.withNavigation((RoactRodux.connect(function(p1)
	return { screenSize = p1.ScreenSize }
end)(ShareLinkInvalidModalContainer)))