local GameInvite = script:FindFirstAncestor("GameInvite")
local ReactModule = require(GameInvite.Parent.React)
local GameInviteContextProviderModule = require(GameInvite.Context.GameInviteContextProvider)
local GameInviteContentModule = require(GameInvite.Components.GameInviteContent)
local _ = require(GameInvite.gameInviteModalType)

return function(p1) --[[ Line: 22 ]]
	-- upvalues: ReactModule (copy), GameInviteContextProviderModule (copy), GameInviteContentModule (copy)
	return ReactModule.createElement(GameInviteContextProviderModule, {
		options = p1.options,
		serverType = p1.serverType,
		gameDetails = p1.gameDetails,
		isLoadingCustomParams = p1.isLoading,
		isCoreScript = p1.isCoreScript
	}, {
		GameInviteContent = ReactModule.createElement(GameInviteContentModule, {
			isLoadingCustomParams = p1.isLoading,
			disableSelectionParentManagement = p1.disableSelectionParentManagement,
			hideCloseButton = p1.hideCloseButton
		})
	})
end