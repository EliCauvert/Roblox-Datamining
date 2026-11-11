local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local FFlagLuaAppSduiUpdateUserSettingsAction = require(Parent.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction
local FFlagSduiOpenSearchResultsTabAction = require(Parent.SharedFlags).FFlagSduiOpenSearchResultsTabAction
local FFlagLuaAppSduiOpenSearchResultsWithQueryAction = require(Parent.SharedFlags).FFlagLuaAppSduiOpenSearchResultsWithQueryAction
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local FFlagSduiActionsUpdateFiresOwnTelemetry = require(Parent.SharedFlags).FFlagSduiActionsUpdateFiresOwnTelemetry
local FFlagSduiActionTelemetryHandler = require(Parent.SharedFlags).FFlagSduiActionTelemetryHandler
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiDevStoreSeeAllSupport = require(Parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local FFlagSduiEventDetailsSupport = require(Parent.SharedFlags).FFlagSduiEventDetailsSupport
local FFlagSduiLaunchExperienceAction = require(Parent.SharedFlags).FFlagSduiLaunchExperienceAction
local FFlagLuaAppUnlockUpsellSupport = require(Parent.SharedFlags).FFlagLuaAppUnlockUpsellSupport
local FFlagLuaAppSduiVerificationUpsellActions = require(Parent.SharedFlags).FFlagLuaAppSduiVerificationUpsellActions
local FFlagRobloxPlusFAEFreeTrial = require(Parent.SharedFlags).FFlagRobloxPlusFAEFreeTrial
local FFlagSduiGenreSelector = require(Parent.SharedFlags).FFlagSduiGenreSelector
local FFlagSduiAiOverviewEnabled = require(Parent.SharedFlags).FFlagSduiAiOverviewEnabled

return function()
	-- upvalues: SduiActionType (copy), ServerDrivenUi (copy), FFlagRobloxPlusFAEFreeTrial (copy), FFlagSduiActionsUpdateFiresOwnTelemetry (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiActionTelemetryHandler (copy), FFlagSduiOpenSearchResultsTabAction (copy), FFlagLuaAppSduiOpenSearchResultsWithQueryAction (copy), FFlagLuaAppUnlockUpsellSupport (copy), FFlagLuaAppSduiVerificationUpsellActions (copy), FFlagSduiAiOverviewEnabled (copy), FFlagLuaAppSduiUpdateUserSettingsAction (copy), FFlagSduiEventDetailsSupport (copy), FFlagSduiLaunchExperienceAction (copy), FFlagSduiChartsSupport (copy), FFlagSduiDevStoreSeeAllSupport (copy), FFlagSduiGenreSelector (copy), GetSduiActionHandlerRegistryFunction (copy)
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
		[SduiActionType.OpenFaeTrialUpsell] = if FFlagRobloxPlusFAEFreeTrial then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenFaeTrialUpsellAction)
			end
		} else nil,
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
		[SduiActionType.OpenBadgesSeeAll] = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenBadgesSeeAllAction)
			end,
			lazyTelemetryHandler = if FFlagSduiActionTelemetryHandler then function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end else nil
		} else nil,
		[SduiActionType.OpenExperienceStoreSeeAll] = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenExperienceStoreSeeAllAction)
			end,
			lazyTelemetryHandler = if FFlagSduiActionTelemetryHandler then function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiGameDetailsSubpageTelemetryHandler)
			end else nil
		} else nil,
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
		[SduiActionType.OpenSearchResultsWithQuery] = if FFlagLuaAppSduiOpenSearchResultsWithQueryAction then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSearchResultsWithQueryAction)
			end,
			lazyTelemetryHandler = if FFlagSduiActionTelemetryHandler then function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiOpenSearchResultsWithQueryTelemetryHandler)
			end else nil
		} else nil,
		[SduiActionType.OpenSocialLink] = if FFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSocialLinkAction)
			end,
			lazyTelemetryHandler = if FFlagSduiActionTelemetryHandler then function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiLeavingRobloxTelemetryHandler)
			end else nil
		} else nil,
		[SduiActionType.OpenSongDetail] = if FFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSongDetailAction)
			end
		} else nil,
		[SduiActionType.OpenAmpWizard] = if FFlagLuaAppUnlockUpsellSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenAmpWizardAction)
			end
		} else nil,
		[SduiActionType.OpenPhoneUpsellModal] = if FFlagLuaAppSduiVerificationUpsellActions then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenPhoneUpsellModalAction)
			end
		} else nil,
		[SduiActionType.OpenEmailUpsellModal] = if FFlagLuaAppSduiVerificationUpsellActions then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenEmailUpsellModalAction)
			end
		} else nil,
		[SduiActionType.ToggleExperienceFavorite] = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiToggleExperienceFavoriteAction)
			end
		} else nil,
		[SduiActionType.ToggleExperienceFollow] = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiToggleExperienceFollowAction)
			end
		} else nil,
		[SduiActionType.ToggleExperienceVote] = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiToggleExperienceVoteAction)
			end
		} else nil,
		[SduiActionType.DismissGameFeedback] = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiDismissGameFeedbackAction)
			end
		} else nil,
		[SduiActionType.OpenGameFeedbackForm] = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenGameFeedbackFormAction)
			end
		} else nil,
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
		[SduiActionType.OpenMarketplaceTryOn] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenMarketplaceTryOnAction)
			end
		},
		[SduiActionType.UpdateUserSettings] = if FFlagLuaAppSduiUpdateUserSettingsAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiUpdateUserSettingsAction)
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
		[SduiActionType.RsvpToEvent] = if FFlagSduiEventDetailsSupport or FFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRsvpToEventAction)
			end
		} else nil,
		[SduiActionType.OpenEventDetails] = if FFlagSduiEventDetailsSupport or FFlagSduiExperienceDetailsSupport then {
			firesOwnTelemetry = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenEventDetailsAction)
			end
		} else nil,
		[SduiActionType.OpenGameInvite] = if FFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenGameInviteAction)
			end
		} else nil,
		[SduiActionType.LaunchExperience] = if FFlagSduiLaunchExperienceAction then {
			firesOwnTelemetry = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiLaunchExperienceAction)
			end
		} else nil,
		[SduiActionType.OpenChartsSortDetail] = if FFlagSduiChartsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenChartsSortDetailAction)
			end
		} else nil,
		[SduiActionType.OpenPurchasePrompt] = if FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.OpenPurchasePrompt.SduiOpenPurchasePromptAction)
			end
		} else nil,
		[SduiActionType.OpenSubscriptionPurchasePage] = if FFlagSduiDevStoreSeeAllSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSubscriptionPurchasePageAction)
			end
		} else nil,
		[SduiActionType.OpenSduiOverlay] = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then {
			firesOwnTelemetry = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiOpenSduiOverlayAction)
			end
		} else nil,
		[SduiActionType.ApplyChartsFilter] = if FFlagSduiChartsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiApplyChartsFilterAction)
			end
		} else nil,
		[SduiActionType.RefreshGamePasses] = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshGamePassesAction)
			end
		} else nil,
		[SduiActionType.RefreshPlayability] = if FFlagSduiExperienceDetailsSupport then {
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshPlayabilityAction)
			end
		} else nil,
		[SduiActionType.EnableEventNotifications] = if FFlagSduiEventDetailsSupport or FFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiEnableEventNotificationsAction)
			end
		} else nil,
		[SduiActionType.DismissEventNotificationsModal] = if FFlagSduiEventDetailsSupport or FFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiDismissEventNotificationsModalAction)
			end
		} else nil,
		[SduiActionType.ReportSurfaceLoadTimeMilestone] = if FFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiReportSurfaceLoadTimeMilestoneAction)
			end
		} else nil,
		[SduiActionType.RefreshOmniRecommendationFeedItem] = if FFlagSduiGenreSelector then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Actions.SduiRefreshOmniRecommendationFeedItemAction)
			end
		} else nil
	})
end