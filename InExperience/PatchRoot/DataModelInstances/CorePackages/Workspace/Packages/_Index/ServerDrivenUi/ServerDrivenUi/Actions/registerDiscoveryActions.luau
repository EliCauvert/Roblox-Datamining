local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local fFlagLuaAppSduiUpdateUserSettingsAction = require(parent.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction
local fFlagSduiOpenSearchResultsTabAction = require(parent.SharedFlags).FFlagSduiOpenSearchResultsTabAction
local fFlagLuaAppSduiOpenSearchResultsWithQueryAction = require(parent.SharedFlags).FFlagLuaAppSduiOpenSearchResultsWithQueryAction
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry
local fFlagSduiActionsUpdateFiresOwnTelemetry = require(parent.SharedFlags).FFlagSduiActionsUpdateFiresOwnTelemetry
local fFlagSduiCommunitySectionSupport = require(parent.SharedFlags).FFlagSduiCommunitySectionSupport
local fFlagSduiDevStoreSeeAllSupport = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local fFlagSduiLaunchExperienceAction = require(parent.SharedFlags).FFlagSduiLaunchExperienceAction
local fFlagLuaAppUnlockUpsellSupport = require(parent.SharedFlags).FFlagLuaAppUnlockUpsellSupport
local fFlagRobloxPlusFAEFreeTrial = require(parent.SharedFlags).FFlagRobloxPlusFAEFreeTrial
local fFlagSduiChartsSortDetailGenreFilter = require(parent.SharedFlags).FFlagSduiChartsSortDetailGenreFilter
local fFlagSduiAiOverviewEnabled = require(parent.SharedFlags).FFlagSduiAiOverviewEnabled
local fFlagSduiPinShortcutAction = require(parent.SharedFlags).FFlagSduiPinShortcutAction
local fFlagLuaAppSduiHomePageSupport = require(parent.SharedFlags).FFlagLuaAppSduiHomePageSupport
local fFlagLuaAppSduiGameTileFeedback = require(parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback

return function()
	-- upvalues: sduiActionType (ref), serverDrivenUi (ref), fFlagRobloxPlusFAEFreeTrial (ref), fFlagSduiActionsUpdateFiresOwnTelemetry (ref), fFlagSduiOpenSearchResultsTabAction (ref), fFlagLuaAppSduiOpenSearchResultsWithQueryAction (ref), fFlagLuaAppUnlockUpsellSupport (ref), fFlagSduiAiOverviewEnabled (ref), fFlagLuaAppSduiGameTileFeedback (ref), fFlagLuaAppSduiUpdateUserSettingsAction (ref), fFlagSduiLaunchExperienceAction (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagLuaAppSduiHomePageSupport (ref), fFlagSduiChartsSortDetailGenreFilter (ref), fFlagSduiPinShortcutAction (ref), fFlagSduiCommunitySectionSupport (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.DismissDialog] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiDismissDialogAction)
			end
		},
		[sduiActionType.Link] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiLinkAction)
			end
		},
		[sduiActionType.OpenFaeTrialUpsell] = if fFlagRobloxPlusFAEFreeTrial then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenFaeTrialUpsellAction)
			end
		} else nil,
		[sduiActionType.OpenAbuseReport] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenAbuseReportAction)
			end
		},
		[sduiActionType.OpenGameDetails] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenGameDetailsAction)
			end,
			skipUnifiedLogging = if fFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[sduiActionType.OpenBadgeDetails] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenBadgeDetailsAction)
			end
		},
		[sduiActionType.OpenBadgesSeeAll] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenBadgesSeeAllAction)
			end,
			lazyTelemetryHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end
		},
		[sduiActionType.OpenExperienceStoreSeeAll] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenExperienceStoreSeeAllAction)
			end,
			lazyTelemetryHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end
		},
		[sduiActionType.OpenProfile] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenProfileAction)
			end
		},
		[sduiActionType.OpenJoinFriends] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenJoinFriendsAction)
			end
		},
		[sduiActionType.OpenSeeAll] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSeeAllAction)
			end,
			skipUnifiedLogging = if fFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[sduiActionType.OpenSearchResultsTab] = if fFlagSduiOpenSearchResultsTabAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSearchResultsTabAction)
			end
		} else nil,
		[sduiActionType.OpenSearchResultsWithQuery] = if fFlagLuaAppSduiOpenSearchResultsWithQueryAction then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSearchResultsWithQueryAction)
			end,
			lazyTelemetryHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.TelemetryHandlers.SduiOpenSearchResultsWithQueryTelemetryHandler)
			end
		} else nil,
		[sduiActionType.OpenSocialLink] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSocialLinkAction)
			end,
			lazyTelemetryHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.TelemetryHandlers.SduiLeavingRobloxTelemetryHandler)
			end
		},
		[sduiActionType.OpenSongDetail] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSongDetailAction)
			end
		},
		[sduiActionType.OpenAmpWizard] = if fFlagLuaAppUnlockUpsellSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenAmpWizardAction)
			end
		} else nil,
		[sduiActionType.ToggleExperienceFavorite] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiToggleExperienceFavoriteAction)
			end
		},
		[sduiActionType.ToggleExperienceFollow] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiToggleExperienceFollowAction)
			end
		},
		[sduiActionType.ToggleExperienceVote] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiToggleExperienceVoteAction)
			end
		},
		[sduiActionType.DismissGameFeedback] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiDismissGameFeedbackAction)
			end
		},
		[sduiActionType.OpenGameFeedbackForm] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenGameFeedbackFormAction)
			end
		},
		[sduiActionType.AiOverviewFeedback] = if fFlagSduiAiOverviewEnabled then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiAiOverviewFeedbackAction)
			end
		} else nil,
		[sduiActionType.OpenSponsoredTooltip] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSponsoredTooltipAction)
			end
		},
		[sduiActionType.SetGameTileNotInterested] = if fFlagLuaAppSduiGameTileFeedback then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiSetGameTileNotInterestedAction)
			end
		} else nil,
		[sduiActionType.UndoGameTileNotInterested] = if fFlagLuaAppSduiGameTileFeedback then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiUndoGameTileNotInterestedAction)
			end
		} else nil,
		[sduiActionType.OpenMarketplaceTryOn] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenMarketplaceTryOnAction)
			end
		},
		[sduiActionType.UpdateUserSettings] = if fFlagLuaAppSduiUpdateUserSettingsAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiUpdateUserSettingsAction)
			end
		} else nil,
		[sduiActionType.PlayButtonClick] = {
			lazyHandler = function()
				return nil
			end,
			skipUnifiedLogging = if fFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[sduiActionType.OpenTooltip] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenTooltipAction)
			end
		},
		[sduiActionType.RemoveBadgeFromInventory] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRemoveBadgeFromInventoryAction)
			end
		},
		[sduiActionType.RsvpToEvent] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRsvpToEventAction)
			end
		},
		[sduiActionType.OpenEventDetails] = {
			firesOwnTelemetry = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenEventDetailsAction)
			end
		},
		[sduiActionType.OpenGameInvite] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenGameInviteAction)
			end
		},
		[sduiActionType.LaunchExperience] = if fFlagSduiLaunchExperienceAction then {
			firesOwnTelemetry = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiLaunchExperienceAction)
			end
		} else nil,
		[sduiActionType.OpenChartsSortDetail] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenChartsSortDetailAction)
			end
		},
		[sduiActionType.OpenPurchasePrompt] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.OpenPurchasePrompt.SduiOpenPurchasePromptAction)
			end
		},
		[sduiActionType.OpenSubscriptionPurchasePage] = if fFlagSduiDevStoreSeeAllSupport then {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSubscriptionPurchasePageAction)
			end
		} else nil,
		[sduiActionType.OpenSduiOverlay] = {
			firesOwnTelemetry = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiOpenSduiOverlayAction)
			end
		},
		[sduiActionType.ApplyChartsFilter] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiApplyChartsFilterAction)
			end
		},
		[sduiActionType.RefreshGamePasses] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRefreshGamePassesAction)
			end
		},
		[sduiActionType.RefreshPlayability] = {
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRefreshPlayabilityAction)
			end
		},
		[sduiActionType.EnableEventNotifications] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiEnableEventNotificationsAction)
			end
		},
		[sduiActionType.DismissEventNotificationsModal] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiDismissEventNotificationsModalAction)
			end
		},
		[sduiActionType.ReportSurfaceLoadTimeMilestone] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiReportSurfaceLoadTimeMilestoneAction)
			end
		},
		[sduiActionType.RefreshOmniRecommendationFeedItem] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRefreshOmniRecommendationFeedItemAction)
			end
		},
		[sduiActionType.RefreshHome] = if fFlagLuaAppSduiHomePageSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRefreshHomeAction)
			end
		} else nil,
		[sduiActionType.RefreshChartsSortDetail] = if fFlagSduiChartsSortDetailGenreFilter then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiRefreshChartsSortDetailAction)
			end
		} else nil,
		[sduiActionType.PinExperienceShortcut] = if fFlagSduiPinShortcutAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiPinShortcutAction)
			end
		} else nil,
		[sduiActionType.JoinCommunity] = if fFlagSduiCommunitySectionSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Actions.SduiJoinCommunityAction)
			end
		} else nil
	})
end