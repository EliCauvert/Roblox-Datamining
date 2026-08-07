-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:50 2026 Pacific Standard Time.

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

return function(p0) --[[ line: 53 ]]
	-- upvalues: useDeviceInsets (ref), useDispatch (ref), useTokens (ref), reactModule (ref), creationFlowContextModule (ref), useSelector (ref), constantsModule (ref), useMemo (ref), useAudioPlayback (ref), useEffect (ref), searchMusicModule (ref), useCallback (ref), eventNamesModule (ref), musicEditorModule (ref), view (ref), foundationModule (ref), text (ref), creationFlowLocalizationModule (ref), icon (ref), textInput (ref), magnifyingGlass (ref), scrollView (ref), scrollBarVisibility (ref), dashModule (ref), musicPreviewItemModule (ref)
	local var13 = useDeviceInsets()
	local var14 = useDispatch()
	local var15 = useTokens()
	local var16, var17 = reactModule.useState("")
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(nil)
	local var22 = reactModule.useContext(creationFlowContextModule)
	local var23 = useSelector(function(p1) --[[ line: 62 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].CreationFlow.musicList
	end)
	local var24 = useAudioPlayback(var20 ~= nil, useMemo(function() --[[ line: 66 ]]
		-- upvalues: var20 (ref)
		return if var20 then tostring(var20) else nil
	end, { var20 }), { autoplay = true, looping = false })
	useEffect(function() --[[ line: 79 ]]
		-- upvalues: p0 (ref), var14 (ref), searchMusicModule (copy)
		p0.playbackController.playback.pause()
		var14(searchMusicModule("", p0.playbackController.timeline.timeLength))
	end, { p0.playbackController.timeline.timeLength })
	useEffect(function() --[[ line: 84 ]]
		-- upvalues: var24 (ref), var21 (ref)
		if not var24.playback.isPlaying then
			var21(nil)
		end
	end, { var24.playback.isPlaying })
	local var25 = useCallback(function(p2) --[[ line: 90 ]]
		-- upvalues: p0 (ref), var21 (ref), var19 (ref), var22 (ref), eventNamesModule (copy)
		p0.onMusicUpdate({ startTime = 0, assetId = p2 })
		p0.playbackController.timeline.seek(0)
		var21(nil)
		var19(true)
		var22.fireEvent(eventNamesModule.EditingFlowMusicSelected, { musicAssetId = tostring(p2) })
	end, { p0.onMusicUpdate })
	local var26 = useCallback(function() --[[ line: 101 ]]
		-- upvalues: p0 (ref)
		p0.onMusicDiscard()
		p0.playbackController.playback.play()
		p0.playbackController.volume.unmute()
	end, { p0.onMusicDiscard })
	local var27 = useCallback(function() --[[ line: 107 ]]
		-- upvalues: p0 (ref), var19 (ref)
		p0.onMusicUpdate(nil)
		var19(false)
		p0.playbackController.playback.pause()
	end, { p0.onMusicUpdate })
	local var28 = useCallback(function() --[[ line: 113 ]]
		-- upvalues: p0 (ref), var19 (ref)
		p0.onMusicSave()
		var19(false)
		p0.playbackController.playback.play()
		p0.playbackController.volume.unmute()
	end, { p0.onMusicSave })
	local var29 = useCallback(function(p3) --[[ line: 120 ]]
		-- upvalues: var20 (ref), var21 (ref), var24 (ref)
		if var20 and var20 == p3 then
			var21(nil)
			
			return
		end
		var21(p3)
		var24.playback.play()
	end, { var20 })
	local var30 = useCallback(function() --[[ line: 129 ]]
		-- upvalues: var20 (ref), var21 (ref), var14 (ref), searchMusicModule (copy), var16 (ref), p0 (ref)
		if var20 then
			var21(nil)
		end
		var14(searchMusicModule(var16, p0.playbackController.timeline.timeLength))
	end, { var20, var16, p0.playbackController.timeline.timeLength })
	
	return if var18 then reactModule.createElement(musicEditorModule, {
		playbackController = p0.playbackController,
		musicEdit = p0.musicEdit,
		onBack = var27,
		onStartTimeChanged = useCallback(function(p6) --[[ line: 136 ]]
			-- upvalues: p0 (ref)
			if p0.musicEdit then
				p0.onMusicUpdate({ assetId = p0.musicEdit.assetId, startTime = p6 })
				
				return
			end
		end, { p0.musicEdit, p0.onMusicUpdate }),
		onDone = var28
	}) else reactModule.createElement(view, {
		tag = "align-x-center align-y-top anchor-bottom-center bg-surface-100 col gap-small position-bottom-center radius-medium size-full-0",
		ZIndex = 5,
		onActivated = function() --[[ line: 155 ]] end,
		Size = UDim2.fromScale(1, 0.666666666667),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var15.Padding.Medium),
			PaddingLeft = UDim.new(0, math.max(var13.left, var15.Padding.XLarge)),
			PaddingRight = UDim.new(0, math.max(var13.right, var15.Padding.XLarge))
		}),
		ModalHeaderBar = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y flex-between row size-full-0"
		}, {
			InspectTitle = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "text-heading-small content-action-emphasis text-truncate-end text-align-x-left text-align-y-top auto-xy",
				Text = var22.getLocalization(creationFlowLocalizationModule.EditingCtaMusic)
			}),
			CloseButton = reactModule.createElement(view, {
				tag = "auto-xy padding-medium radius-medium",
				LayoutOrder = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				onActivated = var26,
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					style = var15.Color.ActionEmphasis.Foreground
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
				text = var16,
				placeholder = var22.getLocalization(creationFlowLocalizationModule.GeneralSearchPlaceholder),
				onChanged = var17,
				onReturnPressed = var30,
				onFocusLost = var30,
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
				Padding = UDim.new(0, var15.Gap.Small)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				scrollBarVisibility = scrollBarVisibility.None,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, if var23 and #var23 > 0 then dashModule.map(var23, function(p4, p5) --[[ line: 232 ]]
			-- upvalues: reactModule (copy), musicPreviewItemModule (copy), var25 (ref), var29 (ref), var20 (ref), var24 (ref)
			return reactModule.createElement(musicPreviewItemModule, {
				key = p4,
				layoutOrder = p5,
				musicAssetId = p4,
				onMusicSelected = var25,
				togglePreviewMusic = var29,
				progress = if var20 == p4 then var24.timeline.elapsed / var24.timeline.duration else nil,
				isPreviewing = var20 == p4
			})
		end) else {
			NoResults = reactModule.createElement(text, {
				tag = "text-body-medium content-action-emphasis text-align-x-center",
				Text = var22.getLocalization(creationFlowLocalizationModule.MusicNoResults)
			})
		})
	})
end