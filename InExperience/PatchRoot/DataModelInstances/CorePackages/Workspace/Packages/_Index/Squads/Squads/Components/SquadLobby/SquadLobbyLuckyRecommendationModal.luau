local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local foundation = dependenciesModule.Foundation
local luauPolyfill = dependenciesModule.LuauPolyfill
local useSelector = dependenciesModule.Hooks.useSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useLocalization = dependenciesModule.Hooks.useLocalization
local setTimeout = luauPolyfill.setTimeout
local clearTimeout = luauPolyfill.clearTimeout
local buttonVariant = foundation.Enums.ButtonVariant
local dialogSize = foundation.Enums.DialogSize
local iconSize = foundation.Enums.IconSize
local progressShape = foundation.Enums.ProgressShape
local progressSize = foundation.Enums.ProgressSize
local button = foundation.Button
local dialog = foundation.Dialog
local icon = foundation.Icon
local image = foundation.Image
local overlayProvider = foundation.OverlayProvider
local progress = foundation.Progress
local text = foundation.Text
local view = foundation.View
local useTokens = foundation.Hooks.useTokens
local reactOtterModule = require(parent.ReactOtter)
local getRbxthumbWithTypeSizeAndOptions = require(parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local constants = require(parent.UserLib).Utils.Constants
local createExperienceInviteModule = require(squads.Thunks.CreateExperienceInvite)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local enumsModule = require(parent.SquadsCore.Enums)
local squadExperienceInviteSource = enumsModule.SquadExperienceInviteSource
local squadLuckyRecommendationPhase = enumsModule.SquadLuckyRecommendationPhase
local hooksModule = require(parent.SquadsCore.Hooks)
local useLuckyRecommendation = hooksModule.useLuckyRecommendation
local useLuckyRecommendationAnalytics = hooksModule.useLuckyRecommendationAnalytics
local useIsExperienceInviteRetryBlocked = hooksModule.useIsExperienceInviteRetryBlocked
local fFlagSquadExperienceInviteRetryAfter = require(parent.SquadsCore.Flags).FFlagSquadExperienceInviteRetryAfter
local eventNamesModule = require(parent.SquadsCore.EventNames)

return function(p1)
	-- upvalues: useTokens (ref), useDispatch (ref), react (ref), squadExternalContractContext (ref), useLuckyRecommendation (ref), useLuckyRecommendationAnalytics (ref), useLocalization (ref), squadLuckyRecommendationPhase (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), useSelector (ref), fFlagSquadExperienceInviteRetryAfter (ref), useIsExperienceInviteRetryBlocked (ref), eventNamesModule (ref), createExperienceInviteModule (ref), squadExperienceInviteSource (ref), setTimeout (ref), clearTimeout (ref), reactOtterModule (ref), text (ref), view (ref), image (ref), progress (ref), progressShape (ref), progressSize (ref), overlayProvider (ref), dialog (ref), dialogSize (ref), button (ref), buttonVariant (ref), icon (ref), iconSize (ref)
	local var1 = useTokens()
	local var2 = useDispatch()
	local size300 = var1.Size.Size_300
	local var3 = react.useContext(squadExternalContractContext)
	local var4 = useLuckyRecommendation()
	local state = var4.state
	local actions = var4.actions
	local var5 = useLuckyRecommendationAnalytics(p1.sessionId)
	local var6 = useLocalization({
		rollingTitle = "Feature.Squads.Label.LuckyRecommendationRolling",
		rollingSubtitle = "Feature.Squads.Description.LuckyRecommendationRolling",
		revealedTitle = "Feature.Squads.Label.LuckyRecommendationRevealed",
		revealedSubtitle = "Feature.Squads.Description.LuckyRecommendationRevealed",
		errorTitle = "CommonUI.Messages.Response.SomethingWentWrong",
		joinText = "Feature.Squads.Action.JoinWithParty",
		cancelText = "CommonUI.Controls.Action.Cancel",
		retryText = "Feature.Squads.Action.Retry"
	})
	local phase = state.phase
	local var7 = phase == squadLuckyRecommendationPhase.Rolling
	local var8 = phase == squadLuckyRecommendationPhase.Revealed
	local var9 = var8 or phase == squadLuckyRecommendationPhase.Errored
	local var10 = if state.phase == squadLuckyRecommendationPhase.Revealed then state.recommendation else nil
	local universeId = var10 and var10.universeId
	local rootPlaceId = var10 and var10.rootPlaceId
	local var11 = if universeId ~= nil then nil else getRbxthumbWithTypeSizeAndOptions(tostring(universeId), constants.RbxthumbTypes.GameIcon, 150, false)
	local var12 = useSelector(react.useCallback(function(p2)
		return p2.Squad and (p2.Squad.Squad and (p2.Squad.Squad.currentSquad and p2.Squad.Squad.currentSquad.squadId))
	end, {}))
	local var13 = useSelector(react.useCallback(function(p2)
		return p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentExperienceInvite)
	end, {}))
	local var14 = if fFlagSquadExperienceInviteRetryAfter then useIsExperienceInviteRetryBlocked(var12) else false
	local var15 = react.useCallback(function()
		-- upvalues: var5 (ref), eventNamesModule (copy), phase (ref), p1 (ref)
		var5.fire(eventNamesModule.LuckyRecommendationDismissed, { phaseAtDismiss = phase })
		p1.onClose()
	end, { var5, phase, p1.onClose })
	local var16 = react.useCallback(function()
		-- upvalues: var5 (ref), eventNamesModule (copy), phase (ref), actions (ref), var12 (ref)
		var5.fire(eventNamesModule.LuckyRecommendationRerolled, { phaseAtReroll = phase })
		actions.startRoll(var12, false)
	end, { actions.startRoll, var12, var5, phase })
	local var17 = react.useCallback(function()
		-- upvalues: var5 (ref), eventNamesModule (copy), rootPlaceId (ref), var2 (ref), createExperienceInviteModule (copy), var3 (ref), squadExperienceInviteSource (copy)
		local context = var5.getContext()
		var5.fire(eventNamesModule.LuckyRecommendationJoinTapped, { rootPlaceId = rootPlaceId })
		
		if rootPlaceId == nil then
			return
		end
		var2(createExperienceInviteModule(tostring(rootPlaceId), var3, squadExperienceInviteSource.LuckyRecommendation)):andThen(function(p2)
			-- upvalues: var5 (copy), eventNamesModule (copy), context (ref), rootPlaceId (copy)
			if p2 then
				var5.fire(eventNamesModule.LuckyRecommendationExperienceInviteCreated, {
					pickRequestId = context.pickRequestId,
					revealType = context.revealType,
					rootPlaceId = rootPlaceId,
					experienceInviteId = p2
				})
			end
		end)
	end, { var2, rootPlaceId, var3, var5 })
	react.useLayoutEffect(function()
		-- upvalues: actions (ref), var12 (ref)
		actions.startRoll(var12, true)
	end, { actions.startRoll, var12 })
	react.useEffect(function()
		-- upvalues: phase (ref), squadLuckyRecommendationPhase (copy), setTimeout (copy), actions (ref), clearTimeout (copy)
		if phase == squadLuckyRecommendationPhase.Rolling then
			local var18 = setTimeout(actions.endRoll, 1000)
			
			return function()
				-- upvalues: clearTimeout (copy), var18 (ref)
				clearTimeout(var18)
			end
		end
	end, { phase, actions.endRoll })
	react.useEffect(function()
		-- upvalues: actions (ref)
		return function()
			-- upvalues: actions (copy)
			actions.cancelFetch()
		end
	end, { actions.cancelFetch })
	react.useEffect(function()
		-- upvalues: phase (ref), squadLuckyRecommendationPhase (copy), var5 (ref), eventNamesModule (copy), universeId (ref), state (ref)
		if phase == squadLuckyRecommendationPhase.Revealed then
			var5.fire(eventNamesModule.LuckyRecommendationRevealShown, { universeId = universeId })
			
			return
		elseif phase == squadLuckyRecommendationPhase.Errored then
			var5.fire(eventNamesModule.LuckyRecommendationErrorShown, { errorType = state.error })
		end
	end, { phase, var5, state, universeId })
	local var18, var19 = reactOtterModule.useAnimatedBinding(0)
	react.useEffect(function()
		-- upvalues: var7 (ref), var19 (ref), reactOtterModule (copy), var9 (ref)
		if var7 then
			var19(reactOtterModule.ease(100, {
				duration = 1,
				startingValue = 0,
				easingStyle = Enum.EasingStyle.Quad
			}))
			
			return
		elseif var9 then
			var19(reactOtterModule.ease(100, { duration = 0 }))
		end
	end, { var7, var9, var19 })
	local var20 = if var8 then {
		title = var6.revealedTitle,
		subtitle = var6.revealedSubtitle,
		actionText = var6.joinText,
		onAction = var17,
		isActionDisabled = if var13 == nil then var14 else true
	} elseif not var9 then {
		title = var6.rollingTitle,
		subtitle = var6.rollingSubtitle,
		actionText = var6.cancelText,
		onAction = var15
	} else {
		title = var6.errorTitle,
		actionText = var6.retryText,
		onAction = var16
	}
	local t = {
		Title = react.createElement(text, {
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			LayoutOrder = 1,
			Text = var20.title
		})
	}
	
	if var20.subtitle ~= nil then
		t.Subtitle = react.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			LayoutOrder = 2,
			Text = var20.subtitle
		})
	end
	local t_1 = {
		Header = react.createElement(view, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, t)
	}
	
	if var10 then
		t_1.GameResult = react.createElement(view, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-position-inner stroke-default radius-medium bg-surface-200",
			LayoutOrder = 2
		}, {
			Thumbnail = if var11 then react.createElement(image, {
				tag = "radius-small",
				LayoutOrder = 1,
				Image = var11,
				Size = UDim2.fromOffset(var1.Size.Size_1000, var1.Size.Size_1000)
			}) else nil,
			GameInfo = react.createElement(view, {
				tag = "col align-y-center fill",
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var1.Size.Size_1000)
			}, {
				GameName = react.createElement(text, {
					tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var10.universeName
				})
			})
		})
	end
	if not var9 then
		t_1.ProgressBar = react.createElement(view, {
			tag = "row align-y-center size-full-0",
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, var1.Size.Size_500)
		}, {
			Bar = react.createElement(progress, {
				shape = progressShape.Bar,
				size = progressSize.Medium,
				value = var18,
				width = UDim.new(1, 0)
			})
		})
	end
	return react.createElement(overlayProvider, { DisplayOrder = 11 }, {
		Dialog = react.createElement(dialog.Root, {
			onClose = var15,
			size = dialogSize.Small,
			hasBackdrop = p1.hasBackdrop ~= nil or p1.hasBackdrop,
			disablePortal = if p1.disablePortal ~= nil then false else p1.disablePortal
		}, {
			Content = react.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
				Main = react.createElement(view, {
					tag = "col size-full-0 auto-y",
					padding = { top = UDim.new(0, size300 + var1.Size.Size_200) }
				}, {
					Body = react.createElement(view, {
						tag = "col gap-large size-full-0 auto-y padding-bottom-large",
						LayoutOrder = 1
					}, t_1),
					ActionButton = react.createElement(button, {
						LayoutOrder = 2,
						onActivated = var20.onAction,
						text = var20.actionText,
						variant = buttonVariant.Standard,
						width = UDim.new(1, 0),
						isDisabled = var20.isActionDisabled
					})
				}),
				ResetButton = if var8 then react.createElement(view, {
					tag = "row align-x-center align-y-center auto-xy padding-small radius-circle clip bg-over-media-100",
					ZIndex = 2,
					onActivated = var16,
					Size = UDim2.fromOffset(var1.Size.Size_1000, var1.Size.Size_1000),
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -var1.Size.Size_1000, 0, size300)
				}, {
					Icon = react.createElement(icon, {
						name = "arrow-spin-clockwise",
						size = iconSize.Small,
						style = var1.Color.Content.Emphasis
					})
				}) else nil
			})
		})
	})
end