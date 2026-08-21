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
local eventNamesModule = require(parent.SquadsCore.EventNames)

return function(p0) --[[ line: 67 | named "SquadLobbyLuckyRecommendationModal" ]]
	-- upvalues: useTokens (ref), useDispatch (ref), react (ref), squadExternalContractContext (ref), useLuckyRecommendation (ref), useLuckyRecommendationAnalytics (ref), useLocalization (ref), squadLuckyRecommendationPhase (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), useSelector (ref), eventNamesModule (ref), createExperienceInviteModule (ref), squadExperienceInviteSource (ref), setTimeout (ref), clearTimeout (ref), reactOtterModule (ref), text (ref), view (ref), image (ref), progress (ref), progressShape (ref), progressSize (ref), overlayProvider (ref), dialog (ref), dialogSize (ref), button (ref), buttonVariant (ref), icon (ref), iconSize (ref)
	local var7 = useTokens()
	local var8 = useDispatch()
	local size300 = var7.Size.Size_300
	local var9 = react.useContext(squadExternalContractContext)
	local var10 = useLuckyRecommendation()
	local state = var10.state
	local actions = var10.actions
	local var11 = useLuckyRecommendationAnalytics(p0.sessionId)
	local var12 = useLocalization({
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
	local var13 = phase == squadLuckyRecommendationPhase.Rolling
	local var14 = phase == squadLuckyRecommendationPhase.Revealed
	local var14_1 = var14 or phase == squadLuckyRecommendationPhase.Errored
	local var16 = if state.phase == squadLuckyRecommendationPhase.Revealed then state.recommendation else nil
	local universeId = var16 and var16.universeId
	local rootPlaceId = var16 and var16.rootPlaceId
	local var19 = if universeId ~= nil then nil else getRbxthumbWithTypeSizeAndOptions(tostring(universeId), constants.RbxthumbTypes.GameIcon, 150, false)
	local var20 = useSelector(react.useCallback(function(p1) --[[ line: 107 ]]
		return p1.Squad and (p1.Squad.Squad and (p1.Squad.Squad.currentSquad and p1.Squad.Squad.currentSquad.squadId))
	end, {}))
	local var21 = useSelector(react.useCallback(function(p2) --[[ line: 115 ]]
		return p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentExperienceInvite)
	end, {}))
	local var22 = react.useCallback(function() --[[ line: 120 ]]
		-- upvalues: var11 (ref), eventNamesModule (copy), phase (ref), p0 (ref)
		var11.fire(eventNamesModule.LuckyRecommendationDismissed, { phaseAtDismiss = phase })
		p0.onClose()
	end, { var11, phase, p0.onClose })
	local var23 = react.useCallback(function() --[[ line: 127 ]]
		-- upvalues: var11 (ref), eventNamesModule (copy), phase (ref), actions (ref), var20 (ref)
		var11.fire(eventNamesModule.LuckyRecommendationRerolled, { phaseAtReroll = phase })
		actions.startRoll(var20, false)
	end, { actions.startRoll, var20, var11, phase })
	local var24 = react.useCallback(function() --[[ line: 134 ]]
		-- upvalues: var11 (ref), eventNamesModule (copy), rootPlaceId (ref), var8 (ref), createExperienceInviteModule (copy), var9 (ref), squadExperienceInviteSource (copy)
		local context = var11.getContext()
		var11.fire(eventNamesModule.LuckyRecommendationJoinTapped, { rootPlaceId = rootPlaceId })
		
		if rootPlaceId == nil then
			return
		end
		var8(createExperienceInviteModule(tostring(rootPlaceId), var9, squadExperienceInviteSource.LuckyRecommendation)):andThen(function(p3) --[[ line: 144 ]]
			-- upvalues: var11 (copy), eventNamesModule (copy), context (ref), rootPlaceId (copy)
			if p3 then
				var11.fire(eventNamesModule.LuckyRecommendationExperienceInviteCreated, {
					pickRequestId = context.pickRequestId,
					revealType = context.revealType,
					rootPlaceId = rootPlaceId,
					experienceInviteId = p3
				})
			end
		end)
	end, { var8, rootPlaceId, var9, var11 })
	react.useLayoutEffect(function() --[[ line: 156 ]]
		-- upvalues: actions (ref), var20 (ref)
		actions.startRoll(var20, true)
	end, { actions.startRoll, var20 })
	react.useEffect(function() --[[ line: 160 ]]
		-- upvalues: phase (ref), squadLuckyRecommendationPhase (copy), setTimeout (copy), actions (ref), clearTimeout (copy)
		if phase == squadLuckyRecommendationPhase.Rolling then
			local var31 = setTimeout(actions.endRoll, 1000)
			
			return function() --[[ line: 165 ]]
				-- upvalues: clearTimeout (copy), var31 (ref)
				clearTimeout(var31)
			end
		end
	end, { phase, actions.endRoll })
	react.useEffect(function() --[[ line: 170 ]]
		-- upvalues: actions (ref)
		return function() --[[ line: 171 ]]
			-- upvalues: actions (copy)
			actions.cancelFetch()
		end
	end, { actions.cancelFetch })
	react.useEffect(function() --[[ line: 176 ]]
		-- upvalues: phase (ref), squadLuckyRecommendationPhase (copy), var11 (ref), eventNamesModule (copy), universeId (ref), state (ref)
		if phase == squadLuckyRecommendationPhase.Revealed then
			var11.fire(eventNamesModule.LuckyRecommendationRevealShown, { universeId = universeId })
			
			return
		elseif phase == squadLuckyRecommendationPhase.Errored then
			var11.fire(eventNamesModule.LuckyRecommendationErrorShown, { errorType = state.error })
		end
	end, { phase, var11, state, universeId })
	local var25, var26 = reactOtterModule.useAnimatedBinding(0)
	react.useEffect(function() --[[ line: 190 ]]
		-- upvalues: var13 (ref), var26 (ref), reactOtterModule (copy), var14_1 (ref)
		if var13 then
			var26(reactOtterModule.ease(100, {
				duration = 1,
				startingValue = 0,
				easingStyle = Enum.EasingStyle.Quad
			}))
			
			return
		elseif var14_1 then
			var26(reactOtterModule.ease(100, { duration = 0 }))
		end
	end, { var13, var14_1, var26 })
	local var27 = if var14 then {
		title = var12.revealedTitle,
		subtitle = var12.revealedSubtitle,
		actionText = var12.joinText,
		onAction = var24,
		isActionDisabled = var21 ~= nil
	} elseif not var14_1 then {
		title = var12.rollingTitle,
		subtitle = var12.rollingSubtitle,
		actionText = var12.cancelText,
		onAction = var22
	} else {
		title = var12.errorTitle,
		actionText = var12.retryText,
		onAction = var23
	}
	local t = {
		Title = react.createElement(text, {
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			LayoutOrder = 1,
			Text = var27.title
		})
	}
	
	if var27.subtitle ~= nil then
		t.Subtitle = react.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			LayoutOrder = 2,
			Text = var27.subtitle
		})
	end
	local t_1 = {
		Header = react.createElement(view, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, t)
	}
	
	if var16 then
		t_1.GameResult = react.createElement(view, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-position-inner stroke-default radius-medium bg-surface-200",
			LayoutOrder = 2
		}, {
			Thumbnail = if var19 then react.createElement(image, {
				tag = "radius-small",
				LayoutOrder = 1,
				Image = var19,
				Size = UDim2.fromOffset(var7.Size.Size_1000, var7.Size.Size_1000)
			}) else nil,
			GameInfo = react.createElement(view, {
				tag = "col align-y-center fill",
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var7.Size.Size_1000)
			}, {
				GameName = react.createElement(text, {
					tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var16.universeName
				})
			})
		})
	end
	if not var14_1 then
		t_1.ProgressBar = react.createElement(view, {
			tag = "row align-y-center size-full-0",
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, var7.Size.Size_500)
		}, {
			Bar = react.createElement(progress, {
				shape = progressShape.Bar,
				size = progressSize.Medium,
				value = var25,
				width = UDim.new(1, 0)
			})
		})
	end
	return react.createElement(overlayProvider, { DisplayOrder = 11 }, {
		Dialog = react.createElement(dialog.Root, {
			onClose = var22,
			size = dialogSize.Small,
			hasBackdrop = p0.hasBackdrop ~= nil or p0.hasBackdrop,
			disablePortal = if p0.disablePortal ~= nil then false else p0.disablePortal
		}, {
			Content = react.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
				Main = react.createElement(view, {
					tag = "col size-full-0 auto-y",
					padding = { top = UDim.new(0, size300 + var7.Size.Size_200) }
				}, {
					Body = react.createElement(view, {
						tag = "col gap-large size-full-0 auto-y padding-bottom-large",
						LayoutOrder = 1
					}, t_1),
					ActionButton = react.createElement(button, {
						LayoutOrder = 2,
						onActivated = var27.onAction,
						text = var27.actionText,
						variant = buttonVariant.Standard,
						width = UDim.new(1, 0),
						isDisabled = var27.isActionDisabled
					})
				}),
				ResetButton = if var14 then react.createElement(view, {
					tag = "row align-x-center align-y-center auto-xy padding-small radius-circle clip bg-over-media-100",
					ZIndex = 2,
					onActivated = var23,
					Size = UDim2.fromOffset(var7.Size.Size_1000, var7.Size.Size_1000),
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -var7.Size.Size_1000, 0, size300)
				}, {
					Icon = react.createElement(icon, {
						name = "arrow-spin-clockwise",
						size = iconSize.Small,
						style = var7.Color.Content.Emphasis
					})
				}) else nil
			})
		})
	})
end