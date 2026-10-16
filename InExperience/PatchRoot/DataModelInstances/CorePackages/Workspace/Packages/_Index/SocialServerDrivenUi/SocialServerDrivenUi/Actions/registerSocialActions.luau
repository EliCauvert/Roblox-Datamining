local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local FFlagLuaAppSduiVerificationUpsellActions = require(Parent.SharedFlags).FFlagLuaAppSduiVerificationUpsellActions
local FFlagSduiRequestFriendshipActionHandler = require(Parent.SharedFlags).FFlagSduiRequestFriendshipActionHandler
local FFlagEditProfileFramesEnabled = require(Parent.SharedFlags).FFlagEditProfileFramesEnabled
local FFlagAddSDUIEditProfileFramesAction = require(Parent.SharedFlags).FFlagAddSDUIEditProfileFramesAction
local FFlagAppChatConversationTrustedFriendUpsellBanner = require(Parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner

return function() --[[ Line: 17 | Named "registerSocialActions" ]]
	-- upvalues: SduiActionType (copy), FFlagLuaAppSduiVerificationUpsellActions (copy), SocialServerDrivenUi (copy), FFlagSduiRequestFriendshipActionHandler (copy), FFlagEditProfileFramesEnabled (copy), FFlagAddSDUIEditProfileFramesAction (copy), FFlagAppChatConversationTrustedFriendUpsellBanner (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.OpenFacialAgeEstimation] = if FFlagLuaAppSduiVerificationUpsellActions then nil else {
			lazyHandler = function() --[[ Line: 24 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiOpenFacialAgeEstimationAction)
			end
		},
		[SduiActionType.OpenAddConnectionsPage] = {
			lazyHandler = function() --[[ Line: 30 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiOpenAddConnectionsPageAction)
			end
		},
		[SduiActionType.OpenMarketplace] = {
			lazyHandler = function() --[[ Line: 35 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiOpenMarketplaceAction)
			end
		},
		[SduiActionType.HideProfileCompletion] = {
			lazyHandler = function() --[[ Line: 40 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiHideProfileCompletionAction)
			end
		},
		[SduiActionType.RequestFriendship] = if FFlagSduiRequestFriendshipActionHandler then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ Line: 46 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiRequestFriendshipAction)
			end
		} else nil,
		[SduiActionType.OpenProfileFramesEditor] = if FFlagEditProfileFramesEnabled and FFlagAddSDUIEditProfileFramesAction then {
			lazyHandler = function() --[[ Line: 55 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiOpenProfileFramesEditorAction)
			end
		} else nil,
		[SduiActionType.OpenTrustedFriendsUpsellModal] = if FFlagAppChatConversationTrustedFriendUpsellBanner then {
			lazyHandler = function() --[[ Line: 62 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiOpenTrustedFriendsUpsellModalAction)
			end
		} else nil,
		[SduiActionType.RecordPartyChatConversationUpsellAcknowledgement] = if FFlagAppChatConversationTrustedFriendUpsellBanner then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ Line: 69 ]]
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Actions.SduiRecordPartyChatConversationUpsellAcknowledgementAction)
			end
		} else nil
	})
end