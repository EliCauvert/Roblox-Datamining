local gameInvite = script:FindFirstAncestor("GameInvite")
local components = gameInvite.Components
local reactModule = require(gameInvite.Parent.React)
local gameInviteContextProviderModule = require(gameInvite.Context.GameInviteContextProvider)
local gameInviteContentModule = require(components.GameInviteContent)
local _ = require(gameInvite.gameInviteModalType)

return function(p1)
	-- upvalues: reactModule (ref), gameInviteContextProviderModule (ref), gameInviteContentModule (ref)
	return reactModule.createElement(gameInviteContextProviderModule, {
		options = p1.options,
		serverType = p1.serverType,
		gameDetails = p1.gameDetails,
		isLoadingCustomParams = p1.isLoading,
		isCoreScript = p1.isCoreScript
	}, {
		GameInviteContent = reactModule.createElement(gameInviteContentModule, {
			isLoadingCustomParams = p1.isLoading,
			disableSelectionParentManagement = p1.disableSelectionParentManagement,
			hideCloseButton = p1.hideCloseButton
		})
	})
end