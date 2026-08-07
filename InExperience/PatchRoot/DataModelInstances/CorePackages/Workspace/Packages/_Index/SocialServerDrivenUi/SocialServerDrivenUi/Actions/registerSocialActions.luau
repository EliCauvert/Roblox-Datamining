local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry
local fFlagLuaAppSduiVerificationUpsellActions = require(parent.SharedFlags).FFlagLuaAppSduiVerificationUpsellActions

return function() --[[ line: 12 | named "registerSocialActions" ]]
	-- upvalues: sduiActionType (ref), fFlagLuaAppSduiVerificationUpsellActions (ref), socialServerDrivenUi (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.OpenFacialAgeEstimation] = if not fFlagLuaAppSduiVerificationUpsellActions then {
			lazyHandler = function() --[[ line: 19 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenFacialAgeEstimationAction)
			end
		} else nil,
		[sduiActionType.OpenAddConnectionsPage] = {
			lazyHandler = function() --[[ line: 25 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenAddConnectionsPageAction)
			end
		},
		[sduiActionType.OpenMarketplace] = {
			lazyHandler = function() --[[ line: 30 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiOpenMarketplaceAction)
			end
		},
		[sduiActionType.HideProfileCompletion] = {
			lazyHandler = function() --[[ line: 35 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Actions.SduiHideProfileCompletionAction)
			end
		}
	})
end