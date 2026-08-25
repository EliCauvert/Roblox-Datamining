local gameInvite = script:FindFirstAncestor("GameInvite")
local components = gameInvite.Components
local reactModule = require(gameInvite.Parent.React)
local gameInviteContextProviderModule = require(gameInvite.Context.GameInviteContextProvider)
local gameInviteContentModule = require(components.GameInviteContent)
local _ = require(gameInvite.gameInviteModalType)

return function(p0)
	-- upvalues: reactModule (ref), gameInviteContextProviderModule (ref), gameInviteContentModule (ref)
	return reactModule.createElement(gameInviteContextProviderModule, {
		options = p0.options,
		serverType = p0.serverType,
		gameDetails = p0.gameDetails,
		isLoadingCustomParams = p0.isLoading,
		isCoreScript = p0.isCoreScript
	}, {
		GameInviteContent = reactModule.createElement(gameInviteContentModule, {
			isLoadingCustomParams = p0.isLoading,
			disableSelectionParentManagement = p0.disableSelectionParentManagement,
			hideCloseButton = p0.hideCloseButton
		})
	})
end