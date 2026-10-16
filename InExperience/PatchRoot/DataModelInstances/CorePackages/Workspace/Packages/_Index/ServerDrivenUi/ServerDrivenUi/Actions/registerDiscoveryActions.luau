local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local FFlagLuaAppSduiUpdateUserSettingsAction = require(Parent.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction
local FFlagMoveSduiUpdateUserSettingsToAccountManagement = require(Parent.SharedFlags).FFlagMoveSduiUpdateUserSettingsToAccountManagement
local FFlagSduiOpenSearchResultsTabAction = require(Parent.SharedFlags).FFlagSduiOpenSearchResultsTabAction
local FFlagLuaAppSduiOpenExternalLinkAction = require(Parent.SharedFlags).FFlagLuaAppSduiOpenExternalLinkAction
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local FFlagSduiActionsUpdateFiresOwnTelemetry = require(Parent.SharedFlags).FFlagSduiActionsUpdateFiresOwnTelemetry
local FFlagSduiCommunitySectionSupport = require(Parent.SharedFlags).FFlagSduiCommunitySectionSupport
local FFlagSduiDevStoreSeeAllSupport = require(Parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local FFlagSduiChartsSortDetailGenreFilter = require(Parent.SharedFlags).FFlagSduiChartsSortDetailGenreFilter
local FFlagSduiAiOverviewEnabled = require(Parent.SharedFlags).FFlagSduiAiOverviewEnabled
local FFlagSduiPinShortcutAction = require(Parent.SharedFlags).FFlagSduiPinShortcutAction
local FFlagLuaAppSduiHomePageSupport = require(Parent.SharedFlags).FFlagLuaAppSduiHomePageSupport
local FFlagLuaAppSduiGameTileFeedback = require(Parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback

return function() --[[ Line: 31 | Named "registerDiscoveryActions" ]]
	-- upvalues: SduiActionType (copy), ServerDrivenUi (copy), FFlagSduiActionsUpdateFiresOwnTelemetry (copy), FFlagSduiOpenSearchResultsTabAction (copy), FFlagLuaAppSduiOpenExternalLinkAction (copy), FFlagSduiAiOverviewEnabled (copy), FFlagLuaAppSduiGameTileFeedback (copy), FFlagLuaAppSduiUpdateUserSettingsAction (copy), FFlagMoveSduiUpdateUserSettingsToAccountManagement (copy), Parent (copy), FFlagSduiDevStoreSeeAllSupport (copy), FFlagLuaAppSduiHomePageSupport (copy), FFlagSduiChartsSortDetailGenreFilter (copy), FFlagSduiPinShortcutAction (copy), FFlagSduiCommunitySectionSupport (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.DismissDialog] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 34 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiDismissDialogAction)
			end
		},
		[SduiActionType.Link] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 40 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiLinkAction)
			end
		},
		[SduiActionType.OpenFaeTrialUpsell] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 46 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenFaeTrialUpsellAction)
			end
		},
		[SduiActionType.OpenAbuseReport] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 52 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenAbuseReportAction)
			end
		},
		[SduiActionType.OpenGameDetails] = {
			lazyHandler = function() --[[ Line: 58 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenGameDetailsAction)
			end,
			skipUnifiedLogging = if FFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[SduiActionType.OpenBadgeDetails] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 64 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenBadgeDetailsAction)
			end
		},
		[SduiActionType.OpenBadgesSeeAll] = {
			lazyHandler = function() --[[ Line: 70 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenBadgesSeeAllAction)
			end,
			lazyTelemetryHandler = function() --[[ Line: 73 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end
		},
		[SduiActionType.OpenExperienceStoreSeeAll] = {
			lazyHandler = function() --[[ Line: 78 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenExperienceStoreSeeAllAction)
			end,
			lazyTelemetryHandler = function() --[[ Line: 81 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end
		},
		[SduiActionType.OpenProfile] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 86 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenProfileAction)
			end
		},
		[SduiActionType.OpenJoinFriends] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 92 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenJoinFriendsAction)
			end
		},
		[SduiActionType.OpenSeeAll] = {
			lazyHandler = function() --[[ Line: 98 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSeeAllAction)
			end,
			skipUnifiedLogging = if FFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[SduiActionType.OpenSearchResultsTab] = if FFlagSduiOpenSearchResultsTabAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 105 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSearchResultsTabAction)
			end
		} else nil,
		[SduiActionType.OpenSearchResultsWithQuery] = {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ Line: 112 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSearchResultsWithQueryAction)
			end,
			lazyTelemetryHandler = function() --[[ Line: 115 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiOpenSearchResultsWithQueryTelemetryHandler)
			end
		},
		[SduiActionType.OpenExternalLink] = if FFlagLuaAppSduiOpenExternalLinkAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 126 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenExternalLinkAction)
			end
		} else nil,
		[SduiActionType.OpenSocialLink] = {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ Line: 133 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSocialLinkAction)
			end,
			lazyTelemetryHandler = function() --[[ Line: 136 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiLeavingRobloxTelemetryHandler)
			end
		},
		[SduiActionType.OpenSongDetail] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 142 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSongDetailAction)
			end
		},
		[SduiActionType.OpenAmpWizard] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 148 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenAmpWizardAction)
			end
		},
		[SduiActionType.ToggleExperienceFavorite] = {
			lazyHandler = function() --[[ Line: 154 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiToggleExperienceFavoriteAction)
			end
		},
		[SduiActionType.ToggleExperienceFollow] = {
			lazyHandler = function() --[[ Line: 159 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiToggleExperienceFollowAction)
			end
		},
		[SduiActionType.ToggleExperienceVote] = {
			lazyHandler = function() --[[ Line: 164 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiToggleExperienceVoteAction)
			end
		},
		[SduiActionType.DismissGameFeedback] = {
			lazyHandler = function() --[[ Line: 169 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiDismissGameFeedbackAction)
			end
		},
		[SduiActionType.OpenGameFeedbackForm] = {
			lazyHandler = function() --[[ Line: 174 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenGameFeedbackFormAction)
			end
		},
		[SduiActionType.AiOverviewFeedback] = if FFlagSduiAiOverviewEnabled then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ Line: 180 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiAiOverviewFeedbackAction)
			end
		} else nil,
		[SduiActionType.OpenSponsoredTooltip] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 187 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSponsoredTooltipAction)
			end
		},
		[SduiActionType.SetGameTileNotInterested] = if FFlagLuaAppSduiGameTileFeedback then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ Line: 194 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiSetGameTileNotInterestedAction)
			end
		} else nil,
		[SduiActionType.UndoGameTileNotInterested] = if FFlagLuaAppSduiGameTileFeedback then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ Line: 202 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiUndoGameTileNotInterestedAction)
			end
		} else nil,
		[SduiActionType.OpenMarketplaceTryOn] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 209 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenMarketplaceTryOnAction)
			end
		},
		[SduiActionType.UpdateUserSettings] = if FFlagLuaAppSduiUpdateUserSettingsAction and not FFlagMoveSduiUpdateUserSettingsToAccountManagement then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 217 ]]
				-- upvalues: Parent (upval)
				return require(Parent.SettingsSdui).getSduiUpdateUserSettingsAction()
			end
		} else nil,
		[SduiActionType.PlayButtonClick] = {
			lazyHandler = function() --[[ Line: 224 ]]
				return nil
			end,
			skipUnifiedLogging = if FFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[SduiActionType.OpenTooltip] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 230 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenTooltipAction)
			end
		},
		[SduiActionType.RemoveBadgeFromInventory] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 236 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRemoveBadgeFromInventoryAction)
			end
		},
		[SduiActionType.RsvpToEvent] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 242 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRsvpToEventAction)
			end
		},
		[SduiActionType.OpenEventDetails] = {
			firesOwnTelemetry = false,
			lazyHandler = function() --[[ Line: 248 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenEventDetailsAction)
			end
		},
		[SduiActionType.OpenGameInvite] = {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ Line: 254 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenGameInviteAction)
			end
		},
		[SduiActionType.LaunchExperience] = {
			firesOwnTelemetry = false,
			lazyHandler = function() --[[ Line: 260 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiLaunchExperienceAction)
			end
		},
		[SduiActionType.OpenChartsSortDetail] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 266 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenChartsSortDetailAction)
			end
		},
		[SduiActionType.OpenPurchasePrompt] = {
			lazyHandler = function() --[[ Line: 272 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.OpenPurchasePrompt.SduiOpenPurchasePromptAction)
			end
		},
		[SduiActionType.OpenSubscriptionPurchasePage] = if FFlagSduiDevStoreSeeAllSupport then {
			lazyHandler = function() --[[ Line: 278 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSubscriptionPurchasePageAction)
			end
		} else nil,
		[SduiActionType.OpenSduiOverlay] = {
			firesOwnTelemetry = false,
			lazyHandler = function() --[[ Line: 284 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSduiOverlayAction)
			end
		},
		[SduiActionType.ApplyChartsFilter] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 290 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiApplyChartsFilterAction)
			end
		},
		[SduiActionType.RefreshGamePasses] = {
			lazyHandler = function() --[[ Line: 296 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshGamePassesAction)
			end
		},
		[SduiActionType.RefreshPlayability] = {
			lazyHandler = function() --[[ Line: 301 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshPlayabilityAction)
			end
		},
		[SduiActionType.EnableEventNotifications] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 306 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiEnableEventNotificationsAction)
			end
		},
		[SduiActionType.DismissEventNotificationsModal] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 312 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiDismissEventNotificationsModalAction)
			end
		},
		[SduiActionType.ReportSurfaceLoadTimeMilestone] = {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ Line: 318 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiReportSurfaceLoadTimeMilestoneAction)
			end
		},
		[SduiActionType.RefreshOmniRecommendationFeedItem] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 324 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshOmniRecommendationFeedItemAction)
			end
		},
		[SduiActionType.RefreshHome] = if FFlagLuaAppSduiHomePageSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 331 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshHomeAction)
			end
		} else nil,
		[SduiActionType.RefreshChartsSortDetail] = if FFlagSduiChartsSortDetailGenreFilter then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 339 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshChartsSortDetailAction)
			end
		} else nil,
		[SduiActionType.PinExperienceShortcut] = if FFlagSduiPinShortcutAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 347 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiPinShortcutAction)
			end
		} else nil,
		[SduiActionType.JoinCommunity] = if FFlagSduiCommunitySectionSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ Line: 355 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiJoinCommunityAction)
			end
		} else nil
	})
end