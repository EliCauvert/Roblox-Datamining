local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry
local fFlagLuaAppSduiVerificationUpsellActions = require(parent.SharedFlags).FFlagLuaAppSduiVerificationUpsellActions
local fFlagSduiRequestFriendshipActionHandler = require(parent.SharedFlags).FFlagSduiRequestFriendshipActionHandler
local fFlagEditProfileFramesEnabled = require(parent.SharedFlags).FFlagEditProfileFramesEnabled
local fFlagAddSDUIEditProfileFramesAction = require(parent.SharedFlags).FFlagAddSDUIEditProfileFramesAction

return function()
	-- upvalues: sduiActionType (ref), fFlagLuaAppSduiVerificationUpsellActions (ref), socialServerDrivenUi (ref), fFlagSduiRequestFriendshipActionHandler (ref), fFlagEditProfileFramesEnabled (ref), fFlagAddSDUIEditProfileFramesAction (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.OpenFacialAgeEstimation] = if not fFlagLuaAppSduiVerificationUpsellActions then {
			lazyHandler = function()
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenFacialAgeEstimationAction)
			end
		} else nil,
		[sduiActionType.OpenAddConnectionsPage] = {
			lazyHandler = function()
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenAddConnectionsPageAction)
			end
		},
		[sduiActionType.OpenMarketplace] = {
			lazyHandler = function()
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenMarketplaceAction)
			end
		},
		[sduiActionType.HideProfileCompletion] = {
			lazyHandler = function()
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiHideProfileCompletionAction)
			end
		},
		[sduiActionType.RequestFriendship] = if fFlagSduiRequestFriendshipActionHandler then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiRequestFriendshipAction)
			end
		} else nil,
		[sduiActionType.OpenProfileFramesEditor] = if fFlagEditProfileFramesEnabled and fFlagAddSDUIEditProfileFramesAction then {
			lazyHandler = function()
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenProfileFramesEditorAction)
			end
		} else nil
	})
end