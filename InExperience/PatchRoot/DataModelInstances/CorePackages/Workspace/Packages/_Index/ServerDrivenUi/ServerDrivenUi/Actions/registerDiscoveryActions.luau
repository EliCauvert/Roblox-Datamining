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

return function()
	-- upvalues: SduiActionType (copy), ServerDrivenUi (copy), FFlagSduiActionsUpdateFiresOwnTelemetry (copy), FFlagSduiOpenSearchResultsTabAction (copy), FFlagLuaAppSduiOpenExternalLinkAction (copy), FFlagSduiAiOverviewEnabled (copy), FFlagLuaAppSduiGameTileFeedback (copy), FFlagLuaAppSduiUpdateUserSettingsAction (copy), FFlagMoveSduiUpdateUserSettingsToAccountManagement (copy), Parent (copy), FFlagSduiDevStoreSeeAllSupport (copy), FFlagLuaAppSduiHomePageSupport (copy), FFlagSduiChartsSortDetailGenreFilter (copy), FFlagSduiPinShortcutAction (copy), FFlagSduiCommunitySectionSupport (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.DismissDialog] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiDismissDialogAction)
			end
		},
		[SduiActionType.Link] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiLinkAction)
			end
		},
		[SduiActionType.OpenFaeTrialUpsell] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenFaeTrialUpsellAction)
			end
		},
		[SduiActionType.OpenAbuseReport] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenAbuseReportAction)
			end
		},
		[SduiActionType.OpenGameDetails] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenGameDetailsAction)
			end,
			skipUnifiedLogging = if FFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[SduiActionType.OpenBadgeDetails] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenBadgeDetailsAction)
			end
		},
		[SduiActionType.OpenBadgesSeeAll] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenBadgesSeeAllAction)
			end,
			lazyTelemetryHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end
		},
		[SduiActionType.OpenExperienceStoreSeeAll] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenExperienceStoreSeeAllAction)
			end,
			lazyTelemetryHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end
		},
		[SduiActionType.OpenProfile] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenProfileAction)
			end
		},
		[SduiActionType.OpenJoinFriends] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenJoinFriendsAction)
			end
		},
		[SduiActionType.OpenSeeAll] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSeeAllAction)
			end,
			skipUnifiedLogging = if FFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[SduiActionType.OpenSearchResultsTab] = if FFlagSduiOpenSearchResultsTabAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSearchResultsTabAction)
			end
		} else nil,
		[SduiActionType.OpenSearchResultsWithQuery] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSearchResultsWithQueryAction)
			end,
			lazyTelemetryHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiOpenSearchResultsWithQueryTelemetryHandler)
			end
		},
		[SduiActionType.OpenExternalLink] = if FFlagLuaAppSduiOpenExternalLinkAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenExternalLinkAction)
			end
		} else nil,
		[SduiActionType.OpenSocialLink] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSocialLinkAction)
			end,
			lazyTelemetryHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiLeavingRobloxTelemetryHandler)
			end
		},
		[SduiActionType.OpenSongDetail] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSongDetailAction)
			end
		},
		[SduiActionType.OpenAmpWizard] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenAmpWizardAction)
			end
		},
		[SduiActionType.ToggleExperienceFavorite] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiToggleExperienceFavoriteAction)
			end
		},
		[SduiActionType.ToggleExperienceFollow] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiToggleExperienceFollowAction)
			end
		},
		[SduiActionType.ToggleExperienceVote] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiToggleExperienceVoteAction)
			end
		},
		[SduiActionType.DismissGameFeedback] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiDismissGameFeedbackAction)
			end
		},
		[SduiActionType.OpenGameFeedbackForm] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenGameFeedbackFormAction)
			end
		},
		[SduiActionType.AiOverviewFeedback] = if FFlagSduiAiOverviewEnabled then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiAiOverviewFeedbackAction)
			end
		} else nil,
		[SduiActionType.OpenSponsoredTooltip] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSponsoredTooltipAction)
			end
		},
		[SduiActionType.SetGameTileNotInterested] = if FFlagLuaAppSduiGameTileFeedback then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiSetGameTileNotInterestedAction)
			end
		} else nil,
		[SduiActionType.UndoGameTileNotInterested] = if FFlagLuaAppSduiGameTileFeedback then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiUndoGameTileNotInterestedAction)
			end
		} else nil,
		[SduiActionType.OpenMarketplaceTryOn] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenMarketplaceTryOnAction)
			end
		},
		[SduiActionType.UpdateUserSettings] = if FFlagLuaAppSduiUpdateUserSettingsAction and not FFlagMoveSduiUpdateUserSettingsToAccountManagement then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: Parent (upval)
				return require(Parent.SettingsSdui).getSduiUpdateUserSettingsAction()
			end
		} else nil,
		[SduiActionType.PlayButtonClick] = {
			lazyHandler = function()
				return nil
			end,
			skipUnifiedLogging = if FFlagSduiActionsUpdateFiresOwnTelemetry then true else false
		},
		[SduiActionType.OpenTooltip] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenTooltipAction)
			end
		},
		[SduiActionType.RemoveBadgeFromInventory] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRemoveBadgeFromInventoryAction)
			end
		},
		[SduiActionType.RsvpToEvent] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRsvpToEventAction)
			end
		},
		[SduiActionType.OpenEventDetails] = {
			firesOwnTelemetry = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenEventDetailsAction)
			end
		},
		[SduiActionType.OpenGameInvite] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenGameInviteAction)
			end
		},
		[SduiActionType.LaunchExperience] = {
			firesOwnTelemetry = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiLaunchExperienceAction)
			end
		},
		[SduiActionType.OpenChartsSortDetail] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenChartsSortDetailAction)
			end
		},
		[SduiActionType.OpenPurchasePrompt] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.OpenPurchasePrompt.SduiOpenPurchasePromptAction)
			end
		},
		[SduiActionType.OpenSubscriptionPurchasePage] = if FFlagSduiDevStoreSeeAllSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSubscriptionPurchasePageAction)
			end
		} else nil,
		[SduiActionType.OpenSduiOverlay] = {
			firesOwnTelemetry = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSduiOverlayAction)
			end
		},
		[SduiActionType.ApplyChartsFilter] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiApplyChartsFilterAction)
			end
		},
		[SduiActionType.RefreshGamePasses] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshGamePassesAction)
			end
		},
		[SduiActionType.RefreshPlayability] = {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshPlayabilityAction)
			end
		},
		[SduiActionType.EnableEventNotifications] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiEnableEventNotificationsAction)
			end
		},
		[SduiActionType.DismissEventNotificationsModal] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiDismissEventNotificationsModalAction)
			end
		},
		[SduiActionType.ReportSurfaceLoadTimeMilestone] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiReportSurfaceLoadTimeMilestoneAction)
			end
		},
		[SduiActionType.RefreshOmniRecommendationFeedItem] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshOmniRecommendationFeedItemAction)
			end
		},
		[SduiActionType.RefreshHome] = if FFlagLuaAppSduiHomePageSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshHomeAction)
			end
		} else nil,
		[SduiActionType.RefreshChartsSortDetail] = if FFlagSduiChartsSortDetailGenreFilter then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshChartsSortDetailAction)
			end
		} else nil,
		[SduiActionType.PinExperienceShortcut] = if FFlagSduiPinShortcutAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiPinShortcutAction)
			end
		} else nil,
		[SduiActionType.JoinCommunity] = if FFlagSduiCommunitySectionSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiJoinCommunityAction)
			end
		} else nil
	})
end