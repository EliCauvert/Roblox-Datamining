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

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), getMusicStoreModule (ref), useState (ref), useEffect (ref), signalsModule (ref), useAudioPlaybackModule (ref), useCallback (ref), makeCreationEventFieldsModule (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), reactModule (ref), musicEditorModule (ref), getFFlagMomentsCreationMusicSearchStateFixModule (ref), dashModule (ref), musicPreviewItemModule (ref), text (ref), button (ref), foundationModule (ref), view (ref), icon (ref), textInput (ref), magnifyingGlass (ref), scrollView (ref), scrollBarVisibility (ref)
	local controller = p1.controller
	local playback = controller.preview.playback
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local var3 = useCreationFlowStringsModule()
	local var4 = getMusicStoreModule()
	local var5, var6 = useState("")
	local var7, var8 = useState(nil)
	local var9, var10 = useState(false)
	local var11, var12 = useState(playback.getTimeLength(false))
	local var13, var14 = useState(var4.getResults(false))
	local var15, var16 = useState(var4.getSearchStatus(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var12 (ref), playback (ref), var14 (ref), var4 (ref), var16 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var12 (copy), playback (copy), var14 (copy), var4 (copy), var16 (copy)
			var12(playback.getTimeLength(p2))
			var14(var4.getResults(p2))
			var16(var4.getSearchStatus(p2))
		end)
	end, { playback, var4 })
	local var17, var18 = useState(nil)
	useEffect(function()
		-- upvalues: signalsModule (copy), controller (ref), var18 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: controller (copy), var18 (copy)
			local activeSession = controller.getActiveSession(p2)
			var18(if activeSession ~= nil then nil else activeSession.getDraft(p2))
		end)
	end, { controller })
	local var19 = useAudioPlaybackModule(var7 ~= nil, var7, { autoplay = true, looping = false })
	useEffect(function()
		-- upvalues: playback (ref), var4 (ref), var11 (ref)
		playback.pause()
		var4.search("", var11)
	end, { var11 })
	useEffect(function()
		-- upvalues: var19 (ref), var8 (ref)
		if not var19.playback.isPlaying then
			var8(nil)
		end
	end, { var19.playback.isPlaying })
	local var20 = useCallback(function()
		-- upvalues: playback (ref), controller (ref)
		playback.play()
		playback.setMuted(false)
		controller.discardActiveTool()
	end, { controller, playback })
	local var21 = useCallback(function(p2)
		-- upvalues: controller (ref), var8 (ref), var10 (ref), makeCreationEventFieldsModule (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, assetId = p2 })
		end
		var8(nil)
		var10(true)
		local t = { musicAssetId = tostring(p2) }
		
		for i, v in makeCreationEventFieldsModule.makeToolFieldFromKind("music") do
			t[i] = v
		end
		for i_1, v_1 in makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)) do
			t[i_1] = v_1
		end
		fireAnalyticsEventModule(eventNames.EditingFlowMusicSelected, t)
	end, { controller })
	local var22 = useCallback(function()
		-- upvalues: controller (ref), var10 (ref), playback (ref)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(nil)
		end
		var10(false)
		playback.pause()
	end, { controller, playback })
	local var23 = useCallback(function()
		-- upvalues: var10 (ref), playback (ref), controller (ref)
		var10(false)
		playback.play()
		playback.setMuted(false)
		controller.commitActiveTool()
	end, { controller, playback })
	local var24 = useCallback(function(p3)
		-- upvalues: controller (ref)
		local activeSession = controller.getActiveSession(false)
		local var25 = if activeSession ~= nil then nil else activeSession.getDraft(false)
		
		if activeSession ~= nil and var25 ~= nil then
			activeSession.update({ assetId = var25.assetId, startTime = p3 })
		end
	end, { controller })
	local var25 = useCallback(function(p3)
		-- upvalues: var7 (ref), var8 (ref), var19 (ref)
		if var7 == p3 then
			var8(nil)
			
			return
		end
		var8(p3)
		var19.playback.play()
	end, { var7 })
	local var26 = useCallback(function()
		-- upvalues: var7 (ref), var8 (ref), var4 (ref), var5 (ref), var11 (ref)
		if var7 ~= nil then
			var8(nil)
		end
		var4.search(var5, var11)
	end, { var7, var5, var11 })
	local var27 = useCallback(function()
		-- upvalues: var4 (ref), var5 (ref), var11 (ref)
		var4.search(var5, var11)
	end, { var4, var5, var11 })
	
	if var9 and var17 ~= nil then
		return reactModule.createElement(musicEditorModule, {
			controller = controller,
			musicEdit = var17,
			onBack = var22,
			onDone = var23,
			onStartTimeChanged = var24
		})
	end
	local duration = var19.timeline.duration
	local var28 = if duration > 0 then var19.timeline.elapsed / duration else 0
	local var29 = getFFlagMomentsCreationMusicSearchStateFixModule()
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
			top = UDim.new(0, var2.Padding.Medium),
			left = UDim.new(0, math.max(var1.left, var2.Padding.XLarge)),
			right = UDim.new(0, math.max(var1.right, var2.Padding.XLarge))
		}
	}, {
		ModalHeaderBar = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row flex-x-between align-x-center align-y-center size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left text-align-y-top text-truncate-end content-action-emphasis",
				Text = var3.EditingCtaMusic
			}),
			CloseButton = reactModule.createElement(view, {
				tag = "auto-xy padding-medium radius-medium",
				LayoutOrder = 2,
				onActivated = var20
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					style = var2.Color.ActionEmphasis.Foreground
				})
			})
		}),
		SearchBar = reactModule.createElement(textInput, {
			label = "",
			LayoutOrder = 2,
			iconLeading = magnifyingGlass,
			text = var5,
			placeholder = var3.GeneralSearchPlaceholder,
			onChanged = var6,
			onReturnPressed = var26,
			onFocusLost = var26,
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
				Padding = UDim.new(0, var2.Gap.Small)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				scrollBarVisibility = scrollBarVisibility.None,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, if #var13 > 0 then dashModule.map(var13, function(p3, p4)
			-- upvalues: reactModule (copy), musicPreviewItemModule (copy), var21 (ref), var25 (ref), var7 (ref), var28 (ref)
			return reactModule.createElement(musicPreviewItemModule, {
				key = p3.AssetId,
				layoutOrder = p4,
				musicAssetId = p3.AssetId,
				onMusicSelected = var21,
				togglePreviewMusic = var25,
				progress = if var7 == p3.AssetId then var28 else nil,
				isPreviewing = var7 == p3.AssetId
			})
		end) elseif var29 and var15 == "loading" then nil elseif var29 and var15 == "error" then {
			SearchError = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-y text-body-medium text-align-x-center content-action-emphasis",
				Text = var3.MusicSearchError
			}),
			Retry = reactModule.createElement(button, {
				LayoutOrder = 2,
				onActivated = var27,
				size = foundationModule.Enums.InputSize.Small,
				text = var3.GeneralCtaRetry,
				variant = foundationModule.Enums.ButtonVariant.Standard
			})
		} else {
			NoResults = reactModule.createElement(text, {
				LayoutOrder = if var29 then 1 else nil,
				Text = var3.MusicNoResults,
				tag = {
					["auto-y padding-top-large text-body-medium text-align-x-center content-action-emphasis"] = var29,
					["text-body-medium text-align-x-center content-action-emphasis"] = not var29
				}
			})
		})
	})
end