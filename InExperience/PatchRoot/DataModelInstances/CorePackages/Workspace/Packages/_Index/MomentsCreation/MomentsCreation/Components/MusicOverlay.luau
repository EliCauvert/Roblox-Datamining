local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local button = foundationModule.Button
local icon = foundationModule.Icon
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local textInput = foundationModule.TextInput
local view = foundationModule.View
local magnifyingGlass = builderIconsModule.Icon.MagnifyingGlass
local useAudioPlaybackModule = require(momentsCreation.Hooks.useAudioPlayback)
local musicEditorModule = require(momentsCreation.Components.MusicEditor)
local musicPreviewItemModule = require(momentsCreation.Components.MusicPreviewItem)
local getMusicStoreModule = require(momentsCreation.Stores.GetMusicStore)
local getFFlagMomentsCreationMusicSearchStateFixModule = require(momentsCreation.Flags.GetFFlagMomentsCreationMusicSearchStateFix)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)

return function(p0)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), getMusicStoreModule (ref), useState (ref), useEffect (ref), signalsModule (ref), useAudioPlaybackModule (ref), useCallback (ref), makeCreationEventFieldsModule (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), reactModule (ref), musicEditorModule (ref), getFFlagMomentsCreationMusicSearchStateFixModule (ref), dashModule (ref), musicPreviewItemModule (ref), text (ref), button (ref), foundationModule (ref), view (ref), icon (ref), textInput (ref), magnifyingGlass (ref), scrollView (ref), scrollBarVisibility (ref)
	local controller = p0.controller
	local playback = controller.preview.playback
	local var15 = useDeviceInsets()
	local var16 = useTokens()
	local var17 = useCreationFlowStringsModule()
	local var18 = getMusicStoreModule()
	local var19, var20 = useState("")
	local var21, var22 = useState(nil)
	local var23, var24 = useState(false)
	local var25, var26 = useState(playback.getTimeLength(false))
	local var27, var28 = useState(var18.getResults(false))
	local var29, var30 = useState(var18.getSearchStatus(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var26 (ref), playback (ref), var28 (ref), var18 (ref), var30 (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var26 (copy), playback (copy), var28 (copy), var18 (copy), var30 (copy)
			var26(playback.getTimeLength(p1))
			var28(var18.getResults(p1))
			var30(var18.getSearchStatus(p1))
		end)
	end, { playback, var18 })
	local var31, var32 = useState(nil)
	useEffect(function()
		-- upvalues: signalsModule (copy), controller (ref), var32 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: controller (copy), var32 (copy)
			local activeSession = controller.getActiveSession(p2)
			var32(if activeSession ~= nil then nil else activeSession.getDraft(p2))
		end)
	end, { controller })
	local var33 = useAudioPlaybackModule(var21 ~= nil, var21, { autoplay = true, looping = false })
	useEffect(function()
		-- upvalues: playback (ref), var18 (ref), var25 (ref)
		playback.pause()
		var18.search("", var25)
	end, { var25 })
	useEffect(function()
		-- upvalues: var33 (ref), var22 (ref)
		if not var33.playback.isPlaying then
			var22(nil)
		end
	end, { var33.playback.isPlaying })
	local var34 = useCallback(function()
		-- upvalues: playback (ref), controller (ref)
		playback.play()
		playback.setMuted(false)
		controller.discardActiveTool()
	end, { controller, playback })
	local var35 = useCallback(function(p3)
		-- upvalues: controller (ref), var22 (ref), var24 (ref), makeCreationEventFieldsModule (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, assetId = p3 })
		end
		var22(nil)
		var24(true)
		local t = { musicAssetId = tostring(p3) }
		
		for i, v in makeCreationEventFieldsModule.makeToolFieldFromKind("music") do
			t[i] = v
		end
		for i_1, v_1 in makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)) do
			t[i_1] = v_1
		end
		fireAnalyticsEventModule(eventNames.EditingFlowMusicSelected, t)
	end, { controller })
	local var36 = useCallback(function()
		-- upvalues: controller (ref), var24 (ref), playback (ref)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(nil)
		end
		var24(false)
		playback.pause()
	end, { controller, playback })
	local var37 = useCallback(function()
		-- upvalues: var24 (ref), playback (ref), controller (ref)
		var24(false)
		playback.play()
		playback.setMuted(false)
		controller.commitActiveTool()
	end, { controller, playback })
	local var38 = useCallback(function(p4)
		-- upvalues: controller (ref)
		local activeSession = controller.getActiveSession(false)
		local var49 = if activeSession ~= nil then nil else activeSession.getDraft(false)
		
		if activeSession ~= nil and var49 ~= nil then
			activeSession.update({ assetId = var49.assetId, startTime = p4 })
		end
	end, { controller })
	local var39 = useCallback(function(p5)
		-- upvalues: var21 (ref), var22 (ref), var33 (ref)
		if var21 == p5 then
			var22(nil)
			
			return
		end
		var22(p5)
		var33.playback.play()
	end, { var21 })
	local var40 = useCallback(function()
		-- upvalues: var21 (ref), var22 (ref), var18 (ref), var19 (ref), var25 (ref)
		if var21 ~= nil then
			var22(nil)
		end
		var18.search(var19, var25)
	end, { var21, var19, var25 })
	local var41 = useCallback(function()
		-- upvalues: var18 (ref), var19 (ref), var25 (ref)
		var18.search(var19, var25)
	end, { var18, var19, var25 })
	
	if var23 and var31 ~= nil then
		return reactModule.createElement(musicEditorModule, {
			controller = controller,
			musicEdit = var31,
			onBack = var36,
			onDone = var37,
			onStartTimeChanged = var38
		})
	end
	local duration = var33.timeline.duration
	local var42 = if duration > 0 then var33.timeline.elapsed / duration else 0
	local var43 = getFFlagMomentsCreationMusicSearchStateFixModule()
	local _ = nil
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-top gap-small position-bottom-center anchor-bottom-center size-full-0 radius-medium bg-surface-100",
		ZIndex = 5,
		onActivated = function() end,
		Size = UDim2.fromScale(1, 0.666666666667),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		padding = {
			top = UDim.new(0, var16.Padding.Medium),
			left = UDim.new(0, math.max(var15.left, var16.Padding.XLarge)),
			right = UDim.new(0, math.max(var15.right, var16.Padding.XLarge))
		}
	}, {
		ModalHeaderBar = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row flex-x-between align-x-center align-y-center size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left text-align-y-top text-truncate-end content-action-emphasis",
				Text = var17.EditingCtaMusic
			}),
			CloseButton = reactModule.createElement(view, {
				tag = "auto-xy padding-medium radius-medium",
				LayoutOrder = 2,
				onActivated = var34
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					style = var16.Color.ActionEmphasis.Foreground
				})
			})
		}),
		SearchBar = reactModule.createElement(textInput, {
			label = "",
			LayoutOrder = 2,
			iconLeading = magnifyingGlass,
			text = var19,
			placeholder = var17.GeneralSearchPlaceholder,
			onChanged = var20,
			onReturnPressed = var40,
			onFocusLost = var40,
			width = UDim.new(1, 0)
		}),
		ScrollView = reactModule.createElement(scrollView, {
			LayoutOrder = 3,
			tag = "col align-x-left align-y-top size-full",
			flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, var16.Gap.Small)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				scrollBarVisibility = scrollBarVisibility.None,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, if #var27 > 0 then dashModule.map(var27, function(p6, p7)
			-- upvalues: reactModule (copy), musicPreviewItemModule (copy), var35 (ref), var39 (ref), var21 (ref), var42 (ref)
			return reactModule.createElement(musicPreviewItemModule, {
				key = p6.AssetId,
				layoutOrder = p7,
				musicAssetId = p6.AssetId,
				onMusicSelected = var35,
				togglePreviewMusic = var39,
				progress = if var21 == p6.AssetId then var42 else nil,
				isPreviewing = var21 == p6.AssetId
			})
		end) elseif var43 and var29 == "loading" then nil elseif var43 and var29 == "error" then {
			SearchError = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-y text-body-medium text-align-x-center content-action-emphasis",
				Text = var17.MusicSearchError
			}),
			Retry = reactModule.createElement(button, {
				LayoutOrder = 2,
				onActivated = var41,
				size = foundationModule.Enums.InputSize.Small,
				text = var17.GeneralCtaRetry,
				variant = foundationModule.Enums.ButtonVariant.Standard
			})
		} else {
			NoResults = reactModule.createElement(text, {
				tag = "text-body-medium text-align-x-center content-action-emphasis",
				Text = var17.MusicNoResults
			})
		})
	})
end