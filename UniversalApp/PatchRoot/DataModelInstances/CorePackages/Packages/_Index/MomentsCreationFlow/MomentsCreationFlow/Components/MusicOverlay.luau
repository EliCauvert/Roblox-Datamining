local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local textInput = foundationModule.TextInput
local view = foundationModule.View
local magnifyingGlass = builderIconsModule.Icon.MagnifyingGlass
local musicEditorModule = require(momentsCreationFlow.Components.MusicEditor)
local musicPreviewItemModule = require(momentsCreationFlow.Components.MusicPreviewItem)
local searchMusicModule = require(momentsCreationFlow.Thunks.SearchMusic)
local useAudioPlayback = momentsCommonModule.Hooks.useAudioPlayback
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useDispatch = momentsCommonModule.Hooks.useDispatch
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useSelector = momentsCommonModule.Hooks.useSelector
local useTokens = foundationModule.Hooks.useTokens
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local constantsModule = require(momentsCreationFlow.Constants)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)
local eventNamesModule = require(momentsCreationFlow.Analytics.EventNames)

return function(p1)
	-- upvalues: useDeviceInsets (ref), useDispatch (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), useSelector (ref), constantsModule (ref), useMemo (ref), useAudioPlayback (ref), useEffect (ref), searchMusicModule (ref), useCallback (ref), eventNamesModule (ref), musicEditorModule (ref), view (ref), foundationModule (ref), text (ref), creationFlowLocalizationModule (ref), icon (ref), textInput (ref), magnifyingGlass (ref), scrollView (ref), scrollBarVisibility (ref), dashModule (ref), musicPreviewItemModule (ref)
	local var1 = useDeviceInsets()
	local var2 = useDispatch()
	local var3 = useTokens()
	local var4, var5 = reactModule.useState("")
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useContext(creationFlowContextModule)
	local var11 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CreationFlow.musicList
	end)
	local var12 = useAudioPlayback(var8 ~= nil, useMemo(function()
		-- upvalues: var8 (ref)
		return if var8 then tostring(var8) else nil
	end, { var8 }), { autoplay = true, looping = false })
	useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), searchMusicModule (copy)
		p1.playbackController.playback.pause()
		var2(searchMusicModule("", p1.playbackController.timeline.timeLength))
	end, { p1.playbackController.timeline.timeLength })
	useEffect(function()
		-- upvalues: var12 (ref), var9 (ref)
		if not var12.playback.isPlaying then
			var9(nil)
		end
	end, { var12.playback.isPlaying })
	local var13 = useCallback(function(p2)
		-- upvalues: p1 (ref), var9 (ref), var7 (ref), var10 (ref), eventNamesModule (copy)
		p1.onMusicUpdate({ startTime = 0, assetId = p2 })
		p1.playbackController.timeline.seek(0)
		var9(nil)
		var7(true)
		var10.fireEvent(eventNamesModule.EditingFlowMusicSelected, { musicAssetId = tostring(p2) })
	end, { p1.onMusicUpdate })
	local var14 = useCallback(function()
		-- upvalues: p1 (ref)
		p1.onMusicDiscard()
		p1.playbackController.playback.play()
		p1.playbackController.volume.unmute()
	end, { p1.onMusicDiscard })
	local var15 = useCallback(function()
		-- upvalues: p1 (ref), var7 (ref)
		p1.onMusicUpdate(nil)
		var7(false)
		p1.playbackController.playback.pause()
	end, { p1.onMusicUpdate })
	local var16 = useCallback(function()
		-- upvalues: p1 (ref), var7 (ref)
		p1.onMusicSave()
		var7(false)
		p1.playbackController.playback.play()
		p1.playbackController.volume.unmute()
	end, { p1.onMusicSave })
	local var17 = useCallback(function(p2)
		-- upvalues: var8 (ref), var9 (ref), var12 (ref)
		if var8 and var8 == p2 then
			var9(nil)
			
			return
		end
		var9(p2)
		var12.playback.play()
	end, { var8 })
	local var18 = useCallback(function()
		-- upvalues: var8 (ref), var9 (ref), var2 (ref), searchMusicModule (copy), var4 (ref), p1 (ref)
		if var8 then
			var9(nil)
		end
		var2(searchMusicModule(var4, p1.playbackController.timeline.timeLength))
	end, { var8, var4, p1.playbackController.timeline.timeLength })
	
	return if var6 then reactModule.createElement(musicEditorModule, {
		playbackController = p1.playbackController,
		musicEdit = p1.musicEdit,
		onBack = var15,
		onStartTimeChanged = useCallback(function(p2)
			-- upvalues: p1 (ref)
			if p1.musicEdit then
				p1.onMusicUpdate({ assetId = p1.musicEdit.assetId, startTime = p2 })
				
				return
			end
		end, { p1.musicEdit, p1.onMusicUpdate }),
		onDone = var16
	}) else reactModule.createElement(view, {
		tag = "align-x-center align-y-top anchor-bottom-center bg-surface-100 col gap-small position-bottom-center radius-medium size-full-0",
		ZIndex = 5,
		onActivated = function() end,
		Size = UDim2.fromScale(1, 0.666666666667),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var3.Padding.Medium),
			PaddingLeft = UDim.new(0, math.max(var1.left, var3.Padding.XLarge)),
			PaddingRight = UDim.new(0, math.max(var1.right, var3.Padding.XLarge))
		}),
		ModalHeaderBar = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y flex-between row size-full-0"
		}, {
			InspectTitle = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "text-heading-small content-action-emphasis text-truncate-end text-align-x-left text-align-y-top auto-xy",
				Text = var10.getLocalization(creationFlowLocalizationModule.EditingCtaMusic)
			}),
			CloseButton = reactModule.createElement(view, {
				tag = "auto-xy padding-medium radius-medium",
				LayoutOrder = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				onActivated = var14,
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					style = var3.Color.ActionEmphasis.Foreground
				})
			})
		}),
		SearchBar = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "align-x-center align-y-center col gap-small size-full-0 auto-y"
		}, {
			Input = reactModule.createElement(textInput, {
				label = "",
				LayoutOrder = 1,
				iconLeading = magnifyingGlass,
				text = var4,
				placeholder = var10.getLocalization(creationFlowLocalizationModule.GeneralSearchPlaceholder),
				onChanged = var5,
				onReturnPressed = var18,
				onFocusLost = var18,
				width = UDim.new(1, 0)
			})
		}),
		ScrollView = reactModule.createElement(scrollView, {
			LayoutOrder = 3,
			tag = "align-x-left align-y-top col size-full",
			flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, var3.Gap.Small)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				scrollBarVisibility = scrollBarVisibility.None,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, if var11 and #var11 > 0 then dashModule.map(var11, function(p2, p3)
			-- upvalues: reactModule (copy), musicPreviewItemModule (copy), var13 (ref), var17 (ref), var8 (ref), var12 (ref)
			return reactModule.createElement(musicPreviewItemModule, {
				key = p2,
				layoutOrder = p3,
				musicAssetId = p2,
				onMusicSelected = var13,
				togglePreviewMusic = var17,
				progress = if var8 == p2 then var12.timeline.elapsed / var12.timeline.duration else nil,
				isPreviewing = var8 == p2
			})
		end) else {
			NoResults = reactModule.createElement(text, {
				tag = "text-body-medium content-action-emphasis text-align-x-center",
				Text = var10.getLocalization(creationFlowLocalizationModule.MusicNoResults)
			})
		})
	})
end