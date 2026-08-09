local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
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
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local eventNames = momentsCommonModule.Analytics.EventNames
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)

return function(p0) --[[ line: 58 | named "MusicOverlay" ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useCreationFlowStringsModule (ref), getMusicStoreModule (ref), useState (ref), useEffect (ref), signalsModule (ref), useAudioPlaybackModule (ref), useCallback (ref), fireAnalyticsEventModule (ref), eventNames (ref), reactModule (ref), musicEditorModule (ref), view (ref), foundationModule (ref), text (ref), icon (ref), textInput (ref), magnifyingGlass (ref), scrollView (ref), scrollBarVisibility (ref), dashModule (ref), musicPreviewItemModule (ref)
	local controller = p0.controller
	local playback = controller.preview.playback
	local var13 = useDeviceInsets()
	local var14 = useTokens()
	local var15 = useCreationFlowStringsModule()
	local var16 = getMusicStoreModule()
	local var17, var18 = useState("")
	local var19, var20 = useState(nil)
	local var21, var22 = useState(false)
	local var23, var24 = useState(playback.getTimeLength(false))
	local var25, var26 = useState(var16.getResults(false))
	useEffect(function() --[[ line: 74 ]]
		-- upvalues: signalsModule (copy), var24 (ref), playback (ref), var26 (ref), var16 (ref)
		return signalsModule.createEffect(function(p1) --[[ line: 75 ]]
			-- upvalues: var24 (copy), playback (copy), var26 (copy), var16 (copy)
			var24(playback.getTimeLength(p1))
			var26(var16.getResults(p1))
		end)
	end, { playback, var16 })
	local var27, var28 = useState(nil)
	useEffect(function() --[[ line: 83 ]]
		-- upvalues: signalsModule (copy), controller (ref), var28 (ref)
		return signalsModule.createEffect(function(p2) --[[ line: 84 ]]
			-- upvalues: controller (copy), var28 (copy)
			local activeSession = controller.getActiveSession(p2)
			var28(if activeSession ~= nil then nil else activeSession.getDraft(p2))
		end)
	end, { controller })
	local var29 = useAudioPlaybackModule(var19 ~= nil, var19, { autoplay = true, looping = false })
	useEffect(function() --[[ line: 97 ]]
		-- upvalues: playback (ref), var16 (ref), var23 (ref)
		playback.pause()
		var16.search("", var23)
	end, { var23 })
	useEffect(function() --[[ line: 103 ]]
		-- upvalues: var29 (ref), var20 (ref)
		if not var29.playback.isPlaying then
			var20(nil)
		end
	end, { var29.playback.isPlaying })
	local var30 = useCallback(function() --[[ line: 109 ]]
		-- upvalues: playback (ref), controller (ref)
		playback.play()
		playback.setMuted(false)
		controller.discardActiveTool()
	end, { controller, playback })
	local var31 = useCallback(function(p3) --[[ line: 115 ]]
		-- upvalues: controller (ref), var20 (ref), var22 (ref), fireAnalyticsEventModule (copy), eventNames (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, assetId = p3 })
		end
		var20(nil)
		var22(true)
		fireAnalyticsEventModule(eventNames.EditingFlowMusicSelected, { musicAssetId = tostring(p3) })
	end, { controller })
	local var32 = useCallback(function() --[[ line: 131 ]]
		-- upvalues: controller (ref), var22 (ref), playback (ref)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(nil)
		end
		var22(false)
		playback.pause()
	end, { controller, playback })
	local var33 = useCallback(function() --[[ line: 140 ]]
		-- upvalues: var22 (ref), playback (ref), controller (ref)
		var22(false)
		playback.play()
		playback.setMuted(false)
		controller.commitActiveTool()
	end, { controller, playback })
	local var34 = useCallback(function(p4) --[[ line: 147 ]]
		-- upvalues: controller (ref)
		local activeSession = controller.getActiveSession(false)
		local var42 = if activeSession ~= nil then nil else activeSession.getDraft(false)
		
		if activeSession ~= nil and var42 ~= nil then
			activeSession.update({ assetId = var42.assetId, startTime = p4 })
		end
	end, { controller })
	local var35 = useCallback(function(p5) --[[ line: 157 ]]
		-- upvalues: var19 (ref), var20 (ref), var29 (ref)
		if var19 == p5 then
			var20(nil)
			
			return
		end
		var20(p5)
		var29.playback.play()
	end, { var19 })
	local var36 = useCallback(function() --[[ line: 167 ]]
		-- upvalues: var19 (ref), var20 (ref), var16 (ref), var17 (ref), var23 (ref)
		if var19 ~= nil then
			var20(nil)
		end
		var16.search(var17, var23)
	end, { var19, var17, var23 })
	
	if var21 and var27 ~= nil then
		return reactModule.createElement(musicEditorModule, {
			controller = controller,
			musicEdit = var27,
			onBack = var32,
			onDone = var33,
			onStartTimeChanged = var34
		})
	end
	local duration = var29.timeline.duration
	local var37 = if duration > 0 then var29.timeline.elapsed / duration else 0
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-top gap-small position-bottom-center anchor-bottom-center size-full-0 radius-medium bg-surface-100",
		ZIndex = 5,
		onActivated = function() --[[ line: 188 ]] end,
		Size = UDim2.fromScale(1, 0.666666666667),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		padding = {
			top = UDim.new(0, var14.Padding.Medium),
			left = UDim.new(0, math.max(var13.left, var14.Padding.XLarge)),
			right = UDim.new(0, math.max(var13.right, var14.Padding.XLarge))
		}
	}, {
		ModalHeaderBar = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row flex-x-between align-x-center align-y-center size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small text-align-x-left text-align-y-top text-truncate-end content-action-emphasis",
				Text = var15.EditingCtaMusic
			}),
			CloseButton = reactModule.createElement(view, {
				tag = "auto-xy padding-medium radius-medium",
				LayoutOrder = 2,
				onActivated = var30
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					style = var14.Color.ActionEmphasis.Foreground
				})
			})
		}),
		SearchBar = reactModule.createElement(textInput, {
			label = "",
			LayoutOrder = 2,
			iconLeading = magnifyingGlass,
			text = var17,
			placeholder = var15.GeneralSearchPlaceholder,
			onChanged = var18,
			onReturnPressed = var36,
			onFocusLost = var36,
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
				Padding = UDim.new(0, var14.Gap.Small)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				scrollBarVisibility = scrollBarVisibility.None,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, if #var25 > 0 then dashModule.map(var25, function(p6, p7) --[[ line: 255 ]]
			-- upvalues: reactModule (copy), musicPreviewItemModule (copy), var31 (ref), var35 (ref), var19 (ref), var37 (ref)
			return reactModule.createElement(musicPreviewItemModule, {
				key = p6.AssetId,
				layoutOrder = p7,
				musicAssetId = p6.AssetId,
				onMusicSelected = var31,
				togglePreviewMusic = var35,
				progress = if var19 == p6.AssetId then var37 else nil,
				isPreviewing = var19 == p6.AssetId
			})
		end) else {
			NoResults = reactModule.createElement(text, {
				tag = "text-body-medium text-align-x-center content-action-emphasis",
				Text = var15.MusicNoResults
			})
		})
	})
end