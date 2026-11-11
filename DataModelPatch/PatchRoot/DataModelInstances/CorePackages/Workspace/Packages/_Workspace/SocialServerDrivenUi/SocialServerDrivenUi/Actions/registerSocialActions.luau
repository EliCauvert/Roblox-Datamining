local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local FFlagLuaAppSduiVerificationUpsellActions = require(Parent.SharedFlags).FFlagLuaAppSduiVerificationUpsellActions

return function()
	-- upvalues: SduiActionType (copy), FFlagLuaAppSduiVerificationUpsellActions (copy), SocialServerDrivenUi (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.OpenFacialAgeEstimation] = if FFlagLuaAppSduiVerificationUpsellActions then nil else {
			lazyHandler = function()
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiOpenFacialAgeEstimationAction)
			end
		},
		[SduiActionType.OpenAddConnectionsPage] = {
			lazyHandler = function()
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiOpenAddConnectionsPageAction)
			end
		},
		[SduiActionType.OpenMarketplace] = {
			lazyHandler = function()
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiOpenMarketplaceAction)
			end
		},
		[SduiActionType.HideProfileCompletion] = {
			lazyHandler = function()
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiHideProfileCompletionAction)
			end
		}
	})
end