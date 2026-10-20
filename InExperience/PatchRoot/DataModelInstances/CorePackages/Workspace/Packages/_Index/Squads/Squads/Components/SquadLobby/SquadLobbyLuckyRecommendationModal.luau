local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local Foundation = DependenciesModule.Foundation
local LuauPolyfill = DependenciesModule.LuauPolyfill
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local SetTimeoutFunction = LuauPolyfill.setTimeout
local ClearTimeoutFunction = LuauPolyfill.clearTimeout
local ButtonVariant = Foundation.Enums.ButtonVariant
local DialogSize = Foundation.Enums.DialogSize
local IconSize = Foundation.Enums.IconSize
local ProgressShape = Foundation.Enums.ProgressShape
local ProgressSize = Foundation.Enums.ProgressSize
local Button = Foundation.Button
local Dialog = Foundation.Dialog
local Icon = Foundation.Icon
local Image = Foundation.Image
local OverlayProvider = Foundation.OverlayProvider
local Progress = Foundation.Progress
local Text = Foundation.Text
local View = Foundation.View
local UseTokensFunction = Foundation.Hooks.useTokens
local ReactOtterModule = require(Parent.ReactOtter)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(Parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = require(Parent.UserLib).Utils.Constants
local CreateExperienceInviteModule = require(Squads.Thunks.CreateExperienceInvite)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local EnumsModule = require(Parent.SquadsCore.Enums)
local SquadExperienceInviteSource = EnumsModule.SquadExperienceInviteSource
local SquadLuckyRecommendationPhase = EnumsModule.SquadLuckyRecommendationPhase
local HooksModule = require(Parent.SquadsCore.Hooks)
local UseLuckyRecommendationFunction = HooksModule.useLuckyRecommendation
local UseLuckyRecommendationAnalyticsFunction = HooksModule.useLuckyRecommendationAnalytics
local UseIsExperienceInviteRetryBlockedFunction = HooksModule.useIsExperienceInviteRetryBlocked
local FFlagUseSignalsForSquadExperienceInvite = DependenciesModule.SharedFlags.FFlagUseSignalsForSquadExperienceInvite
local GetSquadExperienceInviteStoreFunction = require(Parent.SquadsCore.Stores).GetSquadExperienceInviteStore
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local EventNamesModule = require(Parent.SquadsCore.EventNames)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), React (copy), SquadExternalContractContext (copy), UseLuckyRecommendationFunction (copy), UseLuckyRecommendationAnalyticsFunction (copy), UseLocalizationFunction (copy), SquadLuckyRecommendationPhase (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), UseSelectorFunction (copy), FFlagUseSignalsForSquadExperienceInvite (copy), UseSignalStateFunction (copy), GetSquadExperienceInviteStoreFunction (copy), UseIsExperienceInviteRetryBlockedFunction (copy), EventNamesModule (copy), CreateExperienceInviteModule (copy), SquadExperienceInviteSource (copy), SetTimeoutFunction (copy), ClearTimeoutFunction (copy), ReactOtterModule (copy), Text (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), View (copy), Image (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), OverlayProvider (copy), Dialog (copy), DialogSize (copy), Button (copy), ButtonVariant (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local Size300 = UseTokensResult.Size.Size_300
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseLuckyRecommendationResult = UseLuckyRecommendationFunction()
	local State = UseLuckyRecommendationResult.state
	local Actions = UseLuckyRecommendationResult.actions
	local UseLuckyRecommendationAnalyticsResult = UseLuckyRecommendationAnalyticsFunction(p1.sessionId)
	local UseLocalizationResult = UseLocalizationFunction({
		rollingTitle = "Feature.Squads.Label.LuckyRecommendationRolling",
		rollingSubtitle = "Feature.Squads.Description.LuckyRecommendationRolling",
		revealedTitle = "Feature.Squads.Label.LuckyRecommendationRevealed",
		revealedSubtitle = "Feature.Squads.Description.LuckyRecommendationRevealed",
		errorTitle = "CommonUI.Messages.Response.SomethingWentWrong",
		joinText = "Feature.Squads.Action.JoinWithParty",
		cancelText = "CommonUI.Controls.Action.Cancel",
		retryText = "Feature.Squads.Action.Retry"
	})
	local Phase = State.phase
	local IsPhaseMatch = Phase == SquadLuckyRecommendationPhase.Rolling
	local IsPhaseMatch1 = Phase == SquadLuckyRecommendationPhase.Revealed
	local IsPhaseMatch1_1: boolean = IsPhaseMatch1 or Phase == SquadLuckyRecommendationPhase.Errored
	local Recommendation = if State.phase == SquadLuckyRecommendationPhase.Revealed then State.recommendation else nil
	local UniverseId = Recommendation and Recommendation.universeId
	local RootPlaceId = Recommendation and Recommendation.rootPlaceId
	local RbxthumbWithTypeSizeAndOptions = if UniverseId == nil then nil else GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(UniverseId), Constants.RbxthumbTypes.GameIcon, 150, false)
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p2)
		return p2.Squad and (p2.Squad.Squad and (p2.Squad.Squad.currentSquad and p2.Squad.Squad.currentSquad.squadId))
	end, {})))
	local UseResult = React.useCallback(function(p2)
		return p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentExperienceInvite)
	end, {})
	local UseSignalStateResult = if FFlagUseSignalsForSquadExperienceInvite then UseSignalStateFunction(GetSquadExperienceInviteStoreFunction(false).getHasCurrentExperienceInvite) else UseSelectorFunction(UseResult) ~= nil
	local UseIsExperienceInviteRetryBlockedResult = UseIsExperienceInviteRetryBlockedFunction(UseSelectorResult)
	local UseResult1 = React.useCallback(function()
		-- upvalues: UseLuckyRecommendationAnalyticsResult (copy), EventNamesModule (upval), Phase (copy), p1 (copy)
		UseLuckyRecommendationAnalyticsResult.fire(EventNamesModule.LuckyRecommendationDismissed, { phaseAtDismiss = Phase })
		p1.onClose()
	end, { UseLuckyRecommendationAnalyticsResult, Phase, p1.onClose })
	local UseResult11 = React.useCallback(function()
		-- upvalues: UseLuckyRecommendationAnalyticsResult (copy), EventNamesModule (upval), Phase (copy), Actions (copy), UseSelectorResult (copy)
		UseLuckyRecommendationAnalyticsResult.fire(EventNamesModule.LuckyRecommendationRerolled, { phaseAtReroll = Phase })
		Actions.startRoll(UseSelectorResult, false)
	end, {
		Actions.startRoll,
		UseSelectorResult,
		UseLuckyRecommendationAnalyticsResult,
		Phase
	})
	local UseResult2 = React.useCallback(function()
		-- upvalues: UseLuckyRecommendationAnalyticsResult (copy), EventNamesModule (upval), RootPlaceId (copy), UseDispatchResult (copy), CreateExperienceInviteModule (upval), UseContextResult (copy), SquadExperienceInviteSource (upval)
		local Context = UseLuckyRecommendationAnalyticsResult.getContext()
		UseLuckyRecommendationAnalyticsResult.fire(EventNamesModule.LuckyRecommendationJoinTapped, { rootPlaceId = RootPlaceId })
		
		if RootPlaceId ~= nil then
			UseDispatchResult(CreateExperienceInviteModule(tostring(RootPlaceId), UseContextResult, SquadExperienceInviteSource.LuckyRecommendation)):andThen(function(Result)
				-- upvalues: UseLuckyRecommendationAnalyticsResult (upval), EventNamesModule (upval), Context (copy), RootPlaceId (upval)
				if Result then
					UseLuckyRecommendationAnalyticsResult.fire(EventNamesModule.LuckyRecommendationExperienceInviteCreated, {
						pickRequestId = Context.pickRequestId,
						revealType = Context.revealType,
						rootPlaceId = RootPlaceId,
						experienceInviteId = Result
					})
				end
			end)
			
			return
		end
	end, {
		UseDispatchResult,
		RootPlaceId,
		UseContextResult,
		UseLuckyRecommendationAnalyticsResult
	})
	React.useLayoutEffect(function()
		-- upvalues: Actions (copy), UseSelectorResult (copy)
		Actions.startRoll(UseSelectorResult, true)
	end, { Actions.startRoll, UseSelectorResult })
	React.useEffect(function()
		-- upvalues: Phase (copy), SquadLuckyRecommendationPhase (upval), SetTimeoutFunction (upval), Actions (copy), ClearTimeoutFunction (upval)
		if Phase ~= SquadLuckyRecommendationPhase.Rolling then return end
		local SetTimeoutResult = SetTimeoutFunction(Actions.endRoll, 1000)
		
		return function()
			-- upvalues: ClearTimeoutFunction (upval), SetTimeoutResult (copy)
			ClearTimeoutFunction(SetTimeoutResult)
		end
	end, { Phase, Actions.endRoll })
	React.useEffect(function()
		-- upvalues: Actions (copy)
		return function()
			-- upvalues: Actions (upval)
			Actions.cancelFetch()
		end
	end, { Actions.cancelFetch })
	React.useEffect(function()
		-- upvalues: Phase (copy), SquadLuckyRecommendationPhase (upval), UseLuckyRecommendationAnalyticsResult (copy), EventNamesModule (upval), UniverseId (copy), State (copy)
		if Phase == SquadLuckyRecommendationPhase.Revealed then
			UseLuckyRecommendationAnalyticsResult.fire(EventNamesModule.LuckyRecommendationRevealShown, { universeId = UniverseId })
			
			return
		end
		if Phase == SquadLuckyRecommendationPhase.Errored then
			UseLuckyRecommendationAnalyticsResult.fire(EventNamesModule.LuckyRecommendationErrorShown, { errorType = State.error })
		end
	end, {
		Phase,
		UseLuckyRecommendationAnalyticsResult,
		State,
		UniverseId
	})
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	React.useEffect(function()
		-- upvalues: IsPhaseMatch (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), IsPhaseMatch1_1 (copy)
		if IsPhaseMatch then
			UseAnimatedBindingResult2(ReactOtterModule.ease(100, {
				duration = 1,
				startingValue = 0,
				easingStyle = Enum.EasingStyle.Quad
			}))
			
			return
		end
		if IsPhaseMatch1_1 then
			UseAnimatedBindingResult2(ReactOtterModule.ease(100, { duration = 0 }))
		end
	end, { IsPhaseMatch, IsPhaseMatch1_1, UseAnimatedBindingResult2 })
	local Config = if IsPhaseMatch1 then {
		title = UseLocalizationResult.revealedTitle,
		subtitle = UseLocalizationResult.revealedSubtitle,
		actionText = UseLocalizationResult.joinText,
		onAction = UseResult2,
		isActionDisabled = UseSignalStateResult or UseIsExperienceInviteRetryBlockedResult
	} elseif IsPhaseMatch1_1 then {
		title = UseLocalizationResult.errorTitle,
		actionText = UseLocalizationResult.retryText,
		onAction = UseResult11
	} else {
		title = UseLocalizationResult.rollingTitle,
		subtitle = UseLocalizationResult.rollingSubtitle,
		actionText = UseLocalizationResult.cancelText,
		onAction = UseResult1
	}
	local config = {
		Title = React.createElement(Text, {
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			LayoutOrder = 1,
			Text = Config.title,
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lucky-recommendation-dialog--title" else nil
		})
	}
	
	if Config.subtitle ~= nil then
		config.Subtitle = React.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			LayoutOrder = 2,
			Text = Config.subtitle,
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lucky-recommendation-dialog--subtitle" else nil
		})
	end
	local config1 = {
		Header = React.createElement(View, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, config)
	}
	
	if Recommendation then
		config1.GameResult = React.createElement(View, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-position-inner stroke-default radius-medium bg-surface-200",
			LayoutOrder = 2
		}, {
			Thumbnail = if RbxthumbWithTypeSizeAndOptions then React.createElement(Image, {
				tag = "radius-small",
				LayoutOrder = 1,
				Image = RbxthumbWithTypeSizeAndOptions,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lucky-recommendation-dialog--game-thumbnail" else nil
			}) else nil,
			GameInfo = React.createElement(View, {
				tag = "col align-y-center fill",
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000)
			}, {
				GameName = React.createElement(Text, {
					tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = Recommendation.universeName,
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lucky-recommendation-dialog--game-name" else nil
				})
			})
		})
	end
	if not IsPhaseMatch1_1 then
		config1.ProgressBar = React.createElement(View, {
			tag = "row align-y-center size-full-0",
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_500)
		}, {
			Bar = React.createElement(Progress, {
				shape = ProgressShape.Bar,
				size = ProgressSize.Medium,
				value = UseAnimatedBindingResult,
				width = UDim.new(1, 0),
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lucky-recommendation-dialog--progress" else nil
			})
		})
	end
	return (React.createElement(OverlayProvider, { DisplayOrder = 11 }, {
		Dialog = React.createElement(Dialog.Root, {
			onClose = UseResult1,
			size = DialogSize.Small,
			hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
			disablePortal = p1.disablePortal ~= nil and p1.disablePortal,
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lucky-recommendation-dialog" else nil
		}, {
			Content = React.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
				Main = React.createElement(View, {
					tag = "col size-full-0 auto-y",
					padding = {
						top = UDim.new(0, Size300 + UseTokensResult.Size.Size_200)
					}
				}, {
					Body = React.createElement(View, {
						tag = "col gap-large size-full-0 auto-y padding-bottom-large",
						LayoutOrder = 1
					}, config1),
					ActionButton = React.createElement(Button, {
						LayoutOrder = 2,
						onActivated = Config.onAction,
						text = Config.actionText,
						variant = ButtonVariant.Standard,
						width = UDim.new(1, 0),
						isDisabled = Config.isActionDisabled,
						testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lucky-recommendation-dialog--action-button" else nil
					})
				}),
				ResetButton = if IsPhaseMatch1 then React.createElement(View, {
					tag = "row align-x-center align-y-center auto-xy padding-small radius-circle clip bg-over-media-100",
					ZIndex = 2,
					onActivated = UseResult11,
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -UseTokensResult.Size.Size_1000, 0, Size300),
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lucky-recommendation-dialog--reroll-button" else nil
				}, {
					Icon = React.createElement(Icon, {
						name = "arrow-spin-clockwise",
						size = IconSize.Small,
						style = UseTokensResult.Color.Content.Emphasis
					})
				}) else nil
			})
		})
	}))
end