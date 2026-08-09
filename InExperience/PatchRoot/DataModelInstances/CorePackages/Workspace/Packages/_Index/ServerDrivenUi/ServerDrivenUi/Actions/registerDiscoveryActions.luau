local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local fFlagLuaAppSduiUpdateUserSettingsAction = require(parent.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction
local fFlagSduiOpenSearchResultsTabAction = require(parent.SharedFlags).FFlagSduiOpenSearchResultsTabAction
local fFlagLuaAppSduiOpenSearchResultsWithQueryAction = require(parent.SharedFlags).FFlagLuaAppSduiOpenSearchResultsWithQueryAction
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry
local fFlagSduiActionsUpdateFiresOwnTelemetry = require(parent.SharedFlags).FFlagSduiActionsUpdateFiresOwnTelemetry
local fFlagSduiActionTelemetryHandler = require(parent.SharedFlags).FFlagSduiActionTelemetryHandler
local fFlagLuaAppSduiBadgeDetailsComponents = require(parent.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiDevStoreSeeAllSupport = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagSduiLaunchExperienceAction = require(parent.SharedFlags).FFlagSduiLaunchExperienceAction
local fFlagLuaAppUnlockUpsellSupport = require(parent.SharedFlags).FFlagLuaAppUnlockUpsellSupport
local fFlagLuaAppSduiVerificationUpsellActions = require(parent.SharedFlags).FFlagLuaAppSduiVerificationUpsellActions
local fFlagRobloxPlusFAEFreeTrial = require(parent.SharedFlags).FFlagRobloxPlusFAEFreeTrial
local fFlagSduiGenreSelector = require(parent.SharedFlags).FFlagSduiGenreSelector
local fFlagSduiAiOverviewEnabled = require(parent.SharedFlags).FFlagSduiAiOverviewEnabled

return function() --[[ line: 35 | named "registerDiscoveryActions" ]]
	-- upvalues: sduiActionType (ref), serverDrivenUi (ref), fFlagRobloxPlusFAEFreeTrial (ref), fFlagSduiActionsUpdateFiresOwnTelemetry (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiActionTelemetryHandler (ref), fFlagLuaAppSduiBadgeDetailsComponents (ref), fFlagSduiOpenSearchResultsTabAction (ref), fFlagLuaAppSduiOpenSearchResultsWithQueryAction (ref), fFlagLuaAppUnlockUpsellSupport (ref), fFlagLuaAppSduiVerificationUpsellActions (ref), fFlagSduiAiOverviewEnabled (ref), fFlagLuaAppSduiUpdateUserSettingsAction (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiLaunchExperienceAction (ref), fFlagSduiChartsSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiGenreSelector (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.DismissDialog] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 38 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiDismissDialogAction)
			end
		},
		[sduiActionType.Link] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 44 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiLinkAction)
			end
		},
		[sduiActionType.OpenFaeTrialUpsell] = if fFlagRobloxPlusFAEFreeTrial then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 51 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenFaeTrialUpsellAction)
			end
		} else nil,
		[sduiActionType.OpenAbuseReport] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 58 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenAbuseReportAction)
			end
		},
		[sduiActionType.OpenGameDetails] = {
			lazyHandler = function() --[[ line: 64 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenGameDetailsAction)
			end,
			skipUnifiedLogging = if fFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[sduiActionType.OpenBadgeDetails] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 70 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenBadgeDetailsAction)
			end
		},
		[sduiActionType.OpenBadgesSeeAll] = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 77 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenBadgesSeeAllAction)
			end,
			lazyTelemetryHandler = if fFlagSduiActionTelemetryHandler then function() --[[ line: 81 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end else nil
		} else nil,
		[sduiActionType.OpenExperienceStoreSeeAll] = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 89 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenExperienceStoreSeeAllAction)
			end,
			lazyTelemetryHandler = if fFlagSduiActionTelemetryHandler then function() --[[ line: 93 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end else nil
		} else nil,
		[sduiActionType.OpenProfile] = if fFlagLuaAppSduiBadgeDetailsComponents then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 101 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenProfileAction)
			end
		} else nil,
		[sduiActionType.OpenJoinFriends] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 108 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenJoinFriendsAction)
			end
		},
		[sduiActionType.OpenSeeAll] = {
			lazyHandler = function() --[[ line: 114 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSeeAllAction)
			end,
			skipUnifiedLogging = if fFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[sduiActionType.OpenSearchResultsTab] = if fFlagSduiOpenSearchResultsTabAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 121 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSearchResultsTabAction)
			end
		} else nil,
		[sduiActionType.OpenSearchResultsWithQuery] = if fFlagLuaAppSduiOpenSearchResultsWithQueryAction then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 129 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSearchResultsWithQueryAction)
			end,
			lazyTelemetryHandler = if fFlagSduiActionTelemetryHandler then function() --[[ line: 133 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.TelemetryHandlers.SduiOpenSearchResultsWithQueryTelemetryHandler)
			end else nil
		} else nil,
		[sduiActionType.OpenSocialLink] = if fFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 144 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSocialLinkAction)
			end,
			lazyTelemetryHandler = if fFlagSduiActionTelemetryHandler then function() --[[ line: 148 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.TelemetryHandlers.SduiLeavingRobloxTelemetryHandler)
			end else nil
		} else nil,
		[sduiActionType.OpenSongDetail] = if fFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 157 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSongDetailAction)
			end
		} else nil,
		[sduiActionType.OpenAmpWizard] = if fFlagLuaAppUnlockUpsellSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 165 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenAmpWizardAction)
			end
		} else nil,
		[sduiActionType.OpenPhoneUpsellModal] = if fFlagLuaAppSduiVerificationUpsellActions then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 173 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenPhoneUpsellModalAction)
			end
		} else nil,
		[sduiActionType.OpenEmailUpsellModal] = if fFlagLuaAppSduiVerificationUpsellActions then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 181 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenEmailUpsellModalAction)
			end
		} else nil,
		[sduiActionType.ToggleExperienceFavorite] = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 189 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiToggleExperienceFavoriteAction)
			end
		} else nil,
		[sduiActionType.ToggleExperienceFollow] = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 196 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiToggleExperienceFollowAction)
			end
		} else nil,
		[sduiActionType.ToggleExperienceVote] = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 203 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiToggleExperienceVoteAction)
			end
		} else nil,
		[sduiActionType.DismissGameFeedback] = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 210 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiDismissGameFeedbackAction)
			end
		} else nil,
		[sduiActionType.OpenGameFeedbackForm] = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 217 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenGameFeedbackFormAction)
			end
		} else nil,
		[sduiActionType.AiOverviewFeedback] = if fFlagSduiAiOverviewEnabled then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 224 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiAiOverviewFeedbackAction)
			end
		} else nil,
		[sduiActionType.OpenSponsoredTooltip] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 231 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSponsoredTooltipAction)
			end
		},
		[sduiActionType.OpenMarketplaceTryOn] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 237 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenMarketplaceTryOnAction)
			end
		},
		[sduiActionType.UpdateUserSettings] = if fFlagLuaAppSduiUpdateUserSettingsAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 244 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiUpdateUserSettingsAction)
			end
		} else nil,
		[sduiActionType.PlayButtonClick] = {
			lazyHandler = function() --[[ line: 251 ]]
				return nil
			end,
			skipUnifiedLogging = if fFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[sduiActionType.OpenTooltip] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 257 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenTooltipAction)
			end
		},
		[sduiActionType.RemoveBadgeFromInventory] = if fFlagLuaAppSduiBadgeDetailsComponents then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 264 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRemoveBadgeFromInventoryAction)
			end
		} else nil,
		[sduiActionType.RsvpToEvent] = if fFlagSduiEventDetailsSupport or fFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 272 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRsvpToEventAction)
			end
		} else nil,
		[sduiActionType.OpenEventDetails] = if fFlagSduiEventDetailsSupport or fFlagSduiExperienceDetailsSupport then {
			firesOwnTelemetry = false,
			lazyHandler = function() --[[ line: 280 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenEventDetailsAction)
			end
		} else nil,
		[sduiActionType.OpenGameInvite] = if fFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 288 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenGameInviteAction)
			end
		} else nil,
		[sduiActionType.LaunchExperience] = if fFlagSduiLaunchExperienceAction then {
			firesOwnTelemetry = false,
			lazyHandler = function() --[[ line: 296 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiLaunchExperienceAction)
			end
		} else nil,
		[sduiActionType.OpenChartsSortDetail] = if fFlagSduiChartsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 304 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenChartsSortDetailAction)
			end
		} else nil,
		[sduiActionType.OpenPurchasePrompt] = if fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport then {
			lazyHandler = function() --[[ line: 313 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.OpenPurchasePrompt.SduiOpenPurchasePromptAction)
			end
		} else nil,
		[sduiActionType.OpenSubscriptionPurchasePage] = if fFlagSduiDevStoreSeeAllSupport then {
			lazyHandler = function() --[[ line: 320 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSubscriptionPurchasePageAction)
			end
		} else nil,
		[sduiActionType.OpenSduiOverlay] = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then {
			firesOwnTelemetry = false,
			lazyHandler = function() --[[ line: 327 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSduiOverlayAction)
			end
		} else nil,
		[sduiActionType.ApplyChartsFilter] = if fFlagSduiChartsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 335 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiApplyChartsFilterAction)
			end
		} else nil,
		[sduiActionType.RefreshGamePasses] = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 343 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRefreshGamePassesAction)
			end
		} else nil,
		[sduiActionType.RefreshPlayability] = if fFlagSduiExperienceDetailsSupport then {
			lazyHandler = function() --[[ line: 350 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRefreshPlayabilityAction)
			end
		} else nil,
		[sduiActionType.EnableEventNotifications] = if fFlagSduiEventDetailsSupport or fFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 358 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiEnableEventNotificationsAction)
			end
		} else nil,
		[sduiActionType.DismissEventNotificationsModal] = if fFlagSduiEventDetailsSupport or fFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 367 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiDismissEventNotificationsModalAction)
			end
		} else nil,
		[sduiActionType.ReportSurfaceLoadTimeMilestone] = if fFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 375 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiReportSurfaceLoadTimeMilestoneAction)
			end
		} else nil,
		[sduiActionType.RefreshOmniRecommendationFeedItem] = if fFlagSduiGenreSelector then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 383 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRefreshOmniRecommendationFeedItemAction)
			end
		} else nil
	})
end