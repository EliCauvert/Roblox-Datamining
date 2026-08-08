local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry
local fFlagLuaAppSduiVerificationUpsellActions = require(parent.SharedFlags).FFlagLuaAppSduiVerificationUpsellActions
local fFlagSduiRequestFriendshipActionHandler = require(parent.SharedFlags).FFlagSduiRequestFriendshipActionHandler

return function() --[[ line: 13 | named "registerSocialActions" ]]
	-- upvalues: sduiActionType (ref), fFlagLuaAppSduiVerificationUpsellActions (ref), socialServerDrivenUi (ref), fFlagSduiRequestFriendshipActionHandler (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.OpenFacialAgeEstimation] = if not fFlagLuaAppSduiVerificationUpsellActions then {
			lazyHandler = function() --[[ line: 20 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenFacialAgeEstimationAction)
			end
		} else nil,
		[sduiActionType.OpenAddConnectionsPage] = {
			lazyHandler = function() --[[ line: 26 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenAddConnectionsPageAction)
			end
		},
		[sduiActionType.OpenMarketplace] = {
			lazyHandler = function() --[[ line: 31 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenMarketplaceAction)
			end
		},
		[sduiActionType.HideProfileCompletion] = {
			lazyHandler = function() --[[ line: 36 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiHideProfileCompletionAction)
			end
		},
		[sduiActionType.RequestFriendship] = if fFlagSduiRequestFriendshipActionHandler then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 42 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiRequestFriendshipAction)
			end
		} else nil
	})
end